import 'dart:async';
import 'dart:math';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:core_business/src/core/resources/resource.dart';
import 'package:core_business/src/core/errors/failure.dart';
import 'package:core_business/src/core/utils/log_utils.dart';
import '../../../../../core/usecases/usecase.dart';
import '../../../domain/usecases/upload_image_usecase.dart';
import '../../../domain/usecases/upload_video_usecase.dart';
import '../../../domain/usecases/create_tgv_usecase.dart';
import '../../../domain/usecases/create_image_to_video_usecase.dart';
import '../../../domain/usecases/create_itv_single_source_usecase.dart';
import '../../../domain/usecases/create_transition_video_usecase.dart';
import '../../../domain/usecases/create_dancing_image_usecase.dart';
import '../../../domain/usecases/create_extend_video_usecase.dart';
import '../../../domain/usecases/create_itv_dual_source_usecase.dart';
import '../../../domain/usecases/get_media_detail_usecase.dart';
import '../../../data/models/media_models.dart';
import '../../../domain/entities/media_entities.dart';
import 'generating_event.dart';
import 'generating_state.dart';
import '../../../domain/repositories/notification_repository.dart';
import '../../../../auth/domain/usecases/get_profile_usecase.dart';

class GeneratingBloc extends Bloc<GeneratingEvent, GeneratingState> {
  final UploadImageUseCase uploadImageUseCase;
  final UploadVideoUseCase uploadVideoUseCase;
  final CreateTgvUseCase createTgvUseCase;
  final CreateImageToVideoUseCase createImageToVideoUseCase;
  final CreateItvSingleSourceUseCase createItvSingleSourceUseCase;
  final CreateTransitionVideoUseCase createTransitionVideoUseCase;
  final CreateDancingImageUseCase createDancingImageUseCase;
  final CreateExtendVideoUseCase createExtendVideoUseCase;
  final CreateItvDualSourceUseCase createItvDualSourceUseCase;
  final GetMediaDetailUseCase getMediaDetailUseCase;
  final NotificationRepository notificationRepository;
  final GetProfileUseCase getProfileUseCase;
  final SharedPreferences sharedPreferences;
  Timer? _timer;
  String? _mediaId;
  double _mockProgress = 0.0;

  GeneratingBloc({
    required this.uploadImageUseCase,
    required this.uploadVideoUseCase,
    required this.createTgvUseCase,
    required this.createImageToVideoUseCase,
    required this.createItvSingleSourceUseCase,
    required this.createTransitionVideoUseCase,
    required this.createDancingImageUseCase,
    required this.createExtendVideoUseCase,
    required this.createItvDualSourceUseCase,
    required this.getMediaDetailUseCase,
    required this.notificationRepository,
    required this.getProfileUseCase,
    required this.sharedPreferences,
  }) : super(const GeneratingState.initial()) {
    on<GeneratingEvent>((event, emit) async {
      await event.when(
        startGenerating: (title, imageUrl, themeId, themeType, themeOrgId, isHd, isLongTime, serviceType, videoUrl, prompt) async {
          final randomNum = 100000 + Random().nextInt(900000);
          final String finalName = 'VIdo : $randomNum';

          emit(GeneratingState.generating(
            progress: 0.0,
            title: title,
            imageUrl: imageUrl,
          ));
          LogUtils.d('GeneratingBloc: Start generating video for $finalName (original: $title), image: $imageUrl, themeId: $themeId, themeType: $themeType, orgId: $themeOrgId, isHd: $isHd, isLongTime: $isLongTime, serviceType: $serviceType, videoUrl: $videoUrl, prompt: $prompt');

          try {
            // 1. Upload images (handle single or comma-separated multiple paths)
            String finalImageUrl = '';
            if (imageUrl != null && imageUrl.isNotEmpty) {
              final imagePaths = imageUrl.split(',');
              final uploadedUrls = <String>[];
              for (final path in imagePaths) {
                final trimmedPath = path.trim();
                if (trimmedPath.isNotEmpty) {
                  if (trimmedPath.startsWith('http') || trimmedPath.startsWith('assets/')) {
                    uploadedUrls.add(trimmedPath);
                  } else {
                    LogUtils.d('GeneratingBloc: Uploading local image: $trimmedPath');
                    final uploadResult = await uploadImageUseCase(trimmedPath);
                    String? remoteUrl;
                    uploadResult.whenOrNull(
                      success: (url) {
                        remoteUrl = url;
                      },
                    );
                    if (remoteUrl != null) {
                      uploadedUrls.add(remoteUrl!);
                      LogUtils.d('GeneratingBloc: Image upload success, remote url: $remoteUrl');
                    } else {
                      throw Exception('Failed to upload image: $trimmedPath');
                    }
                  }
                }
              }
              finalImageUrl = uploadedUrls.join(',');
            }

            // 2. Upload video if local path is provided
            String finalVideoUrl = videoUrl ?? '';
            if (finalVideoUrl.isNotEmpty &&
                !finalVideoUrl.startsWith('http') &&
                !finalVideoUrl.startsWith('assets/')) {
              LogUtils.d('GeneratingBloc: Uploading local video: $finalVideoUrl');
              final uploadResult = await uploadVideoUseCase(finalVideoUrl);
              uploadResult.when(
                initial: () {},
                loading: () {},
                empty: () {},
                success: (url) {
                  finalVideoUrl = url;
                  LogUtils.d('GeneratingBloc: Video upload success, remote url: $finalVideoUrl');
                },
                error: (failure) {
                  final errorMsg = failure.toErrorCodeOrMessage();
                  LogUtils.e('GeneratingBloc: Video upload failed: $errorMsg');
                  throw Exception('Failed to upload video: $errorMsg');
                },
              );
            }

            // 3. Dispatch to the correct UseCase based on serviceType
            final String finalPrompt = (prompt != null && prompt.trim().isNotEmpty) ? prompt : title;
            final Resource<MediaEntity> createResult;

            switch (serviceType) {
              case 'IMAGE_TO_VIDEO':
                createResult = await createImageToVideoUseCase(CreateImageToVideoParams(
                  imageUrl: finalImageUrl,
                  name: finalName,
                  prompt: finalPrompt,
                  themeId: themeId,
                  themeType: themeType,
                  themeOrgId: themeOrgId,
                  isHd: isHd,
                  isLongTime: isLongTime,
                ));
                break;
              case 'ITV_SINGLE_SOURCE':
                createResult = await createItvSingleSourceUseCase(CreateItvSingleSourceParams(
                  imageUrl: finalImageUrl,
                  name: finalName,
                  prompt: finalPrompt,
                  isHd: isHd,
                  isLongTime: isLongTime,
                ));
                break;
              case 'TRANSITION_VIDEO':
                final parts = finalImageUrl.split(',');
                final firstImg = parts.isNotEmpty ? parts[0] : '';
                final secondImg = parts.length > 1 ? parts[1] : '';
                createResult = await createTransitionVideoUseCase(CreateTransitionVideoParams(
                  firstImageUrl: firstImg,
                  secondImageUrl: secondImg,
                  name: finalName,
                  prompt: finalPrompt,
                  isHd: isHd,
                  isLongTime: isLongTime,
                ));
                break;
              case 'DANCING_IMAGE':
                // Image to Dance (Biến ảnh thành nhảy múa)
                createResult = await createDancingImageUseCase(CreateDancingImageParams(
                  imageUrl: finalImageUrl,
                  videoUrl: finalVideoUrl,
                  name: finalName,
                  prompt: finalPrompt,
                  isHd: isHd,
                  isLongTime: isLongTime,
                ));
                break;
              case 'EXTEND_VIDEO':
                // Extend Video (Mở rộng video hiện tại)
                // Phía client dùng CreateExtendVideoUseCase riêng để tách nghiệp vụ,
                // bên trong UseCase sẽ ánh xạ sang serviceType DANCING_IMAGE của API.
                createResult = await createExtendVideoUseCase(CreateExtendVideoParams(
                  imageUrl: finalImageUrl,
                  videoUrl: finalVideoUrl,
                  name: finalName,
                  prompt: finalPrompt,
                  isHd: isHd,
                  isLongTime: isLongTime,
                ));
                break;
              case 'ITV_DUAL_SOURCE':
                final imageList = finalImageUrl.split(',').where((x) => x.trim().isNotEmpty).toList();
                createResult = await createItvDualSourceUseCase(CreateItvDualSourceParams(
                  imageUrls: imageList,
                  name: finalName,
                  prompt: finalPrompt,
                  isHd: isHd,
                  isLongTime: isLongTime,
                ));
                break;
              default:
                final request = CreateTgvRequestModel(
                  imageUrl: finalImageUrl,
                  videoUrl: finalVideoUrl.isEmpty ? null : finalVideoUrl,
                  name: finalName,
                  prompt: finalPrompt,
                  themeId: themeId,
                  isHd: isHd,
                  isLongTime: isLongTime,
                  themeType: themeType,
                  themeOrgId: themeOrgId,
                  serviceType: serviceType,
                );
                createResult = await createTgvUseCase(request);
            }

            await createResult.when(
              initial: () async {},
              loading: () async {},
              empty: () async {},
              success: (mediaEntity) async {
                _mediaId = mediaEntity.id;
                _mockProgress = 0.05;
                emit(GeneratingState.generating(
                  progress: _mockProgress,
                  title: title,
                  imageUrl: imageUrl,
                ));

                // Call /user/me immediately to refresh coins
                unawaited(getProfileUseCase(NoParams()));

                // Add video ID to generated_but_unviewed_video_ids in SharedPreferences
                try {
                  final list = sharedPreferences.getStringList('generated_but_unviewed_video_ids') ?? [];
                  if (!list.contains(mediaEntity.id)) {
                    list.add(mediaEntity.id);
                    await sharedPreferences.setStringList('generated_but_unviewed_video_ids', list);
                    LogUtils.d('GeneratingBloc: Added ${mediaEntity.id} to generated_but_unviewed_video_ids');
                  }
                } catch (e) {
                  LogUtils.e('GeneratingBloc: Failed to save generated video ID to pending list', error: e);
                }

                // 4. Start Polling Status
                _timer?.cancel();
                _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
                  if (!isClosed) {
                    add(const GeneratingEvent.tickProgress());
                  }
                });
              },
              error: (failure) async {
                LogUtils.e('GeneratingBloc: Create TGV failed: ${failure.toErrorCodeOrMessage()}');
                emit(GeneratingState.failure(message: failure.toErrorCodeOrMessage()));
              },
            );
          } catch (e) {
            LogUtils.e('GeneratingBloc: Generation failed with exception', error: e);
            emit(GeneratingState.failure(message: e.toString()));
          }
        },
        tickProgress: () async {
          await state.mapOrNull(
            generating: (generatingState) async {
              if (_mediaId == null) return;

              final statusResult = await getMediaDetailUseCase(_mediaId!);
              
              await statusResult.when(
                initial: () async {},
                loading: () async {},
                empty: () async {},
                success: (mediaEntity) async {
                  final status = mediaEntity.status.toLowerCase();
                  LogUtils.d('GeneratingBloc: Polling status: $status');

                  if (status == 'completed' || status == 'done' || mediaEntity.resultUrl != null) {
                    _timer?.cancel();
                    _timer = null;
                     emit(GeneratingState.success(
                       videoId: mediaEntity.id,
                       title: generatingState.title,
                       imageUrl: generatingState.imageUrl,
                       videoUrl: mediaEntity.resultUrl ?? '',
                       createdAt: _formatCurrentDate(),
                     ));
                  } else if (status == 'failed') {
                    _timer?.cancel();
                    _timer = null;
                    emit(const GeneratingState.failure(message: ''));
                  } else {
                    // Still generating, increment progress mock value slightly
                    _mockProgress = (_mockProgress + 0.15).clamp(0.05, 0.95);
                    emit(generatingState.copyWith(progress: _mockProgress));
                  }
                },
                error: (failure) async {
                  LogUtils.e('GeneratingBloc: Polling failed: ${failure.toErrorCodeOrMessage()}');
                  _mockProgress = (_mockProgress + 0.1).clamp(0.0, 0.95);
                  emit(generatingState.copyWith(progress: _mockProgress));
                },
              );
            },
          );
        },
        notifyComplete: () async {
          final isGranted = await notificationRepository.requestPermission().timeout(
            const Duration(seconds: 2),
            onTimeout: () => false,
          );
          if (isGranted && _mediaId != null) {
            // Đăng ký FCM Topic nhận thông báo khi video này sinh xong (không block UI)
            unawaited(notificationRepository.subscribeToTopic('aivideo_generation_$_mediaId'));
          }
          _timer?.cancel();
          _timer = null;
          emit(GeneratingState.notifiedAndExited(isPermissionGranted: isGranted));
        },
      );
    });
  }

  String _formatCurrentDate() {
    final now = DateTime.now();
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final time = "${twoDigits(now.hour)}:${twoDigits(now.minute)}";
    final date = "${twoDigits(now.day)}-${twoDigits(now.month)}-${now.year}";
    return "$time  •  $date";
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}

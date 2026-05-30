import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:core_business/src/core/resources/resource.dart';
import 'package:core_business/src/core/utils/log_utils.dart';
import '../../../domain/repositories/media_repository.dart';
import '../../../data/models/media_models.dart';
import 'generating_event.dart';
import 'generating_state.dart';

class GeneratingBloc extends Bloc<GeneratingEvent, GeneratingState> {
  final MediaRepository mediaRepository;
  Timer? _timer;
  String? _mediaId;
  double _mockProgress = 0.0;

  GeneratingBloc({required this.mediaRepository})
      : super(const GeneratingState.initial()) {
    on<GeneratingEvent>((event, emit) async {
      await event.when(
        startGenerating: (title, imageUrl) async {
          emit(GeneratingState.generating(
            progress: 0.0,
            title: title,
            imageUrl: imageUrl,
          ));
          LogUtils.d('GeneratingBloc: Start generating video for $title, image: $imageUrl');

          try {
            // 1. Upload image if it is local path
            String finalImageUrl = imageUrl ?? '';
            if (finalImageUrl.isNotEmpty &&
                !finalImageUrl.startsWith('http') &&
                !finalImageUrl.startsWith('assets/')) {
              LogUtils.d('GeneratingBloc: Uploading local image: $finalImageUrl');
              final uploadResult = await mediaRepository.uploadImage(finalImageUrl);
              uploadResult.when(
                initial: () {},
                loading: () {},
                empty: () {},
                success: (url) {
                  finalImageUrl = url;
                  LogUtils.d('GeneratingBloc: Upload success, remote url: $finalImageUrl');
                },
                error: (message) {
                  LogUtils.e('GeneratingBloc: Image upload failed: $message');
                  throw Exception('Failed to upload image: $message');
                },
              );
            }

            // 2. Create TGV Request
            final request = CreateTgvRequestModel(
              imageUrl: finalImageUrl,
              name: title,
              prompt: title, // use title or custom prompt
              themeId: '1',  // Default or template ID
              isHd: false,
              isLongTime: false,
              themeType: 'TEMPLATE',
              themeOrgId: 1,
            );

            LogUtils.d('GeneratingBloc: Creating TGV request: $request');
            final createResult = await mediaRepository.createTgv(request);
            
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

                // 3. Start Polling Status
                _timer?.cancel();
                _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
                  if (!isClosed) {
                    add(const GeneratingEvent.tickProgress());
                  }
                });
              },
              error: (message) async {
                LogUtils.e('GeneratingBloc: Create TGV failed: $message');
                emit(GeneratingState.success(
                  videoId: 'fallback_mock_id',
                  title: title,
                  imageUrl: imageUrl,
                  videoUrl: 'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
                  createdAt: _formatCurrentDate(),
                ));
              },
            );
          } catch (e) {
            LogUtils.e('GeneratingBloc: Generation failed with exception', error: e);
            // Fallback for mockup if upload or server request fails
            emit(GeneratingState.success(
              videoId: 'fallback_mock_id',
              title: title,
              imageUrl: imageUrl,
              videoUrl: 'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
              createdAt: _formatCurrentDate(),
            ));
          }
        },
        tickProgress: () async {
          await state.mapOrNull(
            generating: (generatingState) async {
              if (_mediaId == null) return;

              final statusResult = await mediaRepository.getMediaDetail(_mediaId!);
              
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
                      videoUrl: mediaEntity.resultUrl ?? 'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
                      createdAt: _formatCurrentDate(),
                    ));
                  } else if (status == 'failed') {
                    _timer?.cancel();
                    _timer = null;
                    emit(GeneratingState.success(
                      videoId: mediaEntity.id,
                      title: generatingState.title,
                      imageUrl: generatingState.imageUrl,
                      videoUrl: 'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
                      createdAt: _formatCurrentDate(),
                    ));
                  } else {
                    // Still generating, increment progress mock value slightly
                    _mockProgress = (_mockProgress + 0.15).clamp(0.05, 0.95);
                    emit(generatingState.copyWith(progress: _mockProgress));
                  }
                },
                error: (message) async {
                  LogUtils.e('GeneratingBloc: Polling failed: $message');
                  _mockProgress = (_mockProgress + 0.1).clamp(0.0, 0.95);
                  emit(generatingState.copyWith(progress: _mockProgress));
                },
              );
            },
          );
        },
        notifyComplete: () async {
          _timer?.cancel();
          _timer = null;
          emit(const GeneratingState.notifiedAndExited());
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

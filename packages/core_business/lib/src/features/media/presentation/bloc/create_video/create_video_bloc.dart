import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:core_business/src/core/utils/log_utils.dart';
import '../../../domain/usecases/get_suggestion_prompt_usecase.dart';
import '../../../domain/usecases/upload_image_usecase.dart';
import '../../../../../core/resources/resource.dart';
import '../../../../../core/usecases/usecase.dart';
import '../../../../auth/domain/usecases/watch_profile_usecase.dart';
import '../../../../auth/domain/usecases/get_profile_usecase.dart';
import '../../../../auth/domain/entities/user_entity.dart';
import 'create_video_event.dart';
import 'create_video_state.dart';

class CreateVideoBloc extends Bloc<CreateVideoEvent, CreateVideoState> {
  final GetSuggestionPromptUseCase getSuggestionPromptUseCase;
  final UploadImageUseCase uploadImageUseCase;
  final WatchProfileUseCase watchProfileUseCase;
  final GetProfileUseCase getProfileUseCase;
  StreamSubscription? _profileSubscription;

  static const List<String> _presetPrompts = [
    "Realistic female portrait, close-up, looking at camera, blinking naturally, blue studio lighting, cinematic, ultra detailed",
    "Neon lit cyberpunk street, rainy night, reflections on puddles, drone shot flying through skyscrapers, futuristic city vibe",
    "Fantasy forest with glowing mushrooms, majestic waterfall in the background, sunlight filtering through ancient trees, ethereal style",
    "Cute fluffy orange cat wearing spacesuit on the moon, looking at Earth, cartoon 3d style, highly detailed"
  ];

  CreateVideoBloc({
    required this.getSuggestionPromptUseCase,
    required this.uploadImageUseCase,
    required this.watchProfileUseCase,
    required this.getProfileUseCase,
  }) : super(const CreateVideoState.initial()) {
    on<CreateVideoEvent>((event, emit) async {
      await event.when(
        init: (initialTab) async {
          LogUtils.d("Initializing CreateVideoBloc with tab: $initialTab");
          emit(const CreateVideoState.loading());
          await Future.delayed(const Duration(milliseconds: 100));

          _profileSubscription?.cancel();
          _profileSubscription = watchProfileUseCase().listen(
            (user) => add(CreateVideoEvent.profileUpdated(user)),
          );

          getProfileUseCase(NoParams());

          emit(CreateVideoState.ready(
            selectedTab: initialTab,
            customPrompt: "",
            inspireMeCount: 3,
            isVip: false,
            slotsPaths: List<String?>.filled(3, null),
            uploadedSlotsPaths: List<String?>.filled(3, null),
            quality: 'Full HD',
            duration: '5s',
            isGenerating: false,
            isSuccess: false,
            isInspiring: false,
          ));
        },
        changeTab: (tabIndex) {
          state.mapOrNull(
            ready: (readyState) {
              if (readyState.selectedTab == tabIndex) return;

              LogUtils.d("Changing tab to: $tabIndex");
              emit(readyState.copyWith(
                selectedTab: tabIndex,
                slotsPaths: List<String?>.filled(3, null),
                uploadedSlotsPaths: List<String?>.filled(3, null),
                isSuccess: false,
              ));
            },
          );
        },
        updatePrompt: (prompt) {
          state.mapOrNull(
            ready: (readyState) {
              emit(readyState.copyWith(customPrompt: prompt, isSuccess: false));
            },
          );
        },
        inspireMe: () async {
          await state.mapOrNull(
            ready: (readyState) async {
              final cannotInspire = !readyState.isVip && readyState.inspireMeCount <= 0;
              if (cannotInspire || readyState.isInspiring) return;

              // 1. Collect all non-null images in slotsPaths
              final selectedLocalPaths = readyState.slotsPaths
                  .where((path) => path != null && path.isNotEmpty)
                  .cast<String>()
                  .toList();

              if (selectedLocalPaths.isEmpty) {
                // Fallback to preset prompts if no image is selected
                final currentCount = readyState.inspireMeCount;
                final promptIndex = (3 - currentCount) % _presetPrompts.length;
                final selectedPrompt = _presetPrompts[promptIndex];

                LogUtils.d("No image selected, falling back to preset prompt index $promptIndex");
                emit(readyState.copyWith(
                  customPrompt: selectedPrompt,
                  inspireMeCount: readyState.isVip ? currentCount : currentCount - 1,
                  isSuccess: false,
                ));
                return;
              }

              // 2. Emit state with isInspiring: true
              emit(readyState.copyWith(isInspiring: true, isSuccess: false));

              try {
                // 3. Upload images that are not yet cached
                final updatedUploadedPaths = List<String?>.from(readyState.uploadedSlotsPaths);
                
                for (int i = 0; i < readyState.slotsPaths.length; i++) {
                  final localPath = readyState.slotsPaths[i];
                  if (localPath != null && localPath.isNotEmpty) {
                    // Check if already has a cached remote URL
                    final cachedUrl = readyState.uploadedSlotsPaths[i];
                    if (cachedUrl == null || !cachedUrl.startsWith('http')) {
                      LogUtils.d("Uploading image at slot $i: $localPath");
                      final uploadResult = await uploadImageUseCase(localPath);
                      
                      String? remoteUrl;
                      uploadResult.whenOrNull(
                        success: (url) {
                          remoteUrl = url;
                        },
                      );

                      if (remoteUrl != null) {
                        updatedUploadedPaths[i] = remoteUrl;
                        LogUtils.d("Cached remote URL for slot $i: $remoteUrl");
                      } else {
                        throw Exception('Failed to upload image at slot $i');
                      }
                    }
                  }
                }

                // Update state with newly uploaded paths, preserving the loading status
                state.mapOrNull(
                  ready: (latestState) {
                    emit(latestState.copyWith(
                      uploadedSlotsPaths: updatedUploadedPaths,
                      isInspiring: true,
                    ));
                  },
                );

                // 4. Construct comma-separated remote URL string
                final remoteUrls = updatedUploadedPaths
                    .where((url) => url != null && url.isNotEmpty)
                    .cast<String>()
                    .toList();

                final joinedUrls = remoteUrls.join(',');
                LogUtils.d("Requesting prompt suggestion for: $joinedUrls");

                // 5. Call suggestion UseCase
                final suggestionResult = await getSuggestionPromptUseCase(joinedUrls);

                state.mapOrNull(
                  ready: (latestState) {
                    suggestionResult.maybeWhen(
                      success: (prompt) {
                        emit(latestState.copyWith(
                          customPrompt: prompt,
                          inspireMeCount: latestState.isVip
                              ? latestState.inspireMeCount
                              : latestState.inspireMeCount - 1,
                          isInspiring: false,
                          isSuccess: true,
                        ));

                        getProfileUseCase(NoParams());
                      },
                      error: (message) {
                        LogUtils.e("Failed to get prompt suggestion: $message");
                        emit(latestState.copyWith(isInspiring: false));
                      },
                      orElse: () {
                        emit(latestState.copyWith(isInspiring: false));
                      },
                    );
                  },
                );
              } catch (e) {
                LogUtils.e("Error during prompt suggestion process: $e");
                state.mapOrNull(
                  ready: (latestState) {
                    emit(latestState.copyWith(isInspiring: false));
                  },
                );
              }
            },
          );
        },
        clearPrompt: () {
          state.mapOrNull(
            ready: (readyState) {
              LogUtils.d("Clearing custom prompt");
              emit(readyState.copyWith(customPrompt: "", isSuccess: false));
            },
          );
        },
        selectMedia: (slotIndex, mediaPath) {
          state.mapOrNull(
            ready: (readyState) {
              LogUtils.d("Selecting media for slot $slotIndex: $mediaPath");
              final updatedPaths = List<String?>.from(readyState.slotsPaths);
              final updatedUploadedPaths = List<String?>.from(readyState.uploadedSlotsPaths);
              if (slotIndex >= 0 && slotIndex < updatedPaths.length) {
                updatedPaths[slotIndex] = mediaPath;
                updatedUploadedPaths[slotIndex] = null;
              }
              emit(readyState.copyWith(
                slotsPaths: updatedPaths,
                uploadedSlotsPaths: updatedUploadedPaths,
                isSuccess: false,
              ));
            },
          );
        },
        removeMedia: (slotIndex) {
          state.mapOrNull(
            ready: (readyState) {
              LogUtils.d("Removing media for slot $slotIndex");
              final updatedPaths = List<String?>.from(readyState.slotsPaths);
              final updatedUploadedPaths = List<String?>.from(readyState.uploadedSlotsPaths);
              if (slotIndex >= 0 && slotIndex < updatedPaths.length) {
                updatedPaths[slotIndex] = null;
                updatedUploadedPaths[slotIndex] = null;
              }
              emit(readyState.copyWith(
                slotsPaths: updatedPaths,
                uploadedSlotsPaths: updatedUploadedPaths,
                isSuccess: false,
              ));
            },
          );
        },
        selectQuality: (quality) {
          state.mapOrNull(
            ready: (readyState) {
              LogUtils.d("Selecting quality: $quality");
              emit(readyState.copyWith(quality: quality, isSuccess: false));
            },
          );
        },
        selectDuration: (duration) {
          state.mapOrNull(
            ready: (readyState) {
              LogUtils.d("Selecting duration: $duration");
              emit(readyState.copyWith(duration: duration, isSuccess: false));
            },
          );
        },
        generateVideo: () async {
          await state.mapOrNull(
            ready: (readyState) async {
              if (readyState.isGenerating) return;

              LogUtils.d("Triggering video generation navigation...");
              emit(readyState.copyWith(isGenerating: true, isSuccess: false));

              // Reset immediately so that popping back to this screen doesn't re-trigger navigation
              emit(readyState.copyWith(isGenerating: false, isSuccess: false));
            },
          );
        },
        profileUpdated: (user) {
          state.mapOrNull(
            ready: (readyState) {
              LogUtils.d("Profile updated in CreateVideoBloc: VIP=${user.isVip}, suggestions=${user.freeSuggestions}");
              emit(readyState.copyWith(
                inspireMeCount: user.freeSuggestions,
                isVip: user.isVip,
              ));
            },
          );
        },
      );
    });
  }

  @override
  Future<void> close() {
    _profileSubscription?.cancel();
    return super.close();
  }
}

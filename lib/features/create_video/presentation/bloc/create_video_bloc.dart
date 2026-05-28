import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/log_utils.dart';
import 'create_video_event.dart';
import 'create_video_state.dart';

class CreateVideoBloc extends Bloc<CreateVideoEvent, CreateVideoState> {
  static const List<String> _presetPrompts = [
    "Realistic female portrait, close-up, looking at camera, blinking naturally, blue studio lighting, cinematic, ultra detailed",
    "Neon lit cyberpunk street, rainy night, reflections on puddles, drone shot flying through skyscrapers, futuristic city vibe",
    "Fantasy forest with glowing mushrooms, majestic waterfall in the background, sunlight filtering through ancient trees, ethereal style",
    "Cute fluffy orange cat wearing spacesuit on the moon, looking at Earth, cartoon 3d style, highly detailed"
  ];

  CreateVideoBloc() : super(const CreateVideoState.initial()) {
    on<CreateVideoEvent>((event, emit) async {
      await event.when(
        init: (initialTab) async {
          LogUtils.d("Initializing CreateVideoBloc with tab: $initialTab");
          emit(const CreateVideoState.loading());
          // Simulate a short data retrieval if any
          await Future.delayed(const Duration(milliseconds: 100));

          emit(CreateVideoState.ready(
            selectedTab: initialTab,
            customPrompt: "",
            inspireMeCount: 3,
            slotsPaths: List<String?>.filled(3, null),
            quality: 'Full HD',
            duration: '5s',
            isGenerating: false,
            isSuccess: false,
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
        inspireMe: () {
          state.mapOrNull(
            ready: (readyState) {
              if (readyState.inspireMeCount <= 0) return;

              final currentCount = readyState.inspireMeCount;
              final promptIndex = (3 - currentCount) % _presetPrompts.length;
              final selectedPrompt = _presetPrompts[promptIndex];

              LogUtils.d("Inspiring user prompt: index $promptIndex");
              emit(readyState.copyWith(
                customPrompt: selectedPrompt,
                inspireMeCount: currentCount - 1,
                isSuccess: false,
              ));
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
              if (slotIndex >= 0 && slotIndex < updatedPaths.length) {
                updatedPaths[slotIndex] = mediaPath;
              }
              emit(readyState.copyWith(slotsPaths: updatedPaths, isSuccess: false));
            },
          );
        },
        removeMedia: (slotIndex) {
          state.mapOrNull(
            ready: (readyState) {
              LogUtils.d("Removing media for slot $slotIndex");
              final updatedPaths = List<String?>.from(readyState.slotsPaths);
              if (slotIndex >= 0 && slotIndex < updatedPaths.length) {
                updatedPaths[slotIndex] = null;
              }
              emit(readyState.copyWith(slotsPaths: updatedPaths, isSuccess: false));
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
      );
    });
  }
}

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:core_business/src/core/utils/log_utils.dart';
import 'create_from_template_event.dart';
import 'create_from_template_state.dart';

class CreateFromTemplateBloc extends Bloc<CreateFromTemplateEvent, CreateFromTemplateState> {
  CreateFromTemplateBloc() : super(const CreateFromTemplateState.initial()) {
    on<CreateFromTemplateEvent>((event, emit) async {
      await event.when(
        init: (templateId, title, videoUrl, imageUrl) async {
          LogUtils.d("Initializing CreateFromTemplateBloc for template: $title");
          emit(const CreateFromTemplateState.loading());
          await Future.delayed(const Duration(milliseconds: 100));

          emit(CreateFromTemplateState.ready(
            templateId: templateId,
            title: title,
            videoUrl: videoUrl,
            imageUrl: imageUrl,
            selectedPhotoPath: null,
            showSettings: false,
            quality: 'Full HD',
            duration: '5s',
            isGenerating: false,
          ));
        },
        selectPhoto: (path) {
          state.mapOrNull(
            ready: (readyState) {
              LogUtils.d("Template Editor: Selected Photo: $path");
              emit(readyState.copyWith(
                selectedPhotoPath: path,
                isSuccess: false,
              ));
            },
          );
        },
        removePhoto: () {
          state.mapOrNull(
            ready: (readyState) {
              LogUtils.d("Template Editor: Removed Photo");
              emit(readyState.copyWith(
                selectedPhotoPath: null,
                isSuccess: false,
              ));
            },
          );
        },
        toggleSettings: (show) {
          state.mapOrNull(
            ready: (readyState) {
              LogUtils.d("Template Editor: Toggle settings view: $show");
              emit(readyState.copyWith(
                showSettings: show,
                isSuccess: false,
              ));
            },
          );
        },
        selectQuality: (quality) {
          state.mapOrNull(
            ready: (readyState) {
              LogUtils.d("Template Editor: Select quality: $quality");
              emit(readyState.copyWith(
                quality: quality,
                isSuccess: false,
              ));
            },
          );
        },
        selectDuration: (duration) {
          state.mapOrNull(
            ready: (readyState) {
              LogUtils.d("Template Editor: Select duration: $duration");
              emit(readyState.copyWith(
                duration: duration,
                isSuccess: false,
              ));
            },
          );
        },
        startGenerating: () async {
          await state.mapOrNull(
            ready: (readyState) async {
              if (readyState.isGenerating) return;

              LogUtils.d("Template Editor: Triggering generation process...");
              emit(readyState.copyWith(isGenerating: true, isSuccess: false));
              
              // Immediately reset isGenerating so going back does not trigger navigation again
              emit(readyState.copyWith(isGenerating: false, isSuccess: false));
            },
          );
        },
      );
    });
  }
}

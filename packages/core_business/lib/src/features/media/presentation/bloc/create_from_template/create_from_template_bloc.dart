import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:core_business/src/core/utils/log_utils.dart';
import '../../../domain/entities/media_entities.dart';
import '../../../domain/usecases/liked_templates_usecases.dart';
import 'create_from_template_event.dart';
import 'create_from_template_state.dart';

class CreateFromTemplateBloc extends Bloc<CreateFromTemplateEvent, CreateFromTemplateState> {
  final IsTemplateLikedUseCase _isTemplateLikedUseCase;
  final ToggleLikeTemplateUseCase _toggleLikeTemplateUseCase;

  CreateFromTemplateBloc({
    required IsTemplateLikedUseCase isTemplateLikedUseCase,
    required ToggleLikeTemplateUseCase toggleLikeTemplateUseCase,
    String templateId = '',
    String title = '',
    String videoUrl = '',
    String imageUrl = '',
    String themeType = '',
    int themeOrgId = 1,
  })  : _isTemplateLikedUseCase = isTemplateLikedUseCase,
        _toggleLikeTemplateUseCase = toggleLikeTemplateUseCase,
        super(CreateFromTemplateState.ready(
          templateId: templateId,
          title: title,
          videoUrl: videoUrl,
          imageUrl: imageUrl,
          themeType: themeType,
          themeOrgId: themeOrgId,
          selectedPhotoPath: null,
          quality: 'HD',
          duration: '5s',
          isGenerating: false,
          isLiked: false,
        )) {
    on<CreateFromTemplateEvent>((event, emit) async {
      await event.when(
        init: (templateId, title, videoUrl, imageUrl, themeType, themeOrgId) async {
          LogUtils.d("Initializing CreateFromTemplateBloc for template: $title");
          
          final isLiked = await _isTemplateLikedUseCase(templateId);

          emit(CreateFromTemplateState.ready(
            templateId: templateId,
            title: title,
            videoUrl: videoUrl,
            imageUrl: imageUrl,
            themeType: themeType,
            themeOrgId: themeOrgId,
            selectedPhotoPath: state.maybeMap(
              ready: (r) => r.selectedPhotoPath,
              orElse: () => null,
            ),
            quality: state.maybeMap(
              ready: (r) => r.quality,
              orElse: () => 'HD',
            ),
            duration: state.maybeMap(
              ready: (r) => r.duration,
              orElse: () => '5s',
            ),
            isGenerating: state.maybeMap(
              ready: (r) => r.isGenerating,
              orElse: () => false,
            ),
            isLiked: isLiked,
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
        toggleLike: () async {
          await state.mapOrNull(
            ready: (readyState) async {
              LogUtils.d("Template Editor: Toggle Like template: ${readyState.templateId}");
              
              final theme = ThemeEntity(
                id: readyState.templateId,
                name: readyState.title,
                description: '',
                resultUrl: '',
                sourceUrl: readyState.videoUrl,
                sourceUrls: const [],
                thumbnailUrl: readyState.imageUrl,
                prompt: '',
                type: readyState.themeType,
                orgId: readyState.themeOrgId,
              );
              
              await _toggleLikeTemplateUseCase(theme);
              
              emit(readyState.copyWith(
                isLiked: !readyState.isLiked,
              ));
            },
          );
        },
      );
    });
  }
}

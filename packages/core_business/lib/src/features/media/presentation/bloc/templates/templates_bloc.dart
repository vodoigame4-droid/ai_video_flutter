import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:core_business/src/core/resources/resource.dart';
import 'package:core_business/src/core/utils/log_utils.dart';
import 'package:core_business/src/core/usecases/usecase.dart';
import '../../../domain/entities/media_entities.dart';
import '../../../domain/usecases/get_categories_usecase.dart';
import '../../../domain/usecases/get_themes_usecase.dart';
import 'templates_event.dart';
import 'templates_state.dart';

class TemplatesBloc extends Bloc<TemplatesEvent, TemplatesState> {
  final GetCategoriesUseCase getCategoriesUseCase;
  final GetThemesUseCase getThemesUseCase;
  List<HomeCategoryEntity> _categoriesList = [];

  TemplatesBloc({
    required this.getCategoriesUseCase,
    required this.getThemesUseCase,
  }) : super(const TemplatesState.initial()) {
    on<TemplatesEvent>((event, emit) async {
      await event.when(
        init: (category) async {
          emit(const TemplatesState.loading());
          LogUtils.d('TemplatesBloc: Fetching categories');

          final catResult = await getCategoriesUseCase(NoParams());
          
          await catResult.when(
            initial: () async {},
            loading: () async {},
            empty: () async {
              emit(TemplatesState.ready(
                categoriesState: const Resource.success(['All']),
                selectedCategory: category,
                templatesState: const Resource.success([]),
              ));
            },
            success: (categories) async {
              _categoriesList = categories;
              final categoryNames = ['All', ...categories.map((c) => c.name)];
              
              // Load themes for initial category
              final initialId = _getCategoryIdByName(category);
              LogUtils.d('TemplatesBloc: Fetching themes for $category (id: $initialId)');
              
              final themesResult = await getThemesUseCase(GetThemesParams(
                categoryId: initialId,
              ));

              emit(TemplatesState.ready(
                categoriesState: Resource.success(categoryNames),
                selectedCategory: category,
                templatesState: themesResult.maybeWhen(
                  success: (paginated) => Resource.success(paginated.data),
                  orElse: () => Resource.error(message: 'Failed to load themes'),
                ),
              ));
            },
            error: (message) async {
              emit(TemplatesState.error(message: message));
            },
          );
        },
        selectCategory: (category) async {
          await state.mapOrNull(
            ready: (readyState) async {
              emit(readyState.copyWith(
                selectedCategory: category,
                templatesState: const Resource.loading(),
              ));

              final categoryId = _getCategoryIdByName(category);
              LogUtils.d('TemplatesBloc: Selected category $category (id: $categoryId)');
              
              final themesResult = await getThemesUseCase(GetThemesParams(
                categoryId: categoryId,
              ));

              emit(readyState.copyWith(
                selectedCategory: category,
                templatesState: themesResult.maybeWhen(
                  success: (paginated) => Resource.success(paginated.data),
                  orElse: () => Resource.error(message: 'Failed to load themes'),
                ),
              ));
            },
          );
        },
      );
    });
  }

  String? _getCategoryIdByName(String name) {
    if (name.toLowerCase() == 'all') {
      return null;
    }
    try {
      final entity = _categoriesList.firstWhere(
        (c) => c.name.toLowerCase() == name.toLowerCase(),
      );
      return entity.id.toString();
    } catch (_) {
      return null;
    }
  }
}

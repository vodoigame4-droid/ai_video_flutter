import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/resources/resource.dart';
import '../../domain/usecases/get_templates_use_case.dart';
import 'templates_event.dart';
import 'templates_state.dart';

class TemplatesBloc extends Bloc<TemplatesEvent, TemplatesState> {
  final GetTemplatesUseCase getTemplatesUseCase;

  // Exact categories from Figma design context
  static const List<String> _categories = [
    'All',
    'Trending',
    'New',
    'Toy Figure Box',
    'Epic Morph',
    'Anime',
  ];

  TemplatesBloc({required this.getTemplatesUseCase})
      : super(const TemplatesState.initial()) {
    on<TemplatesEvent>((event, emit) async {
      await event.when(
        init: (category) async {
          emit(const TemplatesState.loading());

          // Fetch templates for initial category
          final templatesResult = await getTemplatesUseCase(category);

          emit(TemplatesState.ready(
            categoriesState: const Resource.success(_categories),
            selectedCategory: category,
            templatesState: templatesResult,
          ));
        },
        selectCategory: (category) async {
          // Keep current categories but show loading for templates
          await state.mapOrNull(
            ready: (readyState) async {
              emit(readyState.copyWith(
                selectedCategory: category,
                templatesState: const Resource.loading(),
              ));

              // Fetch templates for the new category
              final templatesResult = await getTemplatesUseCase(category);

              emit(readyState.copyWith(
                selectedCategory: category,
                templatesState: templatesResult,
              ));
            },
          );
        },
      );
    });
  }
}

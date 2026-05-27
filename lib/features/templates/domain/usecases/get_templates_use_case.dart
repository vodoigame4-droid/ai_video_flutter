import '../../../../core/resources/resource.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/template_entity.dart';
import '../repositories/templates_repository.dart';

class GetTemplatesUseCase implements UseCase<List<TemplateEntity>, String> {
  final TemplatesRepository repository;

  GetTemplatesUseCase(this.repository);

  @override
  Future<Resource<List<TemplateEntity>>> call(String category) {
    return repository.getTemplates(category);
  }
}

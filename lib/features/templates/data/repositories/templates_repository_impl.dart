import '../../../../core/resources/resource.dart';
import '../../domain/entities/template_entity.dart';
import '../../domain/repositories/templates_repository.dart';
import '../datasources/templates_local_datasource.dart';
import '../models/template_model.dart';

class TemplatesRepositoryImpl implements TemplatesRepository {
  final TemplatesLocalDataSource localDataSource;

  TemplatesRepositoryImpl(this.localDataSource);

  @override
  Future<Resource<List<TemplateEntity>>> getTemplates(String category) async {
    try {
      final models = await localDataSource.getTemplates(category);
      final entities = models.map((m) => m.toEntity()).toList();
      return Resource.success(entities);
    } catch (e) {
      return Resource.error(message: e.toString());
    }
  }
}

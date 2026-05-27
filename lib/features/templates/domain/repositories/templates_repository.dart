import '../../../../core/resources/resource.dart';
import '../entities/template_entity.dart';

abstract class TemplatesRepository {
  Future<Resource<List<TemplateEntity>>> getTemplates(String category);
}

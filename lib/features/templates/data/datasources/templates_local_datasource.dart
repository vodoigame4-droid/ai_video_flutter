import '../models/template_model.dart';

abstract class TemplatesLocalDataSource {
  Future<List<TemplateModel>> getTemplates(String category);
}

class TemplatesLocalDataSourceImpl implements TemplatesLocalDataSource {
  @override
  Future<List<TemplateModel>> getTemplates(String category) async {
    // Exact assets from Figma design context
    final allTemplates = [
      const TemplateModel(
        id: '1',
        title: 'Selfie Aquaman',
        imageUrl: 'http://localhost:3845/assets/550ccb46d34cab8287cf17aa9cc3332b415d9afc.png',
        viewsCount: '11.0K',
        badgeType: 'hot',
      ),
      const TemplateModel(
        id: '2',
        title: 'Selfie Aquaman',
        imageUrl: 'http://localhost:3845/assets/e103599cceed408d474ec54d0686ebb7f7c16f83.png',
        viewsCount: '11.0K',
        badgeType: 'new',
      ),
      const TemplateModel(
        id: '3',
        title: 'Selfie Aquaman',
        imageUrl: 'http://localhost:3845/assets/8a2a8b3e126743df06d7fc90b39cb07196edc1cb.png',
        viewsCount: '11.0K',
        badgeType: 'new',
      ),
      const TemplateModel(
        id: '4',
        title: 'Selfie Aquaman',
        imageUrl: 'http://localhost:3845/assets/fef8fbc09aa30e40d98e1ef55157fb2eefda2abe.png',
        viewsCount: '11.0K',
        badgeType: 'hot',
      ),
      const TemplateModel(
        id: '5',
        title: 'Selfie Aquaman',
        imageUrl: 'http://localhost:3845/assets/097b6702a5a6f47ddaf685970508ed401b81db6f.png',
        viewsCount: '11.0K',
        badgeType: 'new',
      ),
      const TemplateModel(
        id: '6',
        title: 'Selfie Aquaman',
        imageUrl: 'http://localhost:3845/assets/63814d43c83c382b250cb83592804111f1aaaa9e.png',
        viewsCount: '11.0K',
        badgeType: 'hot',
      ),
      const TemplateModel(
        id: '7',
        title: 'Selfie Aquaman',
        imageUrl: 'http://localhost:3845/assets/a2d05f434a0a26642bab96caeb7a3a57fa9390ec.png',
        viewsCount: '11.0K',
        badgeType: 'hot',
      ),
      const TemplateModel(
        id: '8',
        title: 'Selfie Aquaman',
        imageUrl: 'http://localhost:3845/assets/ebe57b4146c6bd1bcf67731e7f3d4f21ba3bc9dc.png',
        viewsCount: '11.0K',
        badgeType: 'new',
      ),
    ];

    // Simulate network delay to ensure loading state is clearly shown
    await Future.delayed(const Duration(milliseconds: 500));

    final normalizedCategory = category.trim().toLowerCase();
    
    if (normalizedCategory == 'all') {
      return allTemplates;
    } else if (normalizedCategory == 'trending') {
      // In Figma, selected category is Trending, it has mixed but let's show all
      // or filter based on badgeType. Let's return all templates to populate the grid
      // or filter some. Actually, returning all templates is better since they are all "Trending".
      return allTemplates;
    } else if (normalizedCategory == 'new' || normalizedCategory == 'new_section') {
      return allTemplates.where((t) => t.badgeType == 'new').toList();
    } else if (normalizedCategory == 'toy box' || normalizedCategory == 'toy_box') {
      // Return a shuffled or subset of templates to make it look dynamic
      return allTemplates.take(4).toList();
    } else if (normalizedCategory == 'epic morph' || normalizedCategory == 'epic_morph') {
      return allTemplates.skip(2).take(4).toList();
    } else if (normalizedCategory == 'anime') {
      return allTemplates.where((t) => t.id == '1' || t.id == '3' || t.id == '5').toList();
    } else {
      return allTemplates;
    }
  }
}

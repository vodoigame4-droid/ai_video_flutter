import 'dart:convert';
import '../../../../core/database/app_database.dart';
import '../../domain/entities/media_entities.dart';
import '../../domain/repositories/liked_templates_repository.dart';
import '../datasources/liked_templates_local_datasource.dart';

class LikedTemplatesRepositoryImpl implements LikedTemplatesRepository {
  final LikedTemplatesLocalDataSource _localDataSource;

  LikedTemplatesRepositoryImpl(this._localDataSource);

  @override
  Future<List<ThemeEntity>> getLikedTemplates() async {
    final templates = await _localDataSource.getLikedTemplates();
    return templates.map((t) {
      List<String> urls = [];
      if (t.sourceUrls != null) {
        try {
          final decoded = json.decode(t.sourceUrls!);
          if (decoded is List) {
            urls = decoded.map((e) => e.toString()).toList();
          }
        } catch (_) {
          // Lỗi parse json, bỏ qua
        }
      }
      return ThemeEntity(
        id: t.id,
        name: t.name,
        description: t.description ?? '',
        resultUrl: t.resultUrl ?? '',
        sourceUrl: t.sourceUrl ?? '',
        sourceUrls: urls,
        thumbnailUrl: t.thumbnailUrl ?? '',
        prompt: t.prompt ?? '',
        type: t.type ?? '',
        orgId: t.orgId ?? 0,
      );
    }).toList();
  }

  @override
  Stream<List<ThemeEntity>> watchLikedTemplates() {
    return _localDataSource.watchLikedTemplates().map((list) {
      return list.map((t) {
        List<String> urls = [];
        if (t.sourceUrls != null) {
          try {
            final decoded = json.decode(t.sourceUrls!);
            if (decoded is List) {
              urls = decoded.map((e) => e.toString()).toList();
            }
          } catch (_) {
            // Lỗi parse json, bỏ qua
          }
        }
        return ThemeEntity(
          id: t.id,
          name: t.name,
          description: t.description ?? '',
          resultUrl: t.resultUrl ?? '',
          sourceUrl: t.sourceUrl ?? '',
          sourceUrls: urls,
          thumbnailUrl: t.thumbnailUrl ?? '',
          prompt: t.prompt ?? '',
          type: t.type ?? '',
          orgId: t.orgId ?? 0,
        );
      }).toList();
    });
  }

  @override
  Future<bool> isTemplateLiked(String id) {
    return _localDataSource.isTemplateLiked(id);
  }

  @override
  Future<void> toggleLikeTemplate(ThemeEntity theme) async {
    final isLiked = await _localDataSource.isTemplateLiked(theme.id);
    if (isLiked) {
      await _localDataSource.removeTemplate(theme.id);
    } else {
      final sourceUrlsJson = json.encode(theme.sourceUrls);
      final model = LikedTemplate(
        id: theme.id,
        name: theme.name,
        description: theme.description,
        resultUrl: theme.resultUrl,
        sourceUrl: theme.sourceUrl,
        sourceUrls: sourceUrlsJson,
        thumbnailUrl: theme.thumbnailUrl,
        prompt: theme.prompt,
        type: theme.type,
        orgId: theme.orgId,
        likedAt: DateTime.now(),
      );
      await _localDataSource.saveTemplate(model);
    }
  }
}

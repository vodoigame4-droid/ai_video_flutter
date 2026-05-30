import '../../../../core/database/app_database.dart';
import 'package:drift/drift.dart';

abstract class LikedTemplatesLocalDataSource {
  Future<List<LikedTemplate>> getLikedTemplates();
  Future<bool> isTemplateLiked(String id);
  Future<void> saveTemplate(LikedTemplate template);
  Future<void> removeTemplate(String id);
  Stream<List<LikedTemplate>> watchLikedTemplates();
}

class LikedTemplatesLocalDataSourceImpl implements LikedTemplatesLocalDataSource {
  final AppDatabase _database;

  LikedTemplatesLocalDataSourceImpl(this._database);

  @override
  Stream<List<LikedTemplate>> watchLikedTemplates() {
    return _database.watchLikedTemplates();
  }

  @override
  Future<List<LikedTemplate>> getLikedTemplates() async {
    return (await (_database.select(_database.likedTemplatesTable)
          ..orderBy([
            (t) => OrderingTerm(expression: t.likedAt, mode: OrderingMode.desc)
          ]))
        .get());
  }

  @override
  Future<bool> isTemplateLiked(String id) async {
    final query = _database.select(_database.likedTemplatesTable)
      ..where((t) => t.id.equals(id));
    final result = await query.getSingleOrNull();
    return result != null;
  }

  @override
  Future<void> saveTemplate(LikedTemplate template) async {
    await _database.into(_database.likedTemplatesTable).insertOnConflictUpdate(template);
  }

  @override
  Future<void> removeTemplate(String id) async {
    await (_database.delete(_database.likedTemplatesTable)
          ..where((t) => t.id.equals(id)))
        .go();
  }
}

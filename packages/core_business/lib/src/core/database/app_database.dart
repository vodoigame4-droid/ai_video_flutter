import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:sqlite3/sqlite3.dart';

part 'app_database.g.dart';

@DataClassName('LikedTemplate')
class LikedTemplatesTable extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get description => text().nullable()();
  TextColumn get resultUrl => text().nullable()();
  TextColumn get sourceUrl => text().nullable()();
  TextColumn get sourceUrls => text().nullable()(); // Lưu dưới dạng JSON string
  TextColumn get thumbnailUrl => text().nullable()();
  TextColumn get prompt => text().nullable()();
  TextColumn get type => text().nullable()();
  IntColumn get orgId => integer().nullable()();
  DateTimeColumn get likedAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};
}

@DriftDatabase(tables: [LikedTemplatesTable])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Stream<List<LikedTemplate>> watchLikedTemplates() {
    return (select(likedTemplatesTable)
          ..orderBy([
            (t) => OrderingTerm(expression: t.likedAt, mode: OrderingMode.desc)
          ]))
        .watch();
  }
}

QueryExecutor _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'app_database.sqlite'));

    // Make sqlite3 pick up temporary directories correctly on some devices
    final cachebase = await getTemporaryDirectory();
    sqlite3.tempDirectory = cachebase.path;

    return NativeDatabase.createInBackground(file);
  });
}

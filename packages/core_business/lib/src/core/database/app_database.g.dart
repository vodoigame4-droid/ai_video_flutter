// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $LikedTemplatesTableTable extends LikedTemplatesTable
    with TableInfo<$LikedTemplatesTableTable, LikedTemplate> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LikedTemplatesTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _resultUrlMeta = const VerificationMeta(
    'resultUrl',
  );
  @override
  late final GeneratedColumn<String> resultUrl = GeneratedColumn<String>(
    'result_url',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _sourceUrlMeta = const VerificationMeta(
    'sourceUrl',
  );
  @override
  late final GeneratedColumn<String> sourceUrl = GeneratedColumn<String>(
    'source_url',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _sourceUrlsMeta = const VerificationMeta(
    'sourceUrls',
  );
  @override
  late final GeneratedColumn<String> sourceUrls = GeneratedColumn<String>(
    'source_urls',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _thumbnailUrlMeta = const VerificationMeta(
    'thumbnailUrl',
  );
  @override
  late final GeneratedColumn<String> thumbnailUrl = GeneratedColumn<String>(
    'thumbnail_url',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _promptMeta = const VerificationMeta('prompt');
  @override
  late final GeneratedColumn<String> prompt = GeneratedColumn<String>(
    'prompt',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
    'type',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _orgIdMeta = const VerificationMeta('orgId');
  @override
  late final GeneratedColumn<int> orgId = GeneratedColumn<int>(
    'org_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _likedAtMeta = const VerificationMeta(
    'likedAt',
  );
  @override
  late final GeneratedColumn<DateTime> likedAt = GeneratedColumn<DateTime>(
    'liked_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    description,
    resultUrl,
    sourceUrl,
    sourceUrls,
    thumbnailUrl,
    prompt,
    type,
    orgId,
    likedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'liked_templates_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<LikedTemplate> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('result_url')) {
      context.handle(
        _resultUrlMeta,
        resultUrl.isAcceptableOrUnknown(data['result_url']!, _resultUrlMeta),
      );
    }
    if (data.containsKey('source_url')) {
      context.handle(
        _sourceUrlMeta,
        sourceUrl.isAcceptableOrUnknown(data['source_url']!, _sourceUrlMeta),
      );
    }
    if (data.containsKey('source_urls')) {
      context.handle(
        _sourceUrlsMeta,
        sourceUrls.isAcceptableOrUnknown(data['source_urls']!, _sourceUrlsMeta),
      );
    }
    if (data.containsKey('thumbnail_url')) {
      context.handle(
        _thumbnailUrlMeta,
        thumbnailUrl.isAcceptableOrUnknown(
          data['thumbnail_url']!,
          _thumbnailUrlMeta,
        ),
      );
    }
    if (data.containsKey('prompt')) {
      context.handle(
        _promptMeta,
        prompt.isAcceptableOrUnknown(data['prompt']!, _promptMeta),
      );
    }
    if (data.containsKey('type')) {
      context.handle(
        _typeMeta,
        type.isAcceptableOrUnknown(data['type']!, _typeMeta),
      );
    }
    if (data.containsKey('org_id')) {
      context.handle(
        _orgIdMeta,
        orgId.isAcceptableOrUnknown(data['org_id']!, _orgIdMeta),
      );
    }
    if (data.containsKey('liked_at')) {
      context.handle(
        _likedAtMeta,
        likedAt.isAcceptableOrUnknown(data['liked_at']!, _likedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  LikedTemplate map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LikedTemplate(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      resultUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}result_url'],
      ),
      sourceUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}source_url'],
      ),
      sourceUrls: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}source_urls'],
      ),
      thumbnailUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}thumbnail_url'],
      ),
      prompt: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}prompt'],
      ),
      type: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}type'],
      ),
      orgId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}org_id'],
      ),
      likedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}liked_at'],
      )!,
    );
  }

  @override
  $LikedTemplatesTableTable createAlias(String alias) {
    return $LikedTemplatesTableTable(attachedDatabase, alias);
  }
}

class LikedTemplate extends DataClass implements Insertable<LikedTemplate> {
  final String id;
  final String name;
  final String? description;
  final String? resultUrl;
  final String? sourceUrl;
  final String? sourceUrls;
  final String? thumbnailUrl;
  final String? prompt;
  final String? type;
  final int? orgId;
  final DateTime likedAt;
  const LikedTemplate({
    required this.id,
    required this.name,
    this.description,
    this.resultUrl,
    this.sourceUrl,
    this.sourceUrls,
    this.thumbnailUrl,
    this.prompt,
    this.type,
    this.orgId,
    required this.likedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || resultUrl != null) {
      map['result_url'] = Variable<String>(resultUrl);
    }
    if (!nullToAbsent || sourceUrl != null) {
      map['source_url'] = Variable<String>(sourceUrl);
    }
    if (!nullToAbsent || sourceUrls != null) {
      map['source_urls'] = Variable<String>(sourceUrls);
    }
    if (!nullToAbsent || thumbnailUrl != null) {
      map['thumbnail_url'] = Variable<String>(thumbnailUrl);
    }
    if (!nullToAbsent || prompt != null) {
      map['prompt'] = Variable<String>(prompt);
    }
    if (!nullToAbsent || type != null) {
      map['type'] = Variable<String>(type);
    }
    if (!nullToAbsent || orgId != null) {
      map['org_id'] = Variable<int>(orgId);
    }
    map['liked_at'] = Variable<DateTime>(likedAt);
    return map;
  }

  LikedTemplatesTableCompanion toCompanion(bool nullToAbsent) {
    return LikedTemplatesTableCompanion(
      id: Value(id),
      name: Value(name),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      resultUrl: resultUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(resultUrl),
      sourceUrl: sourceUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(sourceUrl),
      sourceUrls: sourceUrls == null && nullToAbsent
          ? const Value.absent()
          : Value(sourceUrls),
      thumbnailUrl: thumbnailUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(thumbnailUrl),
      prompt: prompt == null && nullToAbsent
          ? const Value.absent()
          : Value(prompt),
      type: type == null && nullToAbsent ? const Value.absent() : Value(type),
      orgId: orgId == null && nullToAbsent
          ? const Value.absent()
          : Value(orgId),
      likedAt: Value(likedAt),
    );
  }

  factory LikedTemplate.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LikedTemplate(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String?>(json['description']),
      resultUrl: serializer.fromJson<String?>(json['resultUrl']),
      sourceUrl: serializer.fromJson<String?>(json['sourceUrl']),
      sourceUrls: serializer.fromJson<String?>(json['sourceUrls']),
      thumbnailUrl: serializer.fromJson<String?>(json['thumbnailUrl']),
      prompt: serializer.fromJson<String?>(json['prompt']),
      type: serializer.fromJson<String?>(json['type']),
      orgId: serializer.fromJson<int?>(json['orgId']),
      likedAt: serializer.fromJson<DateTime>(json['likedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String?>(description),
      'resultUrl': serializer.toJson<String?>(resultUrl),
      'sourceUrl': serializer.toJson<String?>(sourceUrl),
      'sourceUrls': serializer.toJson<String?>(sourceUrls),
      'thumbnailUrl': serializer.toJson<String?>(thumbnailUrl),
      'prompt': serializer.toJson<String?>(prompt),
      'type': serializer.toJson<String?>(type),
      'orgId': serializer.toJson<int?>(orgId),
      'likedAt': serializer.toJson<DateTime>(likedAt),
    };
  }

  LikedTemplate copyWith({
    String? id,
    String? name,
    Value<String?> description = const Value.absent(),
    Value<String?> resultUrl = const Value.absent(),
    Value<String?> sourceUrl = const Value.absent(),
    Value<String?> sourceUrls = const Value.absent(),
    Value<String?> thumbnailUrl = const Value.absent(),
    Value<String?> prompt = const Value.absent(),
    Value<String?> type = const Value.absent(),
    Value<int?> orgId = const Value.absent(),
    DateTime? likedAt,
  }) => LikedTemplate(
    id: id ?? this.id,
    name: name ?? this.name,
    description: description.present ? description.value : this.description,
    resultUrl: resultUrl.present ? resultUrl.value : this.resultUrl,
    sourceUrl: sourceUrl.present ? sourceUrl.value : this.sourceUrl,
    sourceUrls: sourceUrls.present ? sourceUrls.value : this.sourceUrls,
    thumbnailUrl: thumbnailUrl.present ? thumbnailUrl.value : this.thumbnailUrl,
    prompt: prompt.present ? prompt.value : this.prompt,
    type: type.present ? type.value : this.type,
    orgId: orgId.present ? orgId.value : this.orgId,
    likedAt: likedAt ?? this.likedAt,
  );
  LikedTemplate copyWithCompanion(LikedTemplatesTableCompanion data) {
    return LikedTemplate(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      description: data.description.present
          ? data.description.value
          : this.description,
      resultUrl: data.resultUrl.present ? data.resultUrl.value : this.resultUrl,
      sourceUrl: data.sourceUrl.present ? data.sourceUrl.value : this.sourceUrl,
      sourceUrls: data.sourceUrls.present
          ? data.sourceUrls.value
          : this.sourceUrls,
      thumbnailUrl: data.thumbnailUrl.present
          ? data.thumbnailUrl.value
          : this.thumbnailUrl,
      prompt: data.prompt.present ? data.prompt.value : this.prompt,
      type: data.type.present ? data.type.value : this.type,
      orgId: data.orgId.present ? data.orgId.value : this.orgId,
      likedAt: data.likedAt.present ? data.likedAt.value : this.likedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LikedTemplate(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('resultUrl: $resultUrl, ')
          ..write('sourceUrl: $sourceUrl, ')
          ..write('sourceUrls: $sourceUrls, ')
          ..write('thumbnailUrl: $thumbnailUrl, ')
          ..write('prompt: $prompt, ')
          ..write('type: $type, ')
          ..write('orgId: $orgId, ')
          ..write('likedAt: $likedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    description,
    resultUrl,
    sourceUrl,
    sourceUrls,
    thumbnailUrl,
    prompt,
    type,
    orgId,
    likedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LikedTemplate &&
          other.id == this.id &&
          other.name == this.name &&
          other.description == this.description &&
          other.resultUrl == this.resultUrl &&
          other.sourceUrl == this.sourceUrl &&
          other.sourceUrls == this.sourceUrls &&
          other.thumbnailUrl == this.thumbnailUrl &&
          other.prompt == this.prompt &&
          other.type == this.type &&
          other.orgId == this.orgId &&
          other.likedAt == this.likedAt);
}

class LikedTemplatesTableCompanion extends UpdateCompanion<LikedTemplate> {
  final Value<String> id;
  final Value<String> name;
  final Value<String?> description;
  final Value<String?> resultUrl;
  final Value<String?> sourceUrl;
  final Value<String?> sourceUrls;
  final Value<String?> thumbnailUrl;
  final Value<String?> prompt;
  final Value<String?> type;
  final Value<int?> orgId;
  final Value<DateTime> likedAt;
  final Value<int> rowid;
  const LikedTemplatesTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.resultUrl = const Value.absent(),
    this.sourceUrl = const Value.absent(),
    this.sourceUrls = const Value.absent(),
    this.thumbnailUrl = const Value.absent(),
    this.prompt = const Value.absent(),
    this.type = const Value.absent(),
    this.orgId = const Value.absent(),
    this.likedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  LikedTemplatesTableCompanion.insert({
    required String id,
    required String name,
    this.description = const Value.absent(),
    this.resultUrl = const Value.absent(),
    this.sourceUrl = const Value.absent(),
    this.sourceUrls = const Value.absent(),
    this.thumbnailUrl = const Value.absent(),
    this.prompt = const Value.absent(),
    this.type = const Value.absent(),
    this.orgId = const Value.absent(),
    this.likedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name);
  static Insertable<LikedTemplate> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? description,
    Expression<String>? resultUrl,
    Expression<String>? sourceUrl,
    Expression<String>? sourceUrls,
    Expression<String>? thumbnailUrl,
    Expression<String>? prompt,
    Expression<String>? type,
    Expression<int>? orgId,
    Expression<DateTime>? likedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (resultUrl != null) 'result_url': resultUrl,
      if (sourceUrl != null) 'source_url': sourceUrl,
      if (sourceUrls != null) 'source_urls': sourceUrls,
      if (thumbnailUrl != null) 'thumbnail_url': thumbnailUrl,
      if (prompt != null) 'prompt': prompt,
      if (type != null) 'type': type,
      if (orgId != null) 'org_id': orgId,
      if (likedAt != null) 'liked_at': likedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  LikedTemplatesTableCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<String?>? description,
    Value<String?>? resultUrl,
    Value<String?>? sourceUrl,
    Value<String?>? sourceUrls,
    Value<String?>? thumbnailUrl,
    Value<String?>? prompt,
    Value<String?>? type,
    Value<int?>? orgId,
    Value<DateTime>? likedAt,
    Value<int>? rowid,
  }) {
    return LikedTemplatesTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      resultUrl: resultUrl ?? this.resultUrl,
      sourceUrl: sourceUrl ?? this.sourceUrl,
      sourceUrls: sourceUrls ?? this.sourceUrls,
      thumbnailUrl: thumbnailUrl ?? this.thumbnailUrl,
      prompt: prompt ?? this.prompt,
      type: type ?? this.type,
      orgId: orgId ?? this.orgId,
      likedAt: likedAt ?? this.likedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (resultUrl.present) {
      map['result_url'] = Variable<String>(resultUrl.value);
    }
    if (sourceUrl.present) {
      map['source_url'] = Variable<String>(sourceUrl.value);
    }
    if (sourceUrls.present) {
      map['source_urls'] = Variable<String>(sourceUrls.value);
    }
    if (thumbnailUrl.present) {
      map['thumbnail_url'] = Variable<String>(thumbnailUrl.value);
    }
    if (prompt.present) {
      map['prompt'] = Variable<String>(prompt.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (orgId.present) {
      map['org_id'] = Variable<int>(orgId.value);
    }
    if (likedAt.present) {
      map['liked_at'] = Variable<DateTime>(likedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LikedTemplatesTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('resultUrl: $resultUrl, ')
          ..write('sourceUrl: $sourceUrl, ')
          ..write('sourceUrls: $sourceUrls, ')
          ..write('thumbnailUrl: $thumbnailUrl, ')
          ..write('prompt: $prompt, ')
          ..write('type: $type, ')
          ..write('orgId: $orgId, ')
          ..write('likedAt: $likedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $LikedTemplatesTableTable likedTemplatesTable =
      $LikedTemplatesTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [likedTemplatesTable];
}

typedef $$LikedTemplatesTableTableCreateCompanionBuilder =
    LikedTemplatesTableCompanion Function({
      required String id,
      required String name,
      Value<String?> description,
      Value<String?> resultUrl,
      Value<String?> sourceUrl,
      Value<String?> sourceUrls,
      Value<String?> thumbnailUrl,
      Value<String?> prompt,
      Value<String?> type,
      Value<int?> orgId,
      Value<DateTime> likedAt,
      Value<int> rowid,
    });
typedef $$LikedTemplatesTableTableUpdateCompanionBuilder =
    LikedTemplatesTableCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<String?> description,
      Value<String?> resultUrl,
      Value<String?> sourceUrl,
      Value<String?> sourceUrls,
      Value<String?> thumbnailUrl,
      Value<String?> prompt,
      Value<String?> type,
      Value<int?> orgId,
      Value<DateTime> likedAt,
      Value<int> rowid,
    });

class $$LikedTemplatesTableTableFilterComposer
    extends Composer<_$AppDatabase, $LikedTemplatesTableTable> {
  $$LikedTemplatesTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get resultUrl => $composableBuilder(
    column: $table.resultUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get sourceUrl => $composableBuilder(
    column: $table.sourceUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get sourceUrls => $composableBuilder(
    column: $table.sourceUrls,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get thumbnailUrl => $composableBuilder(
    column: $table.thumbnailUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get prompt => $composableBuilder(
    column: $table.prompt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get orgId => $composableBuilder(
    column: $table.orgId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get likedAt => $composableBuilder(
    column: $table.likedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$LikedTemplatesTableTableOrderingComposer
    extends Composer<_$AppDatabase, $LikedTemplatesTableTable> {
  $$LikedTemplatesTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get resultUrl => $composableBuilder(
    column: $table.resultUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get sourceUrl => $composableBuilder(
    column: $table.sourceUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get sourceUrls => $composableBuilder(
    column: $table.sourceUrls,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get thumbnailUrl => $composableBuilder(
    column: $table.thumbnailUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get prompt => $composableBuilder(
    column: $table.prompt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get orgId => $composableBuilder(
    column: $table.orgId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get likedAt => $composableBuilder(
    column: $table.likedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$LikedTemplatesTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $LikedTemplatesTableTable> {
  $$LikedTemplatesTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get resultUrl =>
      $composableBuilder(column: $table.resultUrl, builder: (column) => column);

  GeneratedColumn<String> get sourceUrl =>
      $composableBuilder(column: $table.sourceUrl, builder: (column) => column);

  GeneratedColumn<String> get sourceUrls => $composableBuilder(
    column: $table.sourceUrls,
    builder: (column) => column,
  );

  GeneratedColumn<String> get thumbnailUrl => $composableBuilder(
    column: $table.thumbnailUrl,
    builder: (column) => column,
  );

  GeneratedColumn<String> get prompt =>
      $composableBuilder(column: $table.prompt, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<int> get orgId =>
      $composableBuilder(column: $table.orgId, builder: (column) => column);

  GeneratedColumn<DateTime> get likedAt =>
      $composableBuilder(column: $table.likedAt, builder: (column) => column);
}

class $$LikedTemplatesTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $LikedTemplatesTableTable,
          LikedTemplate,
          $$LikedTemplatesTableTableFilterComposer,
          $$LikedTemplatesTableTableOrderingComposer,
          $$LikedTemplatesTableTableAnnotationComposer,
          $$LikedTemplatesTableTableCreateCompanionBuilder,
          $$LikedTemplatesTableTableUpdateCompanionBuilder,
          (
            LikedTemplate,
            BaseReferences<
              _$AppDatabase,
              $LikedTemplatesTableTable,
              LikedTemplate
            >,
          ),
          LikedTemplate,
          PrefetchHooks Function()
        > {
  $$LikedTemplatesTableTableTableManager(
    _$AppDatabase db,
    $LikedTemplatesTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LikedTemplatesTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LikedTemplatesTableTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$LikedTemplatesTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<String?> resultUrl = const Value.absent(),
                Value<String?> sourceUrl = const Value.absent(),
                Value<String?> sourceUrls = const Value.absent(),
                Value<String?> thumbnailUrl = const Value.absent(),
                Value<String?> prompt = const Value.absent(),
                Value<String?> type = const Value.absent(),
                Value<int?> orgId = const Value.absent(),
                Value<DateTime> likedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => LikedTemplatesTableCompanion(
                id: id,
                name: name,
                description: description,
                resultUrl: resultUrl,
                sourceUrl: sourceUrl,
                sourceUrls: sourceUrls,
                thumbnailUrl: thumbnailUrl,
                prompt: prompt,
                type: type,
                orgId: orgId,
                likedAt: likedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                Value<String?> description = const Value.absent(),
                Value<String?> resultUrl = const Value.absent(),
                Value<String?> sourceUrl = const Value.absent(),
                Value<String?> sourceUrls = const Value.absent(),
                Value<String?> thumbnailUrl = const Value.absent(),
                Value<String?> prompt = const Value.absent(),
                Value<String?> type = const Value.absent(),
                Value<int?> orgId = const Value.absent(),
                Value<DateTime> likedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => LikedTemplatesTableCompanion.insert(
                id: id,
                name: name,
                description: description,
                resultUrl: resultUrl,
                sourceUrl: sourceUrl,
                sourceUrls: sourceUrls,
                thumbnailUrl: thumbnailUrl,
                prompt: prompt,
                type: type,
                orgId: orgId,
                likedAt: likedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$LikedTemplatesTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $LikedTemplatesTableTable,
      LikedTemplate,
      $$LikedTemplatesTableTableFilterComposer,
      $$LikedTemplatesTableTableOrderingComposer,
      $$LikedTemplatesTableTableAnnotationComposer,
      $$LikedTemplatesTableTableCreateCompanionBuilder,
      $$LikedTemplatesTableTableUpdateCompanionBuilder,
      (
        LikedTemplate,
        BaseReferences<_$AppDatabase, $LikedTemplatesTableTable, LikedTemplate>,
      ),
      LikedTemplate,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$LikedTemplatesTableTableTableManager get likedTemplatesTable =>
      $$LikedTemplatesTableTableTableManager(_db, _db.likedTemplatesTable);
}

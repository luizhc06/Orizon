// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $SourcesTable extends Sources with TableInfo<$SourcesTable, Source> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SourcesTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _baseUrlMeta = const VerificationMeta(
    'baseUrl',
  );
  @override
  late final GeneratedColumn<String> baseUrl = GeneratedColumn<String>(
    'base_url',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _apiTypeMeta = const VerificationMeta(
    'apiType',
  );
  @override
  late final GeneratedColumn<String> apiType = GeneratedColumn<String>(
    'api_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _usernameMeta = const VerificationMeta(
    'username',
  );
  @override
  late final GeneratedColumn<String> username = GeneratedColumn<String>(
    'username',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _apiKeyMeta = const VerificationMeta('apiKey');
  @override
  late final GeneratedColumn<String> apiKey = GeneratedColumn<String>(
    'api_key',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _enabledMeta = const VerificationMeta(
    'enabled',
  );
  @override
  late final GeneratedColumn<bool> enabled = GeneratedColumn<bool>(
    'enabled',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("enabled" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  static const VerificationMeta _isPresetMeta = const VerificationMeta(
    'isPreset',
  );
  @override
  late final GeneratedColumn<bool> isPreset = GeneratedColumn<bool>(
    'is_preset',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_preset" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    baseUrl,
    apiType,
    username,
    apiKey,
    enabled,
    isPreset,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sources';
  @override
  VerificationContext validateIntegrity(
    Insertable<Source> instance, {
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
    if (data.containsKey('base_url')) {
      context.handle(
        _baseUrlMeta,
        baseUrl.isAcceptableOrUnknown(data['base_url']!, _baseUrlMeta),
      );
    } else if (isInserting) {
      context.missing(_baseUrlMeta);
    }
    if (data.containsKey('api_type')) {
      context.handle(
        _apiTypeMeta,
        apiType.isAcceptableOrUnknown(data['api_type']!, _apiTypeMeta),
      );
    } else if (isInserting) {
      context.missing(_apiTypeMeta);
    }
    if (data.containsKey('username')) {
      context.handle(
        _usernameMeta,
        username.isAcceptableOrUnknown(data['username']!, _usernameMeta),
      );
    }
    if (data.containsKey('api_key')) {
      context.handle(
        _apiKeyMeta,
        apiKey.isAcceptableOrUnknown(data['api_key']!, _apiKeyMeta),
      );
    }
    if (data.containsKey('enabled')) {
      context.handle(
        _enabledMeta,
        enabled.isAcceptableOrUnknown(data['enabled']!, _enabledMeta),
      );
    }
    if (data.containsKey('is_preset')) {
      context.handle(
        _isPresetMeta,
        isPreset.isAcceptableOrUnknown(data['is_preset']!, _isPresetMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Source map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Source(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      baseUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}base_url'],
      )!,
      apiType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}api_type'],
      )!,
      username: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}username'],
      ),
      apiKey: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}api_key'],
      ),
      enabled: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}enabled'],
      )!,
      isPreset: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_preset'],
      )!,
    );
  }

  @override
  $SourcesTable createAlias(String alias) {
    return $SourcesTable(attachedDatabase, alias);
  }
}

class Source extends DataClass implements Insertable<Source> {
  final String id;
  final String name;
  final String baseUrl;
  final String apiType;
  final String? username;
  final String? apiKey;
  final bool enabled;
  final bool isPreset;
  const Source({
    required this.id,
    required this.name,
    required this.baseUrl,
    required this.apiType,
    this.username,
    this.apiKey,
    required this.enabled,
    required this.isPreset,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['base_url'] = Variable<String>(baseUrl);
    map['api_type'] = Variable<String>(apiType);
    if (!nullToAbsent || username != null) {
      map['username'] = Variable<String>(username);
    }
    if (!nullToAbsent || apiKey != null) {
      map['api_key'] = Variable<String>(apiKey);
    }
    map['enabled'] = Variable<bool>(enabled);
    map['is_preset'] = Variable<bool>(isPreset);
    return map;
  }

  SourcesCompanion toCompanion(bool nullToAbsent) {
    return SourcesCompanion(
      id: Value(id),
      name: Value(name),
      baseUrl: Value(baseUrl),
      apiType: Value(apiType),
      username: username == null && nullToAbsent
          ? const Value.absent()
          : Value(username),
      apiKey: apiKey == null && nullToAbsent
          ? const Value.absent()
          : Value(apiKey),
      enabled: Value(enabled),
      isPreset: Value(isPreset),
    );
  }

  factory Source.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Source(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      baseUrl: serializer.fromJson<String>(json['baseUrl']),
      apiType: serializer.fromJson<String>(json['apiType']),
      username: serializer.fromJson<String?>(json['username']),
      apiKey: serializer.fromJson<String?>(json['apiKey']),
      enabled: serializer.fromJson<bool>(json['enabled']),
      isPreset: serializer.fromJson<bool>(json['isPreset']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'baseUrl': serializer.toJson<String>(baseUrl),
      'apiType': serializer.toJson<String>(apiType),
      'username': serializer.toJson<String?>(username),
      'apiKey': serializer.toJson<String?>(apiKey),
      'enabled': serializer.toJson<bool>(enabled),
      'isPreset': serializer.toJson<bool>(isPreset),
    };
  }

  Source copyWith({
    String? id,
    String? name,
    String? baseUrl,
    String? apiType,
    Value<String?> username = const Value.absent(),
    Value<String?> apiKey = const Value.absent(),
    bool? enabled,
    bool? isPreset,
  }) => Source(
    id: id ?? this.id,
    name: name ?? this.name,
    baseUrl: baseUrl ?? this.baseUrl,
    apiType: apiType ?? this.apiType,
    username: username.present ? username.value : this.username,
    apiKey: apiKey.present ? apiKey.value : this.apiKey,
    enabled: enabled ?? this.enabled,
    isPreset: isPreset ?? this.isPreset,
  );
  Source copyWithCompanion(SourcesCompanion data) {
    return Source(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      baseUrl: data.baseUrl.present ? data.baseUrl.value : this.baseUrl,
      apiType: data.apiType.present ? data.apiType.value : this.apiType,
      username: data.username.present ? data.username.value : this.username,
      apiKey: data.apiKey.present ? data.apiKey.value : this.apiKey,
      enabled: data.enabled.present ? data.enabled.value : this.enabled,
      isPreset: data.isPreset.present ? data.isPreset.value : this.isPreset,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Source(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('baseUrl: $baseUrl, ')
          ..write('apiType: $apiType, ')
          ..write('username: $username, ')
          ..write('apiKey: $apiKey, ')
          ..write('enabled: $enabled, ')
          ..write('isPreset: $isPreset')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    baseUrl,
    apiType,
    username,
    apiKey,
    enabled,
    isPreset,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Source &&
          other.id == this.id &&
          other.name == this.name &&
          other.baseUrl == this.baseUrl &&
          other.apiType == this.apiType &&
          other.username == this.username &&
          other.apiKey == this.apiKey &&
          other.enabled == this.enabled &&
          other.isPreset == this.isPreset);
}

class SourcesCompanion extends UpdateCompanion<Source> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> baseUrl;
  final Value<String> apiType;
  final Value<String?> username;
  final Value<String?> apiKey;
  final Value<bool> enabled;
  final Value<bool> isPreset;
  final Value<int> rowid;
  const SourcesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.baseUrl = const Value.absent(),
    this.apiType = const Value.absent(),
    this.username = const Value.absent(),
    this.apiKey = const Value.absent(),
    this.enabled = const Value.absent(),
    this.isPreset = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SourcesCompanion.insert({
    required String id,
    required String name,
    required String baseUrl,
    required String apiType,
    this.username = const Value.absent(),
    this.apiKey = const Value.absent(),
    this.enabled = const Value.absent(),
    this.isPreset = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       baseUrl = Value(baseUrl),
       apiType = Value(apiType);
  static Insertable<Source> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? baseUrl,
    Expression<String>? apiType,
    Expression<String>? username,
    Expression<String>? apiKey,
    Expression<bool>? enabled,
    Expression<bool>? isPreset,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (baseUrl != null) 'base_url': baseUrl,
      if (apiType != null) 'api_type': apiType,
      if (username != null) 'username': username,
      if (apiKey != null) 'api_key': apiKey,
      if (enabled != null) 'enabled': enabled,
      if (isPreset != null) 'is_preset': isPreset,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SourcesCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<String>? baseUrl,
    Value<String>? apiType,
    Value<String?>? username,
    Value<String?>? apiKey,
    Value<bool>? enabled,
    Value<bool>? isPreset,
    Value<int>? rowid,
  }) {
    return SourcesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      baseUrl: baseUrl ?? this.baseUrl,
      apiType: apiType ?? this.apiType,
      username: username ?? this.username,
      apiKey: apiKey ?? this.apiKey,
      enabled: enabled ?? this.enabled,
      isPreset: isPreset ?? this.isPreset,
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
    if (baseUrl.present) {
      map['base_url'] = Variable<String>(baseUrl.value);
    }
    if (apiType.present) {
      map['api_type'] = Variable<String>(apiType.value);
    }
    if (username.present) {
      map['username'] = Variable<String>(username.value);
    }
    if (apiKey.present) {
      map['api_key'] = Variable<String>(apiKey.value);
    }
    if (enabled.present) {
      map['enabled'] = Variable<bool>(enabled.value);
    }
    if (isPreset.present) {
      map['is_preset'] = Variable<bool>(isPreset.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SourcesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('baseUrl: $baseUrl, ')
          ..write('apiType: $apiType, ')
          ..write('username: $username, ')
          ..write('apiKey: $apiKey, ')
          ..write('enabled: $enabled, ')
          ..write('isPreset: $isPreset, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $FavoritesTable extends Favorites
    with TableInfo<$FavoritesTable, Favorite> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FavoritesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _postIdMeta = const VerificationMeta('postId');
  @override
  late final GeneratedColumn<String> postId = GeneratedColumn<String>(
    'post_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sourceIdMeta = const VerificationMeta(
    'sourceId',
  );
  @override
  late final GeneratedColumn<String> sourceId = GeneratedColumn<String>(
    'source_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _previewUrlMeta = const VerificationMeta(
    'previewUrl',
  );
  @override
  late final GeneratedColumn<String> previewUrl = GeneratedColumn<String>(
    'preview_url',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _fileUrlMeta = const VerificationMeta(
    'fileUrl',
  );
  @override
  late final GeneratedColumn<String> fileUrl = GeneratedColumn<String>(
    'file_url',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _widthMeta = const VerificationMeta('width');
  @override
  late final GeneratedColumn<int> width = GeneratedColumn<int>(
    'width',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _heightMeta = const VerificationMeta('height');
  @override
  late final GeneratedColumn<int> height = GeneratedColumn<int>(
    'height',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _tagsMeta = const VerificationMeta('tags');
  @override
  late final GeneratedColumn<String> tags = GeneratedColumn<String>(
    'tags',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _ratingMeta = const VerificationMeta('rating');
  @override
  late final GeneratedColumn<String> rating = GeneratedColumn<String>(
    'rating',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _fileTypeMeta = const VerificationMeta(
    'fileType',
  );
  @override
  late final GeneratedColumn<String> fileType = GeneratedColumn<String>(
    'file_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sourcePostUrlMeta = const VerificationMeta(
    'sourcePostUrl',
  );
  @override
  late final GeneratedColumn<String> sourcePostUrl = GeneratedColumn<String>(
    'source_post_url',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _addedAtMeta = const VerificationMeta(
    'addedAt',
  );
  @override
  late final GeneratedColumn<DateTime> addedAt = GeneratedColumn<DateTime>(
    'added_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    postId,
    sourceId,
    previewUrl,
    fileUrl,
    width,
    height,
    tags,
    rating,
    fileType,
    sourcePostUrl,
    addedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'favorites';
  @override
  VerificationContext validateIntegrity(
    Insertable<Favorite> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('post_id')) {
      context.handle(
        _postIdMeta,
        postId.isAcceptableOrUnknown(data['post_id']!, _postIdMeta),
      );
    } else if (isInserting) {
      context.missing(_postIdMeta);
    }
    if (data.containsKey('source_id')) {
      context.handle(
        _sourceIdMeta,
        sourceId.isAcceptableOrUnknown(data['source_id']!, _sourceIdMeta),
      );
    } else if (isInserting) {
      context.missing(_sourceIdMeta);
    }
    if (data.containsKey('preview_url')) {
      context.handle(
        _previewUrlMeta,
        previewUrl.isAcceptableOrUnknown(data['preview_url']!, _previewUrlMeta),
      );
    } else if (isInserting) {
      context.missing(_previewUrlMeta);
    }
    if (data.containsKey('file_url')) {
      context.handle(
        _fileUrlMeta,
        fileUrl.isAcceptableOrUnknown(data['file_url']!, _fileUrlMeta),
      );
    } else if (isInserting) {
      context.missing(_fileUrlMeta);
    }
    if (data.containsKey('width')) {
      context.handle(
        _widthMeta,
        width.isAcceptableOrUnknown(data['width']!, _widthMeta),
      );
    }
    if (data.containsKey('height')) {
      context.handle(
        _heightMeta,
        height.isAcceptableOrUnknown(data['height']!, _heightMeta),
      );
    }
    if (data.containsKey('tags')) {
      context.handle(
        _tagsMeta,
        tags.isAcceptableOrUnknown(data['tags']!, _tagsMeta),
      );
    }
    if (data.containsKey('rating')) {
      context.handle(
        _ratingMeta,
        rating.isAcceptableOrUnknown(data['rating']!, _ratingMeta),
      );
    } else if (isInserting) {
      context.missing(_ratingMeta);
    }
    if (data.containsKey('file_type')) {
      context.handle(
        _fileTypeMeta,
        fileType.isAcceptableOrUnknown(data['file_type']!, _fileTypeMeta),
      );
    } else if (isInserting) {
      context.missing(_fileTypeMeta);
    }
    if (data.containsKey('source_post_url')) {
      context.handle(
        _sourcePostUrlMeta,
        sourcePostUrl.isAcceptableOrUnknown(
          data['source_post_url']!,
          _sourcePostUrlMeta,
        ),
      );
    }
    if (data.containsKey('added_at')) {
      context.handle(
        _addedAtMeta,
        addedAt.isAcceptableOrUnknown(data['added_at']!, _addedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Favorite map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Favorite(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      postId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}post_id'],
      )!,
      sourceId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}source_id'],
      )!,
      previewUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}preview_url'],
      )!,
      fileUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}file_url'],
      )!,
      width: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}width'],
      )!,
      height: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}height'],
      )!,
      tags: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tags'],
      )!,
      rating: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}rating'],
      )!,
      fileType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}file_type'],
      )!,
      sourcePostUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}source_post_url'],
      ),
      addedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}added_at'],
      )!,
    );
  }

  @override
  $FavoritesTable createAlias(String alias) {
    return $FavoritesTable(attachedDatabase, alias);
  }
}

class Favorite extends DataClass implements Insertable<Favorite> {
  final int id;
  final String postId;
  final String sourceId;
  final String previewUrl;
  final String fileUrl;
  final int width;
  final int height;
  final String tags;
  final String rating;
  final String fileType;
  final String? sourcePostUrl;
  final DateTime addedAt;
  const Favorite({
    required this.id,
    required this.postId,
    required this.sourceId,
    required this.previewUrl,
    required this.fileUrl,
    required this.width,
    required this.height,
    required this.tags,
    required this.rating,
    required this.fileType,
    this.sourcePostUrl,
    required this.addedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['post_id'] = Variable<String>(postId);
    map['source_id'] = Variable<String>(sourceId);
    map['preview_url'] = Variable<String>(previewUrl);
    map['file_url'] = Variable<String>(fileUrl);
    map['width'] = Variable<int>(width);
    map['height'] = Variable<int>(height);
    map['tags'] = Variable<String>(tags);
    map['rating'] = Variable<String>(rating);
    map['file_type'] = Variable<String>(fileType);
    if (!nullToAbsent || sourcePostUrl != null) {
      map['source_post_url'] = Variable<String>(sourcePostUrl);
    }
    map['added_at'] = Variable<DateTime>(addedAt);
    return map;
  }

  FavoritesCompanion toCompanion(bool nullToAbsent) {
    return FavoritesCompanion(
      id: Value(id),
      postId: Value(postId),
      sourceId: Value(sourceId),
      previewUrl: Value(previewUrl),
      fileUrl: Value(fileUrl),
      width: Value(width),
      height: Value(height),
      tags: Value(tags),
      rating: Value(rating),
      fileType: Value(fileType),
      sourcePostUrl: sourcePostUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(sourcePostUrl),
      addedAt: Value(addedAt),
    );
  }

  factory Favorite.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Favorite(
      id: serializer.fromJson<int>(json['id']),
      postId: serializer.fromJson<String>(json['postId']),
      sourceId: serializer.fromJson<String>(json['sourceId']),
      previewUrl: serializer.fromJson<String>(json['previewUrl']),
      fileUrl: serializer.fromJson<String>(json['fileUrl']),
      width: serializer.fromJson<int>(json['width']),
      height: serializer.fromJson<int>(json['height']),
      tags: serializer.fromJson<String>(json['tags']),
      rating: serializer.fromJson<String>(json['rating']),
      fileType: serializer.fromJson<String>(json['fileType']),
      sourcePostUrl: serializer.fromJson<String?>(json['sourcePostUrl']),
      addedAt: serializer.fromJson<DateTime>(json['addedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'postId': serializer.toJson<String>(postId),
      'sourceId': serializer.toJson<String>(sourceId),
      'previewUrl': serializer.toJson<String>(previewUrl),
      'fileUrl': serializer.toJson<String>(fileUrl),
      'width': serializer.toJson<int>(width),
      'height': serializer.toJson<int>(height),
      'tags': serializer.toJson<String>(tags),
      'rating': serializer.toJson<String>(rating),
      'fileType': serializer.toJson<String>(fileType),
      'sourcePostUrl': serializer.toJson<String?>(sourcePostUrl),
      'addedAt': serializer.toJson<DateTime>(addedAt),
    };
  }

  Favorite copyWith({
    int? id,
    String? postId,
    String? sourceId,
    String? previewUrl,
    String? fileUrl,
    int? width,
    int? height,
    String? tags,
    String? rating,
    String? fileType,
    Value<String?> sourcePostUrl = const Value.absent(),
    DateTime? addedAt,
  }) => Favorite(
    id: id ?? this.id,
    postId: postId ?? this.postId,
    sourceId: sourceId ?? this.sourceId,
    previewUrl: previewUrl ?? this.previewUrl,
    fileUrl: fileUrl ?? this.fileUrl,
    width: width ?? this.width,
    height: height ?? this.height,
    tags: tags ?? this.tags,
    rating: rating ?? this.rating,
    fileType: fileType ?? this.fileType,
    sourcePostUrl: sourcePostUrl.present
        ? sourcePostUrl.value
        : this.sourcePostUrl,
    addedAt: addedAt ?? this.addedAt,
  );
  Favorite copyWithCompanion(FavoritesCompanion data) {
    return Favorite(
      id: data.id.present ? data.id.value : this.id,
      postId: data.postId.present ? data.postId.value : this.postId,
      sourceId: data.sourceId.present ? data.sourceId.value : this.sourceId,
      previewUrl: data.previewUrl.present
          ? data.previewUrl.value
          : this.previewUrl,
      fileUrl: data.fileUrl.present ? data.fileUrl.value : this.fileUrl,
      width: data.width.present ? data.width.value : this.width,
      height: data.height.present ? data.height.value : this.height,
      tags: data.tags.present ? data.tags.value : this.tags,
      rating: data.rating.present ? data.rating.value : this.rating,
      fileType: data.fileType.present ? data.fileType.value : this.fileType,
      sourcePostUrl: data.sourcePostUrl.present
          ? data.sourcePostUrl.value
          : this.sourcePostUrl,
      addedAt: data.addedAt.present ? data.addedAt.value : this.addedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Favorite(')
          ..write('id: $id, ')
          ..write('postId: $postId, ')
          ..write('sourceId: $sourceId, ')
          ..write('previewUrl: $previewUrl, ')
          ..write('fileUrl: $fileUrl, ')
          ..write('width: $width, ')
          ..write('height: $height, ')
          ..write('tags: $tags, ')
          ..write('rating: $rating, ')
          ..write('fileType: $fileType, ')
          ..write('sourcePostUrl: $sourcePostUrl, ')
          ..write('addedAt: $addedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    postId,
    sourceId,
    previewUrl,
    fileUrl,
    width,
    height,
    tags,
    rating,
    fileType,
    sourcePostUrl,
    addedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Favorite &&
          other.id == this.id &&
          other.postId == this.postId &&
          other.sourceId == this.sourceId &&
          other.previewUrl == this.previewUrl &&
          other.fileUrl == this.fileUrl &&
          other.width == this.width &&
          other.height == this.height &&
          other.tags == this.tags &&
          other.rating == this.rating &&
          other.fileType == this.fileType &&
          other.sourcePostUrl == this.sourcePostUrl &&
          other.addedAt == this.addedAt);
}

class FavoritesCompanion extends UpdateCompanion<Favorite> {
  final Value<int> id;
  final Value<String> postId;
  final Value<String> sourceId;
  final Value<String> previewUrl;
  final Value<String> fileUrl;
  final Value<int> width;
  final Value<int> height;
  final Value<String> tags;
  final Value<String> rating;
  final Value<String> fileType;
  final Value<String?> sourcePostUrl;
  final Value<DateTime> addedAt;
  const FavoritesCompanion({
    this.id = const Value.absent(),
    this.postId = const Value.absent(),
    this.sourceId = const Value.absent(),
    this.previewUrl = const Value.absent(),
    this.fileUrl = const Value.absent(),
    this.width = const Value.absent(),
    this.height = const Value.absent(),
    this.tags = const Value.absent(),
    this.rating = const Value.absent(),
    this.fileType = const Value.absent(),
    this.sourcePostUrl = const Value.absent(),
    this.addedAt = const Value.absent(),
  });
  FavoritesCompanion.insert({
    this.id = const Value.absent(),
    required String postId,
    required String sourceId,
    required String previewUrl,
    required String fileUrl,
    this.width = const Value.absent(),
    this.height = const Value.absent(),
    this.tags = const Value.absent(),
    required String rating,
    required String fileType,
    this.sourcePostUrl = const Value.absent(),
    this.addedAt = const Value.absent(),
  }) : postId = Value(postId),
       sourceId = Value(sourceId),
       previewUrl = Value(previewUrl),
       fileUrl = Value(fileUrl),
       rating = Value(rating),
       fileType = Value(fileType);
  static Insertable<Favorite> custom({
    Expression<int>? id,
    Expression<String>? postId,
    Expression<String>? sourceId,
    Expression<String>? previewUrl,
    Expression<String>? fileUrl,
    Expression<int>? width,
    Expression<int>? height,
    Expression<String>? tags,
    Expression<String>? rating,
    Expression<String>? fileType,
    Expression<String>? sourcePostUrl,
    Expression<DateTime>? addedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (postId != null) 'post_id': postId,
      if (sourceId != null) 'source_id': sourceId,
      if (previewUrl != null) 'preview_url': previewUrl,
      if (fileUrl != null) 'file_url': fileUrl,
      if (width != null) 'width': width,
      if (height != null) 'height': height,
      if (tags != null) 'tags': tags,
      if (rating != null) 'rating': rating,
      if (fileType != null) 'file_type': fileType,
      if (sourcePostUrl != null) 'source_post_url': sourcePostUrl,
      if (addedAt != null) 'added_at': addedAt,
    });
  }

  FavoritesCompanion copyWith({
    Value<int>? id,
    Value<String>? postId,
    Value<String>? sourceId,
    Value<String>? previewUrl,
    Value<String>? fileUrl,
    Value<int>? width,
    Value<int>? height,
    Value<String>? tags,
    Value<String>? rating,
    Value<String>? fileType,
    Value<String?>? sourcePostUrl,
    Value<DateTime>? addedAt,
  }) {
    return FavoritesCompanion(
      id: id ?? this.id,
      postId: postId ?? this.postId,
      sourceId: sourceId ?? this.sourceId,
      previewUrl: previewUrl ?? this.previewUrl,
      fileUrl: fileUrl ?? this.fileUrl,
      width: width ?? this.width,
      height: height ?? this.height,
      tags: tags ?? this.tags,
      rating: rating ?? this.rating,
      fileType: fileType ?? this.fileType,
      sourcePostUrl: sourcePostUrl ?? this.sourcePostUrl,
      addedAt: addedAt ?? this.addedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (postId.present) {
      map['post_id'] = Variable<String>(postId.value);
    }
    if (sourceId.present) {
      map['source_id'] = Variable<String>(sourceId.value);
    }
    if (previewUrl.present) {
      map['preview_url'] = Variable<String>(previewUrl.value);
    }
    if (fileUrl.present) {
      map['file_url'] = Variable<String>(fileUrl.value);
    }
    if (width.present) {
      map['width'] = Variable<int>(width.value);
    }
    if (height.present) {
      map['height'] = Variable<int>(height.value);
    }
    if (tags.present) {
      map['tags'] = Variable<String>(tags.value);
    }
    if (rating.present) {
      map['rating'] = Variable<String>(rating.value);
    }
    if (fileType.present) {
      map['file_type'] = Variable<String>(fileType.value);
    }
    if (sourcePostUrl.present) {
      map['source_post_url'] = Variable<String>(sourcePostUrl.value);
    }
    if (addedAt.present) {
      map['added_at'] = Variable<DateTime>(addedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FavoritesCompanion(')
          ..write('id: $id, ')
          ..write('postId: $postId, ')
          ..write('sourceId: $sourceId, ')
          ..write('previewUrl: $previewUrl, ')
          ..write('fileUrl: $fileUrl, ')
          ..write('width: $width, ')
          ..write('height: $height, ')
          ..write('tags: $tags, ')
          ..write('rating: $rating, ')
          ..write('fileType: $fileType, ')
          ..write('sourcePostUrl: $sourcePostUrl, ')
          ..write('addedAt: $addedAt')
          ..write(')'))
        .toString();
  }
}

class $TagBlacklistEntriesTable extends TagBlacklistEntries
    with TableInfo<$TagBlacklistEntriesTable, TagBlacklistEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TagBlacklistEntriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _tagMeta = const VerificationMeta('tag');
  @override
  late final GeneratedColumn<String> tag = GeneratedColumn<String>(
    'tag',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _addedAtMeta = const VerificationMeta(
    'addedAt',
  );
  @override
  late final GeneratedColumn<DateTime> addedAt = GeneratedColumn<DateTime>(
    'added_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [id, tag, addedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'tag_blacklist_entries';
  @override
  VerificationContext validateIntegrity(
    Insertable<TagBlacklistEntry> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('tag')) {
      context.handle(
        _tagMeta,
        tag.isAcceptableOrUnknown(data['tag']!, _tagMeta),
      );
    } else if (isInserting) {
      context.missing(_tagMeta);
    }
    if (data.containsKey('added_at')) {
      context.handle(
        _addedAtMeta,
        addedAt.isAcceptableOrUnknown(data['added_at']!, _addedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TagBlacklistEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TagBlacklistEntry(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      tag: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tag'],
      )!,
      addedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}added_at'],
      )!,
    );
  }

  @override
  $TagBlacklistEntriesTable createAlias(String alias) {
    return $TagBlacklistEntriesTable(attachedDatabase, alias);
  }
}

class TagBlacklistEntry extends DataClass
    implements Insertable<TagBlacklistEntry> {
  final int id;
  final String tag;
  final DateTime addedAt;
  const TagBlacklistEntry({
    required this.id,
    required this.tag,
    required this.addedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['tag'] = Variable<String>(tag);
    map['added_at'] = Variable<DateTime>(addedAt);
    return map;
  }

  TagBlacklistEntriesCompanion toCompanion(bool nullToAbsent) {
    return TagBlacklistEntriesCompanion(
      id: Value(id),
      tag: Value(tag),
      addedAt: Value(addedAt),
    );
  }

  factory TagBlacklistEntry.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TagBlacklistEntry(
      id: serializer.fromJson<int>(json['id']),
      tag: serializer.fromJson<String>(json['tag']),
      addedAt: serializer.fromJson<DateTime>(json['addedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'tag': serializer.toJson<String>(tag),
      'addedAt': serializer.toJson<DateTime>(addedAt),
    };
  }

  TagBlacklistEntry copyWith({int? id, String? tag, DateTime? addedAt}) =>
      TagBlacklistEntry(
        id: id ?? this.id,
        tag: tag ?? this.tag,
        addedAt: addedAt ?? this.addedAt,
      );
  TagBlacklistEntry copyWithCompanion(TagBlacklistEntriesCompanion data) {
    return TagBlacklistEntry(
      id: data.id.present ? data.id.value : this.id,
      tag: data.tag.present ? data.tag.value : this.tag,
      addedAt: data.addedAt.present ? data.addedAt.value : this.addedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TagBlacklistEntry(')
          ..write('id: $id, ')
          ..write('tag: $tag, ')
          ..write('addedAt: $addedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, tag, addedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TagBlacklistEntry &&
          other.id == this.id &&
          other.tag == this.tag &&
          other.addedAt == this.addedAt);
}

class TagBlacklistEntriesCompanion extends UpdateCompanion<TagBlacklistEntry> {
  final Value<int> id;
  final Value<String> tag;
  final Value<DateTime> addedAt;
  const TagBlacklistEntriesCompanion({
    this.id = const Value.absent(),
    this.tag = const Value.absent(),
    this.addedAt = const Value.absent(),
  });
  TagBlacklistEntriesCompanion.insert({
    this.id = const Value.absent(),
    required String tag,
    this.addedAt = const Value.absent(),
  }) : tag = Value(tag);
  static Insertable<TagBlacklistEntry> custom({
    Expression<int>? id,
    Expression<String>? tag,
    Expression<DateTime>? addedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (tag != null) 'tag': tag,
      if (addedAt != null) 'added_at': addedAt,
    });
  }

  TagBlacklistEntriesCompanion copyWith({
    Value<int>? id,
    Value<String>? tag,
    Value<DateTime>? addedAt,
  }) {
    return TagBlacklistEntriesCompanion(
      id: id ?? this.id,
      tag: tag ?? this.tag,
      addedAt: addedAt ?? this.addedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (tag.present) {
      map['tag'] = Variable<String>(tag.value);
    }
    if (addedAt.present) {
      map['added_at'] = Variable<DateTime>(addedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TagBlacklistEntriesCompanion(')
          ..write('id: $id, ')
          ..write('tag: $tag, ')
          ..write('addedAt: $addedAt')
          ..write(')'))
        .toString();
  }
}

class $DownloadHistoryEntriesTable extends DownloadHistoryEntries
    with TableInfo<$DownloadHistoryEntriesTable, DownloadHistoryEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DownloadHistoryEntriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _postIdMeta = const VerificationMeta('postId');
  @override
  late final GeneratedColumn<String> postId = GeneratedColumn<String>(
    'post_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sourceIdMeta = const VerificationMeta(
    'sourceId',
  );
  @override
  late final GeneratedColumn<String> sourceId = GeneratedColumn<String>(
    'source_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _fileUrlMeta = const VerificationMeta(
    'fileUrl',
  );
  @override
  late final GeneratedColumn<String> fileUrl = GeneratedColumn<String>(
    'file_url',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _localPathMeta = const VerificationMeta(
    'localPath',
  );
  @override
  late final GeneratedColumn<String> localPath = GeneratedColumn<String>(
    'local_path',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _downloadedAtMeta = const VerificationMeta(
    'downloadedAt',
  );
  @override
  late final GeneratedColumn<DateTime> downloadedAt = GeneratedColumn<DateTime>(
    'downloaded_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    postId,
    sourceId,
    fileUrl,
    localPath,
    downloadedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'download_history_entries';
  @override
  VerificationContext validateIntegrity(
    Insertable<DownloadHistoryEntry> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('post_id')) {
      context.handle(
        _postIdMeta,
        postId.isAcceptableOrUnknown(data['post_id']!, _postIdMeta),
      );
    } else if (isInserting) {
      context.missing(_postIdMeta);
    }
    if (data.containsKey('source_id')) {
      context.handle(
        _sourceIdMeta,
        sourceId.isAcceptableOrUnknown(data['source_id']!, _sourceIdMeta),
      );
    } else if (isInserting) {
      context.missing(_sourceIdMeta);
    }
    if (data.containsKey('file_url')) {
      context.handle(
        _fileUrlMeta,
        fileUrl.isAcceptableOrUnknown(data['file_url']!, _fileUrlMeta),
      );
    } else if (isInserting) {
      context.missing(_fileUrlMeta);
    }
    if (data.containsKey('local_path')) {
      context.handle(
        _localPathMeta,
        localPath.isAcceptableOrUnknown(data['local_path']!, _localPathMeta),
      );
    } else if (isInserting) {
      context.missing(_localPathMeta);
    }
    if (data.containsKey('downloaded_at')) {
      context.handle(
        _downloadedAtMeta,
        downloadedAt.isAcceptableOrUnknown(
          data['downloaded_at']!,
          _downloadedAtMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DownloadHistoryEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DownloadHistoryEntry(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      postId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}post_id'],
      )!,
      sourceId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}source_id'],
      )!,
      fileUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}file_url'],
      )!,
      localPath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}local_path'],
      )!,
      downloadedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}downloaded_at'],
      )!,
    );
  }

  @override
  $DownloadHistoryEntriesTable createAlias(String alias) {
    return $DownloadHistoryEntriesTable(attachedDatabase, alias);
  }
}

class DownloadHistoryEntry extends DataClass
    implements Insertable<DownloadHistoryEntry> {
  final int id;
  final String postId;
  final String sourceId;
  final String fileUrl;
  final String localPath;
  final DateTime downloadedAt;
  const DownloadHistoryEntry({
    required this.id,
    required this.postId,
    required this.sourceId,
    required this.fileUrl,
    required this.localPath,
    required this.downloadedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['post_id'] = Variable<String>(postId);
    map['source_id'] = Variable<String>(sourceId);
    map['file_url'] = Variable<String>(fileUrl);
    map['local_path'] = Variable<String>(localPath);
    map['downloaded_at'] = Variable<DateTime>(downloadedAt);
    return map;
  }

  DownloadHistoryEntriesCompanion toCompanion(bool nullToAbsent) {
    return DownloadHistoryEntriesCompanion(
      id: Value(id),
      postId: Value(postId),
      sourceId: Value(sourceId),
      fileUrl: Value(fileUrl),
      localPath: Value(localPath),
      downloadedAt: Value(downloadedAt),
    );
  }

  factory DownloadHistoryEntry.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DownloadHistoryEntry(
      id: serializer.fromJson<int>(json['id']),
      postId: serializer.fromJson<String>(json['postId']),
      sourceId: serializer.fromJson<String>(json['sourceId']),
      fileUrl: serializer.fromJson<String>(json['fileUrl']),
      localPath: serializer.fromJson<String>(json['localPath']),
      downloadedAt: serializer.fromJson<DateTime>(json['downloadedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'postId': serializer.toJson<String>(postId),
      'sourceId': serializer.toJson<String>(sourceId),
      'fileUrl': serializer.toJson<String>(fileUrl),
      'localPath': serializer.toJson<String>(localPath),
      'downloadedAt': serializer.toJson<DateTime>(downloadedAt),
    };
  }

  DownloadHistoryEntry copyWith({
    int? id,
    String? postId,
    String? sourceId,
    String? fileUrl,
    String? localPath,
    DateTime? downloadedAt,
  }) => DownloadHistoryEntry(
    id: id ?? this.id,
    postId: postId ?? this.postId,
    sourceId: sourceId ?? this.sourceId,
    fileUrl: fileUrl ?? this.fileUrl,
    localPath: localPath ?? this.localPath,
    downloadedAt: downloadedAt ?? this.downloadedAt,
  );
  DownloadHistoryEntry copyWithCompanion(DownloadHistoryEntriesCompanion data) {
    return DownloadHistoryEntry(
      id: data.id.present ? data.id.value : this.id,
      postId: data.postId.present ? data.postId.value : this.postId,
      sourceId: data.sourceId.present ? data.sourceId.value : this.sourceId,
      fileUrl: data.fileUrl.present ? data.fileUrl.value : this.fileUrl,
      localPath: data.localPath.present ? data.localPath.value : this.localPath,
      downloadedAt: data.downloadedAt.present
          ? data.downloadedAt.value
          : this.downloadedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DownloadHistoryEntry(')
          ..write('id: $id, ')
          ..write('postId: $postId, ')
          ..write('sourceId: $sourceId, ')
          ..write('fileUrl: $fileUrl, ')
          ..write('localPath: $localPath, ')
          ..write('downloadedAt: $downloadedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, postId, sourceId, fileUrl, localPath, downloadedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DownloadHistoryEntry &&
          other.id == this.id &&
          other.postId == this.postId &&
          other.sourceId == this.sourceId &&
          other.fileUrl == this.fileUrl &&
          other.localPath == this.localPath &&
          other.downloadedAt == this.downloadedAt);
}

class DownloadHistoryEntriesCompanion
    extends UpdateCompanion<DownloadHistoryEntry> {
  final Value<int> id;
  final Value<String> postId;
  final Value<String> sourceId;
  final Value<String> fileUrl;
  final Value<String> localPath;
  final Value<DateTime> downloadedAt;
  const DownloadHistoryEntriesCompanion({
    this.id = const Value.absent(),
    this.postId = const Value.absent(),
    this.sourceId = const Value.absent(),
    this.fileUrl = const Value.absent(),
    this.localPath = const Value.absent(),
    this.downloadedAt = const Value.absent(),
  });
  DownloadHistoryEntriesCompanion.insert({
    this.id = const Value.absent(),
    required String postId,
    required String sourceId,
    required String fileUrl,
    required String localPath,
    this.downloadedAt = const Value.absent(),
  }) : postId = Value(postId),
       sourceId = Value(sourceId),
       fileUrl = Value(fileUrl),
       localPath = Value(localPath);
  static Insertable<DownloadHistoryEntry> custom({
    Expression<int>? id,
    Expression<String>? postId,
    Expression<String>? sourceId,
    Expression<String>? fileUrl,
    Expression<String>? localPath,
    Expression<DateTime>? downloadedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (postId != null) 'post_id': postId,
      if (sourceId != null) 'source_id': sourceId,
      if (fileUrl != null) 'file_url': fileUrl,
      if (localPath != null) 'local_path': localPath,
      if (downloadedAt != null) 'downloaded_at': downloadedAt,
    });
  }

  DownloadHistoryEntriesCompanion copyWith({
    Value<int>? id,
    Value<String>? postId,
    Value<String>? sourceId,
    Value<String>? fileUrl,
    Value<String>? localPath,
    Value<DateTime>? downloadedAt,
  }) {
    return DownloadHistoryEntriesCompanion(
      id: id ?? this.id,
      postId: postId ?? this.postId,
      sourceId: sourceId ?? this.sourceId,
      fileUrl: fileUrl ?? this.fileUrl,
      localPath: localPath ?? this.localPath,
      downloadedAt: downloadedAt ?? this.downloadedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (postId.present) {
      map['post_id'] = Variable<String>(postId.value);
    }
    if (sourceId.present) {
      map['source_id'] = Variable<String>(sourceId.value);
    }
    if (fileUrl.present) {
      map['file_url'] = Variable<String>(fileUrl.value);
    }
    if (localPath.present) {
      map['local_path'] = Variable<String>(localPath.value);
    }
    if (downloadedAt.present) {
      map['downloaded_at'] = Variable<DateTime>(downloadedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DownloadHistoryEntriesCompanion(')
          ..write('id: $id, ')
          ..write('postId: $postId, ')
          ..write('sourceId: $sourceId, ')
          ..write('fileUrl: $fileUrl, ')
          ..write('localPath: $localPath, ')
          ..write('downloadedAt: $downloadedAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $SourcesTable sources = $SourcesTable(this);
  late final $FavoritesTable favorites = $FavoritesTable(this);
  late final $TagBlacklistEntriesTable tagBlacklistEntries =
      $TagBlacklistEntriesTable(this);
  late final $DownloadHistoryEntriesTable downloadHistoryEntries =
      $DownloadHistoryEntriesTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    sources,
    favorites,
    tagBlacklistEntries,
    downloadHistoryEntries,
  ];
}

typedef $$SourcesTableCreateCompanionBuilder =
    SourcesCompanion Function({
      required String id,
      required String name,
      required String baseUrl,
      required String apiType,
      Value<String?> username,
      Value<String?> apiKey,
      Value<bool> enabled,
      Value<bool> isPreset,
      Value<int> rowid,
    });
typedef $$SourcesTableUpdateCompanionBuilder =
    SourcesCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<String> baseUrl,
      Value<String> apiType,
      Value<String?> username,
      Value<String?> apiKey,
      Value<bool> enabled,
      Value<bool> isPreset,
      Value<int> rowid,
    });

class $$SourcesTableFilterComposer
    extends Composer<_$AppDatabase, $SourcesTable> {
  $$SourcesTableFilterComposer({
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

  ColumnFilters<String> get baseUrl => $composableBuilder(
    column: $table.baseUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get apiType => $composableBuilder(
    column: $table.apiType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get username => $composableBuilder(
    column: $table.username,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get apiKey => $composableBuilder(
    column: $table.apiKey,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get enabled => $composableBuilder(
    column: $table.enabled,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isPreset => $composableBuilder(
    column: $table.isPreset,
    builder: (column) => ColumnFilters(column),
  );
}

class $$SourcesTableOrderingComposer
    extends Composer<_$AppDatabase, $SourcesTable> {
  $$SourcesTableOrderingComposer({
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

  ColumnOrderings<String> get baseUrl => $composableBuilder(
    column: $table.baseUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get apiType => $composableBuilder(
    column: $table.apiType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get username => $composableBuilder(
    column: $table.username,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get apiKey => $composableBuilder(
    column: $table.apiKey,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get enabled => $composableBuilder(
    column: $table.enabled,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isPreset => $composableBuilder(
    column: $table.isPreset,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SourcesTableAnnotationComposer
    extends Composer<_$AppDatabase, $SourcesTable> {
  $$SourcesTableAnnotationComposer({
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

  GeneratedColumn<String> get baseUrl =>
      $composableBuilder(column: $table.baseUrl, builder: (column) => column);

  GeneratedColumn<String> get apiType =>
      $composableBuilder(column: $table.apiType, builder: (column) => column);

  GeneratedColumn<String> get username =>
      $composableBuilder(column: $table.username, builder: (column) => column);

  GeneratedColumn<String> get apiKey =>
      $composableBuilder(column: $table.apiKey, builder: (column) => column);

  GeneratedColumn<bool> get enabled =>
      $composableBuilder(column: $table.enabled, builder: (column) => column);

  GeneratedColumn<bool> get isPreset =>
      $composableBuilder(column: $table.isPreset, builder: (column) => column);
}

class $$SourcesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SourcesTable,
          Source,
          $$SourcesTableFilterComposer,
          $$SourcesTableOrderingComposer,
          $$SourcesTableAnnotationComposer,
          $$SourcesTableCreateCompanionBuilder,
          $$SourcesTableUpdateCompanionBuilder,
          (Source, BaseReferences<_$AppDatabase, $SourcesTable, Source>),
          Source,
          PrefetchHooks Function()
        > {
  $$SourcesTableTableManager(_$AppDatabase db, $SourcesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SourcesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SourcesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SourcesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> baseUrl = const Value.absent(),
                Value<String> apiType = const Value.absent(),
                Value<String?> username = const Value.absent(),
                Value<String?> apiKey = const Value.absent(),
                Value<bool> enabled = const Value.absent(),
                Value<bool> isPreset = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SourcesCompanion(
                id: id,
                name: name,
                baseUrl: baseUrl,
                apiType: apiType,
                username: username,
                apiKey: apiKey,
                enabled: enabled,
                isPreset: isPreset,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                required String baseUrl,
                required String apiType,
                Value<String?> username = const Value.absent(),
                Value<String?> apiKey = const Value.absent(),
                Value<bool> enabled = const Value.absent(),
                Value<bool> isPreset = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SourcesCompanion.insert(
                id: id,
                name: name,
                baseUrl: baseUrl,
                apiType: apiType,
                username: username,
                apiKey: apiKey,
                enabled: enabled,
                isPreset: isPreset,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$SourcesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SourcesTable,
      Source,
      $$SourcesTableFilterComposer,
      $$SourcesTableOrderingComposer,
      $$SourcesTableAnnotationComposer,
      $$SourcesTableCreateCompanionBuilder,
      $$SourcesTableUpdateCompanionBuilder,
      (Source, BaseReferences<_$AppDatabase, $SourcesTable, Source>),
      Source,
      PrefetchHooks Function()
    >;
typedef $$FavoritesTableCreateCompanionBuilder =
    FavoritesCompanion Function({
      Value<int> id,
      required String postId,
      required String sourceId,
      required String previewUrl,
      required String fileUrl,
      Value<int> width,
      Value<int> height,
      Value<String> tags,
      required String rating,
      required String fileType,
      Value<String?> sourcePostUrl,
      Value<DateTime> addedAt,
    });
typedef $$FavoritesTableUpdateCompanionBuilder =
    FavoritesCompanion Function({
      Value<int> id,
      Value<String> postId,
      Value<String> sourceId,
      Value<String> previewUrl,
      Value<String> fileUrl,
      Value<int> width,
      Value<int> height,
      Value<String> tags,
      Value<String> rating,
      Value<String> fileType,
      Value<String?> sourcePostUrl,
      Value<DateTime> addedAt,
    });

class $$FavoritesTableFilterComposer
    extends Composer<_$AppDatabase, $FavoritesTable> {
  $$FavoritesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get postId => $composableBuilder(
    column: $table.postId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get sourceId => $composableBuilder(
    column: $table.sourceId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get previewUrl => $composableBuilder(
    column: $table.previewUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get fileUrl => $composableBuilder(
    column: $table.fileUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get width => $composableBuilder(
    column: $table.width,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get height => $composableBuilder(
    column: $table.height,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tags => $composableBuilder(
    column: $table.tags,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get rating => $composableBuilder(
    column: $table.rating,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get fileType => $composableBuilder(
    column: $table.fileType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get sourcePostUrl => $composableBuilder(
    column: $table.sourcePostUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get addedAt => $composableBuilder(
    column: $table.addedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$FavoritesTableOrderingComposer
    extends Composer<_$AppDatabase, $FavoritesTable> {
  $$FavoritesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get postId => $composableBuilder(
    column: $table.postId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get sourceId => $composableBuilder(
    column: $table.sourceId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get previewUrl => $composableBuilder(
    column: $table.previewUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get fileUrl => $composableBuilder(
    column: $table.fileUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get width => $composableBuilder(
    column: $table.width,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get height => $composableBuilder(
    column: $table.height,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tags => $composableBuilder(
    column: $table.tags,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get rating => $composableBuilder(
    column: $table.rating,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get fileType => $composableBuilder(
    column: $table.fileType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get sourcePostUrl => $composableBuilder(
    column: $table.sourcePostUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get addedAt => $composableBuilder(
    column: $table.addedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$FavoritesTableAnnotationComposer
    extends Composer<_$AppDatabase, $FavoritesTable> {
  $$FavoritesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get postId =>
      $composableBuilder(column: $table.postId, builder: (column) => column);

  GeneratedColumn<String> get sourceId =>
      $composableBuilder(column: $table.sourceId, builder: (column) => column);

  GeneratedColumn<String> get previewUrl => $composableBuilder(
    column: $table.previewUrl,
    builder: (column) => column,
  );

  GeneratedColumn<String> get fileUrl =>
      $composableBuilder(column: $table.fileUrl, builder: (column) => column);

  GeneratedColumn<int> get width =>
      $composableBuilder(column: $table.width, builder: (column) => column);

  GeneratedColumn<int> get height =>
      $composableBuilder(column: $table.height, builder: (column) => column);

  GeneratedColumn<String> get tags =>
      $composableBuilder(column: $table.tags, builder: (column) => column);

  GeneratedColumn<String> get rating =>
      $composableBuilder(column: $table.rating, builder: (column) => column);

  GeneratedColumn<String> get fileType =>
      $composableBuilder(column: $table.fileType, builder: (column) => column);

  GeneratedColumn<String> get sourcePostUrl => $composableBuilder(
    column: $table.sourcePostUrl,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get addedAt =>
      $composableBuilder(column: $table.addedAt, builder: (column) => column);
}

class $$FavoritesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $FavoritesTable,
          Favorite,
          $$FavoritesTableFilterComposer,
          $$FavoritesTableOrderingComposer,
          $$FavoritesTableAnnotationComposer,
          $$FavoritesTableCreateCompanionBuilder,
          $$FavoritesTableUpdateCompanionBuilder,
          (Favorite, BaseReferences<_$AppDatabase, $FavoritesTable, Favorite>),
          Favorite,
          PrefetchHooks Function()
        > {
  $$FavoritesTableTableManager(_$AppDatabase db, $FavoritesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$FavoritesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$FavoritesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$FavoritesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> postId = const Value.absent(),
                Value<String> sourceId = const Value.absent(),
                Value<String> previewUrl = const Value.absent(),
                Value<String> fileUrl = const Value.absent(),
                Value<int> width = const Value.absent(),
                Value<int> height = const Value.absent(),
                Value<String> tags = const Value.absent(),
                Value<String> rating = const Value.absent(),
                Value<String> fileType = const Value.absent(),
                Value<String?> sourcePostUrl = const Value.absent(),
                Value<DateTime> addedAt = const Value.absent(),
              }) => FavoritesCompanion(
                id: id,
                postId: postId,
                sourceId: sourceId,
                previewUrl: previewUrl,
                fileUrl: fileUrl,
                width: width,
                height: height,
                tags: tags,
                rating: rating,
                fileType: fileType,
                sourcePostUrl: sourcePostUrl,
                addedAt: addedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String postId,
                required String sourceId,
                required String previewUrl,
                required String fileUrl,
                Value<int> width = const Value.absent(),
                Value<int> height = const Value.absent(),
                Value<String> tags = const Value.absent(),
                required String rating,
                required String fileType,
                Value<String?> sourcePostUrl = const Value.absent(),
                Value<DateTime> addedAt = const Value.absent(),
              }) => FavoritesCompanion.insert(
                id: id,
                postId: postId,
                sourceId: sourceId,
                previewUrl: previewUrl,
                fileUrl: fileUrl,
                width: width,
                height: height,
                tags: tags,
                rating: rating,
                fileType: fileType,
                sourcePostUrl: sourcePostUrl,
                addedAt: addedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$FavoritesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $FavoritesTable,
      Favorite,
      $$FavoritesTableFilterComposer,
      $$FavoritesTableOrderingComposer,
      $$FavoritesTableAnnotationComposer,
      $$FavoritesTableCreateCompanionBuilder,
      $$FavoritesTableUpdateCompanionBuilder,
      (Favorite, BaseReferences<_$AppDatabase, $FavoritesTable, Favorite>),
      Favorite,
      PrefetchHooks Function()
    >;
typedef $$TagBlacklistEntriesTableCreateCompanionBuilder =
    TagBlacklistEntriesCompanion Function({
      Value<int> id,
      required String tag,
      Value<DateTime> addedAt,
    });
typedef $$TagBlacklistEntriesTableUpdateCompanionBuilder =
    TagBlacklistEntriesCompanion Function({
      Value<int> id,
      Value<String> tag,
      Value<DateTime> addedAt,
    });

class $$TagBlacklistEntriesTableFilterComposer
    extends Composer<_$AppDatabase, $TagBlacklistEntriesTable> {
  $$TagBlacklistEntriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tag => $composableBuilder(
    column: $table.tag,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get addedAt => $composableBuilder(
    column: $table.addedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$TagBlacklistEntriesTableOrderingComposer
    extends Composer<_$AppDatabase, $TagBlacklistEntriesTable> {
  $$TagBlacklistEntriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tag => $composableBuilder(
    column: $table.tag,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get addedAt => $composableBuilder(
    column: $table.addedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$TagBlacklistEntriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $TagBlacklistEntriesTable> {
  $$TagBlacklistEntriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get tag =>
      $composableBuilder(column: $table.tag, builder: (column) => column);

  GeneratedColumn<DateTime> get addedAt =>
      $composableBuilder(column: $table.addedAt, builder: (column) => column);
}

class $$TagBlacklistEntriesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TagBlacklistEntriesTable,
          TagBlacklistEntry,
          $$TagBlacklistEntriesTableFilterComposer,
          $$TagBlacklistEntriesTableOrderingComposer,
          $$TagBlacklistEntriesTableAnnotationComposer,
          $$TagBlacklistEntriesTableCreateCompanionBuilder,
          $$TagBlacklistEntriesTableUpdateCompanionBuilder,
          (
            TagBlacklistEntry,
            BaseReferences<
              _$AppDatabase,
              $TagBlacklistEntriesTable,
              TagBlacklistEntry
            >,
          ),
          TagBlacklistEntry,
          PrefetchHooks Function()
        > {
  $$TagBlacklistEntriesTableTableManager(
    _$AppDatabase db,
    $TagBlacklistEntriesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TagBlacklistEntriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TagBlacklistEntriesTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$TagBlacklistEntriesTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> tag = const Value.absent(),
                Value<DateTime> addedAt = const Value.absent(),
              }) => TagBlacklistEntriesCompanion(
                id: id,
                tag: tag,
                addedAt: addedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String tag,
                Value<DateTime> addedAt = const Value.absent(),
              }) => TagBlacklistEntriesCompanion.insert(
                id: id,
                tag: tag,
                addedAt: addedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$TagBlacklistEntriesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TagBlacklistEntriesTable,
      TagBlacklistEntry,
      $$TagBlacklistEntriesTableFilterComposer,
      $$TagBlacklistEntriesTableOrderingComposer,
      $$TagBlacklistEntriesTableAnnotationComposer,
      $$TagBlacklistEntriesTableCreateCompanionBuilder,
      $$TagBlacklistEntriesTableUpdateCompanionBuilder,
      (
        TagBlacklistEntry,
        BaseReferences<
          _$AppDatabase,
          $TagBlacklistEntriesTable,
          TagBlacklistEntry
        >,
      ),
      TagBlacklistEntry,
      PrefetchHooks Function()
    >;
typedef $$DownloadHistoryEntriesTableCreateCompanionBuilder =
    DownloadHistoryEntriesCompanion Function({
      Value<int> id,
      required String postId,
      required String sourceId,
      required String fileUrl,
      required String localPath,
      Value<DateTime> downloadedAt,
    });
typedef $$DownloadHistoryEntriesTableUpdateCompanionBuilder =
    DownloadHistoryEntriesCompanion Function({
      Value<int> id,
      Value<String> postId,
      Value<String> sourceId,
      Value<String> fileUrl,
      Value<String> localPath,
      Value<DateTime> downloadedAt,
    });

class $$DownloadHistoryEntriesTableFilterComposer
    extends Composer<_$AppDatabase, $DownloadHistoryEntriesTable> {
  $$DownloadHistoryEntriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get postId => $composableBuilder(
    column: $table.postId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get sourceId => $composableBuilder(
    column: $table.sourceId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get fileUrl => $composableBuilder(
    column: $table.fileUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get localPath => $composableBuilder(
    column: $table.localPath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get downloadedAt => $composableBuilder(
    column: $table.downloadedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$DownloadHistoryEntriesTableOrderingComposer
    extends Composer<_$AppDatabase, $DownloadHistoryEntriesTable> {
  $$DownloadHistoryEntriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get postId => $composableBuilder(
    column: $table.postId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get sourceId => $composableBuilder(
    column: $table.sourceId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get fileUrl => $composableBuilder(
    column: $table.fileUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get localPath => $composableBuilder(
    column: $table.localPath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get downloadedAt => $composableBuilder(
    column: $table.downloadedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$DownloadHistoryEntriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $DownloadHistoryEntriesTable> {
  $$DownloadHistoryEntriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get postId =>
      $composableBuilder(column: $table.postId, builder: (column) => column);

  GeneratedColumn<String> get sourceId =>
      $composableBuilder(column: $table.sourceId, builder: (column) => column);

  GeneratedColumn<String> get fileUrl =>
      $composableBuilder(column: $table.fileUrl, builder: (column) => column);

  GeneratedColumn<String> get localPath =>
      $composableBuilder(column: $table.localPath, builder: (column) => column);

  GeneratedColumn<DateTime> get downloadedAt => $composableBuilder(
    column: $table.downloadedAt,
    builder: (column) => column,
  );
}

class $$DownloadHistoryEntriesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DownloadHistoryEntriesTable,
          DownloadHistoryEntry,
          $$DownloadHistoryEntriesTableFilterComposer,
          $$DownloadHistoryEntriesTableOrderingComposer,
          $$DownloadHistoryEntriesTableAnnotationComposer,
          $$DownloadHistoryEntriesTableCreateCompanionBuilder,
          $$DownloadHistoryEntriesTableUpdateCompanionBuilder,
          (
            DownloadHistoryEntry,
            BaseReferences<
              _$AppDatabase,
              $DownloadHistoryEntriesTable,
              DownloadHistoryEntry
            >,
          ),
          DownloadHistoryEntry,
          PrefetchHooks Function()
        > {
  $$DownloadHistoryEntriesTableTableManager(
    _$AppDatabase db,
    $DownloadHistoryEntriesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DownloadHistoryEntriesTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$DownloadHistoryEntriesTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$DownloadHistoryEntriesTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> postId = const Value.absent(),
                Value<String> sourceId = const Value.absent(),
                Value<String> fileUrl = const Value.absent(),
                Value<String> localPath = const Value.absent(),
                Value<DateTime> downloadedAt = const Value.absent(),
              }) => DownloadHistoryEntriesCompanion(
                id: id,
                postId: postId,
                sourceId: sourceId,
                fileUrl: fileUrl,
                localPath: localPath,
                downloadedAt: downloadedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String postId,
                required String sourceId,
                required String fileUrl,
                required String localPath,
                Value<DateTime> downloadedAt = const Value.absent(),
              }) => DownloadHistoryEntriesCompanion.insert(
                id: id,
                postId: postId,
                sourceId: sourceId,
                fileUrl: fileUrl,
                localPath: localPath,
                downloadedAt: downloadedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$DownloadHistoryEntriesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DownloadHistoryEntriesTable,
      DownloadHistoryEntry,
      $$DownloadHistoryEntriesTableFilterComposer,
      $$DownloadHistoryEntriesTableOrderingComposer,
      $$DownloadHistoryEntriesTableAnnotationComposer,
      $$DownloadHistoryEntriesTableCreateCompanionBuilder,
      $$DownloadHistoryEntriesTableUpdateCompanionBuilder,
      (
        DownloadHistoryEntry,
        BaseReferences<
          _$AppDatabase,
          $DownloadHistoryEntriesTable,
          DownloadHistoryEntry
        >,
      ),
      DownloadHistoryEntry,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$SourcesTableTableManager get sources =>
      $$SourcesTableTableManager(_db, _db.sources);
  $$FavoritesTableTableManager get favorites =>
      $$FavoritesTableTableManager(_db, _db.favorites);
  $$TagBlacklistEntriesTableTableManager get tagBlacklistEntries =>
      $$TagBlacklistEntriesTableTableManager(_db, _db.tagBlacklistEntries);
  $$DownloadHistoryEntriesTableTableManager get downloadHistoryEntries =>
      $$DownloadHistoryEntriesTableTableManager(
        _db,
        _db.downloadHistoryEntries,
      );
}

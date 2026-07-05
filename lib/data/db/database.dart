import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

part 'database.g.dart';

class Sources extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get baseUrl => text()();
  TextColumn get apiType => text()(); // 'danbooru' | 'gelbooru' | 'moebooru'
  TextColumn get username => text().nullable()();
  TextColumn get apiKey => text().nullable()();
  BoolColumn get enabled => boolean().withDefault(const Constant(true))();
  BoolColumn get isPreset => boolean().withDefault(const Constant(false))();

  @override
  Set<Column> get primaryKey => {id};
}

class Favorites extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get postId => text()();
  TextColumn get sourceId => text()();
  TextColumn get previewUrl => text()();
  TextColumn get fileUrl => text()();
  IntColumn get width => integer().withDefault(const Constant(0))();
  IntColumn get height => integer().withDefault(const Constant(0))();
  TextColumn get tags => text().withDefault(const Constant(''))();
  TextColumn get rating => text()();
  TextColumn get fileType => text()();
  TextColumn get sourcePostUrl => text().nullable()();
  DateTimeColumn get addedAt => dateTime().withDefault(currentDateAndTime)();
}

class TagBlacklistEntries extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get tag => text().unique()();
  DateTimeColumn get addedAt => dateTime().withDefault(currentDateAndTime)();
}

class DownloadHistoryEntries extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get postId => text()();
  TextColumn get sourceId => text()();
  TextColumn get fileUrl => text()();
  TextColumn get localPath => text()();
  DateTimeColumn get downloadedAt => dateTime().withDefault(currentDateAndTime)();
}

@DriftDatabase(
  tables: [Sources, Favorites, TagBlacklistEntries, DownloadHistoryEntries],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    return driftDatabase(name: 'orizon_db');
  }

  // --- Sources ---

  Future<List<Source>> getAllSources() => select(sources).get();

  Stream<List<Source>> watchAllSources() => select(sources).watch();

  Future<void> upsertSource(SourcesCompanion source) =>
      into(sources).insertOnConflictUpdate(source);

  Future<void> deleteSource(String id) =>
      (delete(sources)..where((t) => t.id.equals(id))).go();

  // --- Favorites ---

  Stream<List<Favorite>> watchFavorites() =>
      (select(favorites)..orderBy([(t) => OrderingTerm.desc(t.addedAt)]))
          .watch();

  Future<bool> isFavorite(String sourceId, String postId) async {
    final row =
        await (select(favorites)
              ..where(
                (t) => t.sourceId.equals(sourceId) & t.postId.equals(postId),
              ))
            .getSingleOrNull();
    return row != null;
  }

  Future<void> addFavorite(FavoritesCompanion favorite) =>
      into(favorites).insert(favorite);

  Future<void> removeFavorite(String sourceId, String postId) =>
      (delete(favorites)..where(
            (t) => t.sourceId.equals(sourceId) & t.postId.equals(postId),
          ))
          .go();

  // --- Tag blacklist (do usuário, além da blacklist-base fixa no código) ---

  Stream<List<TagBlacklistEntry>> watchBlacklist() =>
      select(tagBlacklistEntries).watch();

  Future<void> addBlacklistTag(String tag) => into(
    tagBlacklistEntries,
  ).insertOnConflictUpdate(TagBlacklistEntriesCompanion.insert(tag: tag));

  Future<void> removeBlacklistTag(String tag) =>
      (delete(tagBlacklistEntries)..where((t) => t.tag.equals(tag))).go();

  // --- Download history ---

  Stream<List<DownloadHistoryEntry>> watchDownloadHistory() =>
      (select(downloadHistoryEntries)
            ..orderBy([(t) => OrderingTerm.desc(t.downloadedAt)]))
          .watch();

  Future<void> addDownloadRecord(DownloadHistoryEntriesCompanion entry) =>
      into(downloadHistoryEntries).insert(entry);
}

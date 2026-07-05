import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/booru/booru_repository.dart';
import '../data/db/database.dart';

final appDatabaseProvider = Provider<AppDatabase>((ref) {
  final db = AppDatabase();
  ref.onDispose(db.close);
  return db;
});

final booruRepositoryProvider = Provider<BooruRepository>((ref) {
  return BooruRepository(ref.watch(appDatabaseProvider));
});

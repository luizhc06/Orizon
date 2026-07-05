import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

import '../../core/providers.dart';
import '../../data/booru/models/source_config.dart';
import '../../data/db/database.dart';
import '../../data/db/mappers.dart';

final sourcesStreamProvider = StreamProvider<List<Source>>((ref) {
  final db = ref.watch(appDatabaseProvider);
  return db.watchAllSources();
});

/// Fonte ativa pra busca (modo single-source). Guardamos só o id; a tela de
/// busca resolve o [Source] correspondente a partir de [sourcesStreamProvider].
final activeSourceIdProvider = StateProvider<String?>((ref) => null);

/// Fontes escolhidas pelo usuário quando o modo multi-booru está ligado
/// (ver [multiBooruProvider] em settings_providers.dart). Vazio = usa todas
/// as fontes habilitadas.
final selectedMultiSourceIdsProvider = StateProvider<Set<String>>((ref) => {});

Future<void> ensurePresetSourcesSeeded(AppDatabase db) async {
  final existing = await db.getAllSources();
  if (existing.isNotEmpty) return;
  for (final preset in presetSources) {
    await db.upsertSource(preset.toCompanion());
  }
}

import 'dart:convert';
import 'dart:io';

import 'package:drift/drift.dart' show Value;
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/db/database.dart';

const _backupSettingsKeys = [
  'settings.themePreset',
  'settings.gridColumns',
  'settings.gridMode',
  'settings.showAdultContent',
  'settings.multiBooru',
  'settings.hideAiGenerated',
  'settings.autoClearCache',
  'settings.locale',
];

/// Exporta/importa fontes, favoritos, blacklist e configurações num único
/// arquivo JSON. Não inclui histórico de downloads (baixo valor, alto
/// volume) nem senhas/API keys em texto plano fora do próprio dispositivo
/// — as credenciais de fonte são incluídas porque o usuário pode precisar
/// delas pra restaurar o acesso, mas o arquivo deve ser tratado como
/// sensível.
class BackupService {
  final AppDatabase db;

  BackupService(this.db);

  Future<Map<String, dynamic>> _buildExportMap() async {
    final sources = await db.getAllSources();
    final favorites = await db.select(db.favorites).get();
    final blacklist = await db.select(db.tagBlacklistEntries).get();
    final prefs = await SharedPreferences.getInstance();

    final settings = <String, Object?>{};
    for (final key in _backupSettingsKeys) {
      settings[key] = prefs.get(key);
    }

    return {
      'formatVersion': 1,
      'exportedAt': DateTime.now().toIso8601String(),
      'sources': sources
          .map(
            (s) => {
              'id': s.id,
              'name': s.name,
              'baseUrl': s.baseUrl,
              'apiType': s.apiType,
              'username': s.username,
              'apiKey': s.apiKey,
              'enabled': s.enabled,
              'isPreset': s.isPreset,
            },
          )
          .toList(),
      'favorites': favorites
          .map(
            (f) => {
              'postId': f.postId,
              'sourceId': f.sourceId,
              'previewUrl': f.previewUrl,
              'fileUrl': f.fileUrl,
              'width': f.width,
              'height': f.height,
              'tags': f.tags,
              'rating': f.rating,
              'fileType': f.fileType,
              'sourcePostUrl': f.sourcePostUrl,
            },
          )
          .toList(),
      'blacklist': blacklist.map((b) => b.tag).toList(),
      'settings': settings,
    };
  }

  Future<File> exportToFile() async {
    final data = await _buildExportMap();
    final json = const JsonEncoder.withIndent('  ').convert(data);
    final dir = await getTemporaryDirectory();
    final file = File(
      '${dir.path}/orizon_backup_${DateTime.now().millisecondsSinceEpoch}.json',
    );
    await file.writeAsString(json);
    return file;
  }

  Future<void> shareBackup() async {
    final file = await exportToFile();
    await SharePlus.instance.share(
      ShareParams(files: [XFile(file.path)], text: 'Backup do Orizon'),
    );
  }

  Future<void> importFromFile(File file) async {
    final content = await file.readAsString();
    final data = jsonDecode(content) as Map<String, dynamic>;
    await importFromMap(data);
  }

  Future<void> importFromMap(Map<String, dynamic> data) async {
    final sources = (data['sources'] as List? ?? []).cast<Map>();
    for (final s in sources) {
      await db.upsertSource(
        SourcesCompanion(
          id: Value(s['id'] as String),
          name: Value(s['name'] as String),
          baseUrl: Value(s['baseUrl'] as String),
          apiType: Value(s['apiType'] as String),
          username: Value(s['username'] as String?),
          apiKey: Value(s['apiKey'] as String?),
          enabled: Value(s['enabled'] as bool? ?? true),
          isPreset: Value(s['isPreset'] as bool? ?? false),
        ),
      );
    }

    final favorites = (data['favorites'] as List? ?? []).cast<Map>();
    for (final f in favorites) {
      final alreadyFavorite = await db.isFavorite(
        f['sourceId'] as String,
        f['postId'] as String,
      );
      if (alreadyFavorite) continue;
      await db.addFavorite(
        FavoritesCompanion.insert(
          postId: f['postId'] as String,
          sourceId: f['sourceId'] as String,
          previewUrl: f['previewUrl'] as String,
          fileUrl: f['fileUrl'] as String,
          width: Value(f['width'] as int? ?? 0),
          height: Value(f['height'] as int? ?? 0),
          tags: Value(f['tags'] as String? ?? ''),
          rating: f['rating'] as String,
          fileType: f['fileType'] as String,
          sourcePostUrl: Value(f['sourcePostUrl'] as String?),
        ),
      );
    }

    final blacklist = (data['blacklist'] as List? ?? []).cast<String>();
    for (final tag in blacklist) {
      await db.addBlacklistTag(tag);
    }

    final settings = (data['settings'] as Map?)?.cast<String, dynamic>();
    if (settings != null) {
      final prefs = await SharedPreferences.getInstance();
      for (final entry in settings.entries) {
        final value = entry.value;
        if (value == null) continue;
        if (value is bool) {
          await prefs.setBool(entry.key, value);
        } else if (value is int) {
          await prefs.setInt(entry.key, value);
        } else if (value is String) {
          await prefs.setString(entry.key, value);
        }
      }
    }
  }
}

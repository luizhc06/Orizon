import '../../core/ai_generated_tags.dart';
import '../../core/base_blacklist.dart';
import '../db/database.dart';
import 'booru_api_factory.dart';
import 'models/post.dart';
import 'models/source_config.dart';

/// Ponto único onde busca (API) e filtro de conteúdo se encontram. Toda
/// busca feita pela UI passa por aqui — nunca chama [BooruApi] direto —
/// pra garantir que a blacklist-base fixa e a blacklist do usuário sempre
/// sejam aplicadas, além do rating seguro quando [safeModeOnly] estiver
/// ligado (toggle de NSFW desligado) e do filtro anti-IA quando
/// [hideAiGenerated] estiver ligado.
class BooruRepository {
  final AppDatabase db;

  BooruRepository(this.db);

  Future<Set<String>> _userBlacklistTags() async {
    final userBlacklist = await db.select(db.tagBlacklistEntries).get();
    return userBlacklist.map((e) => e.tag.toLowerCase()).toSet();
  }

  List<Post> _filterPosts(
    List<Post> posts,
    Set<String> userBlacklistTags,
    bool hideAiGenerated,
  ) {
    return posts.where((post) {
      if (isBlockedByBaseBlacklist(post.tags)) return false;
      if (hideAiGenerated && isBlockedByAiFilter(post.tags)) return false;
      final postTagSet = post.tags.map((t) => t.toLowerCase()).toSet();
      return !userBlacklistTags.any(postTagSet.contains);
    }).toList();
  }

  Future<List<Post>> search(
    SourceConfig source, {
    required List<String> tags,
    required int page,
    required bool safeModeOnly,
    bool hideAiGenerated = false,
    int limit = 40,
  }) async {
    final api = createBooruApi(source);
    final rawPosts = await api.search(
      tags: tags,
      page: page,
      limit: limit,
      safeModeOnly: safeModeOnly,
    );
    final blacklist = await _userBlacklistTags();
    return _filterPosts(rawPosts, blacklist, hideAiGenerated);
  }

  /// Modo multi-booru: busca em várias fontes ao mesmo tempo. Cada fonte
  /// mantém sua própria paginação em [pages] (por id); o chamador decide
  /// quando parar de incluir uma fonte que já esgotou resultados.
  Future<Map<String, List<Post>>> searchMultiple(
    List<SourceConfig> sources, {
    required List<String> tags,
    required Map<String, int> pages,
    required bool safeModeOnly,
    bool hideAiGenerated = false,
    int limit = 40,
  }) async {
    final blacklist = await _userBlacklistTags();

    final entries = await Future.wait(
      sources.map((source) async {
        try {
          final api = createBooruApi(source);
          final posts = await api.search(
            tags: tags,
            page: pages[source.id] ?? 1,
            limit: limit,
            safeModeOnly: safeModeOnly,
          );
          return MapEntry(
            source.id,
            _filterPosts(posts, blacklist, hideAiGenerated),
          );
        } catch (_) {
          return MapEntry(source.id, const <Post>[]);
        }
      }),
    );

    return Map.fromEntries(entries);
  }

  Future<List<String>> autocompleteTags(SourceConfig source, String query) {
    final api = createBooruApi(source);
    return api.autocompleteTags(query);
  }
}

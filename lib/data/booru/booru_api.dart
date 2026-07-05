import 'models/post.dart';

/// Interface comum pras diferentes APIs de booru (Danbooru, Gelbooru 0.2,
/// Moebooru são todas bem diferentes no formato de resposta). Cada
/// implementação concreta traduz pro modelo [Post] normalizado.
///
/// [safeModeOnly] é decidido pelo toggle de NSFW nas configurações (padrão
/// ligado/seguro). Quando true, cada implementação força o parâmetro de
/// rating seguro da API correspondente e reconfere o rating de cada post
/// retornado antes de expor, mesmo que a fonte não respeite o parâmetro.
abstract class BooruApi {
  Future<List<Post>> search({
    required List<String> tags,
    required int page,
    int limit = 40,
    required bool safeModeOnly,
  });

  Future<List<String>> autocompleteTags(String query);
}

/// Filtro de segurança aplicado quando [safeModeOnly] está ativo,
/// independente do que a fonte devolver.
List<Post> enforceSafeRating(List<Post> posts) {
  return posts.where((p) => p.rating == PostRating.safe).toList();
}

class BooruApiException implements Exception {
  final String message;
  const BooruApiException(this.message);

  @override
  String toString() => 'BooruApiException: $message';
}

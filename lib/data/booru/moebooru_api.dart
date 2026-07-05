import 'package:dio/dio.dart';

import 'booru_api.dart';
import 'models/post.dart';
import 'models/source_config.dart';

/// Moebooru (yande.re, konachan). Esquema de rating tradicional de 3 níveis.
class MoebooruApi implements BooruApi {
  final SourceConfig source;
  final Dio _dio;

  MoebooruApi(this.source, {Dio? dio}) : _dio = dio ?? Dio();

  @override
  Future<List<Post>> search({
    required List<String> tags,
    required int page,
    int limit = 40,
    required bool safeModeOnly,
  }) async {
    final queryTags = safeModeOnly
        ? [...tags, 'rating:safe'].join(' ')
        : tags.join(' ');

    final response = await _dio.get(
      '${source.baseUrl}/post.json',
      queryParameters: {
        'tags': queryTags,
        'page': page,
        'limit': limit,
        if (source.apiKey != null) 'api_key': source.apiKey,
      },
    );

    if (response.data is! List) {
      throw const BooruApiException('Resposta inesperada da API Moebooru');
    }

    final posts = (response.data as List)
        .whereType<Map>()
        .map((json) => _parsePost(json))
        .whereType<Post>()
        .toList();

    return safeModeOnly ? enforceSafeRating(posts) : posts;
  }

  Post? _parsePost(Map json) {
    final fileUrl = json['file_url'] as String?;
    if (fileUrl == null) return null;

    final tagString = (json['tags'] as String? ?? '').trim();

    return Post(
      id: json['id'].toString(),
      sourceId: source.id,
      previewUrl: json['preview_url'] as String? ?? fileUrl,
      sampleUrl: json['sample_url'] as String? ?? fileUrl,
      fileUrl: fileUrl,
      width: (json['width'] as num?)?.toInt() ?? 0,
      height: (json['height'] as num?)?.toInt() ?? 0,
      tags: tagString.isEmpty ? const [] : tagString.split(' '),
      rating: ratingFromLegacyCode(json['rating'] as String?),
      fileType: fileTypeFromExtension(fileUrl.split('.').last),
      sourcePostUrl: '${source.baseUrl}/post/show/${json['id']}',
    );
  }

  @override
  Future<List<String>> autocompleteTags(String query) async {
    final response = await _dio.get(
      '${source.baseUrl}/tag.json',
      queryParameters: {'name': '$query*', 'order': 'count', 'limit': 10},
    );

    if (response.data is! List) return const [];
    return (response.data as List)
        .whereType<Map>()
        .map((e) => e['name'] as String?)
        .whereType<String>()
        .toList();
  }
}

import 'package:dio/dio.dart';

import 'booru_api.dart';
import 'models/post.dart';
import 'models/source_config.dart';

/// Danbooru e derivados (mesmo formato JSON: e621, e926, etc.).
class DanbooruApi implements BooruApi {
  final SourceConfig source;
  final Dio _dio;

  DanbooruApi(this.source, {Dio? dio}) : _dio = dio ?? Dio();

  @override
  Future<List<Post>> search({
    required List<String> tags,
    required int page,
    int limit = 40,
    required bool safeModeOnly,
  }) async {
    final queryTags = safeModeOnly
        ? [...tags, 'rating:g'].join(' ')
        : tags.join(' ');

    final response = await _dio.get(
      '${source.baseUrl}/posts.json',
      queryParameters: {
        'tags': queryTags,
        'page': page,
        'limit': limit,
        if (source.username != null) 'login': source.username,
        if (source.apiKey != null) 'api_key': source.apiKey,
      },
    );

    if (response.data is! List) {
      throw const BooruApiException('Resposta inesperada da API Danbooru');
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

    final extension = json['file_ext'] as String?;
    final tagString = (json['tag_string'] as String? ?? '').trim();

    return Post(
      id: json['id'].toString(),
      sourceId: source.id,
      previewUrl: json['preview_file_url'] as String? ?? fileUrl,
      sampleUrl: json['large_file_url'] as String? ?? fileUrl,
      fileUrl: fileUrl,
      width: (json['image_width'] as num?)?.toInt() ?? 0,
      height: (json['image_height'] as num?)?.toInt() ?? 0,
      tags: tagString.isEmpty ? const [] : tagString.split(' '),
      rating: ratingFromDanbooruCode(json['rating'] as String?),
      fileType: fileTypeFromExtension(extension),
      sourcePostUrl: '${source.baseUrl}/posts/${json['id']}',
    );
  }

  @override
  Future<List<String>> autocompleteTags(String query) async {
    final response = await _dio.get(
      '${source.baseUrl}/tags.json',
      queryParameters: {
        'search[name_matches]': '$query*',
        'search[order]': 'count',
        'limit': 10,
      },
    );

    if (response.data is! List) return const [];
    return (response.data as List)
        .whereType<Map>()
        .map((e) => e['name'] as String?)
        .whereType<String>()
        .toList();
  }
}

import 'package:dio/dio.dart';

import 'booru_api.dart';
import 'models/post.dart';
import 'models/source_config.dart';

/// API 0.2 (Gelbooru, Safebooru, Rule34 usam o mesmo formato).
/// Esquema de rating tradicional de 3 níveis (safe/questionable/explicit).
class GelbooruApi implements BooruApi {
  final SourceConfig source;
  final Dio _dio;

  GelbooruApi(this.source, {Dio? dio}) : _dio = dio ?? Dio();

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
      '${source.baseUrl}/index.php',
      queryParameters: {
        'page': 'dapi',
        's': 'post',
        'q': 'index',
        'json': 1,
        'tags': queryTags,
        'pid': page,
        'limit': limit,
        if (source.apiKey != null) 'api_key': source.apiKey,
        if (source.username != null) 'user_id': source.username,
      },
    );

    final rawList = _extractPostList(response.data);
    final posts = rawList
        .whereType<Map>()
        .map((json) => _parsePost(json))
        .whereType<Post>()
        .toList();

    return safeModeOnly ? enforceSafeRating(posts) : posts;
  }

  List _extractPostList(dynamic data) {
    if (data is List) return data;
    if (data is Map && data['post'] is List) return data['post'] as List;
    return const [];
  }

  Post? _parsePost(Map json) {
    final fileUrl = json['file_url'] as String?;
    if (fileUrl == null) return null;

    final extension = (json['image'] as String?)?.split('.').last;
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
      fileType: fileTypeFromExtension(extension),
      sourcePostUrl:
          '${source.baseUrl}/index.php?page=post&s=view&id=${json['id']}',
    );
  }

  @override
  Future<List<String>> autocompleteTags(String query) async {
    final response = await _dio.get(
      '${source.baseUrl}/index.php',
      queryParameters: {
        'page': 'dapi',
        's': 'tag',
        'q': 'index',
        'json': 1,
        'name_pattern': '%$query%',
        'orderby': 'count',
        'limit': 10,
      },
    );

    final rawList = _extractTagList(response.data);
    return rawList
        .whereType<Map>()
        .map((e) => e['name'] as String?)
        .whereType<String>()
        .toList();
  }

  List _extractTagList(dynamic data) {
    if (data is List) return data;
    if (data is Map && data['tag'] is List) return data['tag'] as List;
    return const [];
  }
}

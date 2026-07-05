import 'package:drift/drift.dart';

import '../booru/models/post.dart';
import '../booru/models/source_config.dart';
import 'database.dart';

extension SourceRowMapping on Source {
  SourceConfig toConfig() => SourceConfig(
    id: id,
    name: name,
    baseUrl: baseUrl,
    apiType: BooruApiType.values.byName(apiType),
    username: username,
    apiKey: apiKey,
    enabled: enabled,
    isPreset: isPreset,
  );
}

extension SourceConfigMapping on SourceConfig {
  SourcesCompanion toCompanion() => SourcesCompanion.insert(
    id: id,
    name: name,
    baseUrl: baseUrl,
    apiType: apiType.name,
    username: Value(username),
    apiKey: Value(apiKey),
    enabled: Value(enabled),
    isPreset: Value(isPreset),
  );
}

extension FavoriteRowMapping on Favorite {
  Post toPost() => Post(
    id: postId,
    sourceId: sourceId,
    previewUrl: previewUrl,
    sampleUrl: fileUrl,
    fileUrl: fileUrl,
    width: width,
    height: height,
    tags: tags.isEmpty ? const [] : tags.split(' '),
    rating: PostRating.values.byName(rating),
    fileType: PostFileType.values.byName(fileType),
    sourcePostUrl: sourcePostUrl,
  );
}

extension PostFavoriteMapping on Post {
  FavoritesCompanion toFavoritesCompanion() => FavoritesCompanion.insert(
    postId: id,
    sourceId: sourceId,
    previewUrl: previewUrl,
    fileUrl: fileUrl,
    width: Value(width),
    height: Value(height),
    tags: Value(tags.join(' ')),
    rating: rating.name,
    fileType: fileType.name,
    sourcePostUrl: Value(sourcePostUrl),
  );
}

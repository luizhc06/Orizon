import 'package:dio/dio.dart';

import 'booru_api.dart';
import 'danbooru_api.dart';
import 'gelbooru_api.dart';
import 'models/source_config.dart';
import 'moebooru_api.dart';

BooruApi createBooruApi(SourceConfig source, {Dio? dio}) {
  switch (source.apiType) {
    case BooruApiType.danbooru:
      return DanbooruApi(source, dio: dio);
    case BooruApiType.gelbooru:
      return GelbooruApi(source, dio: dio);
    case BooruApiType.moebooru:
      return MoebooruApi(source, dio: dio);
  }
}

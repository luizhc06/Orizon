enum PostRating { safe, questionable, explicit, unknown }

enum PostFileType { image, gif, video, unknown }

PostFileType fileTypeFromExtension(String? extension) {
  switch (extension?.toLowerCase()) {
    case 'jpg':
    case 'jpeg':
    case 'png':
    case 'webp':
    case 'bmp':
      return PostFileType.image;
    case 'gif':
      return PostFileType.gif;
    case 'webm':
    case 'mp4':
    case 'mov':
      return PostFileType.video;
    default:
      return PostFileType.unknown;
  }
}

/// Danbooru usa 4 níveis desde a reforma de rating: `g` (general) é o único
/// realmente seguro; `s` hoje significa "sensitive", NÃO "safe" — é um nível
/// acima, com conteúdo levemente sugestivo. Não confundir com o esquema
/// tradicional (ver [ratingFromLegacyCode]).
PostRating ratingFromDanbooruCode(String? code) {
  switch (code?.toLowerCase()) {
    case 'g':
    case 'general':
      return PostRating.safe;
    case 's':
    case 'sensitive':
      return PostRating.questionable; // não é seguro o suficiente pro modo store
    case 'q':
    case 'questionable':
      return PostRating.questionable;
    case 'e':
    case 'explicit':
      return PostRating.explicit;
    default:
      return PostRating.unknown;
  }
}

/// Esquema tradicional de 3 níveis (Gelbooru 0.2, Moebooru): aqui `s`
/// realmente significa "safe".
PostRating ratingFromLegacyCode(String? code) {
  switch (code?.toLowerCase()) {
    case 's':
    case 'safe':
    case 'general':
      return PostRating.safe;
    case 'q':
    case 'questionable':
      return PostRating.questionable;
    case 'e':
    case 'explicit':
      return PostRating.explicit;
    default:
      return PostRating.unknown;
  }
}

class Post {
  final String id;
  final String sourceId;
  final String previewUrl;
  final String sampleUrl;
  final String fileUrl;
  final int width;
  final int height;
  final List<String> tags;
  final PostRating rating;
  final PostFileType fileType;
  final String? sourcePostUrl;

  const Post({
    required this.id,
    required this.sourceId,
    required this.previewUrl,
    required this.sampleUrl,
    required this.fileUrl,
    required this.width,
    required this.height,
    required this.tags,
    required this.rating,
    required this.fileType,
    this.sourcePostUrl,
  });

  double get aspectRatio => height == 0 ? 1 : width / height;
}

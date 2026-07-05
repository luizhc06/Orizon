enum BooruApiType { danbooru, gelbooru, moebooru }

class SourceConfig {
  final String id;
  final String name;
  final String baseUrl;
  final BooruApiType apiType;
  final String? username;
  final String? apiKey;
  final bool enabled;
  final bool isPreset;

  const SourceConfig({
    required this.id,
    required this.name,
    required this.baseUrl,
    required this.apiType,
    this.username,
    this.apiKey,
    this.enabled = true,
    this.isPreset = false,
  });

  SourceConfig copyWith({
    String? name,
    String? baseUrl,
    BooruApiType? apiType,
    String? username,
    String? apiKey,
    bool? enabled,
  }) {
    return SourceConfig(
      id: id,
      name: name ?? this.name,
      baseUrl: baseUrl ?? this.baseUrl,
      apiType: apiType ?? this.apiType,
      username: username ?? this.username,
      apiKey: apiKey ?? this.apiKey,
      enabled: enabled ?? this.enabled,
      isPreset: isPreset,
    );
  }
}

/// Fonte pré-cadastrada pra usuário novo. Só o Safebooru — qualquer outra
/// fonte é escolha do próprio usuário (ver [suggestedSources] pra atalhos
/// oferecidos no formulário de nova fonte).
final List<SourceConfig> presetSources = [
  const SourceConfig(
    id: 'preset-safebooru',
    name: 'Safebooru',
    baseUrl: 'https://safebooru.org',
    apiType: BooruApiType.gelbooru,
    isPreset: true,
  ),
];

class SuggestedSource {
  final String name;
  final String baseUrl;
  final BooruApiType apiType;

  const SuggestedSource({
    required this.name,
    required this.baseUrl,
    required this.apiType,
  });
}

/// Atalhos oferecidos no formulário de "adicionar fonte" — não são
/// cadastrados automaticamente, o usuário escolhe se quer adicionar.
const List<SuggestedSource> suggestedSources = [
  SuggestedSource(
    name: 'Gelbooru',
    baseUrl: 'https://gelbooru.com',
    apiType: BooruApiType.gelbooru,
  ),
  SuggestedSource(
    name: 'Danbooru',
    baseUrl: 'https://danbooru.donmai.us',
    apiType: BooruApiType.danbooru,
  ),
  SuggestedSource(
    name: 'e621',
    baseUrl: 'https://e621.net',
    apiType: BooruApiType.danbooru,
  ),
  SuggestedSource(
    name: 'Konachan',
    baseUrl: 'https://konachan.com',
    apiType: BooruApiType.moebooru,
  ),
];

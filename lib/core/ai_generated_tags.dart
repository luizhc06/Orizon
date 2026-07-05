/// Tags usadas pelos boorus pra marcar conteúdo gerado por IA. Usado pelo
/// filtro opcional "ocultar imagens de IA" (desligado por padrão).
const List<String> aiGeneratedTags = [
  'ai_generated',
  'ai-generated',
  'ai_art',
  'stable_diffusion',
  'novelai',
  'midjourney',
  'ai_created',
  'text-to-image',
  'waifu_diffusion',
];

bool isBlockedByAiFilter(Iterable<String> postTags) {
  final tagSet = postTags.map((t) => t.toLowerCase()).toSet();
  return aiGeneratedTags.any(tagSet.contains);
}

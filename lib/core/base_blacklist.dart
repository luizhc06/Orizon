/// Blacklist-base fixa: cobre famílias de tags associadas a sexualização de
/// menores. Isso é regra de produto permanente — não aparece em nenhuma tela
/// de configurações, não é editável nem removível pelo usuário, e vale em
/// qualquer edição do app (inclusive numa futura edição `full` sem trava de
/// NSFW). Aplica-se por cima do filtro de rating normal, nunca no lugar dele.
///
/// Lista propositalmente ampla (prefere falso positivo a deixar passar
/// conteúdo indevido) e deve ser revisada/expandida ao longo do tempo — não
/// é considerada exaustiva.
const List<String> baseBlacklistTags = [
  'loli',
  'lolicon',
  'shota',
  'shotacon',
  'toddler',
  'toddlercon',
  'child',
  'young_child',
  'kindergarten',
  'cub', // equivalente furry
  'petite_(anatomy)',
  'flat_chest_(child)',
];

bool isBlockedByBaseBlacklist(Iterable<String> postTags) {
  final tagSet = postTags.map((t) => t.toLowerCase()).toSet();
  return baseBlacklistTags.any((blocked) => tagSet.contains(blocked));
}

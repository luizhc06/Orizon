class ChangelogEntry {
  final String version;
  final String date;
  final List<String> changes;

  const ChangelogEntry({
    required this.version,
    required this.date,
    required this.changes,
  });
}

/// Changelog estático, mantido manualmente a cada mudança relevante.
const List<ChangelogEntry> changelogEntries = [
  ChangelogEntry(
    version: '1.0.2',
    date: '2026-07-05',
    changes: [
      'Adicionado: controles completos de vídeo no viewer (play/pause, '
          'barra de progresso com busca, tempo e mudo).',
      'Corrigido: vídeo que falha ao carregar agora mostra erro em vez de '
          'carregar pra sempre.',
      'Corrigido: URLs com query string quebravam o download e a detecção '
          'de tipo de arquivo.',
      'Corrigido: toque duplo rápido no favorito duplicava o registro.',
    ],
  ),
  ChangelogEntry(
    version: '1.0.1',
    date: '2026-07-05',
    changes: [
      'Corrigido: build de release não tinha permissão de internet, então a '
          'busca falhava em dispositivos reais (funcionava só em modo debug).',
      'Adicionado: backup e restauração de fontes, favoritos, blacklist e '
          'configurações.',
      'Adicionado: opções de cache (limpar agora, ou automaticamente ao '
          'fechar o app).',
    ],
  ),
  ChangelogEntry(
    version: '1.0.0',
    date: '2026-07-05',
    changes: [
      'Primeira versão de teste do Orizon.',
      'Busca por tags com autocomplete e chips, modo multi-booru.',
      'Favoritos, histórico de downloads, viewer com zoom e vídeo.',
      'Toggle de conteúdo adulto (desligado por padrão) e blacklist de tags.',
      '4 temas de cor, tipografia própria e suporte a 10 idiomas.',
      'Aviso automático ao tentar buscar conteúdo da blacklist-base fixa.',
    ],
  ),
];

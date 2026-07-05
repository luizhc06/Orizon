// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get appTitle => 'Orizon';

  @override
  String get onboardingWelcome => 'Bem-vindo ao Orizon';

  @override
  String get onboardingBody1 =>
      'O Orizon é um cliente de boorus (image boards) que busca nas fontes que você mesmo cadastra. O toggle de conteúdo adulto fica desligado por padrão — o que aparece depende só da sua própria configuração e escolhas. A responsabilidade por essa escolha é sua.';

  @override
  String get onboardingBody2 =>
      'Uma exceção fixa, que vale sempre, independente de qualquer configuração: o Orizon nunca mostra conteúdo que sexualize menores, sem exceção.';

  @override
  String get onboardingBody3 =>
      'Você pode gerenciar as fontes e a lista de bloqueio quando quiser, nas configurações.';

  @override
  String get onboardingStart => 'Começar';

  @override
  String onboardingStartWithTimer(int seconds) {
    return 'Começar (${seconds}s)';
  }

  @override
  String get navHome => 'Home';

  @override
  String get navNews => 'News';

  @override
  String get navFavorites => 'Favoritos';

  @override
  String get navSettings => 'Config';

  @override
  String get newsTitle => 'News';

  @override
  String get newsChangelogTab => 'Novidades';

  @override
  String get newsStatusTab => 'Status dos sites';

  @override
  String get siteStatusChecking => 'Verificando...';

  @override
  String get siteStatusOffline => 'Fora do ar';

  @override
  String siteStatusLatency(int ms) {
    return '$ms ms';
  }

  @override
  String get settingsTitle => 'Configurações';

  @override
  String get settingsSources => 'Fontes';

  @override
  String get settingsBlacklist => 'Blacklist de tags';

  @override
  String get settingsHideAi => 'Ocultar imagens de IA';

  @override
  String get settingsHideAiSubtitle =>
      'Esconde posts marcados com tags de geração por IA (Stable Diffusion, NovelAI, Midjourney etc.).';

  @override
  String get settingsDownloadHistory => 'Histórico de downloads';

  @override
  String get settingsShowAdult => 'Mostrar conteúdo adulto';

  @override
  String get settingsShowAdultSubtitle =>
      'Desligado por padrão. O Orizon não promove conteúdo adulto. Ao ativar esta opção, imagens sexualmente explícitas ou sugestivas podem aparecer, dependendo das fontes que você mesmo cadastrar. A responsabilidade por essa escolha é sua.';

  @override
  String get settingsMultiBooru => 'Busca multi-booru';

  @override
  String get settingsMultiBooruSubtitle =>
      'Buscar em várias fontes ao mesmo tempo, em vez de só uma. Pode demorar mais pra carregar.';

  @override
  String get settingsTheme => 'Tema';

  @override
  String get settingsGridColumns => 'Colunas do grid';

  @override
  String get settingsGridStyle => 'Estilo do grid';

  @override
  String get settingsGridStyleSubtitle =>
      'Orgânico encaixa cada preview conforme a proporção da imagem; quadriculado usa células uniformes.';

  @override
  String get settingsGridOrganic => 'Orgânico';

  @override
  String get settingsGridUniform => 'Quadriculado';

  @override
  String get settingsLanguage => 'Idioma';

  @override
  String get settingsDiscord => 'Discord';

  @override
  String get settingsDiscordSubtitle => 'Comunidade brasileira do Orizon 🇧🇷';

  @override
  String get settingsSupport => 'Apoie o projeto (Buy Me a Coffee)';

  @override
  String get settingsAbout => 'Sobre';

  @override
  String get settingsBackupTitle => 'Backup';

  @override
  String get settingsBackupExport => 'Exportar backup';

  @override
  String get settingsBackupImport => 'Restaurar backup';

  @override
  String get settingsBackupImportSuccess => 'Backup restaurado';

  @override
  String settingsBackupImportError(String error) {
    return 'Erro ao restaurar backup: $error';
  }

  @override
  String get settingsCacheTitle => 'Cache';

  @override
  String get settingsCacheClearNow => 'Limpar cache agora';

  @override
  String get settingsCacheCleared => 'Cache limpo';

  @override
  String get settingsCacheAutoClear => 'Limpar cache automaticamente ao fechar';

  @override
  String get settingsCacheAutoClearSubtitle =>
      'Desligado por padrão. Quando ligado, o cache de imagens é limpo toda vez que você fecha o app.';

  @override
  String get themeWhiteRed => 'Branco + vermelho';

  @override
  String get themeWhitePurple => 'Branco + roxo';

  @override
  String get themeBlackRed => 'Preto + vermelho';

  @override
  String get themePurpleBlack => 'Roxo + preto';

  @override
  String get aboutTitle => 'Sobre';

  @override
  String get aboutSubtitle => 'Visualizador de boorus';

  @override
  String get aboutPrivacyPolicy => 'Política de privacidade';

  @override
  String get aboutLicenses => 'Licenças de código aberto';

  @override
  String get sourcesTitle => 'Fontes';

  @override
  String get sourcesEmpty => 'Nenhuma fonte cadastrada';

  @override
  String sourcesLoadError(String error) {
    return 'Erro ao carregar fontes: $error';
  }

  @override
  String get sourcesAddTooltip => 'Adicionar fonte customizada';

  @override
  String get sourcesRemoveTooltip => 'Remover fonte';

  @override
  String get sourceFormNew => 'Nova fonte';

  @override
  String get sourceFormEdit => 'Editar fonte';

  @override
  String get sourceFormSuggestions => 'Sugestões';

  @override
  String get sourceFormName => 'Nome';

  @override
  String get sourceFormBaseUrl => 'URL base';

  @override
  String get sourceFormApiType => 'Tipo de API';

  @override
  String get sourceFormUsername => 'Usuário (opcional)';

  @override
  String get sourceFormApiKey => 'API key (opcional)';

  @override
  String get sourceFormRequired => 'Obrigatório';

  @override
  String get sourceFormInvalidUrl => 'URL inválida';

  @override
  String get apiTypeDanbooru => 'Danbooru (e derivados)';

  @override
  String get apiTypeGelbooru => 'Gelbooru 0.2 (Gelbooru/Safebooru/Rule34)';

  @override
  String get apiTypeMoebooru => 'Moebooru (yande.re/konachan)';

  @override
  String get blacklistTitle => 'Blacklist de tags';

  @override
  String get blacklistFixed => 'Sempre bloqueadas (fixo, não editável)';

  @override
  String get blacklistUser => 'Suas tags bloqueadas';

  @override
  String get blacklistAddHint => 'adicionar tag...';

  @override
  String errorGeneric(String error) {
    return 'Erro: $error';
  }

  @override
  String get favoritesTitle => 'Favoritos';

  @override
  String get favoritesEmpty => 'Nenhum favorito ainda';

  @override
  String get downloadHistoryTitle => 'Histórico de downloads';

  @override
  String get downloadHistoryEmpty => 'Nenhum download ainda';

  @override
  String get searchRefreshTooltip => 'Buscar de novo';

  @override
  String get searchTagHint => 'Adicionar tag...';

  @override
  String get searchNoSourceEnabled => 'Nenhuma fonte habilitada';

  @override
  String get searchNoSourceSelected => 'Nenhuma fonte selecionada';

  @override
  String get searchLoading => 'Buscando...';

  @override
  String get searchEmptyState => 'Adicione uma tag pra começar';

  @override
  String get searchMultiWarning =>
      'Várias fontes selecionadas — a busca pode demorar mais pra carregar.';

  @override
  String searchError(String error) {
    return 'Erro na busca: $error';
  }

  @override
  String get shameWarningMessage =>
      'Você não deveria estar procurando por isso. Esse tipo de conteúdo é proibido aqui, sem exceções. Tenha vergonha.';

  @override
  String get shameWarningButton => 'Entendi';

  @override
  String get viewerOpenBrowser => 'Abrir no navegador';

  @override
  String get viewerPermissionDenied => 'Permissão de galeria negada';

  @override
  String get viewerSaved => 'Salvo na galeria';

  @override
  String viewerDownloadError(String error) {
    return 'Erro ao baixar: $error';
  }
}

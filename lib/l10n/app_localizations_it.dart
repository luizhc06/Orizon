// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Italian (`it`).
class AppLocalizationsIt extends AppLocalizations {
  AppLocalizationsIt([String locale = 'it']) : super(locale);

  @override
  String get appTitle => 'Orizon';

  @override
  String get onboardingWelcome => 'Benvenuto su Orizon';

  @override
  String get onboardingBody1 =>
      'Orizon è un client per booru che cerca nelle fonti che aggiungi tu stesso. L\'interruttore dei contenuti per adulti è disattivato di default — ciò che appare dipende solo dalla tua configurazione e dalle tue scelte. La responsabilità di questa scelta è tua.';

  @override
  String get onboardingBody2 =>
      'Un\'eccezione fissa che vale sempre, indipendentemente da qualsiasi impostazione: Orizon non mostra mai contenuti che sessualizzano minori, senza eccezioni.';

  @override
  String get onboardingBody3 =>
      'Puoi gestire le fonti e la lista di blocco in qualsiasi momento nelle impostazioni.';

  @override
  String get onboardingStart => 'Inizia';

  @override
  String onboardingStartWithTimer(int seconds) {
    return 'Inizia (${seconds}s)';
  }

  @override
  String get navHome => 'Home';

  @override
  String get navNews => 'Novità';

  @override
  String get navFavorites => 'Preferiti';

  @override
  String get navSettings => 'Impostazioni';

  @override
  String get newsTitle => 'Novità';

  @override
  String get newsChangelogTab => 'Changelog';

  @override
  String get newsStatusTab => 'Stato dei siti';

  @override
  String get siteStatusChecking => 'Verifica in corso...';

  @override
  String get siteStatusOffline => 'Offline';

  @override
  String siteStatusLatency(int ms) {
    return '$ms ms';
  }

  @override
  String get settingsTitle => 'Impostazioni';

  @override
  String get settingsSources => 'Fonti';

  @override
  String get settingsBlacklist => 'Lista nera dei tag';

  @override
  String get settingsHideAi => 'Nascondi immagini IA';

  @override
  String get settingsHideAiSubtitle =>
      'Nasconde i post contrassegnati come generati da IA (Stable Diffusion, NovelAI, Midjourney, ecc.).';

  @override
  String get settingsDownloadHistory => 'Cronologia download';

  @override
  String get settingsShowAdult => 'Mostra contenuti per adulti';

  @override
  String get settingsShowAdultSubtitle =>
      'Disattivato di default. Orizon non promuove contenuti per adulti. Attivando questa opzione, potrebbero comparire immagini sessualmente esplicite o suggestive, a seconda delle fonti che aggiungi tu stesso. La responsabilità di questa scelta è tua.';

  @override
  String get settingsMultiBooru => 'Ricerca multi-booru';

  @override
  String get settingsMultiBooruSubtitle =>
      'Cerca in più fonti contemporaneamente invece che in una sola. Il caricamento potrebbe richiedere più tempo.';

  @override
  String get settingsTheme => 'Tema';

  @override
  String get settingsGridColumns => 'Colonne della griglia';

  @override
  String get settingsGridStyle => 'Stile griglia';

  @override
  String get settingsGridStyleSubtitle =>
      'Organico adatta ogni anteprima alla proporzione dell\'immagine; uniforme usa celle di dimensioni uguali.';

  @override
  String get settingsGridOrganic => 'Organico';

  @override
  String get settingsGridUniform => 'Uniforme';

  @override
  String get settingsLanguage => 'Lingua';

  @override
  String get settingsDiscord => 'Discord';

  @override
  String get settingsDiscordSubtitle => 'Comunità brasiliana di Orizon 🇧🇷';

  @override
  String get settingsSupport => 'Sostieni il progetto (Buy Me a Coffee)';

  @override
  String get settingsAbout => 'Informazioni';

  @override
  String get settingsBackupTitle => 'Backup';

  @override
  String get settingsBackupExport => 'Esporta backup';

  @override
  String get settingsBackupImport => 'Ripristina backup';

  @override
  String get settingsBackupImportSuccess => 'Backup ripristinato';

  @override
  String settingsBackupImportError(String error) {
    return 'Errore durante il ripristino: $error';
  }

  @override
  String get settingsCacheTitle => 'Cache';

  @override
  String get settingsCacheClearNow => 'Svuota cache ora';

  @override
  String get settingsCacheCleared => 'Cache svuotata';

  @override
  String get settingsCacheAutoClear =>
      'Svuota cache automaticamente alla chiusura';

  @override
  String get settingsCacheAutoClearSubtitle =>
      'Disattivato di default. Se attivo, la cache delle immagini viene svuotata ogni volta che chiudi l\'app.';

  @override
  String get themeWhiteRed => 'Bianco + rosso';

  @override
  String get themeWhitePurple => 'Bianco + viola';

  @override
  String get themeBlackRed => 'Nero + rosso';

  @override
  String get themePurpleBlack => 'Viola + nero';

  @override
  String get aboutTitle => 'Informazioni';

  @override
  String get aboutSubtitle => 'Visualizzatore di booru';

  @override
  String get aboutPrivacyPolicy => 'Informativa sulla privacy';

  @override
  String get aboutLicenses => 'Licenze open source';

  @override
  String get sourcesTitle => 'Fonti';

  @override
  String get sourcesEmpty => 'Nessuna fonte aggiunta';

  @override
  String sourcesLoadError(String error) {
    return 'Errore nel caricamento delle fonti: $error';
  }

  @override
  String get sourcesAddTooltip => 'Aggiungi fonte personalizzata';

  @override
  String get sourcesRemoveTooltip => 'Rimuovi fonte';

  @override
  String get sourceFormNew => 'Nuova fonte';

  @override
  String get sourceFormEdit => 'Modifica fonte';

  @override
  String get sourceFormSuggestions => 'Suggerimenti';

  @override
  String get sourceFormName => 'Nome';

  @override
  String get sourceFormBaseUrl => 'URL base';

  @override
  String get sourceFormApiType => 'Tipo di API';

  @override
  String get sourceFormUsername => 'Nome utente (opzionale)';

  @override
  String get sourceFormApiKey => 'Chiave API (opzionale)';

  @override
  String get sourceFormRequired => 'Obbligatorio';

  @override
  String get sourceFormInvalidUrl => 'URL non valido';

  @override
  String get apiTypeDanbooru => 'Danbooru (e derivati)';

  @override
  String get apiTypeGelbooru => 'Gelbooru 0.2 (Gelbooru/Safebooru/Rule34)';

  @override
  String get apiTypeMoebooru => 'Moebooru (yande.re/konachan)';

  @override
  String get blacklistTitle => 'Lista nera dei tag';

  @override
  String get blacklistFixed => 'Sempre bloccati (fisso, non modificabile)';

  @override
  String get blacklistUser => 'I tuoi tag bloccati';

  @override
  String get blacklistAddHint => 'aggiungi tag...';

  @override
  String errorGeneric(String error) {
    return 'Errore: $error';
  }

  @override
  String get favoritesTitle => 'Preferiti';

  @override
  String get favoritesEmpty => 'Ancora nessun preferito';

  @override
  String get downloadHistoryTitle => 'Cronologia download';

  @override
  String get downloadHistoryEmpty => 'Ancora nessun download';

  @override
  String get searchRefreshTooltip => 'Cerca di nuovo';

  @override
  String get searchTagHint => 'Aggiungi tag...';

  @override
  String get searchNoSourceEnabled => 'Nessuna fonte abilitata';

  @override
  String get searchNoSourceSelected => 'Nessuna fonte selezionata';

  @override
  String get searchLoading => 'Ricerca in corso...';

  @override
  String get searchEmptyState => 'Aggiungi un tag per iniziare';

  @override
  String get searchMultiWarning =>
      'Più fonti selezionate — la ricerca potrebbe richiedere più tempo per caricarsi.';

  @override
  String searchError(String error) {
    return 'Errore nella ricerca: $error';
  }

  @override
  String get shameWarningMessage =>
      'Non dovresti cercare questo. Questo tipo di contenuto non è mai permesso qui, senza eccezioni. Dovresti vergognarti.';

  @override
  String get shameWarningButton => 'Ho capito';

  @override
  String get viewerOpenBrowser => 'Apri nel browser';

  @override
  String get viewerPermissionDenied => 'Permesso galleria negato';

  @override
  String get viewerSaved => 'Salvato nella galleria';

  @override
  String viewerDownloadError(String error) {
    return 'Errore durante il download: $error';
  }
}

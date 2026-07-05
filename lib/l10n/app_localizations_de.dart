// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get appTitle => 'Orizon';

  @override
  String get onboardingWelcome => 'Willkommen bei Orizon';

  @override
  String get onboardingBody1 =>
      'Orizon ist ein Booru-Client, der in den Quellen sucht, die du selbst hinzufügst. Der Schalter für Erwachseneninhalte ist standardmäßig deaktiviert — was angezeigt wird, hängt allein von deiner eigenen Konfiguration und Wahl ab. Die Verantwortung für diese Wahl liegt bei dir.';

  @override
  String get onboardingBody2 =>
      'Eine feste Ausnahme, die immer gilt, unabhängig von jeder Einstellung: Orizon zeigt niemals Inhalte, die Minderjährige sexualisieren, ohne Ausnahme.';

  @override
  String get onboardingBody3 =>
      'Du kannst Quellen und die Sperrliste jederzeit in den Einstellungen verwalten.';

  @override
  String get onboardingStart => 'Starten';

  @override
  String onboardingStartWithTimer(int seconds) {
    return 'Starten (${seconds}s)';
  }

  @override
  String get navHome => 'Start';

  @override
  String get navNews => 'Neuigkeiten';

  @override
  String get navFavorites => 'Favoriten';

  @override
  String get navSettings => 'Einstellungen';

  @override
  String get newsTitle => 'Neuigkeiten';

  @override
  String get newsChangelogTab => 'Änderungsprotokoll';

  @override
  String get newsStatusTab => 'Seitenstatus';

  @override
  String get siteStatusChecking => 'Wird geprüft...';

  @override
  String get siteStatusOffline => 'Offline';

  @override
  String siteStatusLatency(int ms) {
    return '$ms ms';
  }

  @override
  String get settingsTitle => 'Einstellungen';

  @override
  String get settingsSources => 'Quellen';

  @override
  String get settingsBlacklist => 'Tag-Sperrliste';

  @override
  String get settingsHideAi => 'KI-Bilder ausblenden';

  @override
  String get settingsHideAiSubtitle =>
      'Blendet Beiträge aus, die als KI-generiert markiert sind (Stable Diffusion, NovelAI, Midjourney usw.).';

  @override
  String get settingsDownloadHistory => 'Download-Verlauf';

  @override
  String get settingsShowAdult => 'Erwachseneninhalte anzeigen';

  @override
  String get settingsShowAdultSubtitle =>
      'Standardmäßig deaktiviert. Orizon bewirbt keine Erwachseneninhalte. Wenn du diese Option aktivierst, können sexuell explizite oder anzügliche Bilder angezeigt werden, abhängig von den Quellen, die du selbst hinzufügst. Die Verantwortung für diese Entscheidung liegt bei dir.';

  @override
  String get settingsMultiBooru => 'Multi-Booru-Suche';

  @override
  String get settingsMultiBooruSubtitle =>
      'In mehreren Quellen gleichzeitig suchen statt nur in einer. Kann länger zum Laden dauern.';

  @override
  String get settingsTheme => 'Design';

  @override
  String get settingsGridColumns => 'Rasterspalten';

  @override
  String get settingsGridStyle => 'Rasterstil';

  @override
  String get settingsGridStyleSubtitle =>
      'Organisch passt jede Vorschau an das Seitenverhältnis des Bildes an; einheitlich verwendet gleich große Zellen.';

  @override
  String get settingsGridOrganic => 'Organisch';

  @override
  String get settingsGridUniform => 'Einheitlich';

  @override
  String get settingsLanguage => 'Sprache';

  @override
  String get settingsDiscord => 'Discord';

  @override
  String get settingsDiscordSubtitle => 'Brasilianische Orizon-Community 🇧🇷';

  @override
  String get settingsSupport => 'Projekt unterstützen (Buy Me a Coffee)';

  @override
  String get settingsAbout => 'Über';

  @override
  String get settingsBackupTitle => 'Sicherung';

  @override
  String get settingsBackupExport => 'Sicherung exportieren';

  @override
  String get settingsBackupImport => 'Sicherung wiederherstellen';

  @override
  String get settingsBackupImportSuccess => 'Sicherung wiederhergestellt';

  @override
  String settingsBackupImportError(String error) {
    return 'Fehler bei der Wiederherstellung: $error';
  }

  @override
  String get settingsCacheTitle => 'Cache';

  @override
  String get settingsCacheClearNow => 'Cache jetzt leeren';

  @override
  String get settingsCacheCleared => 'Cache geleert';

  @override
  String get settingsCacheAutoClear =>
      'Cache beim Schließen automatisch leeren';

  @override
  String get settingsCacheAutoClearSubtitle =>
      'Standardmäßig deaktiviert. Wenn aktiviert, wird der Bild-Cache bei jedem Schließen der App geleert.';

  @override
  String get themeWhiteRed => 'Weiß + Rot';

  @override
  String get themeWhitePurple => 'Weiß + Lila';

  @override
  String get themeBlackRed => 'Schwarz + Rot';

  @override
  String get themePurpleBlack => 'Lila + Schwarz';

  @override
  String get aboutTitle => 'Über';

  @override
  String get aboutSubtitle => 'Booru-Viewer';

  @override
  String get aboutPrivacyPolicy => 'Datenschutzerklärung';

  @override
  String get aboutLicenses => 'Open-Source-Lizenzen';

  @override
  String get sourcesTitle => 'Quellen';

  @override
  String get sourcesEmpty => 'Keine Quellen hinzugefügt';

  @override
  String sourcesLoadError(String error) {
    return 'Fehler beim Laden der Quellen: $error';
  }

  @override
  String get sourcesAddTooltip => 'Benutzerdefinierte Quelle hinzufügen';

  @override
  String get sourcesRemoveTooltip => 'Quelle entfernen';

  @override
  String get sourceFormNew => 'Neue Quelle';

  @override
  String get sourceFormEdit => 'Quelle bearbeiten';

  @override
  String get sourceFormSuggestions => 'Vorschläge';

  @override
  String get sourceFormName => 'Name';

  @override
  String get sourceFormBaseUrl => 'Basis-URL';

  @override
  String get sourceFormApiType => 'API-Typ';

  @override
  String get sourceFormUsername => 'Benutzername (optional)';

  @override
  String get sourceFormApiKey => 'API-Schlüssel (optional)';

  @override
  String get sourceFormRequired => 'Erforderlich';

  @override
  String get sourceFormInvalidUrl => 'Ungültige URL';

  @override
  String get apiTypeDanbooru => 'Danbooru (und Derivate)';

  @override
  String get apiTypeGelbooru => 'Gelbooru 0.2 (Gelbooru/Safebooru/Rule34)';

  @override
  String get apiTypeMoebooru => 'Moebooru (yande.re/konachan)';

  @override
  String get blacklistTitle => 'Tag-Sperrliste';

  @override
  String get blacklistFixed => 'Immer gesperrt (fest, nicht bearbeitbar)';

  @override
  String get blacklistUser => 'Deine gesperrten Tags';

  @override
  String get blacklistAddHint => 'Tag hinzufügen...';

  @override
  String errorGeneric(String error) {
    return 'Fehler: $error';
  }

  @override
  String get favoritesTitle => 'Favoriten';

  @override
  String get favoritesEmpty => 'Noch keine Favoriten';

  @override
  String get downloadHistoryTitle => 'Download-Verlauf';

  @override
  String get downloadHistoryEmpty => 'Noch keine Downloads';

  @override
  String get searchRefreshTooltip => 'Erneut suchen';

  @override
  String get searchTagHint => 'Tag hinzufügen...';

  @override
  String get searchNoSourceEnabled => 'Keine Quelle aktiviert';

  @override
  String get searchNoSourceSelected => 'Keine Quelle ausgewählt';

  @override
  String get searchLoading => 'Suche läuft...';

  @override
  String get searchEmptyState => 'Füge ein Tag hinzu, um zu starten';

  @override
  String get searchMultiWarning =>
      'Mehrere Quellen ausgewählt — die Suche kann länger dauern.';

  @override
  String searchError(String error) {
    return 'Fehler bei der Suche: $error';
  }

  @override
  String get shameWarningMessage =>
      'Danach solltest du nicht suchen. Diese Art von Inhalt ist hier niemals erlaubt, ohne Ausnahme. Du solltest dich schämen.';

  @override
  String get shameWarningButton => 'Verstanden';

  @override
  String get viewerOpenBrowser => 'Im Browser öffnen';

  @override
  String get viewerPermissionDenied => 'Zugriff auf Galerie verweigert';

  @override
  String get viewerSaved => 'In Galerie gespeichert';

  @override
  String viewerDownloadError(String error) {
    return 'Fehler beim Download: $error';
  }
}

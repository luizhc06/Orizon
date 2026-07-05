// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Orizon';

  @override
  String get onboardingWelcome => 'Welcome to Orizon';

  @override
  String get onboardingBody1 =>
      'Orizon is a booru client that searches the sources you add yourself. The adult content toggle is off by default; what shows up depends on your own configuration and choices. The responsibility for that choice is yours.';

  @override
  String get onboardingBody2 =>
      'One fixed exception that always applies, regardless of any setting: Orizon never shows content that sexualizes minors, no exceptions.';

  @override
  String get onboardingBody3 =>
      'You can manage sources and the blocklist anytime in settings.';

  @override
  String get onboardingStart => 'Start';

  @override
  String onboardingStartWithTimer(int seconds) {
    return 'Start (${seconds}s)';
  }

  @override
  String get navHome => 'Home';

  @override
  String get navNews => 'News';

  @override
  String get navFavorites => 'Favorites';

  @override
  String get navSettings => 'Settings';

  @override
  String get newsTitle => 'News';

  @override
  String get newsChangelogTab => 'Changelog';

  @override
  String get newsStatusTab => 'Site status';

  @override
  String get siteStatusChecking => 'Checking...';

  @override
  String get siteStatusOffline => 'Offline';

  @override
  String siteStatusLatency(int ms) {
    return '$ms ms';
  }

  @override
  String get settingsTitle => 'Settings';

  @override
  String get settingsSources => 'Sources';

  @override
  String get settingsBlacklist => 'Tag blacklist';

  @override
  String get settingsHideAi => 'Hide AI images';

  @override
  String get settingsHideAiSubtitle =>
      'Hides posts tagged as AI-generated (Stable Diffusion, NovelAI, Midjourney, etc.).';

  @override
  String get settingsDownloadHistory => 'Download history';

  @override
  String get settingsShowAdult => 'Show adult content';

  @override
  String get settingsShowAdultSubtitle =>
      'Off by default. Orizon does not promote adult content. If you turn this on, sexually explicit or suggestive images may appear, depending on the sources you add yourself. You are responsible for that choice.';

  @override
  String get settingsMultiBooru => 'Multi-booru search';

  @override
  String get settingsMultiBooruSubtitle =>
      'Search several sources at once instead of just one. May take longer to load.';

  @override
  String get settingsTheme => 'Theme';

  @override
  String get settingsGridColumns => 'Grid columns';

  @override
  String get settingsGridStyle => 'Grid style';

  @override
  String get settingsGridStyleSubtitle =>
      'Organic fits each preview to the image\'s aspect ratio; uniform uses equal-sized cells.';

  @override
  String get settingsGridOrganic => 'Organic';

  @override
  String get settingsGridUniform => 'Uniform';

  @override
  String get settingsLanguage => 'Language';

  @override
  String get settingsDiscord => 'Discord';

  @override
  String get settingsDiscordSubtitle => 'Orizon\'s Brazilian community 🇧🇷';

  @override
  String get settingsSupport => 'Buy me a coffee';

  @override
  String get settingsAbout => 'About';

  @override
  String get settingsBackupTitle => 'Backup';

  @override
  String get settingsBackupExport => 'Export backup';

  @override
  String get settingsBackupImport => 'Restore backup';

  @override
  String get settingsBackupImportSuccess => 'Backup restored';

  @override
  String settingsBackupImportError(String error) {
    return 'Error restoring backup: $error';
  }

  @override
  String get settingsCacheTitle => 'Cache';

  @override
  String get settingsCacheClearNow => 'Clear cache now';

  @override
  String get settingsCacheCleared => 'Cache cleared';

  @override
  String get settingsCacheAutoClear => 'Clear cache automatically on close';

  @override
  String get settingsCacheAutoClearSubtitle =>
      'Off by default. When on, cached images are cleared every time you close the app.';

  @override
  String get themeWhiteRed => 'White + red';

  @override
  String get themeWhitePurple => 'White + purple';

  @override
  String get themeBlackRed => 'Black + red';

  @override
  String get themePurpleBlack => 'Purple + black';

  @override
  String get aboutTitle => 'About';

  @override
  String get aboutSubtitle => 'Booru viewer';

  @override
  String get aboutPrivacyPolicy => 'Privacy policy';

  @override
  String get aboutLicenses => 'Open source licenses';

  @override
  String get sourcesTitle => 'Sources';

  @override
  String get sourcesEmpty => 'No sources added';

  @override
  String sourcesLoadError(String error) {
    return 'Error loading sources: $error';
  }

  @override
  String get sourcesAddTooltip => 'Add custom source';

  @override
  String get sourcesRemoveTooltip => 'Remove source';

  @override
  String get sourceFormNew => 'New source';

  @override
  String get sourceFormEdit => 'Edit source';

  @override
  String get sourceFormSuggestions => 'Suggestions';

  @override
  String get sourceFormName => 'Name';

  @override
  String get sourceFormBaseUrl => 'Base URL';

  @override
  String get sourceFormApiType => 'API type';

  @override
  String get sourceFormUsername => 'Username (optional)';

  @override
  String get sourceFormApiKey => 'API key (optional)';

  @override
  String get sourceFormRequired => 'Required';

  @override
  String get sourceFormInvalidUrl => 'Invalid URL';

  @override
  String get apiTypeDanbooru => 'Danbooru (and derivatives)';

  @override
  String get apiTypeGelbooru => 'Gelbooru 0.2 (Gelbooru/Safebooru/Rule34)';

  @override
  String get apiTypeMoebooru => 'Moebooru (yande.re/konachan)';

  @override
  String get blacklistTitle => 'Tag blacklist';

  @override
  String get blacklistFixed => 'Always blocked (fixed, not editable)';

  @override
  String get blacklistUser => 'Your blocked tags';

  @override
  String get blacklistAddHint => 'add tag...';

  @override
  String errorGeneric(String error) {
    return 'Error: $error';
  }

  @override
  String get favoritesTitle => 'Favorites';

  @override
  String get favoritesEmpty => 'No favorites yet';

  @override
  String get downloadHistoryTitle => 'Download history';

  @override
  String get downloadHistoryEmpty => 'No downloads yet';

  @override
  String get searchRefreshTooltip => 'Search again';

  @override
  String get searchTagHint => 'Add tag...';

  @override
  String get searchNoSourceEnabled => 'No source enabled';

  @override
  String get searchNoSourceSelected => 'No source selected';

  @override
  String get searchLoading => 'Searching...';

  @override
  String get searchEmptyState => 'Add a tag to start';

  @override
  String get searchMultiWarning =>
      'Multiple sources selected — search may take longer to load.';

  @override
  String searchError(String error) {
    return 'Search error: $error';
  }

  @override
  String get shameWarningMessage =>
      'You should not be searching for this. This kind of content is never allowed here, no exceptions. Be ashamed of yourself.';

  @override
  String get shameWarningButton => 'I understand';

  @override
  String get viewerOpenBrowser => 'Open in browser';

  @override
  String get viewerPermissionDenied => 'Gallery permission denied';

  @override
  String get viewerSaved => 'Saved to gallery';

  @override
  String viewerDownloadError(String error) {
    return 'Download error: $error';
  }
}

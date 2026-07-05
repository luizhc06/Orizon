import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_de.dart';
import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_it.dart';
import 'app_localizations_ja.dart';
import 'app_localizations_ko.dart';
import 'app_localizations_pt.dart';
import 'app_localizations_ru.dart';
import 'app_localizations_zh.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('de'),
    Locale('en'),
    Locale('es'),
    Locale('fr'),
    Locale('it'),
    Locale('ja'),
    Locale('ko'),
    Locale('pt'),
    Locale('ru'),
    Locale('zh'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'Orizon'**
  String get appTitle;

  /// No description provided for @onboardingWelcome.
  ///
  /// In en, this message translates to:
  /// **'Welcome to Orizon'**
  String get onboardingWelcome;

  /// No description provided for @onboardingBody1.
  ///
  /// In en, this message translates to:
  /// **'Orizon is a booru client that searches the sources you add yourself. The adult content toggle is off by default; what shows up depends on your own configuration and choices. The responsibility for that choice is yours.'**
  String get onboardingBody1;

  /// No description provided for @onboardingBody2.
  ///
  /// In en, this message translates to:
  /// **'One fixed exception that always applies, regardless of any setting: Orizon never shows content that sexualizes minors, no exceptions.'**
  String get onboardingBody2;

  /// No description provided for @onboardingBody3.
  ///
  /// In en, this message translates to:
  /// **'You can manage sources and the blocklist anytime in settings.'**
  String get onboardingBody3;

  /// No description provided for @onboardingStart.
  ///
  /// In en, this message translates to:
  /// **'Start'**
  String get onboardingStart;

  /// No description provided for @onboardingStartWithTimer.
  ///
  /// In en, this message translates to:
  /// **'Start ({seconds}s)'**
  String onboardingStartWithTimer(int seconds);

  /// No description provided for @navHome.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get navHome;

  /// No description provided for @navNews.
  ///
  /// In en, this message translates to:
  /// **'News'**
  String get navNews;

  /// No description provided for @navFavorites.
  ///
  /// In en, this message translates to:
  /// **'Favorites'**
  String get navFavorites;

  /// No description provided for @navSettings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get navSettings;

  /// No description provided for @newsTitle.
  ///
  /// In en, this message translates to:
  /// **'News'**
  String get newsTitle;

  /// No description provided for @newsChangelogTab.
  ///
  /// In en, this message translates to:
  /// **'Changelog'**
  String get newsChangelogTab;

  /// No description provided for @newsStatusTab.
  ///
  /// In en, this message translates to:
  /// **'Site status'**
  String get newsStatusTab;

  /// No description provided for @siteStatusChecking.
  ///
  /// In en, this message translates to:
  /// **'Checking...'**
  String get siteStatusChecking;

  /// No description provided for @siteStatusOffline.
  ///
  /// In en, this message translates to:
  /// **'Offline'**
  String get siteStatusOffline;

  /// No description provided for @siteStatusLatency.
  ///
  /// In en, this message translates to:
  /// **'{ms} ms'**
  String siteStatusLatency(int ms);

  /// No description provided for @settingsTitle.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settingsTitle;

  /// No description provided for @settingsSources.
  ///
  /// In en, this message translates to:
  /// **'Sources'**
  String get settingsSources;

  /// No description provided for @settingsBlacklist.
  ///
  /// In en, this message translates to:
  /// **'Tag blacklist'**
  String get settingsBlacklist;

  /// No description provided for @settingsHideAi.
  ///
  /// In en, this message translates to:
  /// **'Hide AI images'**
  String get settingsHideAi;

  /// No description provided for @settingsHideAiSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Hides posts tagged as AI-generated (Stable Diffusion, NovelAI, Midjourney, etc.).'**
  String get settingsHideAiSubtitle;

  /// No description provided for @settingsDownloadHistory.
  ///
  /// In en, this message translates to:
  /// **'Download history'**
  String get settingsDownloadHistory;

  /// No description provided for @settingsShowAdult.
  ///
  /// In en, this message translates to:
  /// **'Show adult content'**
  String get settingsShowAdult;

  /// No description provided for @settingsShowAdultSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Off by default. Orizon does not promote adult content. If you turn this on, sexually explicit or suggestive images may appear, depending on the sources you add yourself. You are responsible for that choice.'**
  String get settingsShowAdultSubtitle;

  /// No description provided for @settingsMultiBooru.
  ///
  /// In en, this message translates to:
  /// **'Multi-booru search'**
  String get settingsMultiBooru;

  /// No description provided for @settingsMultiBooruSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Search several sources at once instead of just one. May take longer to load.'**
  String get settingsMultiBooruSubtitle;

  /// No description provided for @settingsTheme.
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get settingsTheme;

  /// No description provided for @settingsGridColumns.
  ///
  /// In en, this message translates to:
  /// **'Grid columns'**
  String get settingsGridColumns;

  /// No description provided for @settingsGridStyle.
  ///
  /// In en, this message translates to:
  /// **'Grid style'**
  String get settingsGridStyle;

  /// No description provided for @settingsGridStyleSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Organic fits each preview to the image\'s aspect ratio; uniform uses equal-sized cells.'**
  String get settingsGridStyleSubtitle;

  /// No description provided for @settingsGridOrganic.
  ///
  /// In en, this message translates to:
  /// **'Organic'**
  String get settingsGridOrganic;

  /// No description provided for @settingsGridUniform.
  ///
  /// In en, this message translates to:
  /// **'Uniform'**
  String get settingsGridUniform;

  /// No description provided for @settingsLanguage.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get settingsLanguage;

  /// No description provided for @settingsDiscord.
  ///
  /// In en, this message translates to:
  /// **'Discord'**
  String get settingsDiscord;

  /// No description provided for @settingsDiscordSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Orizon\'s Brazilian community 🇧🇷'**
  String get settingsDiscordSubtitle;

  /// No description provided for @settingsSupport.
  ///
  /// In en, this message translates to:
  /// **'Buy me a coffee'**
  String get settingsSupport;

  /// No description provided for @settingsAbout.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get settingsAbout;

  /// No description provided for @settingsBackupTitle.
  ///
  /// In en, this message translates to:
  /// **'Backup'**
  String get settingsBackupTitle;

  /// No description provided for @settingsBackupExport.
  ///
  /// In en, this message translates to:
  /// **'Export backup'**
  String get settingsBackupExport;

  /// No description provided for @settingsBackupImport.
  ///
  /// In en, this message translates to:
  /// **'Restore backup'**
  String get settingsBackupImport;

  /// No description provided for @settingsBackupImportSuccess.
  ///
  /// In en, this message translates to:
  /// **'Backup restored'**
  String get settingsBackupImportSuccess;

  /// No description provided for @settingsBackupImportError.
  ///
  /// In en, this message translates to:
  /// **'Error restoring backup: {error}'**
  String settingsBackupImportError(String error);

  /// No description provided for @settingsCacheTitle.
  ///
  /// In en, this message translates to:
  /// **'Cache'**
  String get settingsCacheTitle;

  /// No description provided for @settingsCacheClearNow.
  ///
  /// In en, this message translates to:
  /// **'Clear cache now'**
  String get settingsCacheClearNow;

  /// No description provided for @settingsCacheCleared.
  ///
  /// In en, this message translates to:
  /// **'Cache cleared'**
  String get settingsCacheCleared;

  /// No description provided for @settingsCacheAutoClear.
  ///
  /// In en, this message translates to:
  /// **'Clear cache automatically on close'**
  String get settingsCacheAutoClear;

  /// No description provided for @settingsCacheAutoClearSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Off by default. When on, cached images are cleared every time you close the app.'**
  String get settingsCacheAutoClearSubtitle;

  /// No description provided for @themeWhiteRed.
  ///
  /// In en, this message translates to:
  /// **'White + red'**
  String get themeWhiteRed;

  /// No description provided for @themeWhitePurple.
  ///
  /// In en, this message translates to:
  /// **'White + purple'**
  String get themeWhitePurple;

  /// No description provided for @themeBlackRed.
  ///
  /// In en, this message translates to:
  /// **'Black + red'**
  String get themeBlackRed;

  /// No description provided for @themePurpleBlack.
  ///
  /// In en, this message translates to:
  /// **'Purple + black'**
  String get themePurpleBlack;

  /// No description provided for @aboutTitle.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get aboutTitle;

  /// No description provided for @aboutSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Booru viewer'**
  String get aboutSubtitle;

  /// No description provided for @aboutPrivacyPolicy.
  ///
  /// In en, this message translates to:
  /// **'Privacy policy'**
  String get aboutPrivacyPolicy;

  /// No description provided for @aboutLicenses.
  ///
  /// In en, this message translates to:
  /// **'Open source licenses'**
  String get aboutLicenses;

  /// No description provided for @sourcesTitle.
  ///
  /// In en, this message translates to:
  /// **'Sources'**
  String get sourcesTitle;

  /// No description provided for @sourcesEmpty.
  ///
  /// In en, this message translates to:
  /// **'No sources added'**
  String get sourcesEmpty;

  /// No description provided for @sourcesLoadError.
  ///
  /// In en, this message translates to:
  /// **'Error loading sources: {error}'**
  String sourcesLoadError(String error);

  /// No description provided for @sourcesAddTooltip.
  ///
  /// In en, this message translates to:
  /// **'Add custom source'**
  String get sourcesAddTooltip;

  /// No description provided for @sourcesRemoveTooltip.
  ///
  /// In en, this message translates to:
  /// **'Remove source'**
  String get sourcesRemoveTooltip;

  /// No description provided for @sourceFormNew.
  ///
  /// In en, this message translates to:
  /// **'New source'**
  String get sourceFormNew;

  /// No description provided for @sourceFormEdit.
  ///
  /// In en, this message translates to:
  /// **'Edit source'**
  String get sourceFormEdit;

  /// No description provided for @sourceFormSuggestions.
  ///
  /// In en, this message translates to:
  /// **'Suggestions'**
  String get sourceFormSuggestions;

  /// No description provided for @sourceFormName.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get sourceFormName;

  /// No description provided for @sourceFormBaseUrl.
  ///
  /// In en, this message translates to:
  /// **'Base URL'**
  String get sourceFormBaseUrl;

  /// No description provided for @sourceFormApiType.
  ///
  /// In en, this message translates to:
  /// **'API type'**
  String get sourceFormApiType;

  /// No description provided for @sourceFormUsername.
  ///
  /// In en, this message translates to:
  /// **'Username (optional)'**
  String get sourceFormUsername;

  /// No description provided for @sourceFormApiKey.
  ///
  /// In en, this message translates to:
  /// **'API key (optional)'**
  String get sourceFormApiKey;

  /// No description provided for @sourceFormRequired.
  ///
  /// In en, this message translates to:
  /// **'Required'**
  String get sourceFormRequired;

  /// No description provided for @sourceFormInvalidUrl.
  ///
  /// In en, this message translates to:
  /// **'Invalid URL'**
  String get sourceFormInvalidUrl;

  /// No description provided for @apiTypeDanbooru.
  ///
  /// In en, this message translates to:
  /// **'Danbooru (and derivatives)'**
  String get apiTypeDanbooru;

  /// No description provided for @apiTypeGelbooru.
  ///
  /// In en, this message translates to:
  /// **'Gelbooru 0.2 (Gelbooru/Safebooru/Rule34)'**
  String get apiTypeGelbooru;

  /// No description provided for @apiTypeMoebooru.
  ///
  /// In en, this message translates to:
  /// **'Moebooru (yande.re/konachan)'**
  String get apiTypeMoebooru;

  /// No description provided for @blacklistTitle.
  ///
  /// In en, this message translates to:
  /// **'Tag blacklist'**
  String get blacklistTitle;

  /// No description provided for @blacklistFixed.
  ///
  /// In en, this message translates to:
  /// **'Always blocked (fixed, not editable)'**
  String get blacklistFixed;

  /// No description provided for @blacklistUser.
  ///
  /// In en, this message translates to:
  /// **'Your blocked tags'**
  String get blacklistUser;

  /// No description provided for @blacklistAddHint.
  ///
  /// In en, this message translates to:
  /// **'add tag...'**
  String get blacklistAddHint;

  /// No description provided for @errorGeneric.
  ///
  /// In en, this message translates to:
  /// **'Error: {error}'**
  String errorGeneric(String error);

  /// No description provided for @favoritesTitle.
  ///
  /// In en, this message translates to:
  /// **'Favorites'**
  String get favoritesTitle;

  /// No description provided for @favoritesEmpty.
  ///
  /// In en, this message translates to:
  /// **'No favorites yet'**
  String get favoritesEmpty;

  /// No description provided for @downloadHistoryTitle.
  ///
  /// In en, this message translates to:
  /// **'Download history'**
  String get downloadHistoryTitle;

  /// No description provided for @downloadHistoryEmpty.
  ///
  /// In en, this message translates to:
  /// **'No downloads yet'**
  String get downloadHistoryEmpty;

  /// No description provided for @searchRefreshTooltip.
  ///
  /// In en, this message translates to:
  /// **'Search again'**
  String get searchRefreshTooltip;

  /// No description provided for @searchTagHint.
  ///
  /// In en, this message translates to:
  /// **'Add tag...'**
  String get searchTagHint;

  /// No description provided for @searchNoSourceEnabled.
  ///
  /// In en, this message translates to:
  /// **'No source enabled'**
  String get searchNoSourceEnabled;

  /// No description provided for @searchNoSourceSelected.
  ///
  /// In en, this message translates to:
  /// **'No source selected'**
  String get searchNoSourceSelected;

  /// No description provided for @searchLoading.
  ///
  /// In en, this message translates to:
  /// **'Searching...'**
  String get searchLoading;

  /// No description provided for @searchEmptyState.
  ///
  /// In en, this message translates to:
  /// **'Add a tag to start'**
  String get searchEmptyState;

  /// No description provided for @searchMultiWarning.
  ///
  /// In en, this message translates to:
  /// **'Multiple sources selected — search may take longer to load.'**
  String get searchMultiWarning;

  /// No description provided for @searchError.
  ///
  /// In en, this message translates to:
  /// **'Search error: {error}'**
  String searchError(String error);

  /// No description provided for @shameWarningMessage.
  ///
  /// In en, this message translates to:
  /// **'You should not be searching for this. This kind of content is never allowed here, no exceptions. Be ashamed of yourself.'**
  String get shameWarningMessage;

  /// No description provided for @shameWarningButton.
  ///
  /// In en, this message translates to:
  /// **'I understand'**
  String get shameWarningButton;

  /// No description provided for @viewerOpenBrowser.
  ///
  /// In en, this message translates to:
  /// **'Open in browser'**
  String get viewerOpenBrowser;

  /// No description provided for @viewerPermissionDenied.
  ///
  /// In en, this message translates to:
  /// **'Gallery permission denied'**
  String get viewerPermissionDenied;

  /// No description provided for @viewerSaved.
  ///
  /// In en, this message translates to:
  /// **'Saved to gallery'**
  String get viewerSaved;

  /// No description provided for @viewerDownloadError.
  ///
  /// In en, this message translates to:
  /// **'Download error: {error}'**
  String viewerDownloadError(String error);
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>[
    'de',
    'en',
    'es',
    'fr',
    'it',
    'ja',
    'ko',
    'pt',
    'ru',
    'zh',
  ].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'de':
      return AppLocalizationsDe();
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
    case 'fr':
      return AppLocalizationsFr();
    case 'it':
      return AppLocalizationsIt();
    case 'ja':
      return AppLocalizationsJa();
    case 'ko':
      return AppLocalizationsKo();
    case 'pt':
      return AppLocalizationsPt();
    case 'ru':
      return AppLocalizationsRu();
    case 'zh':
      return AppLocalizationsZh();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}

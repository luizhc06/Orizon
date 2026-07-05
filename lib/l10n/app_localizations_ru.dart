// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get appTitle => 'Orizon';

  @override
  String get onboardingWelcome => 'Добро пожаловать в Orizon';

  @override
  String get onboardingBody1 =>
      'Orizon — это клиент для буру, который ищет только по источникам, добавленным вами самостоятельно. Переключатель контента для взрослых по умолчанию выключен — то, что отображается, зависит только от ваших собственных настроек и выбора. Ответственность за этот выбор лежит на вас.';

  @override
  String get onboardingBody2 =>
      'Одно фиксированное исключение, которое действует всегда, независимо от любых настроек: Orizon никогда не показывает контент, сексуализирующий несовершеннолетних, без исключений.';

  @override
  String get onboardingBody3 =>
      'Вы можете управлять источниками и списком блокировки в любое время в настройках.';

  @override
  String get onboardingStart => 'Начать';

  @override
  String onboardingStartWithTimer(int seconds) {
    return 'Начать ($seconds с)';
  }

  @override
  String get navHome => 'Главная';

  @override
  String get navNews => 'Новости';

  @override
  String get navFavorites => 'Избранное';

  @override
  String get navSettings => 'Настройки';

  @override
  String get newsTitle => 'Новости';

  @override
  String get newsChangelogTab => 'Журнал изменений';

  @override
  String get newsStatusTab => 'Статус сайтов';

  @override
  String get siteStatusChecking => 'Проверка...';

  @override
  String get siteStatusOffline => 'Не в сети';

  @override
  String siteStatusLatency(int ms) {
    return '$ms мс';
  }

  @override
  String get settingsTitle => 'Настройки';

  @override
  String get settingsSources => 'Источники';

  @override
  String get settingsBlacklist => 'Чёрный список тегов';

  @override
  String get settingsHideAi => 'Скрывать изображения ИИ';

  @override
  String get settingsHideAiSubtitle =>
      'Скрывает посты, помеченные как сгенерированные ИИ (Stable Diffusion, NovelAI, Midjourney и т. д.).';

  @override
  String get settingsDownloadHistory => 'История загрузок';

  @override
  String get settingsShowAdult => 'Показывать контент для взрослых';

  @override
  String get settingsShowAdultSubtitle =>
      'По умолчанию выключено. Orizon не продвигает контент для взрослых. Если вы включите эту настройку, в зависимости от добавленных вами источников могут появляться откровенные или провокационные изображения. Ответственность за этот выбор лежит на вас.';

  @override
  String get settingsMultiBooru => 'Мульти-поиск по буру';

  @override
  String get settingsMultiBooruSubtitle =>
      'Искать сразу в нескольких источниках вместо одного. Загрузка может занять больше времени.';

  @override
  String get settingsTheme => 'Тема';

  @override
  String get settingsGridColumns => 'Столбцы сетки';

  @override
  String get settingsGridStyle => 'Стиль сетки';

  @override
  String get settingsGridStyleSubtitle =>
      'Органический подгоняет каждое превью под пропорции изображения; равномерный использует ячейки одинакового размера.';

  @override
  String get settingsGridOrganic => 'Органический';

  @override
  String get settingsGridUniform => 'Равномерный';

  @override
  String get settingsLanguage => 'Язык';

  @override
  String get settingsDiscord => 'Discord';

  @override
  String get settingsDiscordSubtitle => 'Бразильское сообщество Orizon 🇧🇷';

  @override
  String get settingsSupport => 'Поддержать проект (Buy Me a Coffee)';

  @override
  String get settingsAbout => 'О приложении';

  @override
  String get settingsBackupTitle => 'Резервная копия';

  @override
  String get settingsBackupExport => 'Экспортировать резервную копию';

  @override
  String get settingsBackupImport => 'Восстановить из резервной копии';

  @override
  String get settingsBackupImportSuccess => 'Резервная копия восстановлена';

  @override
  String settingsBackupImportError(String error) {
    return 'Ошибка восстановления: $error';
  }

  @override
  String get settingsCacheTitle => 'Кэш';

  @override
  String get settingsCacheClearNow => 'Очистить кэш сейчас';

  @override
  String get settingsCacheCleared => 'Кэш очищен';

  @override
  String get settingsCacheAutoClear => 'Автоматически очищать кэш при закрытии';

  @override
  String get settingsCacheAutoClearSubtitle =>
      'По умолчанию выключено. Если включено, кэш изображений очищается при каждом закрытии приложения.';

  @override
  String get themeWhiteRed => 'Белый + красный';

  @override
  String get themeWhitePurple => 'Белый + фиолетовый';

  @override
  String get themeBlackRed => 'Чёрный + красный';

  @override
  String get themePurpleBlack => 'Фиолетовый + чёрный';

  @override
  String get aboutTitle => 'О приложении';

  @override
  String get aboutSubtitle => 'Просмотрщик буру';

  @override
  String get aboutPrivacyPolicy => 'Политика конфиденциальности';

  @override
  String get aboutLicenses => 'Лицензии с открытым исходным кодом';

  @override
  String get sourcesTitle => 'Источники';

  @override
  String get sourcesEmpty => 'Источники не добавлены';

  @override
  String sourcesLoadError(String error) {
    return 'Ошибка загрузки источников: $error';
  }

  @override
  String get sourcesAddTooltip => 'Добавить свой источник';

  @override
  String get sourcesRemoveTooltip => 'Удалить источник';

  @override
  String get sourceFormNew => 'Новый источник';

  @override
  String get sourceFormEdit => 'Изменить источник';

  @override
  String get sourceFormSuggestions => 'Предложения';

  @override
  String get sourceFormName => 'Название';

  @override
  String get sourceFormBaseUrl => 'Базовый URL';

  @override
  String get sourceFormApiType => 'Тип API';

  @override
  String get sourceFormUsername => 'Имя пользователя (необязательно)';

  @override
  String get sourceFormApiKey => 'API-ключ (необязательно)';

  @override
  String get sourceFormRequired => 'Обязательное поле';

  @override
  String get sourceFormInvalidUrl => 'Неверный URL';

  @override
  String get apiTypeDanbooru => 'Danbooru (и производные)';

  @override
  String get apiTypeGelbooru => 'Gelbooru 0.2 (Gelbooru/Safebooru/Rule34)';

  @override
  String get apiTypeMoebooru => 'Moebooru (yande.re/konachan)';

  @override
  String get blacklistTitle => 'Чёрный список тегов';

  @override
  String get blacklistFixed =>
      'Всегда заблокировано (фиксировано, не редактируется)';

  @override
  String get blacklistUser => 'Ваши заблокированные теги';

  @override
  String get blacklistAddHint => 'добавить тег...';

  @override
  String errorGeneric(String error) {
    return 'Ошибка: $error';
  }

  @override
  String get favoritesTitle => 'Избранное';

  @override
  String get favoritesEmpty => 'Пока нет избранного';

  @override
  String get downloadHistoryTitle => 'История загрузок';

  @override
  String get downloadHistoryEmpty => 'Пока нет загрузок';

  @override
  String get searchRefreshTooltip => 'Искать снова';

  @override
  String get searchTagHint => 'Добавить тег...';

  @override
  String get searchNoSourceEnabled => 'Нет включённых источников';

  @override
  String get searchNoSourceSelected => 'Источник не выбран';

  @override
  String get searchLoading => 'Поиск...';

  @override
  String get searchEmptyState => 'Добавьте тег, чтобы начать';

  @override
  String get searchMultiWarning =>
      'Выбрано несколько источников — поиск может занять больше времени.';

  @override
  String searchError(String error) {
    return 'Ошибка поиска: $error';
  }

  @override
  String get shameWarningMessage =>
      'Вам не следует искать это. Такой контент здесь никогда не разрешён, без исключений. Вам должно быть стыдно.';

  @override
  String get shameWarningButton => 'Понятно';

  @override
  String get viewerOpenBrowser => 'Открыть в браузере';

  @override
  String get viewerPermissionDenied => 'Доступ к галерее запрещён';

  @override
  String get viewerSaved => 'Сохранено в галерею';

  @override
  String viewerDownloadError(String error) {
    return 'Ошибка загрузки: $error';
  }
}

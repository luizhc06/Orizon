// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get appTitle => 'Orizon';

  @override
  String get onboardingWelcome => '欢迎使用 Orizon';

  @override
  String get onboardingBody1 =>
      'Orizon 是一款 booru 客户端，只搜索你自己添加的来源。成人内容开关默认关闭——显示的内容完全取决于你自己的设置和选择。这个选择的责任由你自己承担。';

  @override
  String get onboardingBody2 => '无论任何设置，始终生效的固定例外：Orizon 绝不显示任何性化未成年人的内容，没有例外。';

  @override
  String get onboardingBody3 => '你可以随时在设置中管理来源和屏蔽列表。';

  @override
  String get onboardingStart => '开始';

  @override
  String onboardingStartWithTimer(int seconds) {
    return '开始（$seconds秒）';
  }

  @override
  String get navHome => '首页';

  @override
  String get navNews => '资讯';

  @override
  String get navFavorites => '收藏';

  @override
  String get navSettings => '设置';

  @override
  String get newsTitle => '资讯';

  @override
  String get newsChangelogTab => '更新日志';

  @override
  String get newsStatusTab => '站点状态';

  @override
  String get siteStatusChecking => '检查中...';

  @override
  String get siteStatusOffline => '离线';

  @override
  String siteStatusLatency(int ms) {
    return '$ms 毫秒';
  }

  @override
  String get settingsTitle => '设置';

  @override
  String get settingsSources => '来源';

  @override
  String get settingsBlacklist => '标签黑名单';

  @override
  String get settingsHideAi => '隐藏 AI 生成图片';

  @override
  String get settingsHideAiSubtitle =>
      '隐藏标记为 AI 生成的帖子（Stable Diffusion、NovelAI、Midjourney 等）。';

  @override
  String get settingsDownloadHistory => '下载历史';

  @override
  String get settingsShowAdult => '显示成人内容';

  @override
  String get settingsShowAdultSubtitle =>
      '默认关闭。Orizon 不推广成人内容。启用此选项后，根据你自己添加的来源，可能会出现露骨或挑逗性的图片。这个选择的责任由你自己承担。';

  @override
  String get settingsMultiBooru => '多站点搜索';

  @override
  String get settingsMultiBooruSubtitle => '同时搜索多个来源，而不仅仅是一个。加载可能会更慢。';

  @override
  String get settingsTheme => '主题';

  @override
  String get settingsGridColumns => '网格列数';

  @override
  String get settingsGridStyle => '网格样式';

  @override
  String get settingsGridStyleSubtitle => '有机排列会根据图片比例调整每个预览；统一排列使用相同大小的单元格。';

  @override
  String get settingsGridOrganic => '有机';

  @override
  String get settingsGridUniform => '统一';

  @override
  String get settingsLanguage => '语言';

  @override
  String get settingsDiscord => 'Discord';

  @override
  String get settingsDiscordSubtitle => 'Orizon 巴西社区 🇧🇷';

  @override
  String get settingsSupport => '支持项目 (Buy Me a Coffee)';

  @override
  String get settingsAbout => '关于';

  @override
  String get settingsBackupTitle => '备份';

  @override
  String get settingsBackupExport => '导出备份';

  @override
  String get settingsBackupImport => '恢复备份';

  @override
  String get settingsBackupImportSuccess => '备份已恢复';

  @override
  String settingsBackupImportError(String error) {
    return '恢复出错：$error';
  }

  @override
  String get settingsCacheTitle => '缓存';

  @override
  String get settingsCacheClearNow => '立即清除缓存';

  @override
  String get settingsCacheCleared => '缓存已清除';

  @override
  String get settingsCacheAutoClear => '关闭时自动清除缓存';

  @override
  String get settingsCacheAutoClearSubtitle => '默认关闭。开启后，每次关闭应用时都会清除图片缓存。';

  @override
  String get themeWhiteRed => '白色 + 红色';

  @override
  String get themeWhitePurple => '白色 + 紫色';

  @override
  String get themeBlackRed => '黑色 + 红色';

  @override
  String get themePurpleBlack => '紫色 + 黑色';

  @override
  String get aboutTitle => '关于';

  @override
  String get aboutSubtitle => 'booru 浏览器';

  @override
  String get aboutPrivacyPolicy => '隐私政策';

  @override
  String get aboutLicenses => '开源许可证';

  @override
  String get sourcesTitle => '来源';

  @override
  String get sourcesEmpty => '尚未添加来源';

  @override
  String sourcesLoadError(String error) {
    return '加载来源出错：$error';
  }

  @override
  String get sourcesAddTooltip => '添加自定义来源';

  @override
  String get sourcesRemoveTooltip => '删除来源';

  @override
  String get sourceFormNew => '新建来源';

  @override
  String get sourceFormEdit => '编辑来源';

  @override
  String get sourceFormSuggestions => '推荐';

  @override
  String get sourceFormName => '名称';

  @override
  String get sourceFormBaseUrl => '基础 URL';

  @override
  String get sourceFormApiType => 'API 类型';

  @override
  String get sourceFormUsername => '用户名（可选）';

  @override
  String get sourceFormApiKey => 'API 密钥（可选）';

  @override
  String get sourceFormRequired => '必填';

  @override
  String get sourceFormInvalidUrl => 'URL 无效';

  @override
  String get apiTypeDanbooru => 'Danbooru（及衍生站点）';

  @override
  String get apiTypeGelbooru => 'Gelbooru 0.2（Gelbooru/Safebooru/Rule34）';

  @override
  String get apiTypeMoebooru => 'Moebooru（yande.re/konachan）';

  @override
  String get blacklistTitle => '标签黑名单';

  @override
  String get blacklistFixed => '始终屏蔽（固定，不可编辑）';

  @override
  String get blacklistUser => '你的屏蔽标签';

  @override
  String get blacklistAddHint => '添加标签...';

  @override
  String errorGeneric(String error) {
    return '错误：$error';
  }

  @override
  String get favoritesTitle => '收藏';

  @override
  String get favoritesEmpty => '还没有收藏';

  @override
  String get downloadHistoryTitle => '下载历史';

  @override
  String get downloadHistoryEmpty => '还没有下载记录';

  @override
  String get searchRefreshTooltip => '重新搜索';

  @override
  String get searchTagHint => '添加标签...';

  @override
  String get searchNoSourceEnabled => '没有启用的来源';

  @override
  String get searchNoSourceSelected => '没有选择来源';

  @override
  String get searchLoading => '搜索中...';

  @override
  String get searchEmptyState => '添加一个标签开始搜索';

  @override
  String get searchMultiWarning => '已选择多个来源——加载可能需要更长时间。';

  @override
  String searchError(String error) {
    return '搜索出错：$error';
  }

  @override
  String get shameWarningMessage => '你不应该搜索这个。这类内容在这里绝对不被允许，没有任何例外。你应该感到羞耻。';

  @override
  String get shameWarningButton => '我知道了';

  @override
  String get viewerOpenBrowser => '在浏览器中打开';

  @override
  String get viewerPermissionDenied => '相册权限被拒绝';

  @override
  String get viewerSaved => '已保存到相册';

  @override
  String viewerDownloadError(String error) {
    return '下载出错：$error';
  }
}

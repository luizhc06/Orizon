// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class AppLocalizationsJa extends AppLocalizations {
  AppLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get appTitle => 'Orizon';

  @override
  String get onboardingWelcome => 'Orizonへようこそ';

  @override
  String get onboardingBody1 =>
      'Orizonは、あなた自身が追加したソースを検索するbooruクライアントです。アダルトコンテンツの表示はデフォルトでオフになっています。何が表示されるかは、あなた自身の設定と選択次第です。その選択の責任はあなたにあります。';

  @override
  String get onboardingBody2 =>
      '設定に関わらず常に適用される固定の例外があります。Orizonは未成年を性的対象として扱うコンテンツを例外なく表示しません。';

  @override
  String get onboardingBody3 => 'ソースとブロックリストはいつでも設定から管理できます。';

  @override
  String get onboardingStart => 'はじめる';

  @override
  String onboardingStartWithTimer(int seconds) {
    return 'はじめる（$seconds秒）';
  }

  @override
  String get navHome => 'ホーム';

  @override
  String get navNews => 'ニュース';

  @override
  String get navFavorites => 'お気に入り';

  @override
  String get navSettings => '設定';

  @override
  String get newsTitle => 'ニュース';

  @override
  String get newsChangelogTab => '更新履歴';

  @override
  String get newsStatusTab => 'サイトの状態';

  @override
  String get siteStatusChecking => '確認中...';

  @override
  String get siteStatusOffline => 'オフライン';

  @override
  String siteStatusLatency(int ms) {
    return '$ms ms';
  }

  @override
  String get settingsTitle => '設定';

  @override
  String get settingsSources => 'ソース';

  @override
  String get settingsBlacklist => 'タグのブラックリスト';

  @override
  String get settingsHideAi => 'AI生成画像を非表示';

  @override
  String get settingsHideAiSubtitle =>
      'AI生成（Stable Diffusion、NovelAI、Midjourneyなど）とタグ付けされた投稿を非表示にします。';

  @override
  String get settingsDownloadHistory => 'ダウンロード履歴';

  @override
  String get settingsShowAdult => 'アダルトコンテンツを表示';

  @override
  String get settingsShowAdultSubtitle =>
      'デフォルトでオフです。Orizonはアダルトコンテンツを推奨しません。この設定をオンにすると、あなた自身が追加したソースによっては、性的に露骨または示唆的な画像が表示されることがあります。その選択の責任はあなたにあります。';

  @override
  String get settingsMultiBooru => 'マルチbooru検索';

  @override
  String get settingsMultiBooruSubtitle =>
      '1つだけでなく複数のソースを同時に検索します。読み込みに時間がかかる場合があります。';

  @override
  String get settingsTheme => 'テーマ';

  @override
  String get settingsGridColumns => 'グリッドの列数';

  @override
  String get settingsGridStyle => 'グリッドのスタイル';

  @override
  String get settingsGridStyleSubtitle =>
      'オーガニックは画像の縦横比に合わせてプレビューを配置し、均一は同じサイズのセルを使用します。';

  @override
  String get settingsGridOrganic => 'オーガニック';

  @override
  String get settingsGridUniform => '均一';

  @override
  String get settingsLanguage => '言語';

  @override
  String get settingsDiscord => 'Discord';

  @override
  String get settingsDiscordSubtitle => 'Orizonのブラジルコミュニティ 🇧🇷';

  @override
  String get settingsSupport => '開発者を支援する (Buy Me a Coffee)';

  @override
  String get settingsAbout => 'アプリについて';

  @override
  String get settingsBackupTitle => 'バックアップ';

  @override
  String get settingsBackupExport => 'バックアップを書き出す';

  @override
  String get settingsBackupImport => 'バックアップを復元する';

  @override
  String get settingsBackupImportSuccess => 'バックアップを復元しました';

  @override
  String settingsBackupImportError(String error) {
    return '復元エラー: $error';
  }

  @override
  String get settingsCacheTitle => 'キャッシュ';

  @override
  String get settingsCacheClearNow => '今すぐキャッシュを削除';

  @override
  String get settingsCacheCleared => 'キャッシュを削除しました';

  @override
  String get settingsCacheAutoClear => '終了時に自動でキャッシュを削除';

  @override
  String get settingsCacheAutoClearSubtitle =>
      'デフォルトでオフです。オンにすると、アプリを閉じるたびに画像キャッシュが削除されます。';

  @override
  String get themeWhiteRed => '白 + 赤';

  @override
  String get themeWhitePurple => '白 + 紫';

  @override
  String get themeBlackRed => '黒 + 赤';

  @override
  String get themePurpleBlack => '紫 + 黒';

  @override
  String get aboutTitle => 'アプリについて';

  @override
  String get aboutSubtitle => 'booruビューアー';

  @override
  String get aboutPrivacyPolicy => 'プライバシーポリシー';

  @override
  String get aboutLicenses => 'オープンソースライセンス';

  @override
  String get sourcesTitle => 'ソース';

  @override
  String get sourcesEmpty => 'ソースが追加されていません';

  @override
  String sourcesLoadError(String error) {
    return 'ソースの読み込みエラー: $error';
  }

  @override
  String get sourcesAddTooltip => 'カスタムソースを追加';

  @override
  String get sourcesRemoveTooltip => 'ソースを削除';

  @override
  String get sourceFormNew => '新しいソース';

  @override
  String get sourceFormEdit => 'ソースを編集';

  @override
  String get sourceFormSuggestions => '候補';

  @override
  String get sourceFormName => '名前';

  @override
  String get sourceFormBaseUrl => 'ベースURL';

  @override
  String get sourceFormApiType => 'APIタイプ';

  @override
  String get sourceFormUsername => 'ユーザー名（任意）';

  @override
  String get sourceFormApiKey => 'APIキー（任意）';

  @override
  String get sourceFormRequired => '必須項目です';

  @override
  String get sourceFormInvalidUrl => '無効なURLです';

  @override
  String get apiTypeDanbooru => 'Danbooru（および派生系）';

  @override
  String get apiTypeGelbooru => 'Gelbooru 0.2（Gelbooru/Safebooru/Rule34）';

  @override
  String get apiTypeMoebooru => 'Moebooru（yande.re/konachan）';

  @override
  String get blacklistTitle => 'タグのブラックリスト';

  @override
  String get blacklistFixed => '常にブロック（固定・編集不可）';

  @override
  String get blacklistUser => 'あなたのブロック済みタグ';

  @override
  String get blacklistAddHint => 'タグを追加...';

  @override
  String errorGeneric(String error) {
    return 'エラー: $error';
  }

  @override
  String get favoritesTitle => 'お気に入り';

  @override
  String get favoritesEmpty => 'まだお気に入りがありません';

  @override
  String get downloadHistoryTitle => 'ダウンロード履歴';

  @override
  String get downloadHistoryEmpty => 'まだダウンロードがありません';

  @override
  String get searchRefreshTooltip => '再検索';

  @override
  String get searchTagHint => 'タグを追加...';

  @override
  String get searchNoSourceEnabled => '有効なソースがありません';

  @override
  String get searchNoSourceSelected => 'ソースが選択されていません';

  @override
  String get searchLoading => '検索中...';

  @override
  String get searchEmptyState => 'タグを追加して始めましょう';

  @override
  String get searchMultiWarning => '複数のソースが選択されています — 読み込みに時間がかかる場合があります。';

  @override
  String searchError(String error) {
    return '検索エラー: $error';
  }

  @override
  String get shameWarningMessage =>
      'これを検索するべきではありません。この種のコンテンツはいかなる例外もなく、ここでは絶対に許可されていません。恥を知りなさい。';

  @override
  String get shameWarningButton => 'わかりました';

  @override
  String get viewerOpenBrowser => 'ブラウザで開く';

  @override
  String get viewerPermissionDenied => 'ギャラリーへのアクセスが拒否されました';

  @override
  String get viewerSaved => 'ギャラリーに保存しました';

  @override
  String viewerDownloadError(String error) {
    return 'ダウンロードエラー: $error';
  }

  @override
  String get viewerTagSearchTooltip => 'このタグだけで検索';

  @override
  String get viewerTagAddTooltip => '現在の検索に追加';

  @override
  String viewerTagAdded(String tag) {
    return '「$tag」を現在の検索に追加しました';
  }

  @override
  String get savedSearchesTitle => '保存した検索';

  @override
  String get savedSearchesEmpty => 'まだ保存された検索がありません';

  @override
  String get savedSearchesSaveButton => '現在の検索を保存';

  @override
  String get savedSearchesDialogTitle => '検索を保存';

  @override
  String get savedSearchesDialogHint => '検索名';

  @override
  String get savedSearchesDialogSave => '保存';

  @override
  String get savedSearchesDialogCancel => 'キャンセル';

  @override
  String get savedSearchesSaved => '検索を保存しました';

  @override
  String get savedSearchesDeleteTooltip => '削除';
}

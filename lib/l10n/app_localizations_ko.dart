// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Korean (`ko`).
class AppLocalizationsKo extends AppLocalizations {
  AppLocalizationsKo([String locale = 'ko']) : super(locale);

  @override
  String get appTitle => 'Orizon';

  @override
  String get onboardingWelcome => 'Orizon에 오신 것을 환영합니다';

  @override
  String get onboardingBody1 =>
      'Orizon은 사용자가 직접 추가한 소스를 검색하는 부루 클라이언트입니다. 성인 콘텐츠 표시는 기본적으로 꺼져 있습니다 — 무엇이 표시되는지는 오직 사용자의 설정과 선택에 달려 있습니다. 그 선택에 대한 책임은 사용자에게 있습니다.';

  @override
  String get onboardingBody2 =>
      '어떤 설정과도 관계없이 항상 적용되는 고정된 예외가 있습니다: Orizon은 미성년자를 성적으로 묘사하는 콘텐츠를 예외 없이 절대 표시하지 않습니다.';

  @override
  String get onboardingBody3 => '소스와 차단 목록은 언제든지 설정에서 관리할 수 있습니다.';

  @override
  String get onboardingStart => '시작하기';

  @override
  String onboardingStartWithTimer(int seconds) {
    return '시작하기 ($seconds초)';
  }

  @override
  String get navHome => '홈';

  @override
  String get navNews => '뉴스';

  @override
  String get navFavorites => '즐겨찾기';

  @override
  String get navSettings => '설정';

  @override
  String get newsTitle => '뉴스';

  @override
  String get newsChangelogTab => '업데이트 내역';

  @override
  String get newsStatusTab => '사이트 상태';

  @override
  String get siteStatusChecking => '확인 중...';

  @override
  String get siteStatusOffline => '오프라인';

  @override
  String siteStatusLatency(int ms) {
    return '$ms ms';
  }

  @override
  String get settingsTitle => '설정';

  @override
  String get settingsSources => '소스';

  @override
  String get settingsBlacklist => '태그 차단 목록';

  @override
  String get settingsHideAi => 'AI 이미지 숨기기';

  @override
  String get settingsHideAiSubtitle =>
      'AI 생성으로 태그된 게시물을 숨깁니다 (Stable Diffusion, NovelAI, Midjourney 등).';

  @override
  String get settingsDownloadHistory => '다운로드 기록';

  @override
  String get settingsShowAdult => '성인 콘텐츠 표시';

  @override
  String get settingsShowAdultSubtitle =>
      '기본적으로 꺼져 있습니다. Orizon은 성인 콘텐츠를 권장하지 않습니다. 이 옵션을 켜면 사용자가 직접 추가한 소스에 따라 성적으로 노골적이거나 선정적인 이미지가 표시될 수 있습니다. 그 선택에 대한 책임은 사용자에게 있습니다.';

  @override
  String get settingsMultiBooru => '멀티 부루 검색';

  @override
  String get settingsMultiBooruSubtitle =>
      '하나가 아닌 여러 소스를 동시에 검색합니다. 로딩이 더 오래 걸릴 수 있습니다.';

  @override
  String get settingsTheme => '테마';

  @override
  String get settingsGridColumns => '그리드 열 수';

  @override
  String get settingsGridStyle => '그리드 스타일';

  @override
  String get settingsGridStyleSubtitle =>
      '오가닉은 이미지 비율에 맞춰 미리보기를 배치하고, 균일은 동일한 크기의 셀을 사용합니다.';

  @override
  String get settingsGridOrganic => '오가닉';

  @override
  String get settingsGridUniform => '균일';

  @override
  String get settingsLanguage => '언어';

  @override
  String get settingsDiscord => 'Discord';

  @override
  String get settingsDiscordSubtitle => 'Orizon의 브라질 커뮤니티 🇧🇷';

  @override
  String get settingsSupport => '프로젝트 후원하기 (Buy Me a Coffee)';

  @override
  String get settingsAbout => '정보';

  @override
  String get settingsBackupTitle => '백업';

  @override
  String get settingsBackupExport => '백업 내보내기';

  @override
  String get settingsBackupImport => '백업 복원';

  @override
  String get settingsBackupImportSuccess => '백업이 복원되었습니다';

  @override
  String settingsBackupImportError(String error) {
    return '복원 오류: $error';
  }

  @override
  String get settingsCacheTitle => '캐시';

  @override
  String get settingsCacheClearNow => '지금 캐시 지우기';

  @override
  String get settingsCacheCleared => '캐시가 삭제되었습니다';

  @override
  String get settingsCacheAutoClear => '종료 시 캐시 자동 삭제';

  @override
  String get settingsCacheAutoClearSubtitle =>
      '기본적으로 꺼져 있습니다. 켜면 앱을 닫을 때마다 이미지 캐시가 삭제됩니다.';

  @override
  String get themeWhiteRed => '화이트 + 레드';

  @override
  String get themeWhitePurple => '화이트 + 퍼플';

  @override
  String get themeBlackRed => '블랙 + 레드';

  @override
  String get themePurpleBlack => '퍼플 + 블랙';

  @override
  String get aboutTitle => '정보';

  @override
  String get aboutSubtitle => '부루 뷰어';

  @override
  String get aboutPrivacyPolicy => '개인정보 처리방침';

  @override
  String get aboutLicenses => '오픈소스 라이선스';

  @override
  String get sourcesTitle => '소스';

  @override
  String get sourcesEmpty => '추가된 소스가 없습니다';

  @override
  String sourcesLoadError(String error) {
    return '소스를 불러오는 중 오류 발생: $error';
  }

  @override
  String get sourcesAddTooltip => '사용자 지정 소스 추가';

  @override
  String get sourcesRemoveTooltip => '소스 삭제';

  @override
  String get sourceFormNew => '새 소스';

  @override
  String get sourceFormEdit => '소스 편집';

  @override
  String get sourceFormSuggestions => '추천';

  @override
  String get sourceFormName => '이름';

  @override
  String get sourceFormBaseUrl => '기본 URL';

  @override
  String get sourceFormApiType => 'API 유형';

  @override
  String get sourceFormUsername => '사용자 이름 (선택 사항)';

  @override
  String get sourceFormApiKey => 'API 키 (선택 사항)';

  @override
  String get sourceFormRequired => '필수 항목입니다';

  @override
  String get sourceFormInvalidUrl => '잘못된 URL입니다';

  @override
  String get apiTypeDanbooru => 'Danbooru (및 파생 사이트)';

  @override
  String get apiTypeGelbooru => 'Gelbooru 0.2 (Gelbooru/Safebooru/Rule34)';

  @override
  String get apiTypeMoebooru => 'Moebooru (yande.re/konachan)';

  @override
  String get blacklistTitle => '태그 차단 목록';

  @override
  String get blacklistFixed => '항상 차단됨 (고정, 편집 불가)';

  @override
  String get blacklistUser => '사용자 차단 태그';

  @override
  String get blacklistAddHint => '태그 추가...';

  @override
  String errorGeneric(String error) {
    return '오류: $error';
  }

  @override
  String get favoritesTitle => '즐겨찾기';

  @override
  String get favoritesEmpty => '아직 즐겨찾기가 없습니다';

  @override
  String get downloadHistoryTitle => '다운로드 기록';

  @override
  String get downloadHistoryEmpty => '아직 다운로드한 항목이 없습니다';

  @override
  String get searchRefreshTooltip => '다시 검색';

  @override
  String get searchTagHint => '태그 추가...';

  @override
  String get searchNoSourceEnabled => '활성화된 소스가 없습니다';

  @override
  String get searchNoSourceSelected => '선택된 소스가 없습니다';

  @override
  String get searchLoading => '검색 중...';

  @override
  String get searchEmptyState => '태그를 추가해서 시작하세요';

  @override
  String get searchMultiWarning => '여러 소스가 선택됨 — 로딩에 시간이 더 걸릴 수 있습니다.';

  @override
  String searchError(String error) {
    return '검색 오류: $error';
  }

  @override
  String get shameWarningMessage =>
      '이런 걸 검색하면 안 됩니다. 이런 종류의 콘텐츠는 예외 없이 절대 허용되지 않습니다. 부끄러운 줄 아세요.';

  @override
  String get shameWarningButton => '알겠습니다';

  @override
  String get viewerOpenBrowser => '브라우저에서 열기';

  @override
  String get viewerPermissionDenied => '갤러리 접근 권한이 거부되었습니다';

  @override
  String get viewerSaved => '갤러리에 저장되었습니다';

  @override
  String viewerDownloadError(String error) {
    return '다운로드 오류: $error';
  }

  @override
  String get viewerTagSearchTooltip => '이 태그만으로 검색';

  @override
  String get viewerTagAddTooltip => '현재 검색에 추가';

  @override
  String viewerTagAdded(String tag) {
    return '\"$tag\"이(가) 현재 검색에 추가되었습니다';
  }

  @override
  String get savedSearchesTitle => '저장된 검색';

  @override
  String get savedSearchesEmpty => '아직 저장된 검색이 없습니다';

  @override
  String get savedSearchesSaveButton => '현재 검색 저장';

  @override
  String get savedSearchesDialogTitle => '검색 저장';

  @override
  String get savedSearchesDialogHint => '검색 이름';

  @override
  String get savedSearchesDialogSave => '저장';

  @override
  String get savedSearchesDialogCancel => '취소';

  @override
  String get savedSearchesSaved => '검색이 저장되었습니다';

  @override
  String get savedSearchesDeleteTooltip => '삭제';
}

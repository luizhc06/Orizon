import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _localeKey = 'settings.locale';
const _themePresetKey = 'settings.themePreset';
const _gridColumnsKey = 'settings.gridColumns';
const _gridModeKey = 'settings.gridMode';
const _onboardingDoneKey = 'settings.onboardingDone';
const _showAdultContentKey = 'settings.showAdultContent';
const _multiBooruKey = 'settings.multiBooru';
const _hideAiGeneratedKey = 'settings.hideAiGenerated';

enum GridMode { masonry, uniform }

enum AppThemePreset { whiteRed, whitePurple, blackRed, purpleBlack }

/// Idiomas suportados. `null` = seguir o idioma do sistema.
const List<Locale> supportedAppLocales = [
  Locale('pt'),
  Locale('en'),
  Locale('es'),
  Locale('fr'),
  Locale('de'),
  Locale('it'),
  Locale('ja'),
  Locale('ko'),
  Locale('zh'),
  Locale('ru'),
];

const Map<String, String> localeNativeNames = {
  'pt': 'Português',
  'en': 'English',
  'es': 'Español',
  'fr': 'Français',
  'de': 'Deutsch',
  'it': 'Italiano',
  'ja': '日本語',
  'ko': '한국어',
  'zh': '中文',
  'ru': 'Русский',
};

class AppLocaleNotifier extends Notifier<Locale?> {
  @override
  Locale? build() {
    final stored = ref.read(sharedPreferencesProvider).getString(_localeKey);
    if (stored == null) return null;
    return Locale(stored);
  }

  void set(Locale? locale) {
    state = locale;
    final prefs = ref.read(sharedPreferencesProvider);
    if (locale == null) {
      prefs.remove(_localeKey);
    } else {
      prefs.setString(_localeKey, locale.languageCode);
    }
  }
}

final appLocaleProvider = NotifierProvider<AppLocaleNotifier, Locale?>(
  AppLocaleNotifier.new,
);

/// Sobrescrito em main.dart depois de SharedPreferences.getInstance().
final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError('SharedPreferences não inicializado ainda');
});

class ThemePresetNotifier extends Notifier<AppThemePreset> {
  @override
  AppThemePreset build() {
    final stored = ref
        .read(sharedPreferencesProvider)
        .getString(_themePresetKey);
    return AppThemePreset.values.firstWhere(
      (p) => p.name == stored,
      orElse: () => AppThemePreset.whiteRed,
    );
  }

  void set(AppThemePreset preset) {
    state = preset;
    ref.read(sharedPreferencesProvider).setString(_themePresetKey, preset.name);
  }
}

final themePresetProvider = NotifierProvider<ThemePresetNotifier, AppThemePreset>(
  ThemePresetNotifier.new,
);

class GridColumnsNotifier extends Notifier<int> {
  @override
  int build() {
    return ref.read(sharedPreferencesProvider).getInt(_gridColumnsKey) ?? 2;
  }

  void set(int columns) {
    state = columns;
    ref.read(sharedPreferencesProvider).setInt(_gridColumnsKey, columns);
  }
}

final gridColumnsProvider = NotifierProvider<GridColumnsNotifier, int>(
  GridColumnsNotifier.new,
);

class GridModeNotifier extends Notifier<GridMode> {
  @override
  GridMode build() {
    final stored = ref.read(sharedPreferencesProvider).getString(_gridModeKey);
    return stored == 'uniform' ? GridMode.uniform : GridMode.masonry;
  }

  void set(GridMode mode) {
    state = mode;
    ref.read(sharedPreferencesProvider).setString(_gridModeKey, mode.name);
  }
}

final gridModeProvider = NotifierProvider<GridModeNotifier, GridMode>(
  GridModeNotifier.new,
);

/// Toggle de NSFW: desligado por padrão. Quando desligado, toda busca é
/// forçada em modo seguro (ver [BooruRepository]). O que fica visível com
/// ele ligado depende só das fontes que o próprio usuário cadastrar — o app
/// não promove nem sugere fontes adultas.
class ShowAdultContentNotifier extends Notifier<bool> {
  @override
  bool build() {
    return ref.read(sharedPreferencesProvider).getBool(_showAdultContentKey) ??
        false;
  }

  void set(bool value) {
    state = value;
    ref.read(sharedPreferencesProvider).setBool(_showAdultContentKey, value);
  }
}

final showAdultContentProvider =
    NotifierProvider<ShowAdultContentNotifier, bool>(
      ShowAdultContentNotifier.new,
    );

class MultiBooruNotifier extends Notifier<bool> {
  @override
  bool build() {
    return ref.read(sharedPreferencesProvider).getBool(_multiBooruKey) ??
        false;
  }

  void set(bool value) {
    state = value;
    ref.read(sharedPreferencesProvider).setBool(_multiBooruKey, value);
  }
}

final multiBooruProvider = NotifierProvider<MultiBooruNotifier, bool>(
  MultiBooruNotifier.new,
);

/// Oculta posts marcados com tags associadas a geração por IA
/// (ver `lib/core/ai_generated_tags.dart`). Desligado por padrão.
class HideAiGeneratedNotifier extends Notifier<bool> {
  @override
  bool build() {
    return ref.read(sharedPreferencesProvider).getBool(_hideAiGeneratedKey) ??
        false;
  }

  void set(bool value) {
    state = value;
    ref.read(sharedPreferencesProvider).setBool(_hideAiGeneratedKey, value);
  }
}

final hideAiGeneratedProvider = NotifierProvider<HideAiGeneratedNotifier, bool>(
  HideAiGeneratedNotifier.new,
);

bool isOnboardingDone(SharedPreferences prefs) =>
    prefs.getBool(_onboardingDoneKey) ?? false;

Future<void> markOnboardingDone(SharedPreferences prefs) =>
    prefs.setBool(_onboardingDoneKey, true);

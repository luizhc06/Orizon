import 'package:flutter/material.dart';

import '../features/settings/settings_providers.dart';
import '../l10n/app_localizations.dart';

const _displayFontFamily = 'Fraunces';
const _bodyFontFamily = 'Inter';

ThemeData themeForPreset(AppThemePreset preset) {
  final seed = presetSwatchPrimary(preset);
  final brightness = presetSwatchBackground(preset) == Colors.black
      ? Brightness.dark
      : Brightness.light;

  final colorScheme = ColorScheme.fromSeed(
    seedColor: seed,
    brightness: brightness,
  );
  final base = ThemeData(colorScheme: colorScheme, useMaterial3: true);
  final bodyTextTheme = base.textTheme.apply(fontFamily: _bodyFontFamily);

  return base.copyWith(
    textTheme: bodyTextTheme.copyWith(
      headlineLarge: bodyTextTheme.headlineLarge?.copyWith(
        fontFamily: _displayFontFamily,
        fontWeight: FontWeight.w600,
      ),
      headlineMedium: bodyTextTheme.headlineMedium?.copyWith(
        fontFamily: _displayFontFamily,
        fontWeight: FontWeight.w600,
      ),
      titleLarge: bodyTextTheme.titleLarge?.copyWith(
        fontFamily: _displayFontFamily,
        fontWeight: FontWeight.w600,
      ),
    ),
    appBarTheme: base.appBarTheme.copyWith(
      titleTextStyle: TextStyle(
        fontFamily: _displayFontFamily,
        fontSize: 22,
        fontWeight: FontWeight.w600,
        color: colorScheme.onSurface,
      ),
    ),
  );
}

String presetLabel(BuildContext context, AppThemePreset preset) {
  final l10n = AppLocalizations.of(context)!;
  return switch (preset) {
    AppThemePreset.whiteRed => l10n.themeWhiteRed,
    AppThemePreset.whitePurple => l10n.themeWhitePurple,
    AppThemePreset.blackRed => l10n.themeBlackRed,
    AppThemePreset.purpleBlack => l10n.themePurpleBlack,
  };
}

Color presetSwatchPrimary(AppThemePreset preset) => switch (preset) {
  AppThemePreset.whiteRed => Colors.red,
  AppThemePreset.whitePurple => Colors.deepPurple,
  AppThemePreset.blackRed => Colors.red,
  AppThemePreset.purpleBlack => Colors.deepPurple,
};

Color presetSwatchBackground(AppThemePreset preset) => switch (preset) {
  AppThemePreset.whiteRed => Colors.white,
  AppThemePreset.whitePurple => Colors.white,
  AppThemePreset.blackRed => Colors.black,
  AppThemePreset.purpleBlack => Colors.black,
};

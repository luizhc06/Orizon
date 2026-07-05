import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core/theme.dart';
import '../../l10n/app_localizations.dart';
import '../favorites/download_history_screen.dart';
import '../sources/sources_screen.dart';
import 'about_screen.dart';
import 'blacklist_screen.dart';
import 'settings_providers.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final gridColumns = ref.watch(gridColumnsProvider);
    final gridMode = ref.watch(gridModeProvider);
    final showAdultContent = ref.watch(showAdultContentProvider);
    final multiBooru = ref.watch(multiBooruProvider);
    final hideAiGenerated = ref.watch(hideAiGeneratedProvider);
    final themePreset = ref.watch(themePresetProvider);
    final locale = ref.watch(appLocaleProvider);

    return Scaffold(
      appBar: AppBar(title: Text(l10n.settingsTitle)),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.travel_explore),
            title: Text(l10n.settingsSources),
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => const SourcesScreen()),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.block),
            title: Text(l10n.settingsBlacklist),
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => const BlacklistScreen()),
            ),
          ),
          SwitchListTile(
            secondary: const Icon(Icons.smart_toy_outlined),
            title: Text(l10n.settingsHideAi),
            subtitle: Text(l10n.settingsHideAiSubtitle),
            value: hideAiGenerated,
            onChanged: (value) =>
                ref.read(hideAiGeneratedProvider.notifier).set(value),
          ),
          ListTile(
            leading: const Icon(Icons.history),
            title: Text(l10n.settingsDownloadHistory),
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => const DownloadHistoryScreen()),
            ),
          ),
          const Divider(),
          SwitchListTile(
            secondary: const Icon(Icons.no_adult_content),
            title: Text(l10n.settingsShowAdult),
            subtitle: Text(l10n.settingsShowAdultSubtitle),
            value: showAdultContent,
            onChanged: (value) =>
                ref.read(showAdultContentProvider.notifier).set(value),
          ),
          SwitchListTile(
            secondary: const Icon(Icons.dynamic_feed),
            title: Text(l10n.settingsMultiBooru),
            subtitle: Text(l10n.settingsMultiBooruSubtitle),
            value: multiBooru,
            onChanged: (value) =>
                ref.read(multiBooruProvider.notifier).set(value),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 4),
            child: Text(
              l10n.settingsTheme,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Wrap(
              spacing: 12,
              runSpacing: 12,
              children: AppThemePreset.values
                  .map(
                    (preset) => _ThemeSwatch(
                      preset: preset,
                      selected: preset == themePreset,
                      onTap: () =>
                          ref.read(themePresetProvider.notifier).set(preset),
                    ),
                  )
                  .toList(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 20, 16, 4),
            child: Text(
              l10n.settingsGridColumns,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SegmentedButton<int>(
              segments: const [
                ButtonSegment(value: 2, label: Text('2')),
                ButtonSegment(value: 3, label: Text('3')),
                ButtonSegment(value: 4, label: Text('4')),
              ],
              selected: {gridColumns},
              onSelectionChanged: (selection) =>
                  ref.read(gridColumnsProvider.notifier).set(selection.first),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 20, 16, 4),
            child: Text(
              l10n.settingsGridStyle,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 4),
            child: Text(
              l10n.settingsGridStyleSubtitle,
              style: const TextStyle(fontSize: 12),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SegmentedButton<GridMode>(
              segments: [
                ButtonSegment(
                  value: GridMode.masonry,
                  icon: const Icon(Icons.view_quilt),
                  label: Text(l10n.settingsGridOrganic),
                ),
                ButtonSegment(
                  value: GridMode.uniform,
                  icon: const Icon(Icons.grid_on),
                  label: Text(l10n.settingsGridUniform),
                ),
              ],
              selected: {gridMode},
              onSelectionChanged: (selection) =>
                  ref.read(gridModeProvider.notifier).set(selection.first),
            ),
          ),
          const SizedBox(height: 8),
          const Divider(),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 4),
            child: Text(
              l10n.settingsLanguage,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
            child: DropdownButton<Locale?>(
              isExpanded: true,
              value: locale,
              items: [
                DropdownMenuItem<Locale?>(
                  value: null,
                  child: Text(l10n.settingsLanguage),
                ),
                ...supportedAppLocales.map(
                  (loc) => DropdownMenuItem<Locale?>(
                    value: loc,
                    child: Text(
                      localeNativeNames[loc.languageCode] ?? loc.languageCode,
                    ),
                  ),
                ),
              ],
              onChanged: (value) =>
                  ref.read(appLocaleProvider.notifier).set(value),
            ),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.discord),
            title: Text(l10n.settingsDiscord),
            subtitle: Text(l10n.settingsDiscordSubtitle),
            trailing: const Icon(Icons.open_in_new),
            onTap: () => launchUrl(
              Uri.parse('https://discord.gg/FMsS8QnAtT'),
              mode: LaunchMode.externalApplication,
            ),
          ),
          ListTile(
            leading: const Icon(Icons.coffee),
            title: Text(l10n.settingsSupport),
            trailing: const Icon(Icons.open_in_new),
            onTap: () => launchUrl(
              Uri.parse('https://buymeacoffee.com/rizuwu'),
              mode: LaunchMode.externalApplication,
            ),
          ),
          ListTile(
            leading: const Icon(Icons.info_outline),
            title: Text(l10n.settingsAbout),
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => const AboutScreen()),
            ),
          ),
        ],
      ),
    );
  }
}

class _ThemeSwatch extends StatelessWidget {
  final AppThemePreset preset;
  final bool selected;
  final VoidCallback onTap;

  const _ThemeSwatch({
    required this.preset,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final primary = presetSwatchPrimary(preset);
    final background = presetSwatchBackground(preset);
    final borderColor = selected
        ? Theme.of(context).colorScheme.primary
        : Theme.of(context).dividerColor;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: 84,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: borderColor, width: selected ? 2 : 1),
        ),
        child: Column(
          children: [
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: background,
                border: Border.all(color: Colors.grey.shade400),
                gradient: LinearGradient(
                  colors: [background, primary],
                  stops: const [0.5, 0.5],
                ),
              ),
            ),
            const SizedBox(height: 6),
            Text(
              presetLabel(context, preset),
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 11),
              maxLines: 2,
            ),
          ],
        ),
      ),
    );
  }
}

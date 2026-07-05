import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../l10n/app_localizations.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(title: Text(l10n.aboutTitle)),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Orizon'),
            subtitle: Text(l10n.aboutSubtitle),
          ),
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
            title: Text(l10n.aboutPrivacyPolicy),
            trailing: const Icon(Icons.open_in_new),
            onTap: () => launchUrl(
              Uri.parse(
                'https://github.com/luizhc06/Orizon/blob/main/PRIVACY.md',
              ),
              mode: LaunchMode.externalApplication,
            ),
          ),
          ListTile(
            title: Text(l10n.aboutLicenses),
            onTap: () => showLicensePage(
              context: context,
              applicationName: 'Orizon',
              applicationVersion: '1.0.0',
            ),
          ),
        ],
      ),
    );
  }
}

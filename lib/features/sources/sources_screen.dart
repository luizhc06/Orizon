import 'package:drift/drift.dart' show Value;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/providers.dart';
import '../../data/db/database.dart';
import '../../l10n/app_localizations.dart';
import 'source_form_screen.dart';
import 'sources_providers.dart';

class SourcesScreen extends ConsumerWidget {
  const SourcesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final sourcesAsync = ref.watch(sourcesStreamProvider);

    return Scaffold(
      appBar: AppBar(title: Text(l10n.sourcesTitle)),
      body: sourcesAsync.when(
        data: (sources) => sources.isEmpty
            ? Center(child: Text(l10n.sourcesEmpty))
            : ListView.builder(
                itemCount: sources.length,
                itemBuilder: (context, index) => _SourceTile(
                  source: sources[index],
                ),
              ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, _) =>
            Center(child: Text(l10n.sourcesLoadError(err.toString()))),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(builder: (_) => const SourceFormScreen()),
        ),
        tooltip: l10n.sourcesAddTooltip,
        child: const Icon(Icons.add),
      ),
    );
  }
}

class _SourceTile extends ConsumerWidget {
  final Source source;

  const _SourceTile({required this.source});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    return ListTile(
      title: Text(source.name),
      subtitle: Text(source.baseUrl),
      leading: Icon(source.isPreset ? Icons.verified_user : Icons.public),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Switch(
            value: source.enabled,
            onChanged: (value) {
              ref
                  .read(appDatabaseProvider)
                  .upsertSource(
                    SourcesCompanion(
                      id: Value(source.id),
                      name: Value(source.name),
                      baseUrl: Value(source.baseUrl),
                      apiType: Value(source.apiType),
                      username: Value(source.username),
                      apiKey: Value(source.apiKey),
                      enabled: Value(value),
                      isPreset: Value(source.isPreset),
                    ),
                  );
            },
          ),
          IconButton(
            icon: const Icon(Icons.delete_outline),
            tooltip: l10n.sourcesRemoveTooltip,
            onPressed: () =>
                ref.read(appDatabaseProvider).deleteSource(source.id),
          ),
        ],
      ),
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => SourceFormScreen(existing: source),
        ),
      ),
    );
  }
}

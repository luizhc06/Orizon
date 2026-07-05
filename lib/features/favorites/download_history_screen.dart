import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../core/providers.dart';
import '../../data/db/database.dart';
import '../../l10n/app_localizations.dart';

final downloadHistoryStreamProvider =
    StreamProvider<List<DownloadHistoryEntry>>((ref) {
      return ref.watch(appDatabaseProvider).watchDownloadHistory();
    });

class DownloadHistoryScreen extends ConsumerWidget {
  const DownloadHistoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final historyAsync = ref.watch(downloadHistoryStreamProvider);
    final dateFormat = DateFormat('dd/MM/yyyy HH:mm');

    return Scaffold(
      appBar: AppBar(title: Text(l10n.downloadHistoryTitle)),
      body: historyAsync.when(
        data: (entries) => entries.isEmpty
            ? Center(child: Text(l10n.downloadHistoryEmpty))
            : ListView.builder(
                itemCount: entries.length,
                itemBuilder: (context, index) {
                  final entry = entries[index];
                  return ListTile(
                    leading: const Icon(Icons.download_done),
                    title: Text(entry.postId),
                    subtitle: Text(
                      '${entry.localPath} · ${dateFormat.format(entry.downloadedAt)}',
                    ),
                  );
                },
              ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, _) => Center(child: Text(l10n.errorGeneric(err.toString()))),
      ),
    );
  }
}

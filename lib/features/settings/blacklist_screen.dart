import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/base_blacklist.dart';
import '../../core/providers.dart';
import '../../data/db/database.dart';
import '../../l10n/app_localizations.dart';

final userBlacklistStreamProvider = StreamProvider<List<TagBlacklistEntry>>((
  ref,
) {
  return ref.watch(appDatabaseProvider).watchBlacklist();
});

class BlacklistScreen extends ConsumerStatefulWidget {
  const BlacklistScreen({super.key});

  @override
  ConsumerState<BlacklistScreen> createState() => _BlacklistScreenState();
}

class _BlacklistScreenState extends ConsumerState<BlacklistScreen> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _addTag(String value) {
    final tag = value.trim().toLowerCase();
    if (tag.isEmpty) return;
    ref.read(appDatabaseProvider).addBlacklistTag(tag);
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final userBlacklistAsync = ref.watch(userBlacklistStreamProvider);

    return Scaffold(
      appBar: AppBar(title: Text(l10n.blacklistTitle)),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(
            l10n.blacklistFixed,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: baseBlacklistTags
                .map(
                  (tag) => Chip(
                    label: Text(tag),
                    avatar: const Icon(Icons.lock_outline, size: 16),
                  ),
                )
                .toList(),
          ),
          const Divider(height: 32),
          Text(
            l10n.blacklistUser,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _controller,
                  decoration: InputDecoration(hintText: l10n.blacklistAddHint),
                  onSubmitted: _addTag,
                ),
              ),
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: () => _addTag(_controller.text),
              ),
            ],
          ),
          const SizedBox(height: 8),
          userBlacklistAsync.when(
            data: (entries) => Wrap(
              spacing: 8,
              runSpacing: 8,
              children: entries
                  .map(
                    (entry) => Chip(
                      label: Text(entry.tag),
                      onDeleted: () => ref
                          .read(appDatabaseProvider)
                          .removeBlacklistTag(entry.tag),
                    ),
                  )
                  .toList(),
            ),
            loading: () => const CircularProgressIndicator(),
            error: (err, _) => Text(l10n.errorGeneric(err.toString())),
          ),
        ],
      ),
    );
  }
}

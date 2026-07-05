import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../l10n/app_localizations.dart';
import '../sources/sources_providers.dart';
import 'changelog_data.dart';
import 'site_status.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(l10n.newsTitle),
          bottom: TabBar(
            tabs: [
              Tab(text: l10n.newsChangelogTab),
              Tab(text: l10n.newsStatusTab),
            ],
          ),
        ),
        body: const TabBarView(
          children: [_ChangelogTab(), _SiteStatusTab()],
        ),
      ),
    );
  }
}

class _ChangelogTab extends StatelessWidget {
  const _ChangelogTab();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: changelogEntries.length,
      itemBuilder: (context, index) {
        final entry = changelogEntries[index];
        return Card(
          margin: const EdgeInsets.only(bottom: 12),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'v${entry.version}',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    Text(
                      entry.date,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                ...entry.changes.map(
                  (change) => Padding(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: Text('• $change'),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _SiteStatusTab extends ConsumerStatefulWidget {
  const _SiteStatusTab();

  @override
  ConsumerState<_SiteStatusTab> createState() => _SiteStatusTabState();
}

class _SiteStatusTabState extends ConsumerState<_SiteStatusTab> {
  List<SiteStatus> _statuses = [];
  bool _checking = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _checkAll());
  }

  Future<void> _checkAll() async {
    final sources = ref.read(sourcesStreamProvider).value ?? [];
    if (sources.isEmpty) return;

    setState(() {
      _checking = true;
      _statuses = sources
          .map(
            (s) => SiteStatus(
              sourceId: s.id,
              name: s.name,
              baseUrl: s.baseUrl,
              state: SiteStatusState.checking,
            ),
          )
          .toList();
    });

    final dio = Dio();
    for (final source in sources) {
      final stopwatch = Stopwatch()..start();
      try {
        await dio.get(
          source.baseUrl,
          options: Options(
            sendTimeout: const Duration(seconds: 6),
            receiveTimeout: const Duration(seconds: 6),
            validateStatus: (_) => true,
          ),
        );
        stopwatch.stop();
        _updateStatus(
          source.id,
          SiteStatusState.online,
          stopwatch.elapsedMilliseconds,
        );
      } catch (_) {
        _updateStatus(source.id, SiteStatusState.offline, null);
      }
    }

    if (mounted) setState(() => _checking = false);
  }

  void _updateStatus(String sourceId, SiteStatusState state, int? latencyMs) {
    if (!mounted) return;
    setState(() {
      _statuses = _statuses
          .map(
            (s) => s.sourceId == sourceId
                ? s.copyWith(state: state, latencyMs: latencyMs)
                : s,
          )
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return RefreshIndicator(
      onRefresh: _checkAll,
      child: _statuses.isEmpty
          ? ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(24),
                  child: Text(
                    _checking ? l10n.siteStatusChecking : l10n.sourcesEmpty,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            )
          : ListView.builder(
              itemCount: _statuses.length,
              itemBuilder: (context, index) {
                final status = _statuses[index];
                return ListTile(
                  leading: _StatusDot(state: status.state),
                  title: Text(status.name),
                  subtitle: Text(status.baseUrl),
                  trailing: Text(_statusLabel(l10n, status)),
                );
              },
            ),
    );
  }

  String _statusLabel(AppLocalizations l10n, SiteStatus status) {
    switch (status.state) {
      case SiteStatusState.checking:
        return l10n.siteStatusChecking;
      case SiteStatusState.online:
        return l10n.siteStatusLatency(status.latencyMs ?? 0);
      case SiteStatusState.offline:
        return l10n.siteStatusOffline;
    }
  }
}

class _StatusDot extends StatelessWidget {
  final SiteStatusState state;

  const _StatusDot({required this.state});

  @override
  Widget build(BuildContext context) {
    final color = switch (state) {
      SiteStatusState.checking => Colors.grey,
      SiteStatusState.online => Colors.green,
      SiteStatusState.offline => Colors.red,
    };
    return Container(
      width: 12,
      height: 12,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }
}

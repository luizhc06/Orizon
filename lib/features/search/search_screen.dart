import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../core/base_blacklist.dart';
import '../../core/providers.dart';
import '../../data/booru/booru_repository.dart';
import '../../data/booru/models/post.dart';
import '../../data/db/database.dart';
import '../../data/db/mappers.dart';
import '../../l10n/app_localizations.dart';
import '../settings/settings_providers.dart';
import '../sources/sources_providers.dart';
import '../viewer/viewer_screen.dart';

class SearchScreen extends ConsumerStatefulWidget {
  const SearchScreen({super.key});

  @override
  ConsumerState<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen> {
  final _tagInputController = TextEditingController();
  final _scrollController = ScrollController();
  final List<Post> _posts = [];
  final List<String> _activeTags = [];
  List<String> _suggestions = [];
  Timer? _debounce;
  int _page = 1;
  final Map<String, int> _pagesBySource = {};
  final Set<String> _exhaustedSourceIds = {};
  bool _isLoading = false;
  bool _hasMore = true;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _debounce?.cancel();
    _tagInputController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (!_scrollController.hasClients) return;
    final threshold = _scrollController.position.maxScrollExtent - 400;
    if (_scrollController.position.pixels >= threshold &&
        !_isLoading &&
        _hasMore) {
      _loadMore();
    }
  }

  void _onTagInputChanged(String value) {
    _debounce?.cancel();
    final query = value.trim();
    if (query.isEmpty) {
      setState(() => _suggestions = []);
      return;
    }
    _debounce = Timer(
      const Duration(milliseconds: 300),
      () => _fetchSuggestions(query),
    );
  }

  Future<void> _fetchSuggestions(String query) async {
    final sources = ref.read(sourcesStreamProvider).value ?? [];
    final source = _resolveActiveSource(sources);
    if (source == null) return;
    try {
      final repo = ref.read(booruRepositoryProvider);
      final results = await repo.autocompleteTags(source.toConfig(), query);
      if (mounted) setState(() => _suggestions = results);
    } catch (_) {
      // autocomplete falhando não deve travar a busca principal.
    }
  }

  void _commitTag(String rawTag) {
    final tag = rawTag.trim();
    if (tag.isEmpty) return;

    if (isBlockedByBaseBlacklist([tag])) {
      _tagInputController.clear();
      setState(() => _suggestions = []);
      _showShameWarning();
      return;
    }

    setState(() {
      if (!_activeTags.contains(tag)) _activeTags.add(tag);
      _tagInputController.clear();
      _suggestions = [];
    });
    _runSearch();
  }

  void _showShameWarning() {
    final l10n = AppLocalizations.of(context)!;
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (dialogContext) => AlertDialog(
        title: const Text('(╬ ಠ益ಠ)', textAlign: TextAlign.center),
        content: Text(l10n.shameWarningMessage, textAlign: TextAlign.center),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(),
            child: Text(l10n.shameWarningButton),
          ),
        ],
      ),
    );
  }

  void _removeTag(String tag) {
    setState(() => _activeTags.remove(tag));
    _runSearch();
  }

  Future<void> _runSearch() async {
    setState(() {
      _posts.clear();
      _page = 1;
      _pagesBySource.clear();
      _exhaustedSourceIds.clear();
      _hasMore = true;
      _errorMessage = null;
    });
    await _loadMore();
  }

  Source? _resolveActiveSource(List<Source> sources) {
    final activeId = ref.read(activeSourceIdProvider);
    for (final s in sources) {
      if (s.id == activeId) return s;
    }
    for (final s in sources) {
      if (s.enabled) return s;
    }
    return null;
  }

  Future<void> _loadMore() async {
    if (_activeTags.isEmpty) return;
    final safeModeOnly = !ref.read(showAdultContentProvider);
    final hideAiGenerated = ref.read(hideAiGeneratedProvider);
    final multiBooru = ref.read(multiBooruProvider);
    final repo = ref.read(booruRepositoryProvider);

    if (multiBooru) {
      await _loadMoreMultiBooru(repo, safeModeOnly, hideAiGenerated);
    } else {
      await _loadMoreSingleSource(repo, safeModeOnly, hideAiGenerated);
    }
  }

  Future<void> _loadMoreSingleSource(
    BooruRepository repo,
    bool safeModeOnly,
    bool hideAiGenerated,
  ) async {
    final l10n = AppLocalizations.of(context)!;
    final sources = ref.read(sourcesStreamProvider).value ?? [];
    final source = _resolveActiveSource(sources);
    if (source == null) {
      setState(() => _errorMessage = l10n.searchNoSourceEnabled);
      return;
    }

    setState(() => _isLoading = true);
    try {
      final results = await repo.search(
        source.toConfig(),
        tags: _activeTags,
        page: _page,
        safeModeOnly: safeModeOnly,
        hideAiGenerated: hideAiGenerated,
      );
      if (!mounted) return;
      setState(() {
        _posts.addAll(results);
        _page++;
        _hasMore = results.isNotEmpty;
      });
    } catch (e) {
      if (mounted) {
        setState(() => _errorMessage = l10n.searchError(e.toString()));
      }
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  Future<void> _loadMoreMultiBooru(
    BooruRepository repo,
    bool safeModeOnly,
    bool hideAiGenerated,
  ) async {
    final l10n = AppLocalizations.of(context)!;
    final sources = ref.read(sourcesStreamProvider).value ?? [];
    final selectedIds = ref.read(selectedMultiSourceIdsProvider);
    final candidates = selectedIds.isEmpty
        ? sources.where((s) => s.enabled)
        : sources.where((s) => s.enabled && selectedIds.contains(s.id));
    final enabledSources = candidates
        .where((s) => !_exhaustedSourceIds.contains(s.id))
        .toList();

    if (enabledSources.isEmpty) {
      setState(() {
        _hasMore = false;
        if (_posts.isEmpty) _errorMessage = l10n.searchNoSourceSelected;
      });
      return;
    }

    setState(() => _isLoading = true);
    try {
      final resultsMap = await repo.searchMultiple(
        enabledSources.map((s) => s.toConfig()).toList(),
        tags: _activeTags,
        pages: _pagesBySource,
        safeModeOnly: safeModeOnly,
        hideAiGenerated: hideAiGenerated,
      );

      final newPosts = <Post>[];
      for (final source in enabledSources) {
        final posts = resultsMap[source.id] ?? const <Post>[];
        if (posts.isEmpty) {
          _exhaustedSourceIds.add(source.id);
        } else {
          _pagesBySource[source.id] = (_pagesBySource[source.id] ?? 1) + 1;
          newPosts.addAll(posts);
        }
      }

      if (!mounted) return;
      setState(() {
        _posts.addAll(newPosts);
        _hasMore = _exhaustedSourceIds.length < enabledSources.length;
      });
    } catch (e) {
      if (mounted) {
        setState(() => _errorMessage = l10n.searchError(e.toString()));
      }
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final sourcesAsync = ref.watch(sourcesStreamProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Orizon'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            tooltip: l10n.searchRefreshTooltip,
            onPressed: _activeTags.isEmpty ? null : _runSearch,
          ),
        ],
      ),
      body: Column(
        children: [
          _buildTagInputBar(),
          sourcesAsync.when(
            data: (sources) => _SourcePickerBar(sources: sources),
            loading: () => const SizedBox.shrink(),
            error: (_, _) => const SizedBox.shrink(),
          ),
          const Divider(height: 1),
          Expanded(child: _buildResults()),
        ],
      ),
    );
  }

  Widget _buildTagInputBar() {
    final l10n = AppLocalizations.of(context)!;
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 8, 12, 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            decoration: BoxDecoration(
              border: Border.all(color: Theme.of(context).dividerColor),
              borderRadius: BorderRadius.circular(24),
            ),
            child: Wrap(
              spacing: 6,
              runSpacing: 6,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                const Icon(Icons.search, size: 18),
                ..._activeTags.map(
                  (tag) => Chip(
                    label: Text(tag),
                    visualDensity: VisualDensity.compact,
                    onDeleted: () => _removeTag(tag),
                  ),
                ),
                ConstrainedBox(
                  constraints: const BoxConstraints(minWidth: 100),
                  child: IntrinsicWidth(
                    child: TextField(
                      controller: _tagInputController,
                      decoration: InputDecoration(
                        hintText: l10n.searchTagHint,
                        isDense: true,
                        border: InputBorder.none,
                        isCollapsed: true,
                      ),
                      textInputAction: TextInputAction.done,
                      onChanged: _onTagInputChanged,
                      onSubmitted: _commitTag,
                    ),
                  ),
                ),
              ],
            ),
          ),
          if (_suggestions.isNotEmpty)
            Container(
              margin: const EdgeInsets.only(top: 6),
              constraints: const BoxConstraints(maxHeight: 160),
              decoration: BoxDecoration(
                border: Border.all(color: Theme.of(context).dividerColor),
                borderRadius: BorderRadius.circular(8),
              ),
              child: ListView(
                shrinkWrap: true,
                children: _suggestions
                    .map(
                      (s) => ListTile(
                        dense: true,
                        title: Text(s),
                        onTap: () => _commitTag(s),
                      ),
                    )
                    .toList(),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildResults() {
    final l10n = AppLocalizations.of(context)!;
    if (_errorMessage != null && _posts.isEmpty) {
      return Center(child: Text(_errorMessage!));
    }
    if (_posts.isEmpty) {
      return Center(
        child: Text(_isLoading ? l10n.searchLoading : l10n.searchEmptyState),
      );
    }

    final gridColumns = ref.watch(gridColumnsProvider);
    final gridMode = ref.watch(gridModeProvider);

    if (gridMode == GridMode.uniform) {
      return GridView.builder(
        controller: _scrollController,
        padding: const EdgeInsets.all(4),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: gridColumns,
          mainAxisSpacing: 4,
          crossAxisSpacing: 4,
        ),
        itemCount: _posts.length,
        itemBuilder: (context, index) => _PostThumbnail(
          post: _posts[index],
          posts: _posts,
          index: index,
        ),
      );
    }

    return MasonryGridView.count(
      controller: _scrollController,
      crossAxisCount: gridColumns,
      mainAxisSpacing: 4,
      crossAxisSpacing: 4,
      padding: const EdgeInsets.all(4),
      itemCount: _posts.length,
      itemBuilder: (context, index) => _PostThumbnail(
        post: _posts[index],
        posts: _posts,
        index: index,
        organic: true,
      ),
    );
  }
}

class _PostThumbnail extends StatelessWidget {
  final Post post;
  final List<Post> posts;
  final int index;
  final bool organic;

  const _PostThumbnail({
    required this.post,
    required this.posts,
    required this.index,
    this.organic = false,
  });

  @override
  Widget build(BuildContext context) {
    final image = CachedNetworkImage(
      imageUrl: post.previewUrl,
      fit: BoxFit.cover,
      placeholder: (context, url) => const ColoredBox(color: Colors.black12),
      errorWidget: (context, url, error) =>
          const Icon(Icons.broken_image_outlined),
    );

    return GestureDetector(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => ViewerScreen(posts: posts, initialIndex: index),
        ),
      ),
      child: organic
          ? AspectRatio(
              aspectRatio: post.aspectRatio == 0 ? 1 : post.aspectRatio,
              child: image,
            )
          : image,
    );
  }
}

/// Seletor de fontes com preview (favicon) + nome. Em modo normal é seleção
/// única; com o multi-booru ligado (configurações) vira multi-seleção e
/// mostra um aviso quando mais de uma fonte estiver marcada.
class _SourcePickerBar extends ConsumerWidget {
  final List<Source> sources;

  const _SourcePickerBar({required this.sources});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final enabledSources = sources.where((s) => s.enabled).toList();
    final multiBooru = ref.watch(multiBooruProvider);
    final activeId =
        ref.watch(activeSourceIdProvider) ??
        (enabledSources.isNotEmpty ? enabledSources.first.id : null);
    final selectedIds = ref.watch(selectedMultiSourceIdsProvider);

    if (enabledSources.isEmpty) {
      return Padding(
        padding: const EdgeInsets.all(12),
        child: Text(l10n.searchNoSourceEnabled),
      );
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (multiBooru && selectedIds.length > 1)
          Container(
            width: double.infinity,
            color: Colors.orange.withValues(alpha: 0.15),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: Row(
              children: [
                const Icon(
                  Icons.warning_amber_rounded,
                  size: 16,
                  color: Colors.orange,
                ),
                const SizedBox(width: 6),
                Expanded(
                  child: Text(
                    l10n.searchMultiWarning,
                    style: const TextStyle(fontSize: 11),
                  ),
                ),
              ],
            ),
          ),
        SizedBox(
          height: 92,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
            children: enabledSources.map((s) {
              final selected = multiBooru
                  ? selectedIds.contains(s.id)
                  : s.id == activeId;
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: _SourceCard(
                  source: s,
                  selected: selected,
                  onTap: () {
                    if (multiBooru) {
                      final current = {...selectedIds};
                      if (!current.add(s.id)) current.remove(s.id);
                      ref
                              .read(selectedMultiSourceIdsProvider.notifier)
                              .state =
                          current;
                    } else {
                      ref.read(activeSourceIdProvider.notifier).state = s.id;
                    }
                  },
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}

class _SourceCard extends StatelessWidget {
  final Source source;
  final bool selected;
  final VoidCallback onTap;

  const _SourceCard({
    required this.source,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final borderColor = selected
        ? Theme.of(context).colorScheme.primary
        : Theme.of(context).dividerColor;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: 72,
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          border: Border.all(color: borderColor, width: selected ? 2 : 1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: CachedNetworkImage(
                    imageUrl: '${source.baseUrl}/favicon.ico',
                    width: 36,
                    height: 36,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => const Icon(
                      Icons.public,
                      size: 24,
                    ),
                    errorWidget: (context, url, error) => const Icon(
                      Icons.public,
                      size: 24,
                    ),
                  ),
                ),
                if (selected)
                  Positioned(
                    right: -6,
                    top: -6,
                    child: Icon(
                      Icons.check_circle,
                      size: 16,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              source.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 11),
            ),
          ],
        ),
      ),
    );
  }
}

import 'dart:async';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gal/gal.dart';
import 'package:go_router/go_router.dart';
import 'package:path_provider/path_provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:video_player/video_player.dart';

import '../../core/providers.dart';
import '../../data/booru/models/post.dart';
import '../../data/db/database.dart';
import '../../data/db/mappers.dart';
import '../../l10n/app_localizations.dart';
import '../search/search_providers.dart';

class ViewerScreen extends ConsumerStatefulWidget {
  final List<Post> posts;
  final int initialIndex;

  const ViewerScreen({
    super.key,
    required this.posts,
    required this.initialIndex,
  });

  @override
  ConsumerState<ViewerScreen> createState() => _ViewerScreenState();
}

class _ViewerScreenState extends ConsumerState<ViewerScreen> {
  late final PageController _pageController;
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
    _pageController = PageController(initialPage: widget.initialIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final post = widget.posts[_currentIndex];

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black54,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.open_in_browser),
            tooltip: l10n.viewerOpenBrowser,
            onPressed: post.sourcePostUrl == null
                ? null
                : () => launchUrl(
                    Uri.parse(post.sourcePostUrl!),
                    mode: LaunchMode.externalApplication,
                  ),
          ),
        ],
      ),
      body: PageView.builder(
        controller: _pageController,
        itemCount: widget.posts.length,
        onPageChanged: (i) => setState(() => _currentIndex = i),
        itemBuilder: (context, index) => _PostPage(post: widget.posts[index]),
      ),
      bottomNavigationBar: _ViewerBottomBar(post: post),
    );
  }
}

class _PostPage extends StatelessWidget {
  final Post post;

  const _PostPage({required this.post});

  @override
  Widget build(BuildContext context) {
    if (post.fileType == PostFileType.video) {
      return _VideoPlayerWidget(url: post.fileUrl, previewUrl: post.previewUrl);
    }
    return _ZoomableImage(fileUrl: post.fileUrl, previewUrl: post.previewUrl);
  }
}

/// Formata bytes em KB/MB pra exibir progresso e velocidade de carregamento.
String _formatBytes(num bytes) {
  if (bytes < 1024 * 1024) return '${(bytes / 1024).toStringAsFixed(0)} KB';
  return '${(bytes / (1024 * 1024)).toStringAsFixed(1)} MB';
}

class _ZoomableImage extends StatefulWidget {
  final String fileUrl;
  final String previewUrl;

  const _ZoomableImage({required this.fileUrl, required this.previewUrl});

  @override
  State<_ZoomableImage> createState() => _ZoomableImageState();
}

class _ZoomableImageState extends State<_ZoomableImage> {
  final Stopwatch _stopwatch = Stopwatch();

  @override
  void dispose() {
    _stopwatch.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ExtendedImage.network(
      widget.fileUrl,
      fit: BoxFit.contain,
      mode: ExtendedImageMode.gesture,
      initGestureConfigHandler: (state) => GestureConfig(
        minScale: 1,
        maxScale: 5,
        animationMinScale: 0.7,
        animationMaxScale: 6,
        inPageView: true,
      ),
      onDoubleTap: (state) {
        final currentScale = state.gestureDetails?.totalScale ?? 1.0;
        final targetScale = currentScale > 1.1 ? 1.0 : 3.0;
        state.handleDoubleTap(
          scale: targetScale,
          doubleTapPosition: state.pointerDownPosition,
        );
      },
      loadStateChanged: (state) {
        switch (state.extendedImageLoadState) {
          case LoadState.loading:
            state.returnLoadStateChangedWidget = true;
            final progress = state.loadingProgress;
            if (progress != null && !_stopwatch.isRunning) {
              _stopwatch.start();
            }
            double? bytesPerSecond;
            final elapsedSeconds = _stopwatch.elapsedMilliseconds / 1000;
            if (progress != null && elapsedSeconds > 0) {
              bytesPerSecond = progress.cumulativeBytesLoaded / elapsedSeconds;
            }
            return _ImageLoadingPreview(
              previewUrl: widget.previewUrl,
              progress: progress,
              bytesPerSecond: bytesPerSecond,
            );
          case LoadState.failed:
            state.returnLoadStateChangedWidget = true;
            return const Center(
              child: Icon(Icons.broken_image_outlined, color: Colors.white54, size: 48),
            );
          case LoadState.completed:
            _stopwatch
              ..stop()
              ..reset();
            return null;
        }
      },
    );
  }
}

class _ImageLoadingPreview extends StatelessWidget {
  final String previewUrl;
  final ImageChunkEvent? progress;
  final double? bytesPerSecond;

  const _ImageLoadingPreview({
    required this.previewUrl,
    required this.progress,
    required this.bytesPerSecond,
  });

  @override
  Widget build(BuildContext context) {
    final total = progress?.expectedTotalBytes;
    final loaded = progress?.cumulativeBytesLoaded ?? 0;
    final ratio = (total != null && total > 0) ? loaded / total : null;

    return Stack(
      fit: StackFit.expand,
      children: [
        CachedNetworkImage(
          imageUrl: previewUrl,
          fit: BoxFit.contain,
          errorWidget: (context, url, error) => const SizedBox.shrink(),
        ),
        Positioned(
          left: 24,
          right: 24,
          bottom: 32,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: LinearProgressIndicator(
                  value: ratio,
                  minHeight: 4,
                  backgroundColor: Colors.white24,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
              const SizedBox(height: 6),
              Text(
                [
                  if (ratio != null) '${(ratio * 100).toStringAsFixed(0)}%',
                  if (total != null)
                    '${_formatBytes(loaded)} / ${_formatBytes(total)}',
                  if (bytesPerSecond != null && bytesPerSecond! > 0)
                    '${_formatBytes(bytesPerSecond!)}/s',
                ].join(' · '),
                style: const TextStyle(color: Colors.white70, fontSize: 11),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _VideoPlayerWidget extends StatefulWidget {
  final String url;
  final String previewUrl;

  const _VideoPlayerWidget({required this.url, required this.previewUrl});

  @override
  State<_VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<_VideoPlayerWidget> {
  late final VideoPlayerController _controller;
  bool _showControls = true;
  Timer? _hideTimer;
  double _lastVolume = 1;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(Uri.parse(widget.url))
      ..initialize()
          .then((_) {
            if (!mounted) return;
            _controller
              ..setLooping(true)
              ..play();
            _scheduleHide();
          })
          .catchError((Object _) {
            // hasError já fica true no value; o builder mostra o estado de erro.
          });
  }

  @override
  void dispose() {
    _hideTimer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  void _scheduleHide() {
    _hideTimer?.cancel();
    _hideTimer = Timer(const Duration(seconds: 3), () {
      if (mounted && _controller.value.isPlaying) {
        setState(() => _showControls = false);
      }
    });
  }

  void _toggleControls() {
    setState(() => _showControls = !_showControls);
    if (_showControls) _scheduleHide();
  }

  void _togglePlay() {
    if (_controller.value.isPlaying) {
      _controller.pause();
      _hideTimer?.cancel();
    } else {
      _controller.play();
      _scheduleHide();
    }
  }

  void _toggleMute() {
    final currentVolume = _controller.value.volume;
    if (currentVolume > 0) {
      _lastVolume = currentVolume;
      _controller.setVolume(0);
    } else {
      _controller.setVolume(_lastVolume > 0 ? _lastVolume : 1);
    }
    _scheduleHide();
  }

  void _seekRelative(Duration offset) {
    final duration = _controller.value.duration;
    final target = _controller.value.position + offset;
    _controller.seekTo(
      target < Duration.zero
          ? Duration.zero
          : (target > duration ? duration : target),
    );
    _scheduleHide();
  }

  static String _formatDuration(Duration d) {
    final minutes = d.inMinutes;
    final seconds = (d.inSeconds % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<VideoPlayerValue>(
      valueListenable: _controller,
      builder: (context, value, _) {
        if (value.hasError) {
          return const Center(
            child: Icon(Icons.error_outline, color: Colors.white54, size: 48),
          );
        }
        if (!value.isInitialized) {
          return Stack(
            fit: StackFit.expand,
            children: [
              CachedNetworkImage(
                imageUrl: widget.previewUrl,
                fit: BoxFit.contain,
                errorWidget: (context, url, error) => const SizedBox.shrink(),
              ),
              const Center(child: CircularProgressIndicator()),
            ],
          );
        }

        return Stack(
          alignment: Alignment.center,
          children: [
            Positioned.fill(
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: _toggleControls,
                child: Center(
                  child: AspectRatio(
                    aspectRatio: value.aspectRatio,
                    child: VideoPlayer(_controller),
                  ),
                ),
              ),
            ),
            AnimatedOpacity(
              opacity: _showControls ? 1 : 0,
              duration: const Duration(milliseconds: 200),
              child: IgnorePointer(
                ignoring: !_showControls,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          iconSize: 40,
                          color: Colors.white,
                          icon: const Icon(Icons.replay_10),
                          onPressed: () =>
                              _seekRelative(const Duration(seconds: -10)),
                        ),
                        IconButton(
                          iconSize: 64,
                          color: Colors.white,
                          icon: Icon(
                            value.isPlaying
                                ? Icons.pause_circle_filled
                                : Icons.play_circle_filled,
                          ),
                          onPressed: _togglePlay,
                        ),
                        IconButton(
                          iconSize: 40,
                          color: Colors.white,
                          icon: const Icon(Icons.forward_10),
                          onPressed: () =>
                              _seekRelative(const Duration(seconds: 10)),
                        ),
                      ],
                    ),
                    Positioned(
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: Container(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Colors.transparent, Colors.black87],
                          ),
                        ),
                        padding: const EdgeInsets.fromLTRB(12, 24, 12, 4),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              children: [
                                Text(
                                  _formatDuration(value.position),
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: VideoProgressIndicator(
                                    _controller,
                                    allowScrubbing: true,
                                    colors: VideoProgressColors(
                                      playedColor: Theme.of(
                                        context,
                                      ).colorScheme.primary,
                                      bufferedColor: Colors.white38,
                                      backgroundColor: Colors.white12,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  _formatDuration(value.duration),
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                IconButton(
                                  color: Colors.white,
                                  icon: Icon(
                                    value.volume <= 0
                                        ? Icons.volume_off
                                        : value.volume < 0.5
                                        ? Icons.volume_down
                                        : Icons.volume_up,
                                  ),
                                  onPressed: _toggleMute,
                                ),
                                Expanded(
                                  child: SliderTheme(
                                    data: SliderThemeData(
                                      trackHeight: 2,
                                      thumbShape: const RoundSliderThumbShape(
                                        enabledThumbRadius: 6,
                                      ),
                                      overlayShape:
                                          const RoundSliderOverlayShape(
                                            overlayRadius: 12,
                                          ),
                                      activeTrackColor: Theme.of(
                                        context,
                                      ).colorScheme.primary,
                                      inactiveTrackColor: Colors.white24,
                                      thumbColor: Theme.of(
                                        context,
                                      ).colorScheme.primary,
                                    ),
                                    child: Slider(
                                      value: value.volume.clamp(0, 1),
                                      onChanged: (v) {
                                        _controller.setVolume(v);
                                        _scheduleHide();
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class _ViewerBottomBar extends ConsumerStatefulWidget {
  final Post post;

  const _ViewerBottomBar({required this.post});

  @override
  ConsumerState<_ViewerBottomBar> createState() => _ViewerBottomBarState();
}

class _ViewerBottomBarState extends ConsumerState<_ViewerBottomBar> {
  bool _isFavorite = false;
  bool _isDownloading = false;
  bool _favoriteBusy = false;
  double? _downloadProgress;

  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  @override
  void didUpdateWidget(covariant _ViewerBottomBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.post.id != widget.post.id) _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final db = ref.read(appDatabaseProvider);
    final fav = await db.isFavorite(widget.post.sourceId, widget.post.id);
    if (mounted) setState(() => _isFavorite = fav);
  }

  Future<void> _toggleFavorite() async {
    // Guarda contra toque duplo rápido: sem isso, dois adds concorrentes
    // inserem o mesmo post duas vezes (a tabela não tem unique constraint).
    if (_favoriteBusy) return;
    _favoriteBusy = true;
    try {
      final db = ref.read(appDatabaseProvider);
      if (_isFavorite) {
        await db.removeFavorite(widget.post.sourceId, widget.post.id);
      } else {
        await db.addFavorite(widget.post.toFavoritesCompanion());
      }
      if (mounted) setState(() => _isFavorite = !_isFavorite);
    } finally {
      _favoriteBusy = false;
    }
  }

  Future<void> _download() async {
    final l10n = AppLocalizations.of(context)!;
    setState(() {
      _isDownloading = true;
      _downloadProgress = null;
    });
    final messenger = ScaffoldMessenger.of(context);
    File? tempFile;
    try {
      final hasAccess = await Gal.requestAccess();
      if (!hasAccess) {
        messenger.showSnackBar(
          SnackBar(content: Text(l10n.viewerPermissionDenied)),
        );
        return;
      }

      // Extensão extraída do path da URL (não da URL inteira) pra não
      // arrastar query string pro nome do arquivo.
      final tempDir = await getTemporaryDirectory();
      final urlPath = Uri.parse(widget.post.fileUrl).path;
      final isVideo = widget.post.fileType == PostFileType.video;
      final extension = urlPath.contains('.')
          ? urlPath.split('.').last
          : (isVideo ? 'mp4' : 'jpg');
      tempFile = File('${tempDir.path}/orizon_${widget.post.id}.$extension');

      // Baixa direto pro disco em vez de bufferizar tudo na memória, o que
      // também dá acesso ao progresso real via onReceiveProgress.
      await Dio().download(
        widget.post.fileUrl,
        tempFile.path,
        onReceiveProgress: (received, total) {
          if (total > 0 && mounted) {
            setState(() => _downloadProgress = received / total);
          }
        },
      );

      if (isVideo) {
        await Gal.putVideo(tempFile.path);
      } else {
        await Gal.putImage(tempFile.path);
      }

      final db = ref.read(appDatabaseProvider);
      await db.addDownloadRecord(
        DownloadHistoryEntriesCompanion.insert(
          postId: widget.post.id,
          sourceId: widget.post.sourceId,
          fileUrl: widget.post.fileUrl,
          localPath: 'galeria do dispositivo',
        ),
      );

      messenger.showSnackBar(SnackBar(content: Text(l10n.viewerSaved)));
    } catch (e) {
      messenger.showSnackBar(
        SnackBar(content: Text(l10n.viewerDownloadError(e.toString()))),
      );
    } finally {
      if (tempFile != null && tempFile.existsSync()) {
        await tempFile.delete();
      }
      if (mounted) {
        setState(() {
          _isDownloading = false;
          _downloadProgress = null;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.black87,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            icon: Icon(
              _isFavorite ? Icons.favorite : Icons.favorite_border,
              color: _isFavorite ? Colors.redAccent : Colors.white,
            ),
            onPressed: _toggleFavorite,
          ),
          IconButton(
            icon: _isDownloading
                ? SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      value: _downloadProgress,
                      color: Colors.white,
                    ),
                  )
                : const Icon(Icons.download, color: Colors.white),
            onPressed: _isDownloading ? null : _download,
          ),
          IconButton(
            icon: const Icon(Icons.sell_outlined, color: Colors.white),
            onPressed: () => _showTags(context),
          ),
        ],
      ),
    );
  }

  void _showTags(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (sheetContext) => DraggableScrollableSheet(
        initialChildSize: 0.5,
        minChildSize: 0.25,
        maxChildSize: 0.9,
        expand: false,
        builder: (sheetContext, scrollController) => SingleChildScrollView(
          controller: scrollController,
          padding: const EdgeInsets.all(16),
          child: Wrap(
            spacing: 8,
            runSpacing: 8,
            children: widget.post.tags
                .map(
                  (tag) => InputChip(
                    label: Text(tag),
                    tooltip: l10n.viewerTagSearchTooltip,
                    onPressed: () => _searchTagInNewSession(sheetContext, tag),
                    deleteIcon: const Icon(Icons.add, size: 18),
                    deleteButtonTooltipMessage: l10n.viewerTagAddTooltip,
                    onDeleted: () => _addTagToCurrentSession(tag),
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }

  void _searchTagInNewSession(BuildContext sheetContext, String tag) {
    ref.read(activeSearchTagsProvider.notifier).state = [tag];
    Navigator.of(sheetContext).popUntil((route) => route.isFirst);
    GoRouter.of(sheetContext).go('/search');
  }

  void _addTagToCurrentSession(String tag) {
    final l10n = AppLocalizations.of(context)!;
    final current = ref.read(activeSearchTagsProvider);
    if (!current.contains(tag)) {
      ref.read(activeSearchTagsProvider.notifier).state = [...current, tag];
    }
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(l10n.viewerTagAdded(tag))));
  }
}

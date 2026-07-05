import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gal/gal.dart';
import 'package:path_provider/path_provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:video_player/video_player.dart';

import '../../core/providers.dart';
import '../../data/booru/models/post.dart';
import '../../data/db/database.dart';
import '../../data/db/mappers.dart';
import '../../l10n/app_localizations.dart';

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
      return _VideoPlayerWidget(url: post.fileUrl);
    }
    return ExtendedImage.network(
      post.fileUrl,
      fit: BoxFit.contain,
      mode: ExtendedImageMode.gesture,
      initGestureConfigHandler: (state) => GestureConfig(
        minScale: 1,
        maxScale: 5,
        inPageView: true,
      ),
    );
  }
}

class _VideoPlayerWidget extends StatefulWidget {
  final String url;

  const _VideoPlayerWidget({required this.url});

  @override
  State<_VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<_VideoPlayerWidget> {
  late final VideoPlayerController _controller;
  bool _showControls = true;
  Timer? _hideTimer;

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
    _controller.setVolume(_controller.value.volume > 0 ? 0 : 1);
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
          return const Center(child: CircularProgressIndicator());
        }

        return GestureDetector(
          onTap: _toggleControls,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Center(
                child: AspectRatio(
                  aspectRatio: value.aspectRatio,
                  child: VideoPlayer(_controller),
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
                          padding: const EdgeInsets.fromLTRB(12, 24, 12, 8),
                          child: Row(
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
                                    playedColor:
                                        Theme.of(context).colorScheme.primary,
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
                              IconButton(
                                color: Colors.white,
                                icon: Icon(
                                  value.volume > 0
                                      ? Icons.volume_up
                                      : Icons.volume_off,
                                ),
                                onPressed: _toggleMute,
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
          ),
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
    setState(() => _isDownloading = true);
    final messenger = ScaffoldMessenger.of(context);
    try {
      final hasAccess = await Gal.requestAccess();
      if (!hasAccess) {
        messenger.showSnackBar(
          SnackBar(content: Text(l10n.viewerPermissionDenied)),
        );
        return;
      }
      final response = await Dio().get<List<int>>(
        widget.post.fileUrl,
        options: Options(responseType: ResponseType.bytes),
      );
      final bytes = response.data;
      if (bytes == null) throw Exception('download vazio');

      if (widget.post.fileType == PostFileType.video) {
        // Gal só salva vídeo a partir de um caminho de arquivo, não bytes.
        // Extensão extraída do path da URL (não da URL inteira) pra não
        // arrastar query string pro nome do arquivo.
        final tempDir = await getTemporaryDirectory();
        final urlPath = Uri.parse(widget.post.fileUrl).path;
        final extension = urlPath.contains('.')
            ? urlPath.split('.').last
            : 'mp4';
        final tempFile = File(
          '${tempDir.path}/orizon_${widget.post.id}.$extension',
        );
        await tempFile.writeAsBytes(bytes);
        await Gal.putVideo(tempFile.path);
        await tempFile.delete();
      } else {
        await Gal.putImageBytes(
          Uint8List.fromList(bytes),
          name: 'orizon_${widget.post.id}',
        );
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
      if (mounted) setState(() => _isDownloading = false);
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
                ? const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(strokeWidth: 2),
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
    showModalBottomSheet(
      context: context,
      builder: (context) => Padding(
        padding: const EdgeInsets.all(16),
        child: Wrap(
          spacing: 8,
          runSpacing: 8,
          children: widget.post.tags
              .map((tag) => Chip(label: Text(tag)))
              .toList(),
        ),
      ),
    );
  }
}

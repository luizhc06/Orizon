import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../core/providers.dart';
import '../../data/db/database.dart';
import '../../data/db/mappers.dart';
import '../../l10n/app_localizations.dart';
import '../settings/settings_providers.dart';
import '../viewer/viewer_screen.dart';

final favoritesStreamProvider = StreamProvider<List<Favorite>>((ref) {
  return ref.watch(appDatabaseProvider).watchFavorites();
});

class FavoritesScreen extends ConsumerWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final favoritesAsync = ref.watch(favoritesStreamProvider);

    return Scaffold(
      appBar: AppBar(title: Text(l10n.favoritesTitle)),
      body: favoritesAsync.when(
        data: (favorites) {
          if (favorites.isEmpty) {
            return Center(child: Text(l10n.favoritesEmpty));
          }
          final posts = favorites.map((f) => f.toPost()).toList();
          final gridColumns = ref.watch(gridColumnsProvider);
          return MasonryGridView.count(
            crossAxisCount: gridColumns,
            mainAxisSpacing: 4,
            crossAxisSpacing: 4,
            padding: const EdgeInsets.all(4),
            itemCount: posts.length,
            itemBuilder: (context, index) {
              final favorite = favorites[index];
              final post = posts[index];
              return GestureDetector(
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) =>
                        ViewerScreen(posts: posts, initialIndex: index),
                  ),
                ),
                onLongPress: () => ref
                    .read(appDatabaseProvider)
                    .removeFavorite(favorite.sourceId, favorite.postId),
                child: AspectRatio(
                  aspectRatio: post.aspectRatio == 0 ? 1 : post.aspectRatio,
                  child: CachedNetworkImage(
                    imageUrl: post.previewUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, _) => Center(child: Text(l10n.errorGeneric(err.toString()))),
      ),
    );
  }
}

import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_app/core/constants.dart';
import 'package:movies_app/core/utils/app_router.dart';
import 'package:movies_app/features/home/data/models/movie_model.dart';
import 'package:shimmer/shimmer.dart';

class GridViewItem extends StatelessWidget {
  const GridViewItem({super.key, required this.movie});
  final MovieModel movie;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(AppRouter.kMovieDetailesView, extra: movie.id);
      },
      child: FadeInUp(
        from: 20,
        duration: const Duration(milliseconds: 500),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(4.0)),
          child: CachedNetworkImage(
            imageUrl: imageUrl(movie.backdropPath ?? movie.posterPath ?? ''),
            placeholder: (context, url) => Shimmer.fromColors(
              baseColor: Colors.grey[850]!,
              highlightColor: Colors.grey[800]!,
              child: Container(
                height: 170.0,
                width: 120.0,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            errorWidget: (context, url, error) => const Icon(Icons.error),
            height: 180.0,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/core/constants.dart';
import 'package:shimmer/shimmer.dart';

class MovieListImage extends StatelessWidget {
  const MovieListImage({super.key, this.ontap, required this.url});
  final void Function()? ontap;
  final String url;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: FadeIn(
        duration: const Duration(milliseconds: 500),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: SizedBox(
            height: 120,
            child: AspectRatio(
              aspectRatio: 2.8 / 4,
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl: imageUrl(url),
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
                errorWidget: (context, url, error) => const Icon(
                  Icons.error,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/core/constants.dart';

class AppBarBackGround extends StatelessWidget {
  const AppBarBackGround({super.key, required this.url});
  final String url;
  @override
  Widget build(BuildContext context) {
    return FadeIn(
      duration: const Duration(milliseconds: 500),
      child: ShaderMask(
        shaderCallback: (rect) {
          return const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              // fromLTRB
              kBackgroundColor,
              Colors.transparent,
              Colors.transparent,
              Colors.transparent,
            ],
            stops: [0, 0.7, 0, 0],
          ).createShader(
            Rect.fromLTRB(0, 0, rect.width, rect.height),
          );
        },
        blendMode: BlendMode.darken,
        child: CachedNetworkImage(
          width: MediaQuery.of(context).size.width,
          imageUrl: imageUrl(url),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

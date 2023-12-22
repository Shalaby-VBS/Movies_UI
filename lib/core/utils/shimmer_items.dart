import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

Shimmer shimmerItem(double height) {
  return Shimmer.fromColors(
    baseColor: Colors.grey[850]!,
    highlightColor: Colors.grey[800]!,
    child: SizedBox(
      height: height,
      child: AspectRatio(
        aspectRatio: 2.8 / 4,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ),
    ),
  );
}

Widget listViewShimmer() {
  return Row(
    children: [
      const SizedBox(width: 10),
      shimmerItem(120),
      const SizedBox(width: 10),
      shimmerItem(120),
      const SizedBox(width: 10),
      shimmerItem(120),
      const SizedBox(width: 10),
      shimmerItem(120),
    ],
  );
}

Widget sliderShemmer() {
  return Padding(
    padding: const EdgeInsets.all(10),
    child: shimmerItem(380),
  );
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/core/utils/app_router.dart';
import 'package:movies_app/features/home/presentation/views/widgets/popular_movies_listView.dart';

class PopularMoviesSection extends StatelessWidget {
  const PopularMoviesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Popular",
                style: GoogleFonts.poppins(
                  fontSize: 19,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.15,
                ),
              ),
              GestureDetector(
                onTap: () {
                  context.push(AppRouter.kPopularSeeMoreListView);
                },
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text('See More '),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 16.0,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        const PopularMoviesListView(),
      ],
    );
  }
}

import 'package:movies_app/features/home/presentation/views/widgets/popular_movies_section.dart';
import 'package:movies_app/features/home/presentation/views/widgets/slider.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/features/home/presentation/views/widgets/topRated_movies_Section.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              MoviesSlider(),
              PopularMoviesSection(),
              TopRatedMoviesSection(),
              SizedBox(
                height: 16,
              )
            ],
          ),
        ),
      ),
    );
  }
}

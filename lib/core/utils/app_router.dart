import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_app/core/utils/service_locator.dart';
import 'package:movies_app/features/home/data/repos/home_repo_impl.dart';
import 'package:movies_app/features/home/presentation/manager/movie_detailes_cubit/movie_detailes_cubit.dart';
import 'package:movies_app/features/home/presentation/manager/popular_cubit/popular_cubit.dart';
import 'package:movies_app/features/home/presentation/manager/recommendations_cubit/recommendatins_cubit.dart';
import 'package:movies_app/features/home/presentation/manager/top_rated_cubit/top_rated_cubit.dart';
import 'package:movies_app/features/home/presentation/views/home_view.dart';
import 'package:movies_app/features/home/presentation/views/movie_detailes_view.dart';
import 'package:movies_app/features/home/presentation/views/widgets/popular_seeMore_listview.dart';
import 'package:movies_app/features/home/presentation/views/widgets/topRated_seeMore_listview.dart';
import 'package:movies_app/features/splash/presentation/views/splash_view.dart';

abstract class AppRouter {
  static const kHomeView = '/homeView';
  static const kMovieDetailesView = '/movieDetailesView';
  static const kPopularSeeMoreListView = '/popularSeeMoreListView';
  static const kTopRatedSeeMoreListView = '/topRatedSeeMoreListView';
  static const kTest = '/kTest';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kHomeView,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: kMovieDetailesView,
        builder: (context, state) => MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => MovieDetailesCubit(
                getIt.get<HomeRepoImpl>(),
              )..fetchMovieDetails(state.extra as int),
            ),
            BlocProvider(
              create: (context) => RecommendatinsCubit(
                getIt.get<HomeRepoImpl>(),
              )..fetchRecommendations(state.extra as int),
            ),
          ],
          child: const MovieDetailesView(),
        ),
      ),
      GoRoute(
        path: kPopularSeeMoreListView,
        builder: (context, state) => BlocProvider(
          create: (context) => PopularCubitCubit(
            getIt.get<HomeRepoImpl>(),
          )..fetchPopularMovies(),
          child: const PopularSeeMoreListView(),
        ),
      ),
      GoRoute(
        path: kTopRatedSeeMoreListView,
        builder: (context, state) => BlocProvider(
          create: (context) => TopRatedCubit(
            getIt.get<HomeRepoImpl>(),
          )..fetchTopRatedMovies(),
          child: const TopRatedSeeMoreListView(),
        ),
      ),
    ],
  );
}

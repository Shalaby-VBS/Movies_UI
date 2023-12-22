import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/constants.dart';
import 'package:movies_app/core/utils/app_router.dart';
import 'package:movies_app/core/utils/service_locator.dart';
import 'package:movies_app/core/utils/simple_bloc_observer.dart';
import 'package:movies_app/features/home/data/repos/home_repo_impl.dart';
import 'package:movies_app/features/home/presentation/manager/now_playing_cubit/now_playing_cubit.dart';
import 'package:movies_app/features/home/presentation/manager/popular_cubit/popular_cubit.dart';
import 'package:movies_app/features/home/presentation/manager/top_rated_cubit/top_rated_cubit.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, // status bar color
  ));
  setupServiceLocator();
  runApp(const MoviesApp());
}

class MoviesApp extends StatelessWidget {
  const MoviesApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NowPlayingCubit(
            getIt.get<HomeRepoImpl>(),
          )..fetchNowPlaying(),
        ),
        BlocProvider(
          create: (context) => PopularCubitCubit(
            getIt.get<HomeRepoImpl>(),
          )..fetchPopularMovies(),
        ),
        BlocProvider(
          create: (context) => TopRatedCubit(
            getIt.get<HomeRepoImpl>(),
          )..fetchTopRatedMovies(),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kBackgroundColor,
        ),
      ),
    );
  }
}

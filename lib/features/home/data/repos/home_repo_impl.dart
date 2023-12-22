import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movies_app/core/errors/failure.dart';
import 'package:movies_app/core/utils/api_services.dart';
import 'package:movies_app/features/home/data/models/movie_detailes_model/movie/movie.detailes.model.dart';
import 'package:movies_app/features/home/data/models/movie_model.dart';
import 'package:movies_app/features/home/data/repos/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService apiService;
  HomeRepoImpl(this.apiService);
  @override
  Future<Either<Failure, List<MovieModel>>> fetchNowPlaying() async {
    try {
      var data = await apiService.get(endPoint: 'now_playing');
      List<MovieModel> movies = [];
      for (var item in data['results']) {
        try {
          movies.add(MovieModel.fromJson(item));
        } catch (e) {
          movies.add(MovieModel.fromJson(item));
        }
      }

      return right(movies);
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerFailure.fromDioError(e),
        );
      }
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<MovieModel>>> fetchPopularMovies() async {
    try {
      var data = await apiService.get(endPoint: 'popular');
      List<MovieModel> movies = [];
      for (var item in data['results']) {
        try {
          movies.add(MovieModel.fromJson(item));
        } catch (e) {
          movies.add(MovieModel.fromJson(item));
        }
      }

      return right(movies);
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerFailure.fromDioError(e),
        );
      }
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<MovieModel>>> fetchTopRatedMovies() async {
    try {
      var data = await apiService.get(endPoint: 'top_rated');
      List<MovieModel> movies = [];
      for (var item in data['results']) {
        try {
          movies.add(MovieModel.fromJson(item));
        } catch (e) {
          movies.add(MovieModel.fromJson(item));
        }
      }

      return right(movies);
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerFailure.fromDioError(e),
        );
      }
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, MovieDetailesModel>> fetchMovieDetails(
      int movieId) async {
    try {
      var data = await apiService.get(endPoint: '$movieId');
      MovieDetailesModel movie = MovieDetailesModel.fromJson(data);

      return right(movie);
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerFailure.fromDioError(e),
        );
      }
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<MovieModel>>> fetchRecommendations(
      int movieId) async {
    try {
      var data = await apiService.get(endPoint: '$movieId/recommendations');
      List<MovieModel> movies = [];
      for (var item in data['results']) {
        try {
          movies.add(MovieModel.fromJson(item));
        } catch (e) {
          movies.add(MovieModel.fromJson(item));
        }
      }

      return right(movies);
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerFailure.fromDioError(e),
        );
      }
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }
}

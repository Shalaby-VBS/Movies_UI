import 'package:dartz/dartz.dart';
import 'package:movies_app/core/errors/failure.dart';
import 'package:movies_app/features/home/data/models/movie_detailes_model/movie/movie.detailes.model.dart';
import 'package:movies_app/features/home/data/models/movie_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<MovieModel>>> fetchNowPlaying();
  Future<Either<Failure, List<MovieModel>>> fetchPopularMovies();
  Future<Either<Failure, List<MovieModel>>> fetchTopRatedMovies();
  Future<Either<Failure, MovieDetailesModel>> fetchMovieDetails(int movieId);
  Future<Either<Failure, List<MovieModel>>> fetchRecommendations(int movieId);
}

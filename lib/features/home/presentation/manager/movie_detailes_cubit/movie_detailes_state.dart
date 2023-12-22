part of 'movie_detailes_cubit.dart';

@immutable
sealed class MovieDetailesState {}

final class MovieDetailesInitial extends MovieDetailesState {}

final class MovieDetailesSuccess extends MovieDetailesState {
  final MovieDetailesModel movie;

  MovieDetailesSuccess({required this.movie});
}

final class MovieDetailesFailure extends MovieDetailesState {
  final String errMassage;

  MovieDetailesFailure({required this.errMassage});
}

final class MovieDetailesLoading extends MovieDetailesState {}

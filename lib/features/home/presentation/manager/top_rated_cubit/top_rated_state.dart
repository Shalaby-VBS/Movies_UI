part of 'top_rated_cubit.dart';

@immutable
sealed class TopRatedState {}

final class TopRatedInitial extends TopRatedState {}

final class TopRatedLoading extends TopRatedState {}

final class TopRatedSuccess extends TopRatedState {
  final List<MovieModel> moviesList;

  TopRatedSuccess({required this.moviesList});
}

final class TopRatedFailure extends TopRatedState {
  final String errMassage;

  TopRatedFailure({required this.errMassage});
}

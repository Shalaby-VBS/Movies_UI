part of 'recommendatins_cubit.dart';

@immutable
sealed class RecommendatinsState {}

final class RecommendatinsInitial extends RecommendatinsState {}

final class RecommendatinsLoading extends RecommendatinsState {}

final class RecommendatinsSuccess extends RecommendatinsState {
  final List<MovieModel> moviesList;
  RecommendatinsSuccess({required this.moviesList});
}

final class RecommendatinsFailure extends RecommendatinsState {
  final String errMassage;

  RecommendatinsFailure({required this.errMassage});
}

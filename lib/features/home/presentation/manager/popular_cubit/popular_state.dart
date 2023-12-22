part of 'popular_cubit.dart';

@immutable
sealed class PopularCubitState {}

final class PopularInitial extends PopularCubitState {}

final class PopularLoading extends PopularCubitState {}

final class PopularSuccess extends PopularCubitState {
  final List<MovieModel> moviesList;

  PopularSuccess({required this.moviesList});
}

final class PopularFailure extends PopularCubitState {
  final String errMassage;

  PopularFailure({required this.errMassage});
}

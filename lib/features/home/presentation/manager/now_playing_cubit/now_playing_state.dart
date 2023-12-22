part of 'now_playing_cubit.dart';

@immutable
sealed class NowPlayingState {}

final class NowPlayingInitial extends NowPlayingState {}

final class NowPlayingLoading extends NowPlayingState {}

final class NowPlayingFailure extends NowPlayingState {
  final String errMassage;

  NowPlayingFailure({required this.errMassage});
}

final class NowPlayingSuccess extends NowPlayingState {
  final List<MovieModel> moviesList;

  NowPlayingSuccess({required this.moviesList});
}

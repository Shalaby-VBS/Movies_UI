import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movies_app/features/home/data/models/movie_model.dart';
import 'package:movies_app/features/home/data/repos/home_repo.dart';

part 'now_playing_state.dart';

class NowPlayingCubit extends Cubit<NowPlayingState> {
  NowPlayingCubit(this.homeRepo) : super(NowPlayingInitial());
  final HomeRepo homeRepo;

  Future<void> fetchNowPlaying() async {
    emit(NowPlayingLoading());
    var result = await homeRepo.fetchNowPlaying();
    result.fold((failure) {
      emit(NowPlayingFailure(errMassage: failure.errMessage));
    }, (movies) {
      emit(NowPlayingSuccess(moviesList: movies));
    });
  }
}

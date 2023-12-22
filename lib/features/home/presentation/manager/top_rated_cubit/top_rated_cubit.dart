import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movies_app/features/home/data/models/movie_model.dart';
import 'package:movies_app/features/home/data/repos/home_repo.dart';

part 'top_rated_state.dart';

class TopRatedCubit extends Cubit<TopRatedState> {
  TopRatedCubit(this.homeRepo) : super(TopRatedInitial());
  final HomeRepo homeRepo;

  Future<void> fetchTopRatedMovies() async {
    emit(TopRatedLoading());
    var result = await homeRepo.fetchTopRatedMovies();
    result.fold((failure) {
      emit(TopRatedFailure(errMassage: failure.errMessage));
    }, (movies) {
      emit(TopRatedSuccess(moviesList: movies));
    });
  }
}

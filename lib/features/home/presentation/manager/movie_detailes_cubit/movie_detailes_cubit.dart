import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movies_app/features/home/data/models/movie_detailes_model/movie/movie.detailes.model.dart';
import 'package:movies_app/features/home/data/repos/home_repo.dart';

part 'movie_detailes_state.dart';

class MovieDetailesCubit extends Cubit<MovieDetailesState> {
  MovieDetailesCubit(this.homeRepo) : super(MovieDetailesInitial());

  final HomeRepo homeRepo;

  Future<void> fetchMovieDetails(int id) async {
    emit(MovieDetailesLoading());
    var result = await homeRepo.fetchMovieDetails(id);
    result.fold((failure) {
      emit(MovieDetailesFailure(errMassage: failure.errMessage));
    }, (movie) {
      emit(MovieDetailesSuccess(movie: movie));
    });
  }
}

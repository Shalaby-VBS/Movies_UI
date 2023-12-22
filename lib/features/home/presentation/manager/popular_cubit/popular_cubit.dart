import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movies_app/features/home/data/models/movie_model.dart';
import 'package:movies_app/features/home/data/repos/home_repo.dart';

part 'popular_state.dart';

class PopularCubitCubit extends Cubit<PopularCubitState> {
  PopularCubitCubit(this.homeRepo) : super(PopularInitial());

  final HomeRepo homeRepo;

  Future<void> fetchPopularMovies() async {
    emit(PopularLoading());
    var result = await homeRepo.fetchPopularMovies();
    result.fold((failure) {
      emit(PopularFailure(errMassage: failure.errMessage));
    }, (movies) {
      emit(PopularSuccess(moviesList: movies));
    });
  }
}

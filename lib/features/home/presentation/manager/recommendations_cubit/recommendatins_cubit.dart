import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movies_app/features/home/data/models/movie_model.dart';
import 'package:movies_app/features/home/data/repos/home_repo.dart';

part 'recommendatins_state.dart';

class RecommendatinsCubit extends Cubit<RecommendatinsState> {
  RecommendatinsCubit(this.homeRepo) : super(RecommendatinsInitial());

  final HomeRepo homeRepo;

  Future<void> fetchRecommendations(int id) async {
    emit(RecommendatinsLoading());
    var result = await homeRepo.fetchRecommendations(id);
    result.fold((failure) {
      emit(RecommendatinsFailure(errMassage: failure.errMessage));
    }, (movies) {
      emit(RecommendatinsSuccess(moviesList: movies));
    });
  }
}

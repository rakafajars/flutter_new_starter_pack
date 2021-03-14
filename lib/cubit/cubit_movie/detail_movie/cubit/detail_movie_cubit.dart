import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_new_starter_pack/model/m_movie/m_detail_movie.dart';
import 'package:flutter_new_starter_pack/network/api_repository.dart';
import 'package:flutter_new_starter_pack/network/api_service.dart';
import 'package:meta/meta.dart';
part 'detail_movie_state.dart';

class DetailMovieCubit extends Cubit<DetailMovieState> {
  DetailMovieCubit() : super(DetailMovieInitial());

  Repository _repository = ApiService();
  ModelDetailMovie modelDetailMovie;

  Future<void> getDetailMovie({
    @required String idMovie,
  }) async {
    try {
      emit(
        DetailMovieInitial(),
      );

      modelDetailMovie = await _repository.readDetailMovie(
        idMovie: idMovie,
      );

      emit(
        DetailMovieSuccess(
          modelDetailMovie: modelDetailMovie,
        ),
      );
    } catch (e) {
      emit(
        DetailMovieFailure(message: "$e"),
      );
    }
  }
}

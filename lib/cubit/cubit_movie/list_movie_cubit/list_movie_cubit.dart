import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_new_starter_pack/model/m_movie/m_list_movie.dart';
import 'package:flutter_new_starter_pack/network/api_repository.dart';
import 'package:flutter_new_starter_pack/network/api_service.dart';
import 'package:meta/meta.dart';

part 'list_movie_state.dart';

class ListMovieCubit extends Cubit<ListMovieState> {
  ListMovieCubit() : super(ListMovieInitial());

  Repository _repository = ApiService();
  ModelListMovie modelListMovie;

  Future<void> getListMovie() async {
    try {
      emit(
        ListMovieInitial(),
      );

      modelListMovie = await _repository.readListMovie();

      emit(
        ListMovieSuccess(
          modelListMovie: modelListMovie,
        ),
      );
    } catch (e) {
      emit(
        ListMovieFailure(message: "$e"),
      );
    }
  }
}

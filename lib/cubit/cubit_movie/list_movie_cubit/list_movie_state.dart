part of 'list_movie_cubit.dart';

abstract class ListMovieState extends Equatable {
  const ListMovieState();

  @override
  List<Object> get props => [];
}

class ListMovieInitial extends ListMovieState {}

class ListMovieSuccess extends ListMovieState {
  final ModelListMovie modelListMovie;

  ListMovieSuccess({
    @required this.modelListMovie,
  });

  @override
  List<Object> get props => [modelListMovie];
}

class ListMovieFailure extends ListMovieState {
  final String message;

  ListMovieFailure({
    @required this.message,
  });

  @override
  List<Object> get props => [message];
}

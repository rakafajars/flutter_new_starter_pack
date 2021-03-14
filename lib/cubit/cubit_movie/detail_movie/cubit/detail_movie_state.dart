part of 'detail_movie_cubit.dart';

abstract class DetailMovieState extends Equatable {
  const DetailMovieState();

  @override
  List<Object> get props => [];
}

class DetailMovieInitial extends DetailMovieState {}

class DetailMovieSuccess extends DetailMovieState {
  final ModelDetailMovie modelDetailMovie;

  DetailMovieSuccess({
    @required this.modelDetailMovie,
  });

  @override
  List<Object> get props => [modelDetailMovie];
}

class DetailMovieFailure extends DetailMovieState {
  final String message;

  DetailMovieFailure({
    @required this.message,
  });
  @override
  List<Object> get props => [message];
}

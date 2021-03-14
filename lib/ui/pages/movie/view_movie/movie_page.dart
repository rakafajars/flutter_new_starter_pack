import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_new_starter_pack/cubit/cubit_movie/detail_movie/cubit/detail_movie_cubit.dart';
import 'package:flutter_new_starter_pack/ui/pages/movie/movie.dart';
import 'package:flutter_new_starter_pack/ui/pages/movie/view_movie/movie_argument.dart';
import 'package:flutter_new_starter_pack/ui/pages/movie/view_movie/movie_detail.dart';

import 'movie_view.dart';

class MoviePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ListMovieCubit>(
      create: (context) => ListMovieCubit()..getListMovie(),
      child: MovieView(),
    );
  }
}

class MovieDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final MovieArguments arg = ModalRoute.of(context).settings.arguments;
    return BlocProvider<DetailMovieCubit>(
      create: (context) => DetailMovieCubit()
        ..getDetailMovie(
          idMovie: arg.idMovie,
        ),
      child: MovieDetailView(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_new_starter_pack/ui/pages/movie/movie.dart';

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

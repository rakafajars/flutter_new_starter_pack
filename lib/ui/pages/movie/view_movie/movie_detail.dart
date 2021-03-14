import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_new_starter_pack/cubit/cubit_movie/detail_movie/cubit/detail_movie_cubit.dart';
import 'package:flutter_new_starter_pack/theme/theme_text.dart';
import 'package:relative_scale/relative_scale.dart';

class MovieDetailView extends StatefulWidget {
  @override
  _MovieDetailViewState createState() => _MovieDetailViewState();
}

class _MovieDetailViewState extends State<MovieDetailView> {
  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Detail Movie',
            ),
          ),
          body: BlocBuilder<DetailMovieCubit, DetailMovieState>(
            builder: (context, state) {
              if (state is DetailMovieInitial) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is DetailMovieSuccess) {
                return Card(
                  elevation: 1.5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    verticalDirection: VerticalDirection.down,
                    children: [
                      Text(
                        state.modelDetailMovie.originalTitle,
                      ),
                      Text(
                        state.modelDetailMovie.overview,
                      ),
                    ],
                  ),
                );
              }
              if (state is DetailMovieFailure) {
                return Center(
                  child: Text(
                    state.message,
                    style: textFontWeight700,
                  ),
                );
              }
              return Container();
            },
          ),
        );
      },
    );
  }
}

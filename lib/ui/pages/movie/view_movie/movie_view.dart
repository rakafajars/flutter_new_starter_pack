import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_new_starter_pack/config/route_name.dart';
import 'package:flutter_new_starter_pack/theme/theme_text.dart';
import 'package:flutter_new_starter_pack/ui/pages/movie/movie.dart';
import 'package:flutter_new_starter_pack/ui/pages/movie/view_movie/movie_argument.dart';
import 'package:relative_scale/relative_scale.dart';

class MovieView extends StatefulWidget {
  @override
  _MovieViewState createState() => _MovieViewState();
}

class _MovieViewState extends State<MovieView> {
  // Refresh
  Completer<void> _refreshCompleter;

  // Cubit
  ListMovieCubit _listMovieCubit;

  @override
  void initState() {
    _refreshCompleter = Completer<void>();
    // Fungsi BlocProvider disini agar bisa melakukan refresh
    _listMovieCubit = BlocProvider.of<ListMovieCubit>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              "Movie Listing",
            ),
          ),
          body: BlocListener<ListMovieCubit, ListMovieState>(
            listener: (context, state) {
              if (state is ListMovieInitial) {
                _refreshCompleter?.complete();
                _refreshCompleter = Completer();
              }
            },
            child: BlocBuilder<ListMovieCubit, ListMovieState>(
              builder: (context, state) {
                if (state is ListMovieInitial) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is ListMovieSuccess) {
                  return RefreshIndicator(
                    onRefresh: () {
                      _listMovieCubit..getListMovie();
                      return _refreshCompleter.future;
                    },
                    child: ListView.builder(
                      itemCount: state.modelListMovie.results.length,
                      padding: EdgeInsets.all(
                        sy(8.0),
                      ),
                      itemBuilder: (context, int index) {
                        return InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              RouteName.detailMovie,
                              arguments: MovieArguments(
                                idMovie: state.modelListMovie.results[index].id
                                    .toString(),
                              ),
                            );
                          },
                          child: Card(
                            elevation: 4,
                            child: Padding(
                              padding: EdgeInsets.all(
                                sy(8.0),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    width: sy(150),
                                    height: sy(200),
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: NetworkImage(
                                          'https://cnet4.cbsistatic.com/img/j7SdHs9Ac8coHkwTOcJG1DYcQI4=/940x0/2019/04/19/f20d0d6a-1781-49a4-90ab-e285109b65b2/avengers-endgame-imax-poster-crop.png',
                                        ),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: sy(4),
                                  ),
                                  Expanded(
                                    child: Container(
                                      height: sy(200),
                                      child: Column(
                                        children: [
                                          Text(
                                            state.modelListMovie.results[index]
                                                .title,
                                            style: TextStyle(fontSize: 14),
                                          ),
                                          SizedBox(
                                            height: 8,
                                          ),
                                          Expanded(
                                            child: Container(
                                              child: Text(
                                                // 6
                                                state.modelListMovie
                                                    .results[index].overview,
                                                style: TextStyle(fontSize: 12),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                }
                if (state is ListMovieFailure) {
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
          ),
        );
      },
    );
  }
}

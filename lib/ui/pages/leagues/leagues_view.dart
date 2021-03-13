import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_new_starter_pack/bloc/bloc_leagues/list_leagues_bloc/list_leagues_bloc.dart';
import 'package:flutter_new_starter_pack/config/route_name.dart';
import 'package:flutter_new_starter_pack/theme/theme_text.dart';
import 'package:flutter_new_starter_pack/ui/widget/custome_page.dart';
import 'package:relative_scale/relative_scale.dart';

class LeaguesView extends StatefulWidget {
  @override
  _LeaguesViewState createState() => _LeaguesViewState();
}

class _LeaguesViewState extends State<LeaguesView> {
  // Refresh
  Completer<void> _refreshCompleter;

  // BLOC
  ListLeaguesBloc _listLeaguesBloc;

  @override
  void initState() {
    super.initState();
    _listLeaguesBloc = BlocProvider.of<ListLeaguesBloc>(context);
    _refreshCompleter = Completer<void>();
  }

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        return CustomePage(
          scaffold: Scaffold(
            appBar: AppBar(
              title: Text('Leagues List'),
            ),
            body: BlocListener<ListLeaguesBloc, ListLeaguesState>(
              listener: (context, state) {
                if (state is ListLeaguesInitial) {
                  _refreshCompleter?.complete();
                  _refreshCompleter = Completer();
                }
              },
              child: BlocBuilder<ListLeaguesBloc, ListLeaguesState>(
                cubit: _listLeaguesBloc,
                builder: (context, state) {
                  if (state is ListLeaguesInitial) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (state is ListLeaguesLoadedSuccess) {
                    return RefreshIndicator(
                      onRefresh: () {
                        _listLeaguesBloc
                          ..add(
                            GetListLeaguesFromApi(),
                          );
                        return _refreshCompleter.future;
                      },
                      child: GridView.builder(
                        itemCount: state.modelListLeagues.data.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                RouteName.detailLeagues,
                              );
                            },
                            child: Card(
                              elevation: 1.5,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                verticalDirection: VerticalDirection.down,
                                children: [
                                  CachedNetworkImage(
                                    imageUrl: state.modelListLeagues.data[index]
                                        .logos.dark,
                                    height: sy(130),
                                    width: sy(100),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  }
                  if (state is ListLeaguesLoadedFailure) {
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
          ),
        );
      },
    );
  }
}

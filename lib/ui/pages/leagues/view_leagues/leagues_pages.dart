import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_new_starter_pack/bloc/bloc_leagues/list_leagues_bloc/list_leagues_bloc.dart';
import 'package:flutter_new_starter_pack/ui/pages/leagues/view_leagues/leagues_view.dart';

class LeaguesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ListLeaguesBloc>(
      create: (context) => ListLeaguesBloc()
        ..add(
          GetListLeaguesFromApi(),
        ),
      child: LeaguesView(),
    );
  }
}

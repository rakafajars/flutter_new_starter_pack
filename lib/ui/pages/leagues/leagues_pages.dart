import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_new_starter_pack/bloc/b_leagues/leagues_bloc.dart';
import 'package:flutter_new_starter_pack/ui/pages/leagues/leagues.dart';

class LeaguesListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<LeaguesBloc>(
      create: (context) => LeaguesBloc()
        ..add(
          GetListLeaguesFromApi(),
        ),
      child: LeaguesView(),
    );
  }
}

class DetailLeaguesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<LeaguesBloc>(
      create: (context) => LeaguesBloc()
        ..add(
          GetDetailLeaguesFromApi(
            idLeagues: 'eng.1',
          ),
        ),
      child: LeaguesDetailView(),
    );
  }
}

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'list_leagues_event.dart';
part 'list_leagues_state.dart';

class ListLeaguesBloc extends Bloc<ListLeaguesEvent, ListLeaguesState> {
  ListLeaguesBloc() : super(ListLeaguesInitial());

  @override
  Stream<ListLeaguesState> mapEventToState(
    ListLeaguesEvent event,
  ) async* {}
}

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_new_starter_pack/network/api_repository.dart';
import 'package:flutter_new_starter_pack/network/api_service.dart';
import 'package:meta/meta.dart';
import 'package:flutter_new_starter_pack/model/m_leagues/m_list_leagues.dart';

part 'list_leagues_event.dart';
part 'list_leagues_state.dart';

class ListLeaguesBloc extends Bloc<ListLeaguesEvent, ListLeaguesState> {
  ListLeaguesBloc() : super(ListLeaguesInitial());

  Repository _repository = ApiService();
  ModelListLeagues modelListLeagues;

  @override
  Stream<ListLeaguesState> mapEventToState(
    ListLeaguesEvent event,
  ) async* {
    if (event is GetListLeaguesFromApi) {
      yield ListLeaguesInitial();
      try {
        modelListLeagues = await _repository.readListLeagues();

        yield ListLeaguesLoadedSuccess(
          modelListLeagues: modelListLeagues,
        );
      } catch (e) {
        yield ListLeaguesLoadedFailure(
          message: "$e",
        );
      }
    }
  }
}

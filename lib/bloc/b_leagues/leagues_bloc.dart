import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_new_starter_pack/model/m_leagues/m_detail_leagues.dart';
import 'package:flutter_new_starter_pack/model/m_leagues/m_list_leagues.dart';
import 'package:flutter_new_starter_pack/network/api_repository.dart';
import 'package:flutter_new_starter_pack/network/api_service.dart';

part 'leagues_event.dart';
part 'leagues_state.dart';

class LeaguesBloc extends Bloc<LeaguesEvent, LeaguesState> {
  LeaguesBloc() : super(LeaguesInitial());

  Repository _repository = ApiService();
  ModelListLeagues modelListLeagues;
  ModelDetailLeagues modelDetailLeagues;

  @override
  Stream<LeaguesState> mapEventToState(
    LeaguesEvent event,
  ) async* {
    if (event is GetListLeaguesFromApi) {
      yield LeaguesLoadInProgress();
      try {
        modelListLeagues = await _repository.readListLeagues();

        yield LeaguesListLoadSuccess(
          modelListLeagues: modelListLeagues,
        );
      } catch (e) {
        yield LeaguesLoadFailure(
          message: "$e",
        );
      }
    } else if (event is GetDetailLeaguesFromApi) {
      yield LeaguesLoadInProgress();
      try {
        modelDetailLeagues = await _repository.readDetailLeagues(
          idLeagues: event.idLeagues,
        );

        yield LeaguesDetailLoadSuccess(
          modelDetailLeagues: modelDetailLeagues,
        );
      } catch (e) {
        yield LeaguesLoadFailure(
          message: "$e",
        );
      }
    }
  }
}

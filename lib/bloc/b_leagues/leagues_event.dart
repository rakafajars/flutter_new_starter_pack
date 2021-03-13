part of 'leagues_bloc.dart';

abstract class LeaguesEvent extends Equatable {
  const LeaguesEvent();
}

class GetListLeaguesFromApi extends LeaguesEvent {
  @override
  List<Object> get props => [];
}

class GetDetailLeaguesFromApi extends LeaguesEvent {
  final String idLeagues;

  GetDetailLeaguesFromApi({
    @required this.idLeagues,
  });

  @override
  List<Object> get props => [idLeagues];
}

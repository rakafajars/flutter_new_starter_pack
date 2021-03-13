part of 'leagues_bloc.dart';

abstract class LeaguesState extends Equatable {
  const LeaguesState();

  @override
  List<Object> get props => [];
}

class LeaguesInitial extends LeaguesState {}

class LeaguesLoadInProgress extends LeaguesState {}

class LeaguesListLoadSuccess extends LeaguesState {
  final ModelListLeagues modelListLeagues;

  LeaguesListLoadSuccess({
    @required this.modelListLeagues,
  });

  @override
  List<Object> get props => [modelListLeagues];
}

class LeaguesDetailLoadSuccess extends LeaguesState {}

class LeaguesLoadFailure extends LeaguesState {
  final String message;

  LeaguesLoadFailure({
    @required this.message,
  });
  @override
  List<Object> get props => [];
}

part of 'list_leagues_bloc.dart';

abstract class ListLeaguesState extends Equatable {
  const ListLeaguesState();

  @override
  List<Object> get props => [];
}

class ListLeaguesInitial extends ListLeaguesState {}

class ListLeaguesLoadedSuccess extends ListLeaguesState {
  final ModelListLeagues modelListLeagues;

  ListLeaguesLoadedSuccess({
    @required this.modelListLeagues,
  });

  @override
  List<Object> get props => [modelListLeagues];
}

class ListLeaguesLoadedFailure extends ListLeaguesState {
  final String message;

  ListLeaguesLoadedFailure({@required this.message});

  @override
  List<Object> get props => [message];
}

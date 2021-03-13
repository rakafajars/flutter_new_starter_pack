part of 'list_leagues_bloc.dart';

abstract class ListLeaguesEvent extends Equatable {
  const ListLeaguesEvent();
}

class GetListLeaguesFromApi extends ListLeaguesEvent {
  @override
  List<Object> get props => [];
}

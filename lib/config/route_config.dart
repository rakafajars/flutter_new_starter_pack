import 'package:flutter/material.dart';
import 'package:flutter_new_starter_pack/config/route_name.dart';
import 'package:flutter_new_starter_pack/ui/pages/leagues/leagues.dart';
import 'package:flutter_new_starter_pack/ui/pages/movie/movie.dart';

// Route Config disimpen di MaterialApp
class RouteConfig {
  static final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
    RouteName.listMovie: (BuildContext context) => MoviePage(),
    RouteName.listLeagues: (BuildContext context) => LeaguesListPage(),
    RouteName.detailLeagues: (BuildContext context) => DetailLeaguesPage(),
  };
}

import 'package:flutter_new_starter_pack/model/m_leagues/m_detail_leagues.dart';
import 'package:flutter_new_starter_pack/model/m_leagues/m_list_leagues.dart';
import 'package:flutter_new_starter_pack/model/m_movie/m_detail_movie.dart';
import 'package:flutter_new_starter_pack/model/m_movie/m_list_movie.dart';
import 'package:meta/meta.dart';

abstract class Repository {
  Future<ModelListMovie> readListMovie();

  Future<ModelDetailMovie> readDetailMovie({
    @required String idMovie,
  });

  Future<ModelListLeagues> readListLeagues();

  Future<ModelDetailLeagues> readDetailLeagues({
    @required String idLeagues,
  });
}

import 'package:flutter_new_starter_pack/model/m_movie/m_list_movie.dart';

abstract class Repository {
  Future<ModelListMovie> getListMovie();
}
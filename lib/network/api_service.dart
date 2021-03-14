import 'package:dio/dio.dart';
import 'package:flutter_new_starter_pack/model/m_leagues/m_detail_leagues.dart';
import 'package:flutter_new_starter_pack/model/m_leagues/m_list_leagues.dart';
import 'package:flutter_new_starter_pack/model/m_movie/m_detail_movie.dart';
import 'package:flutter_new_starter_pack/model/m_movie/m_list_movie.dart';
import 'package:flutter_new_starter_pack/network/api_repository.dart';
import 'package:flutter_new_starter_pack/network/dio_client.dart';
import 'package:flutter_new_starter_pack/utils/extensions.dart';
import 'package:meta/meta.dart';

class ApiService implements Repository {
  Response response;

  Dio get dio => dioClient();

  @override
  Future<ModelListMovie> readListMovie() async {
    try {
      response = await dio.get(
        'https://api.themoviedb.org/3/movie/popular?api_key=0b0debe0535354fd45b3b86a81fd35a2&language=en-US&page=1&region=',
      );
      return ModelListMovie.fromJson(response.data);
    } on DioError catch (e) {
      throw e.getErrorMessage();
    } catch (error, stacktrace) {
      throw showException(error, stacktrace);
    }
  }

  @override
  Future<ModelDetailMovie> readDetailMovie({
    @required String idMovie,
  }) async {
    try {
      response = await dio.get(
        'https://api.themoviedb.org/3/movie/$idMovie?api_key=0b0debe0535354fd45b3b86a81fd35a2',
      );

      return ModelDetailMovie.fromJson(response.data);
    } on DioError catch (e) {
      throw e.getErrorMessage();
    } catch (error, stacktrace) {
      throw showException(error, stacktrace);
    }
  }

  @override
  Future<ModelListLeagues> readListLeagues() async {
    try {
      response = await dio.get(
        'https://api-football.azharimm.tk/leagues',
      );
      return ModelListLeagues.fromJson(response.data);
    } on DioError catch (e) {
      throw e.getErrorMessage();
    } catch (error, stacktrace) {
      throw showException(error, stacktrace);
    }
  }

  @override
  Future<ModelDetailLeagues> readDetailLeagues({
    @required String idLeagues,
  }) async {
    try {
      response = await dio.get(
        'https://api-football.azharimm.tk/leagues/$idLeagues',
      );

      return ModelDetailLeagues.fromJson(response.data);
    } on DioError catch (e) {
      throw e.getErrorMessage();
    } catch (error, stacktrace) {
      throw showException(error, stacktrace);
    }
  }
}

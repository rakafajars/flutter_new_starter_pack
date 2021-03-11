import 'package:dio/dio.dart';
import 'package:flutter_new_starter_pack/model/m_movie/m_list_movie.dart';
import 'package:flutter_new_starter_pack/network/api_repository.dart';
import 'package:flutter_new_starter_pack/network/dio_client.dart';
import 'package:flutter_new_starter_pack/utils/extensions.dart';

class ApiService implements Repository {
  Response response;

  Dio get dio => dioClient();

  @override
  Future<ModelListMovie> getListMovie() async {
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
}

import 'package:dio/dio.dart';
import 'package:flutter_new_starter_pack/config/app_config.dart';
import 'package:flutter_new_starter_pack/model/m_movie/m_list_movie.dart';
import 'package:flutter_new_starter_pack/resource/api_repository.dart';
import 'package:flutter_new_starter_pack/utils/logging_interceptor.dart';
import 'package:flutter_new_starter_pack/utils/extensions.dart';

class ApiService implements Repository {
  String _baseUrl = Constants.baseUrl;

  Dio get dio => _dio();

  Response response;

  Dio _dio() {
    final options = BaseOptions(
      // baseUrl: _baseUrl,
      connectTimeout: 120000,
      receiveTimeout: 120000,
      contentType: 'application/json',
    );

    var dio = Dio(options);
    dio.interceptors.add(LogginInterceptors());
  }

  String _showException(final error, final stacktrace) {
    print("Exception occurred: $error stackTrace: $stacktrace");
    return "Failed Get Data";
  }

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
      throw _showException(error, stacktrace);
    }
  }
}

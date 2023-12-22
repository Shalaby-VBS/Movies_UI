import 'package:dio/dio.dart';

class ApiService {
  final _baseUrl = 'https://api.themoviedb.org/3/movie/';
  final _apiKey = '?api_key=a04fa796e903a17f94ae386820a214c8';
  final Dio _dio;
  ApiService(this._dio);

  Future<Map<String, dynamic>> get({required String endPoint}) async {
    var response = await _dio.get('$_baseUrl$endPoint$_apiKey');
    return response.data;
  }
}

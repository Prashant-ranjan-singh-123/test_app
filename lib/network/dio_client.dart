import 'package:dio/dio.dart';

class DioClient{
  DioClient._();
  String _base_url = 'https://fakestoreapi.com';

  static DioClient instance(){
    return DioClient._();
  }

  Dio dio(){
    return Dio(BaseOptions(baseUrl: _base_url));
  }
}
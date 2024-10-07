import 'package:dio/dio.dart';
import 'package:test_app/network/dio_client.dart';

class Endpoints{
  Future<Response> getProducts() async{

    try{
      Response response = await DioClient.instance().dio().get('/products/1');
      return response;
    } on DioException catch (e){
      return e.response!;
    }
  }
}
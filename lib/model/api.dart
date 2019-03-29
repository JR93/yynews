import 'package:dio/dio.dart';

Dio dio = new Dio();

class Api {
  static const String BaseUrl = "http://yue.yy.com/";

  static const String TABS = BaseUrl + "1.0/h5/tab/getTabs";

  static const String RECOMMEND = BaseUrl + "1.0/h5/message/getMessagesV2";

  //get请求
  static Future<Map<String, dynamic>> get(String url, { Map<String, dynamic> params }) async {
    Response<Map<String, dynamic>> response = await dio.get(url, queryParameters: params);
    // await Future.delayed(Duration(milliseconds: 3000));
    return response.data;
  }
}
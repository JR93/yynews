import 'package:dio/dio.dart';

Dio dio = new Dio();

class Api {
  static const String BaseUrl = "http://xxx.xx.com/";

  static const String TOPIC = BaseUrl + "1.0/h5/message/getMessagesByTopic";

  static const String RECOMMEND = BaseUrl + "1.0/h5/message/getMessagesV2";

  //get请求
  static Future<Map<String, dynamic>> get(String url, { Map<String, dynamic> params }) async {
    Response<Map<String, dynamic>> response = await dio.get(url, queryParameters: params);
    // await Future.delayed(Duration(milliseconds: 1000));
    return response.data;
  }
}

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class diohelp {

  static Dio? dio;

  static init() {
    dio = Dio(BaseOptions(
        baseUrl: 'http://app.d3wat.com/',
        receiveDataWhenStatusError: true));
  }

  static Future<Response> getdata({@required String? URL,}) async {
    return await dio!.get(URL!);

  }

  static Future<Response> postdata({@required String? URL,@required Map<String,dynamic>? data}) async {
    return  dio!.post(URL!,data: data);

  }


}
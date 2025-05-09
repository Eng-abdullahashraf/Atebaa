import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class DioHelper {
  static  Dio? dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://kh-alwafi.com/api/',
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        receiveDataWhenStatusError: true,
        headers: {
          'Content-Type': 'application/json',
          // لو عندك توكن أو حاجة ثانية تقدر تضيفها هنا
        },
      ),
    );
  }

  static Future<Response> getData({required String url, Map<String, dynamic>? query, Map<String, dynamic>? headers,}) async {
    try {
      final response = await dio!.get(url, queryParameters: query, options: Options(headers: headers),);
      return response;
    } catch (e) {
      print('GET Error: $e');
      rethrow; // عشان ترجع الخطأ للكنترولر يتعامل معاه
    }
  }

  static Future<Response> postData({required String url, Map<String, dynamic>? data, Map<String, dynamic>? query, Map<String, dynamic>? headers,}) async {
    try {
      final response = await dio!.post(url, queryParameters: query, data: data, options: Options(headers: headers),);
      return response;
    } catch (e) {
      print('POST Error: $e');
      rethrow;
    }
  }
}

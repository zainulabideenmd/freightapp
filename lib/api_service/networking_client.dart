import 'package:dio/dio.dart';
import 'package:dio_mock_interceptor/dio_mock_interceptor.dart';
import 'package:flutter/foundation.dart';
import 'api_end_points.dart';

/// Create a singleton class to contain all Dio methods and helper functions
class DioClient {
  DioClient._();
  static final instance = DioClient._();

  final Dio _dio = Dio(
      BaseOptions(

      )
  );



  ///Get Method
  Future<Map<String, dynamic>> get(
      String path, {
        Map<String, dynamic>? queryParameters,
        Options? options,
        CancelToken? cancelToken,
        ProgressCallback? onReceiveProgress
      }) async{
    try{
      _dio.interceptors.add(MockInterceptor());
      final Response response = await _dio.get(
        path,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      print(response);
      if(response.statusCode == 200){
        return response.data;
      }
      throw "something went wrong";
    } catch(e){
      rethrow;
    }
  }

  ///Post Method
  Future<Map<String, dynamic>> post(
      String path, {
        data,
        Map<String, dynamic>? queryParameters,
        Options? options,
        CancelToken? cancelToken,
        ProgressCallback? onSendProgress,
        ProgressCallback? onReceiveProgress,
        String? contentType
      }) async{
    try{
      _dio.interceptors.add(MockInterceptor());
      final Response response = await _dio.post(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      if(response.statusCode == 200){
        return response.data;
      } else {
        throw "something went wrong";
      }
    } on DioError catch (e){
      try {

      } catch (ex) {

      }
      rethrow;
    }
  }

}
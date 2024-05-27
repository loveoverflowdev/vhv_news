import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart' show debugPrint;
import 'package:news_repository/src/core/news_api_endpoint.dart';

typedef ApiResponse = Map<String, dynamic>;

class NewsApiClient {
  final Dio _dio;
  
  NewsApiClient({
    required Dio dio,
  }) : _dio = dio {
    _dio.options.headers.addAll({
      'Content-Type': 'application/json',
    });

    _dio.interceptors.add(LogInterceptor(
      requestHeader: false,
      requestBody: true,
      responseBody: false,
      responseHeader: false,
      error: true,
      logPrint: (log) {
        debugPrint(log.toString());
      },
    ));
  }

  Future<List<ApiResponse>> selectAllMap(NewsApiEndpoint endpoint, {
    Map<String, dynamic>? queryParameters,
  }) {
    return _dio.get(
      endpoint.apiUrl, 
      queryParameters: queryParameters,
    )
      .then(
        (response) {
          final items = response.data['items'];
          final results = (items is Map<String, dynamic> ? items : {})
            .values.map((e) => e as ApiResponse).toList();
          return results;
        }
      );
  }

  Future<List<ApiResponse>> selectAllList(NewsApiEndpoint endpoint, {
    Map<String, dynamic>? queryParameters,
  }) {
    return _dio.get(
      endpoint.apiUrl, 
      queryParameters: queryParameters,
    )
      .then(
        (response) {
          final items = response.data['items'];
          final results = (items is Iterable ? items : [])
            .map((e) => e as ApiResponse).toList();
          return results;
        }
      );
  }

  Future<ApiResponse> selectById(NewsApiEndpoint endpoint, {
    required String id,
  }) {
    return _dio.get('${endpoint.apiUrl}/select/$id')
      .then((response) {
        return response.data as ApiResponse;
      });
  }

  Future<List<ApiResponse>> selectByFilter(NewsApiEndpoint endpoint, {
    required Map<String, dynamic> filter,
  }) {
    throw UnimplementedError();

  }
}

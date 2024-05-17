
import 'dart:convert';

import 'package:dio/dio.dart';
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
  }

  Future<List<ApiResponse>> selectAll(NewApiEndpoint endpoint) {
    return _dio.get('${endpoint.url}/selectAll')
      .then(
        (response) {
          final results = (response.data['items'] as Map<String, dynamic>)
            .values.map((e) => e as ApiResponse).toList();
          return results;
        }
      );
  }

  Future<ApiResponse> selectById(NewApiEndpoint endpoint, {
    required String id,
  }) {
    return _dio.get('${endpoint.url}/select/$id')
      .then((response) {
        return response.data as ApiResponse;
      });
  }

  Future<List<ApiResponse>> selectByFilter(NewApiEndpoint endpoint, {
    required Map<String, dynamic> filter,
  }) {
    throw UnimplementedError();

  }
}

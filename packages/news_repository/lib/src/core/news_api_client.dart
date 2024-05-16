
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:news_repository/src/core/news_api_endpoint.dart';

typedef ApiResponse = Map<String, dynamic>;

class NewsApiClient {
  final Dio _dio;
  
  NewsApiClient({
    required Dio dio,
  }) : _dio = dio;

  Future<List<ApiResponse>> selectAll(NewApiEndpoint endpoint) {
    return _dio.get('${endpoint.url}/selectAll')
      .then(
        (response) => (jsonDecode(response.data['items']) as Map<String, dynamic>)
        .values.map((e) => e as ApiResponse).toList()
      );
  }

  Future<ApiResponse> selectById(NewApiEndpoint endpoint, {
    required String id,
  }) {
    return _dio.get('${endpoint.url}/select/$id')
      .then((response) {
        return jsonDecode(response.data) as ApiResponse;
      });
  }

  Future<List<ApiResponse>> selectByFilter(NewApiEndpoint endpoint, {
    required Map<String, dynamic> filter,
  }) {
    throw UnimplementedError();

  }
}

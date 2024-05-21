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

  Future<List<ApiResponse>> selectAll(NewsApiEndpoint endpoint) {
    return _dio.get(endpoint.apiUrl)
      .then(
        (response) {
          final results = (response.data['items'] as Map<String, dynamic>)
            .values.map((e) => e as ApiResponse).toList();
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

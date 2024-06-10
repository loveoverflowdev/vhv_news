import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_cache_interceptor_sembast_storage/dio_cache_interceptor_sembast_storage.dart';
import 'package:flutter/foundation.dart' show debugPrint;
import 'package:news_repository/src/core/news_api_endpoint.dart';

typedef ApiResponse = Map<String, dynamic>;

abstract class NewsApiClient {
  NewsApiClient();

  factory NewsApiClient.common({
    required Dio dio,
    String? cachedDirectoryPath,
  }) = _CommonNewsApiClient;

  Future<List<ApiResponse>> selectAllMap(NewsApiEndpoint endpoint, {
    Map<String, dynamic>? queryParameters,
  });

  Future<List<ApiResponse>> selectAllList(NewsApiEndpoint endpoint, {
    Map<String, dynamic>? queryParameters,
  });

  Future<ApiResponse> selectById(NewsApiEndpoint endpoint, {
    required String id,
  });

  Future<ApiResponse> search(NewsApiEndpoint endpoint, {
    required String keyword,
  });

  Future<dynamic> downloadFile({required String url, void Function(int, int)? onReceiveProgress});
}

class _CommonNewsApiClient extends NewsApiClient {
  final Dio _dio;
  
  _CommonNewsApiClient({
    required Dio dio,
    String? cachedDirectoryPath,
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

    _dio.interceptors.add(DioCacheInterceptor(options: _getCacheOptions()));
  }

  @override
  Future<List<ApiResponse>> selectAllMap(NewsApiEndpoint endpoint, {
    Map<String, dynamic>? queryParameters,
  }) {
    return _dio.get(
      endpoint.selectAllApiUrl(), 
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

  @override
  Future<List<ApiResponse>> selectAllList(NewsApiEndpoint endpoint, {
    Map<String, dynamic>? queryParameters,
  }) {
    return _dio.get(
      endpoint.selectAllApiUrl(), 
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

  @override
  Future<ApiResponse> selectById(NewsApiEndpoint endpoint, {
    required String id,
  }) {
    return _dio.get(endpoint.selectApiUrl(id: id))
      .then((response) {
        return response.data as ApiResponse;
      });
  }

  @override
  Future<ApiResponse> search(NewsApiEndpoint endpoint, {
    required String keyword,
  }) {
    return _dio.get(endpoint.search(keyword: keyword))
      .then((response) {
      return response.data as ApiResponse;
    });
  }
  
  @override
  Future downloadFile({required String url, void Function(int, int)? onReceiveProgress}) async {
    final Response response = await _dio.get(
      url,
      onReceiveProgress: onReceiveProgress,
      options: Options(
        responseType: ResponseType.bytes,
        followRedirects: false,
      ),
    );
    return response.data;
  }

  CacheOptions _getCacheOptions({
    String? cachedDirectoryPath,
  }) {
    return  CacheOptions(
      // A store is required for interceptor.
      store: cachedDirectoryPath != null ? SembastCacheStore(storePath: cachedDirectoryPath) : MemCacheStore(),

      // All subsequent fields are optional.
      
      // Default.
      policy: CachePolicy.forceCache,
      // Returns a cached response on error but for statuses 401 & 403.
      // Also allows to return a cached response on network errors (e.g. offline usage).
      // Defaults to [null].
      hitCacheOnErrorExcept: [],
      // Overrides any HTTP directive to delete entry past this duration.
      // Useful only when origin server has no cache config or custom behaviour is desired.
      // Defaults to [null].
      maxStale: const Duration(minutes: 15),
      // Default. Allows 3 cache sets and ease cleanup.
      priority: CachePriority.normal,
      // Default. Body and headers encryption with your own algorithm.
      cipher: null,
      // Default. Key builder to retrieve requests.
      keyBuilder: CacheOptions.defaultCacheKeyBuilder,
      // Default. Allows to cache POST requests.
      // Overriding [keyBuilder] is strongly recommended when [true].
      allowPostMethod: false,
    );
  }
}

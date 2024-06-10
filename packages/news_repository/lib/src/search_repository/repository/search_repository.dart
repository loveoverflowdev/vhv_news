import '../response/response.dart';

abstract class SearchRepository {
  Future<SearchResponse> search(String keyword);  
}

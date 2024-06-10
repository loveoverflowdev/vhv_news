import '../response/response.dart';

abstract class SongRepository {
  Future<List<SongResponse>> getSongs();
}

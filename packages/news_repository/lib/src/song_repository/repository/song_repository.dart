import '../response/response.dart';

abstract class SongRepository {
  Future<List<SongResponse>> getSongs();

  Future<SongDetailResponse> getSongDetail({
    required String id,
  });
}

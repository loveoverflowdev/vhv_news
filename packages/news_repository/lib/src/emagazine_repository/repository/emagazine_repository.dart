import '../response/response.dart';

abstract class EmagazineRepository {
  const EmagazineRepository();

  Future<List<EmagazineResponse>> getEmagazines({
    required String categoryId,
  });

  Future<EmagazineDetailResponse> getEmagazineDetail({required String id});
}

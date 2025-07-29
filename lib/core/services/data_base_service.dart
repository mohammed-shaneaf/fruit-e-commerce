abstract class DataBaseService {
  Future<void> addData({required String path, required Map<String, dynamic> data});

  // You Read Record From Data Base Not Collection
  Future<Map<String, dynamic>> getData({
    required String path,
    required String doucmnetId, // api , endpoint , collectioname
  });
}

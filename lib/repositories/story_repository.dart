import 'package:dio/dio.dart';
import 'package:novel_reader/models/discovery.dart';

class StoryRepository {
  Future<DiscoveryResponse> getDiscoveryData() async {
    try {
      var response = await Dio().get("https://api.truyenfull.vn/v1/discovery");
      var discoveryData = DiscoveryResponse.fromJson(response.data);
      return discoveryData;
    } catch (e) {
      rethrow;
    }
  }
}

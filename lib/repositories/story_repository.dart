import 'package:novel_reader/environment/environment.dart';
import 'package:novel_reader/models/discovery.dart';
import 'package:novel_reader/models/story_detail_response.dart';
import 'package:novel_reader/repositories/base_repository.dart';

class StoryRepository extends BaseRepository {
  Future<DiscoveryResponse> getDiscoveryData() async {
    try {
      var response = await dio.get(ApiPaths.discovery);
      var discoveryData = DiscoveryResponse.fromJson(response.data);
      return discoveryData;
    } catch (e) {
      rethrow;
    }
  }

  Future<StoryDetailResponse> getStoryDetail(int id) async {
    try {
      var response = await dio.get("${ApiPaths.storyDetail}/$id");
      var storyDetail = StoryDetailResponse.fromJson(response.data);
      return storyDetail;
    } catch (e) {
      rethrow;
    }
  }
}

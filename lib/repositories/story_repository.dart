import 'package:dio/dio.dart';

class StoryRepository {

  void testGetGeneralData() async {
    try {
      var response = await Dio().get("https://api.truyenfull.vn/v1/discovery");
      print(response.data);
    }catch (e) {
      print(e);
    }
  }

}
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:novel_reader/di/injection.dart';
import 'package:novel_reader/repositories/story_repository.dart';
import 'package:novel_reader/screens/discovery/cubit/recent_stories_state.dart';

class RecentStoriesCubit extends Cubit<StoriesState> {

  StoryRepository repo = getIt.get<StoryRepository>();

  RecentStoriesCubit() : super(StoriesStateInit());

  void getRecentStories() async {
    emit(StoriesStateLoading());
    try {
      var response = await repo.getDiscoveryData();
      var data = StoriesStateData(response);
      print("${data.discoveryResponse.message}");
      emit(data);
    }
    catch (ex) {
     emit(StoriesStateError(Exception("ex")));
    }
  }
}

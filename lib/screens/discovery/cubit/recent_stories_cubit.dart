import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:novel_reader/models/discovery.dart';
import 'package:novel_reader/models/result.dart';
import 'package:novel_reader/repositories/story_repository.dart';
import 'package:novel_reader/screens/discovery/cubit/recent_stories_state.dart';

class RecentStoriesCubit extends Cubit<StoriesState> {
  var repo = StoryRepository();

  RecentStoriesCubit() : super(StoriesStateInit());

  void getRecentStories() async {
    emit(StoriesStateLoading());
    try {
      var response = await repo.getDiscoveryData();
      emit(StoriesStateData(response));
    }
    catch (ex) {
     emit(StoriesStateError(Exception("ex")));
    }
  }
}

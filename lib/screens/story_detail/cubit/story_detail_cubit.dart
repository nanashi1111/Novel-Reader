import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:novel_reader/models/discovery.dart';
import 'package:novel_reader/models/story_detail_response.dart';
import 'package:novel_reader/repositories/story_repository.dart';
import 'package:novel_reader/di/injection.dart';
part 'story_detail_state.dart';

class StoryDetailCubit extends Cubit<StoryDetailState> {

  StoryRepository repo = getIt.get<StoryRepository>();

  StoryDetailCubit() : super(StoryDetailInitial());

  getStoryDetail(Story story) async {
    if (story.id == null) {
      emit(StoryDetailError());
      return;
    }
    var response = await repo.getStoryDetail(story.id!);
    emit(StoryDetailData(response));
  }
}

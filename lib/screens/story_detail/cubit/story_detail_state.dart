part of 'story_detail_cubit.dart';

@immutable
abstract class StoryDetailState {}

class StoryDetailInitial extends StoryDetailState {}

class StoryDetailLoading extends StoryDetailState {}

class StoryDetailData extends StoryDetailState {
  StoryDetailResponse data;

  StoryDetailData(this.data);
}

class StoryDetailError extends StoryDetailState {}

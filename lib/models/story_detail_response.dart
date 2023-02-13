import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'story_detail_response.freezed.dart';
part 'story_detail_response.g.dart';

StoryDetailResponse storyDetailResponseFromJson(String str) => StoryDetailResponse.fromJson(json.decode(str));

String storyDetailResponseToJson(StoryDetailResponse data) => json.encode(data.toJson());

@freezed
class StoryDetailResponse with _$StoryDetailResponse {
  const factory StoryDetailResponse({
    String? status,
    String? message,
    int? statusCode,
    StoryDetail? data,
  }) = _StoryDetailResponse;

  factory StoryDetailResponse.fromJson(Map<String, dynamic> json) => _$StoryDetailResponseFromJson(json);
}

@freezed
class StoryDetail with _$StoryDetail {
  const factory StoryDetail({
    int? id,
    String? title,
    String? image,
    String? link,
    String? status,
    String? author,
    String? time,
    String? source,
    bool? liked,
    int? totalChapters,
    int? totalLike,
    String? totalView,
    String? categories,
    String? categoryIds,
    String? chaptersNew,
    List<Chapter>? new_chapters,
    String? description,
  }) = _StoryDetail;

  factory StoryDetail.fromJson(Map<String, dynamic> json) => _$StoryDetailFromJson(json);
}

@freezed
class Chapter with _$Chapter {
  const factory Chapter({
    int? id,
    String? title,
    String? chapterName,
    String? chapterNumber,
    dynamic? bookNumber,
  }) = _Chapter;

  factory Chapter.fromJson(Map<String, dynamic> json) => _$ChapterFromJson(json);
}
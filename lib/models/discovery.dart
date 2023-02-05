import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'discovery.freezed.dart';
part 'discovery.g.dart';

DiscoveryResponse discoveryResponseFromJson(String str) => DiscoveryResponse.fromJson(json.decode(str));

String discoveryResponseToJson(DiscoveryResponse data) => json.encode(data.toJson());

@freezed
class DiscoveryResponse with _$DiscoveryResponse {
  const factory DiscoveryResponse({
    String? status,
    String? message,
    int? status_code,
    Data? data,
  }) = _DiscoveryResponse;

  factory DiscoveryResponse.fromJson(Map<String, dynamic> json) => _$DiscoveryResponseFromJson(json);
}

@freezed
class Data with _$Data {
  const factory Data({
    List<Story>? story_new,
    List<Story>? story_update,
    List<Category>? categories,
    List<OtherList>? other_lists,
  }) = _Data;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}

@freezed
class Category with _$Category {
  const factory Category({
    int? id,
    String? name,
    String? slug,
    String? image,
  }) = _Category;

  factory Category.fromJson(Map<String, dynamic> json) => _$CategoryFromJson(json);
}

@freezed
class OtherList with _$OtherList {
  const factory OtherList({
    String? name,
    String? page,
    int? category,
    int? order,
    int? limit,
    int? id,
  }) = _OtherList;

  factory OtherList.fromJson(Map<String, dynamic> json) => _$OtherListFromJson(json);
}

@freezed
class Story with _$Story {
  const factory Story({
    int? id,
    String? title,
    String? image,
    bool? isFull,
  }) = _Story;

  factory Story.fromJson(Map<String, dynamic> json) => _$StoryFromJson(json);
}
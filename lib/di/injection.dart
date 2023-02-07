import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:novel_reader/environment/environment.dart';
import 'package:novel_reader/repositories/story_repository.dart';

final getIt = GetIt.instance;

configInstances() async {
  getIt.registerSingleton<Dio>( Dio(BaseOptions(baseUrl: provideBaseUrl())));
  getIt.registerSingleton<StoryRepository>(StoryRepository());
}
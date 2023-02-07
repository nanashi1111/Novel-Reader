
import 'package:dio/dio.dart';
import 'package:novel_reader/di/injection.dart';

class BaseRepository {
  Dio dio = getIt.get<Dio>();
}
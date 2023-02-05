
import 'package:novel_reader/models/discovery.dart';

abstract class StoriesState {
}

class StoriesStateInit extends StoriesState {
}

class StoriesStateLoading extends StoriesState {
}

class StoriesStateData extends StoriesState {
  DiscoveryResponse discoveryResponse;
  StoriesStateData(this.discoveryResponse);
}

class StoriesStateError extends StoriesState {
  Exception exception;
  StoriesStateError(this.exception);
}
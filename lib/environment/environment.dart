
enum Environment {
  debug, uat, release
}

const Environment environment = Environment.debug;

String provideBaseUrl() {
  switch (environment) {
    case Environment.debug : return "https://api.truyenfull.vn/v1";
    case Environment.uat:  return "https://stg.api.truyenfull.vn/v1";
    case Environment.release:  return "https://api.truyenfull.vn/v1";
  }
}

class ApiPaths {
  static String discovery = "/discovery";
  static String storyDetail = "/story/detail";
}
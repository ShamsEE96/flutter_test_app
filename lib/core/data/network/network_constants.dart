class NetworkConstants {
  static const String BASE_API = '/api/v1/';

  static String getFullURL(String apiName) {
    return BASE_API + apiName;
  }
}

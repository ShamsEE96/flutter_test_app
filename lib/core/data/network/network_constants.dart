class NetworkConstants {
  static const String BASE_SERVICE_API = '/api/services/app/';
  static const String BASE_API = '/api/';

  static String getFullURL(String apiName) {
    return BASE_SERVICE_API + apiName;
  }
}

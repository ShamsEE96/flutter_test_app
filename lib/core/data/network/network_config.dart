import 'package:flutter_template/core/enums/request_type_enum.dart';
import 'package:flutter_template/core/utils/general_utils.dart';

class NetworkConfig {
  static const String Auth_Bearer = "Bearer ";

  static String BASE_API = '/api/v1/';

  static String getFullApiUrl(String api) {
    return BASE_API + api;
  }

  static Map<String, String> getHeaders({
    bool? needAuth = true,
    RequestType? type = RequestType.POST,
    Map<String, String>? extraHeaders,
  }) {
    return {
      if (needAuth!)
        'Authorization':
            '$Auth_Bearer ${storage.getTokenInfo()?.accessToken ?? ''}',
      if (type != RequestType.GET) 'Content-Type': 'application/json',
      ...?extraHeaders
      // ...extraHeaders ?? {'Accept-Language': '${storage.getAppLanguage()}'}
    };
  }
}

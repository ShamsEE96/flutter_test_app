import 'dart:convert';

import 'package:flutter_template/core/data/models/apis/token_info.dart';
import 'package:flutter_template/core/enums/data_type.dart';
import 'package:flutter_template/main.dart';

class SharedPreferencesRepository {
  static String PREF_FIRST_LANUCH = 'PREF_FIRST_LANUCH';
  static String PREF_LOGGED_IN = 'PREF_LOGGED_IN';
  static String PREF_APP_LANGUAGE = 'PREF_APP_LANGUAGE';
  static String PREF_TOKEN_INFO = 'token_info';
  // static String PREF_USER_PROFILE = 'user_profile';
  // static String PREF_USER_PROFILE_NFC = 'user_profile_nfc';

  // StreamController<UserProfileModel> userProfileStream =
  //     StreamController<UserProfileModel>.broadcast();

  setFirstLaunch(bool value) {
    setPrefrance(
      dataType: DataType.BOOL,
      key: PREF_FIRST_LANUCH,
      value: value,
    );
  }

  bool getFirstLaunch() {
    if (globalSharedPrefs!.containsKey(PREF_FIRST_LANUCH)) {
      return getPrefrance(key: PREF_FIRST_LANUCH);
    } else {
      return true;
    }
  }

  setLoggedIn(bool value) {
    setPrefrance(
      dataType: DataType.BOOL,
      key: PREF_LOGGED_IN,
      value: value,
    );
  }

  bool getLoggedIn() {
    if (globalSharedPrefs!.containsKey(PREF_LOGGED_IN)) {
      return getPrefrance(key: PREF_LOGGED_IN);
    } else {
      return false;
    }
  }

  bool get isLoggedIn => getTokenInfo() != null ? true : false;

  setTokenInfo(TokenInfo value) {
    setPrefrance(
      dataType: DataType.STRING,
      key: PREF_TOKEN_INFO,
      value: jsonEncode(value),
    );
  }

  TokenInfo? getTokenInfo() {
    if (globalSharedPrefs!.containsKey(PREF_TOKEN_INFO)) {
      return TokenInfo.fromJson(jsonDecode(getPrefrance(key: PREF_TOKEN_INFO)));
    } else {
      return null;
    }
  }

  void clearTokenInfo() {
    // globalSharedPreferences.remove(PREF_TOKEN);
    globalSharedPrefs!.clear();
  }

  void setAppLanguage({required String langCode}) {
    setPrefrance(
      dataType: DataType.STRING,
      key: PREF_APP_LANGUAGE,
      value: langCode,
    );
  }

  String getAppLanguage() {
    if (globalSharedPrefs!.containsKey(PREF_APP_LANGUAGE)) {
      return getPrefrance(key: PREF_APP_LANGUAGE);
    } else {
      String languageCode = 'en';

      return languageCode;
    }
  }

  // void setUserProfile(UserProfileModel value) {
  //   setPrefrance(
  //     dataType: DataType.STRING,
  //     key: PREF_USER_PROFILE,
  //     value: jsonEncode(value),
  //   );
  // }

  // UserProfileModel? getUserProfile() {
  //   if (globalSharedPrefs!.containsKey(PREF_USER_PROFILE)) {
  //     return UserProfileModel.fromJson(
  //         jsonDecode(getPrefrance(key: PREF_USER_PROFILE)));
  //   } else {
  //     return null;
  //   }
  // }

  // void setUserProfileFromNFC(UserProfileModel value) {
  //   setPrefrance(
  //     dataType: DataType.STRING,
  //     key: PREF_USER_PROFILE_NFC,
  //     value: jsonEncode(value),
  //   );
  // }

  // UserProfileModel? getUserProfileFromNFC() {
  //   if (globalSharedPrefs!.containsKey(PREF_USER_PROFILE_NFC)) {
  //     return UserProfileModel.fromJson(
  //         jsonDecode(getPrefrance(key: PREF_USER_PROFILE_NFC)));
  //   } else {
  //     return null;
  //   }
  // }

  static setPrefrance(
      {required DataType dataType,
      required String key,
      required dynamic value}) async {
    switch (dataType) {
      case DataType.INT:
        await globalSharedPrefs!.setInt(key, value);
        break;
      case DataType.BOOL:
        await globalSharedPrefs!.setBool(key, value);
        break;
      case DataType.STRING:
        await globalSharedPrefs!.setString(key, value);
        break;
      case DataType.DOUBLE:
        await globalSharedPrefs!.setDouble(key, value);
        break;
      case DataType.LISTSTRING:
        await globalSharedPrefs!.setStringList(key, value);
        break;
    }
  }

  static dynamic getPrefrance({required String key}) {
    return globalSharedPrefs!.get(key);
  }
}

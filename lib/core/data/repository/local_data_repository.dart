import 'package:flutter_template/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalDataRepository {
  static const String PREF_TYPE_BOOL = "BOOL";
  static const String PREF_TYPE_INTEGER = "INTEGER";
  static const String PREF_TYPE_DOUBLE = "DOUBLE";
  static const String PREF_TYPE_STRING = "STRING";

  SharedPreferences? _preferences;

  static final LocalDataRepository _instance = LocalDataRepository._internal();

  factory LocalDataRepository() => _instance;

  LocalDataRepository._internal() {
    _preferences = globalSharedPrefs;
  }

  ///Locals

  //--------------------------------------------------- Private Preference Methods ----------------------------------------------------

  void setPreference(
      {required String? prefName,
      required dynamic prefValue,
      required String? prefType}) {
    // Make switch for Preference Type i.e. Preference-Value's data-type
    switch (prefType) {
      // prefType is bool
      case PREF_TYPE_BOOL:
        {
          _preferences!.setBool(prefName!, prefValue);
          break;
        }
      // prefType is int
      case PREF_TYPE_INTEGER:
        {
          _preferences!.setInt(prefName!, prefValue);
          break;
        }
      // prefType is double
      case PREF_TYPE_DOUBLE:
        {
          _preferences!.setDouble(prefName!, prefValue);
          break;
        }
      // prefType is String
      case PREF_TYPE_STRING:
        {
          _preferences!.setString(prefName!, prefValue);
          break;
        }
    }
  }
}

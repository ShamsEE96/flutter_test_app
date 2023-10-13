import 'package:flutter/material.dart';
import 'package:flutter_template/app/app_controller.dart';
import 'package:flutter_template/core/data/repository/shared_prefrence_repository.dart';
import 'package:flutter_template/core/services/connectivity_service.dart';
import 'package:flutter_template/core/services/language_service.dart';
import 'package:flutter_template/core/services/package_info_service.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app/app.dart';

SharedPreferences? globalSharedPrefs;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  globalSharedPrefs = await SharedPreferences.getInstance();
  Get.lazyPut<SharedPreferencesRepository>(() => SharedPreferencesRepository());
  Get.put(ConnectivityService());
  Get.put(AppController());
  await Get.put(LanguageService());
  Get.put(PackageInfoService());

  runApp(App());
}

import 'package:flutter/material.dart';
import 'package:flutter_template/app/app_controller.dart';
import 'package:flutter_template/core/data/repository/account_repository.dart';
import 'package:flutter_template/core/data/repository/profile_repository.dart';
import 'package:flutter_template/core/data/repository/session_repository.dart';
import 'package:flutter_template/core/data/repository/shared_prefrence_repository.dart';
import 'package:flutter_template/core/data/repository/tenant_registration_repository.dart';
import 'package:flutter_template/core/data/repository/token_auth_repository.dart';
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
  Get.lazyPut<ProfileRepository>(() => ProfileRepository());
  Get.lazyPut<AccountRepository>(() => AccountRepository());
  Get.lazyPut<TenantRegistrationRepository>(
      () => TenantRegistrationRepository());
  Get.lazyPut<TokenAuthRepository>(() => TokenAuthRepository());
  Get.lazyPut<SessionRepository>(() => SessionRepository());
  Get.put(ConnectivityService());
  Get.put(AppController());
  await Get.put(LanguageService());
  Get.put(PackageInfoService());

  runApp(App());
}

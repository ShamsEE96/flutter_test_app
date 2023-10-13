import 'package:flutter_template/core/data/repository/local_data_repository.dart';
import 'package:flutter_template/core/data/repository/shared_prefrence_repository.dart';

import 'package:get/get.dart';

class StartupBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SharedPreferencesRepository>(
        () => SharedPreferencesRepository());
    Get.lazyPut<LocalDataRepository>(() => LocalDataRepository());

    // Get.lazyPut<UserRepository>(() => UserRepository());
  }
}

import 'package:flutter_template/core/services/base_controller.dart';

class AppController extends BaseController {
  @override
  void onInit() {
    listenForConnectivityStatus();
    super.onInit();
  }
}

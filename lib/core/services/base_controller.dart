import 'package:bot_toast/bot_toast.dart';
import 'package:flutter_template/core/enums/connectivity_status.dart';
import 'package:flutter_template/core/enums/operation_type_enum.dart';
import 'package:flutter_template/core/enums/request_status_enum.dart';
import 'package:flutter_template/core/utils/general_utils.dart';
import 'package:get/get.dart';

class BaseController<T> extends GetxController {
  //UserRepository userRepository = Get.find<UserRepository>();

  bool get isOnline => connectivityStatus.value == ConnectivityStatus.ONLINE;

  Rx<ConnectivityStatus> connectivityStatus = ConnectivityStatus.ONLINE.obs;

  set setConnectivityStatus(ConnectivityStatus value) {
    connectivityStatus.value = value;
  }

  void listenForConnectivityStatus() {
    connectivityService.connectivityStatusController.stream.listen((event) {
      setConnectivityStatus = event;
    });
  }

  bool get isLoading =>
      rxRequestStatus == RequestStatus.LOADING &&
      rxOperationType == OperationType.NONE;

  final rxRequestStatus = RequestStatus.DEFAULT.obs;
  void setRxRequestStatus(RequestStatus _value) =>
      rxRequestStatus.value = _value;

  final rxOperationType = OperationType.NONE.obs;
  void setRxOperationType(OperationType _value) =>
      rxOperationType.value = _value;

  Future runFutuerFunction({required Future function}) async {
    await function;
  }

  Future runFutuerFunctionWithLoading({
    required Future function,
    OperationType type = OperationType.NONE,
  }) async {
    setRxRequestStatus(RequestStatus.LOADING);
    setRxOperationType(type);

    await function;
    setRxRequestStatus(RequestStatus.SUCESS);
    setRxOperationType(OperationType.NONE);
  }

  Future runFutureFunctionWithFullLoading({
    required Future function,
    OperationType? operationType = OperationType.NONE,
  }) async {
    // checkConnection(
    //   () async {
    customLoader();
    await function;
    BotToast.closeAllLoading();
    //   },
    // );
  }
}

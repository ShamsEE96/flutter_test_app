import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_template/core/enums/connectivity_status.dart';
import 'package:flutter_template/core/utils/network_util.dart';

class ConnectivityService {
  final Connectivity connectivity = Connectivity();
  StreamController<ConnectivityStatus> connectivityStatusController =
      StreamController<ConnectivityStatus>.broadcast();

  ConnectivityService() {
    connectivity.onConnectivityChanged.listen((event) {
      connectivityStatusController.add(getStatus(event));
      NetworkUtil.online = getStatus(event) == ConnectivityStatus.ONLINE;
    });
  }
  // test() async {
  //   final connectivityResult = await (Connectivity().checkConnectivity());
  //   if (connectivityResult == ConnectivityResult.mobile) {
  //     // I am connected to a mobile network.
  //   } else if (connectivityResult == ConnectivityResult.wifi) {
  //     // I am connected to a wifi network.
  //   } else if (connectivityResult == ConnectivityResult.ethernet) {
  //     // I am connected to a ethernet network.
  //   } else if (connectivityResult == ConnectivityResult.vpn) {
  //     // I am connected to a vpn network.
  //     // Note for iOS and macOS:
  //     // There is no separate network interface type for [vpn].
  //     // It returns [other] on any device (also simulator)
  //   } else if (connectivityResult == ConnectivityResult.bluetooth) {
  //     // I am connected to a bluetooth.
  //   } else if (connectivityResult == ConnectivityResult.other) {
  //     // I am connected to a network which is not in the above mentioned networks.
  //   } else if (connectivityResult == ConnectivityResult.none) {
  //     // I am not connected to any network.
  //   }
  // }

  ConnectivityStatus getStatus(ConnectivityResult result) {
    switch (result) {
      case ConnectivityResult.bluetooth:
        return ConnectivityStatus.ONLINE;

      case ConnectivityResult.wifi:
        return ConnectivityStatus.ONLINE;

      case ConnectivityResult.ethernet:
        return ConnectivityStatus.ONLINE;

      case ConnectivityResult.mobile:
        return ConnectivityStatus.ONLINE;

      case ConnectivityResult.none:
        return ConnectivityStatus.OFFLINE;

      case ConnectivityResult.vpn:
        return ConnectivityStatus.ONLINE;

      case ConnectivityResult.other:
        return ConnectivityStatus.ONLINE;
    }
  }
}

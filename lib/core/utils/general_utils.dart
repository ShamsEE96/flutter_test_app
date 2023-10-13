import 'dart:developer';

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_template/core/data/repository/shared_prefrence_repository.dart';
import 'package:flutter_template/core/services/connectivity_service.dart';
import 'package:flutter_template/core/services/language_service.dart';
import 'package:flutter_template/core/services/package_info_service.dart';
import 'package:flutter_template/ui/shared/colors.dart';
import 'package:flutter_template/ui/shared/custom_widgets/custom_toasts.dart';
import 'package:flutter_template/ui/shared/utils.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

void customLoader() => BotToast.showCustomLoading(
      toastBuilder: (cancelFunc) => Container(
        height: 75,
        width: 75,
        alignment: Alignment.center,
        child: SpinKitCircle(
          color: AppColors.fillColorButtonIcon,
        ),
        decoration: BoxDecoration(
          color: AppColors.fillColorNavBar,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      crossPage: true,
      align: Alignment.center,
    );

void showApiErrors({
  required dynamic errors,
  String logErrorName = "LOG ERROR :",
  MessageType messageType = MessageType.errorMessage,
}) {
  String _error = "Unknown error";
  if (errors != null) {
    if (errors is List) {
      if (errors.isNotEmpty) {
        _error = errors.join(", ");
      }
    }
    if (errors is Map) {
      if (errors.values.isNotEmpty) {
        _error = errors.values.join(", ");
      }
    }
    if (errors is String) {
      if (errors.isNotEmpty) {
        _error = errors;
      }
    }
  }
  log(_error, name: logErrorName);
  showAlertDialog(
      description: _error
          .replaceAll("[", "")
          .replaceAll("]", "")
          .replaceAll("{", "")
          .replaceAll("}", ""));
}

String deleteBrackets(String error) => error
    .replaceAll("[", "")
    .replaceAll("]", "")
    .replaceAll(")", "")
    .replaceAll("(", "")
    .replaceAll("{", "")
    .replaceAll("}", "");

String getErrorFromDynamicError(dynamic error) {
  String _error = "";
  if (error is String) {
    _error = deleteBrackets(error);
  }
  if (error is List) {
    _error = deleteBrackets(error.join(", "));
  }
  if (error is Map) {
    _error = deleteBrackets(error.values.join(", "));
  }
  return _error;
}

///Navigation

///Storage
SharedPreferencesRepository get storage =>
    Get.find<SharedPreferencesRepository>();

ConnectivityService get connectivityService => Get.find<ConnectivityService>();
LanguageService get languageService => Get.find<LanguageService>();
PackageInfoService get packageInfoService => Get.find<PackageInfoService>();

///
const Map<String, String> unKnownError = {"errors": "Unknown error"};

///TextInputFormatters
TextInputFormatter get doubleTextFormatter => FilteringTextInputFormatter.allow(
    new RegExp('^(?:-?(?:[0-9]+))?(?:\.[0-9]*)?(?:[eE][\+\-]?(?:[0-9]+))?'));

int? extractNumberFromString(String value) {
  return int.tryParse(value.replaceAll(new RegExp(r'[^0-9]'), ''));
}

// double width = Get.size.shortestSide;
// double height = Get.size.longestSide;
// Size size = Get.size;

// Size size = MediaQuery.of(appContext).size;

SizedBox verSpace(double space, BuildContext context) {
  Size size = MediaQuery.of(context).size;
  return SizedBox(
    height: size.height / (space),
  );
}

SizedBox horSpace(double space, BuildContext context) {
  Size size = MediaQuery.of(context).size;

  return SizedBox(
    width: size.width / (space),
  );
}

double screenWidthPercent(double percent, BuildContext context) {
  Size size = MediaQuery.of(context).size;

  return size.width / percent;
}

double screenHeightPercent(double percent, BuildContext context) {
  Size size = MediaQuery.of(context).size;

  return size.height / percent;
}

Map<String, dynamic> removeEmptyValueFromMap(Map<String, dynamic> map,
    {bool? justString}) {
  Map<String, dynamic> result = map;

  if (justString != null && justString) {
    result.removeWhere((key, value) =>
        value == null || (value is String && value.toString().isEmpty));
  } else {
    result.removeWhere((key, value) =>
        value == null ||
        (value is String && value.toString().isEmpty) ||
        (value is double && value == 0.0));
  }
  return result;
}

bool isNumeric(String s) {
  if (s.isNotEmpty) {
    return double.tryParse(s) != null;
  } else {
    return false;
  }
}

bool checkListNotEmpty(List? list) {
  return list != null && list.isNotEmpty;
}

String getTodayDate() {
  final DateFormat formatter = DateFormat(
    'EEEE, dd MMM yyyy',
    storage.getAppLanguage() == 'ar'
        ? "ar_SA"
        : storage.getAppLanguage() == 'en'
            ? "en_US"
            : "tr_TR",
  );
  return formatter.format(DateTime.now());
}

DateFormat baseDateFormat = DateFormat('MM/dd/yyyy');

int conatctCardId = 6;

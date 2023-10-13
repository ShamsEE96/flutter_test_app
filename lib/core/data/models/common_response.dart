import 'package:flutter_template/core/translation/translation_service.dart';

class CommonResponse<T> {
  int? statusCode;
  T? data;
  String? errors;
  String? message;

  CommonResponse.fromJson(dynamic json) {
    try {
      this.statusCode = json["statusCode"];
      if (this.statusCode == 200 ||
          this.statusCode == 201 ||
          this.statusCode == 204) {
        this.data = json['response'];
        message = json['response']['message'];
        // this.data = json['response']['data'];
        // message = json['response']['message'];
      } else {
        if (json["response"] != null && json["response"] is Map) {
          if (json["response"].values.isNotEmpty) {
            errors = json["response"].values.join(", ");
          }
        } else {
          switch (statusCode) {
            case 400:
              //  errors = tr("400_status_error_message");
              errors = "400_status_error_message";
              break;
            case 401:
              errors = tr("401_status_error_message");
              //errors = "401_status_error_message";
              break;
            case 404:
              errors = tr("404_status_error_message");
              // errors = "404_status_error_message";
              break;
            case 500:
              //   errors = tr("500_status_error_message");
              errors = "500_status_error_message";
              break;
            case 503:
              // errors = tr("503_status_error_message");
              errors = "503_status_error_message";
              break;

            default:
              //errors = tr("call_unknown_error");
              errors = "call_unknown_error";
          }
        }
      }
    } catch (e) {
      print(e.toString());
    }
  }

  int get getStatusCode => statusCode!;

  bool get getStatus => this.statusCode == 200 ? true : false;

  T get getData => data!;

  String get getError => errors!;
}

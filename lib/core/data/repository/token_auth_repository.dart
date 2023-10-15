import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:flutter_template/core/data/models/apis/token_info.dart';
import 'package:flutter_template/core/data/models/common_response.dart';
import 'package:flutter_template/core/data/network/endpoints/token_auth_endpoints.dart';
import 'package:flutter_template/core/data/network/network_config.dart';
import 'package:flutter_template/core/data/network/network_constants.dart';
import 'package:flutter_template/core/enums/request_type_enum.dart';
import 'package:flutter_template/core/utils/network_util.dart';

class TokenAuthRepository {
  Future<Either<String, TokenInfo>> authenticate({
    required String email,
    required String password,
    required String workspaceName,
  }) async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.POST,
        url: NetworkConstants.BASE_API + TokenAuthPoints.authenticate,
        headers: NetworkConfig.getHeaders(
          needAuth: false,
          type: RequestType.POST,
        ),
        body: {
          "ianaTimeZone": "Europe/Istanbul",
          "password": password.trim(),
          "rememberClient": false,
          "returnUrl": null,
          "singleSignIn": false,
          "tenantName": workspaceName.trim(),
          "userNameOrEmailAddress": email.trim(),
        },
        // body: {
        //   "ianaTimeZone": "Europe/Istanbul",
        //   "password": "Shams@1234",
        //   "rememberClient": false,
        //   "returnUrl": null,
        //   "singleSignIn": false,
        //   "tenantName": "babysteps",
        //   "userNameOrEmailAddress": "abdulrahman.shamse@gmail.com"
        // },
      ).then(
        (response) {
          CommonResponse commonResponse =
              CommonResponse<dynamic>.fromJson(response);

          if (commonResponse.getStatus) {
            return Right(
              TokenInfo.fromJson(commonResponse.getData),
            );
          } else {
            return Left(commonResponse.message ?? commonResponse.errors ?? '');
          }
        },
      );
    } catch (e) {
      log(e.toString());

      return Left(e.toString());
    }
  }
}

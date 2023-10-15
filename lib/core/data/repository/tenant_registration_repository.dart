import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:flutter_template/core/data/models/apis/tenant_profile_model.dart';
import 'package:flutter_template/core/data/models/common_response.dart';
import 'package:flutter_template/core/data/network/endpoints/tenant_registration_endpoints.dart';
import 'package:flutter_template/core/data/network/network_config.dart';
import 'package:flutter_template/core/enums/request_type_enum.dart';
import 'package:flutter_template/core/utils/general_utils.dart';
import 'package:flutter_template/core/utils/network_util.dart';

class TenantRegistrationRepository {
  Future<Either<String, TenantProfileModel>> registerTenant({
    required String email,
    required String firstName,
    required String lastName,
    required String password,
    required String workspaceName,
  }) async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.POST,
        url: TenantRegistrationPoints.registerTenant,
        headers: NetworkConfig.getHeaders(
          needAuth: false,
          type: RequestType.POST,
        ),
        body: {
          "adminEmailAddress": email.trim(),
          "adminFirstName": firstName.trim(),
          "adminLastName": lastName.trim(),
          "adminPassword": password,
          "captchaResponse": null,
          "editionId": 1,
          "name": workspaceName.trim(),
          "tenancyName": workspaceName.trim(),
        },
        params: {
          // "timeZone": "",
          "timeZone": currentTimeZone,
        },
      ).then(
        (response) {
          CommonResponse commonResponse =
              CommonResponse<dynamic>.fromJson(response);

          if (commonResponse.getStatus) {
            return Right(
              TenantProfileModel.fromJson(commonResponse.getData),
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

import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:flutter_template/core/data/models/apis/tenant_state_model.dart';
import 'package:flutter_template/core/data/models/common_response.dart';
import 'package:flutter_template/core/data/network/endpoints/account_endpoints.dart';
import 'package:flutter_template/core/data/network/network_config.dart';
import 'package:flutter_template/core/enums/request_type_enum.dart';
import 'package:flutter_template/core/utils/network_util.dart';

class AccountRepository {
  Future<Either<String, TenantStateModel>> isTenantAvailable({
    required String workspaceName,
  }) async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.POST,
        url: AccountPoints.isTenantAvailable,
        headers: NetworkConfig.getHeaders(
          needAuth: false,
          type: RequestType.POST,
        ),
        body: {
          "tenancyName": workspaceName.trim(),
        },
      ).then(
        (response) {
          CommonResponse commonResponse =
              CommonResponse<dynamic>.fromJson(response);

          if (commonResponse.getStatus) {
            return Right(
              TenantStateModel.fromJson(commonResponse.getData),
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

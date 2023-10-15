import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:flutter_template/core/data/models/apis/login_info_model.dart';
import 'package:flutter_template/core/data/models/common_response.dart';
import 'package:flutter_template/core/data/network/endpoints/session_endpoints.dart';
import 'package:flutter_template/core/data/network/network_config.dart';
import 'package:flutter_template/core/enums/request_type_enum.dart';
import 'package:flutter_template/core/utils/network_util.dart';

class SessionRepository {
  Future<Either<String, LoginInformationModel>>
      getCurrentLoginInformations() async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.GET,
        url: SessionPoints.getCurrentLoginInformations,
        headers: NetworkConfig.getHeaders(
          needAuth: true,
          type: RequestType.GET,
        ),
      ).then(
        (response) {
          CommonResponse commonResponse =
              CommonResponse<dynamic>.fromJson(response);

          if (commonResponse.getStatus) {
            return Right(
              LoginInformationModel.fromJson(commonResponse.getData),
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
//   static Map<String, String> headers = {
//     'Content-Type': 'application/json',
//     'Access-Control-Allow-Origin': '*',
//     'Access-Control-Allow-Methods': 'POST, GET, OPTIONS, PUT, DELETE, HEAD',
//     'Access-Control-Allow-Headers':
//         'custId, appId, Origin, Content-Type, Cookie, X-CSRF-TOKEN, Accept, Authorization, X-XSRF-TOKEN, Access-Control-Allow-Origin',
//     'Access-Control-Max-Age': '3600'
//   };

//   Future<Either<String, TokenInfo>> login({
//     required AuthGrantType authGrantType,
//     required String username,
//     required String password,
//     String? refreshToken,
//   }) async {
//     try {
//       return NetworkUtil.sendRequest(
//           type: RequestType.POST,
//           url: AuthPoints.login,
//           headers: NetworkConfig.getHeaders(),
//           body: {
//             "grantType": "$authGrantType",
//             "userName": "$username",
//             "password": "$password",
//             "refreshToken": "$refreshToken"
//           }).then((response) {
//         CommonResponse commonResponse =
//             CommonResponse<dynamic>.fromJson(response);

//         if (commonResponse.getStatus) {
//           storage.setTokenInfo(TokenInfo.fromJson(commonResponse.getData));
//           return Right(TokenInfo.fromJson(commonResponse.getData));
//         } else {
//           return Left(commonResponse.message ?? commonResponse.errors ?? '');
//         }
//       });
//     } catch (e) {
//       log(e.toString());

//       return Left(e.toString());
//     }
//   }

//   // Future<Either<String, TokenInfo>> refreshToken(
//   //     {required String token}) async {
//   //   try {
//   //     return NetworkUtil.post(
//   //         url: '/token/refresh',
//   //         headers: NetworkConfig.getHeaders(headers),
//   //         body: jsonEncode({"Token": "$token"})).then((response) {
//   //       CommonResponse commonResponse =
//   //           CommonResponse<dynamic>.fromJson(response);

//   //       if (commonResponse.getStatus) {
//   //         storage.saveTokenInfo(TokenInfo.fromJson(commonResponse.getData));
//   //         return Right(TokenInfo.fromJson(commonResponse.getData));
//   //       } else {
//   //         return Left(commonResponse.message ?? '');
//   //       }
//   //     });
//   //   } catch (e) {
//   //     log(e.toString());

//   //     return Left(e.toString());
//   //   }
//   // }
}

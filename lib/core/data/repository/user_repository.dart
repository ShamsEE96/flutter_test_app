// import 'dart:developer';

// import 'package:dartz/dartz.dart';
// import 'package:fluttergetxframework/core/data/models/apis/token_info.dart';
// import 'package:fluttergetxframework/core/data/models/common_response.dart';
// import 'package:fluttergetxframework/core/data/network/endpoints/auth_endpoints.dart';
// import 'package:fluttergetxframework/core/data/network/network_config.dart';
// import 'package:fluttergetxframework/core/enums/auth_grant_type.dart';
// import 'package:fluttergetxframework/core/enums/request_type_enum.dart';
// import 'package:fluttergetxframework/core/utils/general_utils.dart';
// import 'package:fluttergetxframework/core/utils/network_util.dart';

// class UserRepository {
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
// }

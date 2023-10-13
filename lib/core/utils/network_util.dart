import 'dart:convert';

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter_template/core/enums/request_type_enum.dart';
import 'package:flutter_template/core/translation/translation_service.dart';
import 'package:flutter_template/ui/shared/custom_widgets/custom_toasts.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:path/path.dart' as path;

class NetworkUtil {
  static String baseUrl = 'training.owner-tech.com';

  static var client = http.Client();
  static bool online = true;

  static Future<dynamic> sendRequest({
    required RequestType type,
    required String url,
    Map<String, dynamic>? params,
    Map<String, String>? headers,
    Map<String, dynamic>? body,
  }) async {
    try {
      if (!online) {
        BotToast.cleanAll();
        CustomToasts.showMessage(
          message: tr("check_connection"),
          messageType: MessageType.alertMessage,
          duration: 5,
        );
        BotToast.closeAllLoading();
        return;
      }

      var uri = Uri.https(baseUrl, url, params);
      late http.Response response;

      Map<String, dynamic> jsonResponse = {};

      switch (type) {
        case RequestType.GET:
          response = await client.get(uri, headers: headers);
          break;
        case RequestType.POST:
          response =
              await client.post(uri, headers: headers, body: jsonEncode(body));
          break;
        case RequestType.PUT:
          response =
              await client.put(uri, headers: headers, body: jsonEncode(body));
          break;
        case RequestType.DELETE:
          response = await client.delete(uri,
              headers: headers, body: jsonEncode(body));
          break;
        case RequestType.MULTIPART:
          break;
      }

      dynamic result;
      try {
        result = jsonDecode(utf8.decode(response.bodyBytes));
      } catch (e) {}

      jsonResponse.putIfAbsent('statusCode', () => response.statusCode);
      jsonResponse.putIfAbsent('response',
          () => result ?? {'general': utf8.decode(response.bodyBytes)});

      return jsonResponse;
    } catch (e) {
      print(e);
      BotToast.showText(text: e.toString());
    }
  }

  static Future<dynamic> sendMultipartRequest({
    required String url,
    required RequestType type,
    Map<String, dynamic>? params,
    Map<String, String>? headers = const {},
    Map<String, String>? fields = const {},
    Map<String, String>? files = const {},
  }) async {
    try {
      var request =
          http.MultipartRequest(type.name, Uri.https(baseUrl, url, params));
      if (files!.isNotEmpty) {
        var _filesKeyList = files.keys.toList();
        var _filesNameList = files.values.toList();

        for (int i = 0; i < _filesKeyList.length; i++) {
          if (_filesNameList[i].isNotEmpty) {
            var multipartFile = http.MultipartFile.fromPath(
              _filesKeyList[i],
              _filesNameList[i],
              filename: path.basename(_filesNameList[i]),
              contentType: getContentType(_filesNameList[i]),
            );
            request.files.add(await multipartFile);
          }
        }
      }

      request.headers.addAll(headers!);
      request.fields.addAll(fields!);

      var response = await request.send();

      Map<String, dynamic> responseJson = {};
      var value;
      try {
        value = await response.stream.bytesToString();
      } catch (e) {
        print(e);
      }

      responseJson.putIfAbsent('statusCode', () => response.statusCode);
      // responseJson.putIfAbsent('response', () => jsonDecode(value));
      responseJson.putIfAbsent(
          'response',
          () => value is String
              ? {'general': value}
              // () => value == "" && response.statusCode == 200
              //     ? {'title': 'Register Successful!'}
              : jsonDecode(value));

      return responseJson;
    } catch (error) {
      print(error.toString());
    }
  }

  static MediaType getContentType(String name) {
    var ext = name.split('.').last;
    if (ext == "png" || ext == "jpeg") {
      return MediaType.parse("image/jpg");
    } else if (ext == 'pdf') {
      return MediaType.parse("application/pdf");
    } else {
      return MediaType.parse("image/jpg");
    }
  }

  static Future<dynamic> downloadFile({
    required String url,
    Map<String, String>? headers,
  }) async {
    try {
      if (!online) {
        BotToast.cleanAll();
        CustomToasts.showMessage(
          message: tr("check_connection"),
          messageType: MessageType.alertMessage,
          duration: 5,
        );
        BotToast.closeAllLoading();
        return;
      }

      var uri = Uri.parse(url);
      late http.Response response;

      Map<String, dynamic> jsonResponse = {};
      // Create a new HTTP client.

      // Make a GET request to the URL.
      response = await client.get(uri, headers: headers);

      // Check if the response status code is 200.
      // if (response.statusCode != 200) {
      //   throw Exception(
      //       'Failed to download VCF file. Status code: ${response.statusCode}');
      // }
      dynamic result;
      try {
        // result = jsonDecode(utf8.decode(response.bodyBytes));
        result = response.bodyBytes;
      } catch (e) {}

      jsonResponse.putIfAbsent('statusCode', () => response.statusCode);
      jsonResponse.putIfAbsent('response',
          () => result ?? {'general': utf8.decode(response.bodyBytes)});

      return jsonResponse;
      // Get the local path where the VCF file will be saved.
      // final directory = await getApplicationDocumentsDirectory();
      // final path = '${directory.path}/vcf.vcf';

      // // Write the VCF file to the local path.
      // final file = await File(path).writeAsBytes(response.bodyBytes);

      // // Return the local file.
      // return file;
    } catch (e) {
      print(e);
      BotToast.showText(text: e.toString());
    }
  }
}

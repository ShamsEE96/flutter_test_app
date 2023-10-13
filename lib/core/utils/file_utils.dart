import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_template/core/data/models/file_type_model.dart';
import 'package:flutter_template/core/enums/file_type.dart';
import 'package:flutter_template/core/utils/general_utils.dart';

import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

class FileUtil {
  static final ImagePicker picker = ImagePicker();

  static Future<FileTypeModel> pickFile({
    required FileTypeEnum type,
    int? imageQuality,
  }) async {
    String? path;
    switch (type) {
      case FileTypeEnum.GALLERY:
        await picker
            .pickImage(
              source: ImageSource.gallery,
              imageQuality: imageQuality,
            )
            .then((value) => path = value?.path ?? '');
        break;
      case FileTypeEnum.CAMERA:
        await picker
            .pickImage(
              source: ImageSource.camera,
              imageQuality: imageQuality,
            )
            .then((value) => path = value?.path ?? '');
        break;
      case FileTypeEnum.FILE:
        // await FilePicker.platform
        //     .pickFiles()
        //     .then((value) => path = value?.paths[0] ?? '');
        break;
    }

    return FileTypeModel(path: path ?? '', type: type);
  }

  static Future<File> downloadFile({
    required String url,
    String filename = 'my_vcf.vcf',
  }) async {
    String? bearerToken = storage.getTokenInfo()!.accessToken;
    var httpClient = new HttpClient();
    try {
      var request = await httpClient.postUrl(Uri.parse(url));
      request.headers.set('Authorization', 'Bearer $bearerToken');
      var response = await request.close();
      var bytes = await consolidateHttpClientResponseBytes(response);

      // Get the path to the internal storage Downloads folder.
      final downloadsDirectory = await getDownloadsDirectory();

      // Create a file in the internal storage Downloads folder.
      final file = File('${downloadsDirectory!.path}/$filename');

      // Write the bytes to the file.
      await file.writeAsBytes(bytes);

      return file;
    } catch (error) {
      print('pdf downloading error = $error');
      return File('');
    }
  }
  // static Future<File> downloadFile({
  //   required String url,
  //   String filename = 'my_vcf.vcf',
  // }) async {
  //   String? bearerToken = storage.getTokenInfo()!.accessToken;
  //   var httpClient = new HttpClient();
  //   try {
  //     var request = await httpClient.postUrl(Uri.parse(url));
  //     request.headers.set('Authorization', 'Bearer $bearerToken');
  //     var response = await request.close();
  //     var bytes = await consolidateHttpClientResponseBytes(response);
  //     final dir =
  //         await getTemporaryDirectory(); //(await getApplicationDocumentsDirectory()).path;
  //     File file = new File('${dir.path}/$filename');
  //     await file.writeAsBytes(bytes);
  //     print('downloaded file path = ${file.path}');
  //     return file;
  //   } catch (error) {
  //     print('pdf downloading error = $error');
  //     return File('');
  //   }
  // }
}

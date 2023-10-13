// import 'package:flutter_template/core/enums/url_type.dart';
// import 'package:flutter_template/ui/shared/custom_widgets/custom_toasts.dart';

// class UrlLauncherUtil {
//   Future<void> startLaunchUrl({
//     required Uri url,
//     required UrlType type,
//     String path = "",
//   }) async {
//     switch (type) {
//       case UrlType.WEB:
//         await _launchWEB(url);
//         break;
//       case UrlType.EMAIL:
//         await _launchEMAIL(path);
//         break;
//       case UrlType.PHONE:
//         await _launchPHONE(path);
//         break;
//       case UrlType.SMS:
//         await _launchSMS(path);
//         break;
//     }
//   }

//   Future<void> _launchWEB(Uri url) async {
//     if (!await launchUrl(url,
//         mode: LaunchMode.externalApplication,
//         webViewConfiguration: WebViewConfiguration()))
//       CustomToasts.showMessage(
//         message: 'cant launch url',
//         messageType: MessageType.errorMessage,
//       );
//   }

//   Future<void> _launchEMAIL(String EMAIL) async {
//     final Uri uri = createUri(scheme: 'mailto', path: EMAIL);
//     if (!await launchUrl(uri))
//       CustomToasts.showMessage(
//         message: 'cant launch url',
//         messageType: MessageType.errorMessage,
//       );
//   }

//   Future<void> _launchPHONE(String PHONE) async {
//     final Uri uri = createUri(scheme: 'tel', path: PHONE);
//     if (!await launchUrl(uri))
//       CustomToasts.showMessage(
//         message: 'cant launch url',
//         messageType: MessageType.errorMessage,
//       );
//   }

//   Future<void> _launchSMS(String PHONE) async {
//     final Uri uri = createUri(scheme: 'SMS', path: PHONE);
//     if (!await launchUrl(uri))
//       CustomToasts.showMessage(
//         message: 'cant launch url',
//         messageType: MessageType.errorMessage,
//       );
//   }

//   Uri createUri({
//     String? scheme,
//     String? path,
//     String? query,
//     Map<String, dynamic>? queryParameters,
//   }) {
//     return Uri(
//       scheme: scheme,
//       path: path,
//       query: query,
//       queryParameters: queryParameters,
//     );
//   }
// }

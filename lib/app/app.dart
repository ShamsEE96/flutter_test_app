import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_template/core/enums/connectivity_status.dart';
import 'package:flutter_template/core/translation/translation_service.dart';
import 'package:flutter_template/core/utils/general_utils.dart';
import 'package:flutter_template/ui/shared/colors.dart';
import 'package:flutter_template/ui/views/splash_view/splash_view.dart';

import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'startup_binding.dart';

class App extends StatefulWidget {
  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        // statusBarBrightness: Brightness.light
        systemNavigationBarColor: AppColors.transparentColor,
        systemNavigationBarDividerColor: AppColors.transparentColor,
        statusBarColor: AppColors.transparentColor,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    return StreamProvider<ConnectivityStatus>(
      initialData: ConnectivityStatus.ONLINE,
      create: (context) =>
          connectivityService.connectivityStatusController.stream,
      child: GetMaterialApp(
        textDirection: languageService.getLocale() == Locale('ar', 'SA')
            ? TextDirection.rtl
            : TextDirection.ltr,
        title: 'Workiom Flutter Test',
        locale: languageService.getLocale(),
        fallbackLocale: languageService.getLocale(),
        builder: BotToastInit(),
        translations: AppTranslations(),
        // scrollBehavior: ScrollBehavior().copyWith(overscroll: false),
        theme: ThemeData(
          fontFamily: 'Rubik',
          primaryColor: AppColors.orangeColor,
        ),
        debugShowCheckedModeBanner: false,
        navigatorObservers: [BotToastNavigatorObserver()],
        initialBinding: StartupBinding(),
        home: SplashView(),
      ),
    );
  }
}

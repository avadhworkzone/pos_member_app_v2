import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:member_app_v2/common/app_initial_bindings.dart';
import 'package:member_app_v2/common/localization/app_localization.dart';
import 'package:member_app_v2/modules/splash/view/splash_screen.dart';

import '../theme/app_theme.dart';

Widget getMaterialApp(BuildContext context) {
  return GetMaterialApp(
    enableLog: !kReleaseMode,
    theme: appLightTheme(context),
    darkTheme: appDarkTheme(context),
    debugShowCheckedModeBanner: false,
    locale: AppLocalization.locale,
    fallbackLocale: AppLocalization.fallbackLocale,
    translations: AppLocalization(),
    builder: (context, child) {
      return protectFromSettingsFontSize(context, child!);
    },
    home: const SplashScreenWidget(),
    initialBinding: AppInitialBindings(),
  );
}

MediaQuery protectFromSettingsFontSize(BuildContext context, Widget child) {
  final mediaQueryData = MediaQuery.of(context);
  // Font size change(either reduce or increase) from phone setting should not impact app font size
  final scale = mediaQueryData.textScaleFactor.clamp(1.0, 1.0);
  return MediaQuery(
    data: MediaQuery.of(context).copyWith(textScaleFactor: scale),
    child: child,
  );
}

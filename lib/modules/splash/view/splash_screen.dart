import 'package:flutter/material.dart';
import 'package:focus_detector/focus_detector.dart';
import 'package:get/get.dart';
import 'package:member_app_v2/common/color_constants.dart';
import 'package:member_app_v2/common/image_assets.dart';
import 'package:member_app_v2/common/size_constants.dart';
import 'package:member_app_v2/modules/splash/splash_controller.dart';

class SplashScreenWidget extends StatefulWidget {
  const SplashScreenWidget({super.key});

  @override
  State<SplashScreenWidget> createState() => _SplashScreenWidgetState();
}

class _SplashScreenWidgetState extends State<SplashScreenWidget> {
  SplashController splashController = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _buildSplashScreenWidgetView());
  }

  _buildSplashScreenWidgetView() {
    SizeConstants(context);
    return FocusDetector(
        onVisibilityGained: () => splashController.getToken(),
        child: SafeArea(
          child: Container(
              alignment: Alignment.center,
              color: ColorConstants.kPrimaryColor,
              child: SizedBox(
                height: SizeConstants.width * 0.25,
                width: SizeConstants.width * 0.25,
                child: Image.asset(ImageAssets.imageArianiLogo),
              )),
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:focus_detector/focus_detector.dart';
import 'package:get/get.dart';
import 'package:member_app_v2/common/app_strings.dart';
import 'package:member_app_v2/common/color_constants.dart';
import 'package:member_app_v2/common/image_assets.dart';
import 'package:member_app_v2/common/text_styles_constants.dart';
import 'package:member_app_v2/common/widget/app_image_widget.dart';
import 'package:member_app_v2/modules/welcome/welcome_controller.dart';

class WelcomeScreenWidget extends StatefulWidget {
  final bool isNewUser;
  const WelcomeScreenWidget({super.key, this.isNewUser = true});

  @override
  State<WelcomeScreenWidget> createState() => _WelcomeScreenWidgetState();
}

class _WelcomeScreenWidgetState extends State<WelcomeScreenWidget> {
  WelcomeScreenController controller = Get.put(WelcomeScreenController());

  @override
  void initState() {
    super.initState();
    controller.isNewUser = widget.isNewUser;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FocusDetector(
      onFocusGained: () => controller.redirect(),
      child: Container(
        color: ColorConstants.kPrimaryColor,
        height: Get.height,
        width: Get.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(AppStrings.welcomeTo,
                style: getTitleText(size: 36.0, fontStyle: FontStyle.italic)),
            const SizedBox(height: 10),
            AppImageWidget(
                asset: ImageAssets.imageArianiLogo, height: 120, width: 120),
            const SizedBox(height: 2),
            Text(AppStrings.family, style: getTitleText(size: 24.0)),
          ],
        ),
      ),
    ));
  }
}

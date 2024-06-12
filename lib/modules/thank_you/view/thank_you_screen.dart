import 'package:flutter/material.dart';
import 'package:focus_detector/focus_detector.dart';
import 'package:get/get.dart';
import 'package:member_app_v2/common/app_strings.dart';
import 'package:member_app_v2/common/color_constants.dart';
import 'package:member_app_v2/common/image_assets.dart';
import 'package:member_app_v2/common/size_constants.dart';
import 'package:member_app_v2/common/text_styles_constants.dart';
import 'package:member_app_v2/modules/thank_you/thank_you_controller.dart';

class ThankYouScreenWidget extends StatefulWidget {
  final bool isNewUser;
  const ThankYouScreenWidget({super.key, this.isNewUser = true});

  @override
  State<ThankYouScreenWidget> createState() => _ThankYouScreenWidgetState();
}

class _ThankYouScreenWidgetState extends State<ThankYouScreenWidget> {
  ThankYouController thankYouController = Get.put(ThankYouController());

  @override
  void initState() {
    super.initState();
    thankYouController.isNewUser = widget.isNewUser;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FocusDetector(
      onFocusGained: () => thankYouController.navigateToWelcome(),
      child: Container(
        color: Colors.white,
        width: SizeConstants.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              ImageAssets.imageThankYou,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              AppStrings.thankYou,
              style: getTextSemiBold(colors: Colors.black, size: 22.0),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              widget.isNewUser
                  ? AppStrings.verificationSuccessMessage
                  : AppStrings.loginSuccessMessage,
              textAlign: TextAlign.center,
              style:
                  getTextRegular(size: 16.0, colors: ColorConstants.cHintText),
            )
          ],
        ),
      ),
    ));
  }
}

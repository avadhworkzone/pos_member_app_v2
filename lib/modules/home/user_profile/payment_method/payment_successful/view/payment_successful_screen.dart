import 'package:flutter/material.dart';
import 'package:focus_detector/focus_detector.dart';
import 'package:get/get.dart';
import 'package:member_app_v2/common/app_strings.dart';
import 'package:member_app_v2/common/appbars_constants.dart';
import 'package:member_app_v2/common/button_constants.dart';
import 'package:member_app_v2/common/color_constants.dart';
import 'package:member_app_v2/common/image_assets.dart';
import 'package:member_app_v2/common/size_constants.dart';
import 'package:member_app_v2/common/text_styles_constants.dart';

class PaymentSuccessfulScreenWidget extends StatefulWidget {
  const PaymentSuccessfulScreenWidget({super.key});

  @override
  State<PaymentSuccessfulScreenWidget> createState() =>
      _PaymentSuccessfulScreenWidgetState();
}

class _PaymentSuccessfulScreenWidgetState
    extends State<PaymentSuccessfulScreenWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBars.arianiAppBar(
            title: Text(AppStrings.paymentSuccessful,
                style: getTextSemiBold(
                  colors: ColorConstants.cNavyBlueColor,
                  size: SizeConstants.s1 * 18,
                )),
            leading: IconButton(
                onPressed: () => navigateBack(),
                icon: const Icon(
                  Icons.arrow_back,
                  color: ColorConstants.cNavyBlueColor,
                )),
            noActions: true,
            backgroundColor: Colors.white),
        body: _buildMyPaymentSuccessfulScreenScreenWidgetView());
  }

  _buildMyPaymentSuccessfulScreenScreenWidgetView() {
    return FocusDetector(
        onVisibilityGained: () {},
        child: SafeArea(
            child: SizedBox(
          width: SizeConstants.width,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          ImageAssets.imageThankYou,
                          height: SizeConstants.s1*70,
                          width: SizeConstants.s1*70,
                          fit: BoxFit.cover,
                        ),
                         SizedBox(
                          height: SizeConstants.s1*20,
                        ),
                        Text(
                          AppStrings.paymentSuccessful,
                          style: getTextSemiBold(colors:  ColorConstants.cNavyBlueColor, size: SizeConstants.s1*20),
                        ),
                         SizedBox(
                          height: SizeConstants.s1*15,
                        ),
                        Text(
                          AppStrings.thankYouForShoppingWithUs,
                          style:
                          getTextRegular(size: SizeConstants.s1*14, colors: ColorConstants.cHintText),
                        )
                      ],
                    )),
                rectangleButton(
                    onTap: () {},
                    sButtonTitle: AppStrings.backToHomepage,
                    dButtonWidth: SizeConstants.width),
              ]),
        )));
  }

  navigateBack() {
    Get.back();
  }
}

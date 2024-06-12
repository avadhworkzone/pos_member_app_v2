import 'package:flutter/material.dart';
import 'package:focus_detector/focus_detector.dart';
import 'package:get/get.dart';
import 'package:member_app_v2/common/app_strings.dart';
import 'package:member_app_v2/common/appbars_constants.dart';
import 'package:member_app_v2/common/color_constants.dart';
import 'package:member_app_v2/common/image_assets.dart';
import 'package:member_app_v2/common/size_constants.dart';
import 'package:member_app_v2/common/text_styles_constants.dart';

class ProcessingPaymentScreenWidget extends StatefulWidget {
  const ProcessingPaymentScreenWidget({super.key});

  @override
  State<ProcessingPaymentScreenWidget> createState() =>
      _ProcessingPaymentScreenWidgetState();
}

class _ProcessingPaymentScreenWidgetState
    extends State<ProcessingPaymentScreenWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBars.arianiAppBar(
            title: Text(AppStrings.processingPayment,
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
        body: _buildMyProcessingPaymentScreenScreenWidgetView());
  }

  _buildMyProcessingPaymentScreenScreenWidgetView() {
    return FocusDetector(
        onVisibilityGained: () {},
        child: SafeArea(
            child: Container(
          width: SizeConstants.width,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(ImageAssets.iconSplashPayment,
                    width: SizeConstants.s1 * 120,
                    height: SizeConstants.s1 * 120,
                    fit: BoxFit.fitHeight),
              ]),
        )));
  }

  navigateBack() {
    Get.back();
  }
}

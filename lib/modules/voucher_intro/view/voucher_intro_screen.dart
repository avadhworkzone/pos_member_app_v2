import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:member_app_v2/common/app_strings.dart';
import 'package:member_app_v2/common/button_constants.dart';
import 'package:member_app_v2/common/color_constants.dart';
import 'package:member_app_v2/common/text_styles_constants.dart';
import 'package:member_app_v2/modules/voucher_intro/voucher_intro_controller.dart';

class VoucherIntroScreenWidget extends StatefulWidget {
  const VoucherIntroScreenWidget({super.key});

  @override
  State<VoucherIntroScreenWidget> createState() =>
      _VoucherIntroScreenWidgetState();
}

class _VoucherIntroScreenWidgetState extends State<VoucherIntroScreenWidget> {
  VoucherIntroController voucherIntroController =
      Get.put(VoucherIntroController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(18.0),
        color: ColorConstants.kPrimaryColor,
        child: Column(children: [
          const SizedBox(height: 16),
          Align(
            alignment: Alignment.centerRight,
            child: textButton(
                appbarActionInterface: (_) =>
                    voucherIntroController.skipIntro(),
                sButtonTitle: AppStrings.skipIntro,
                cButtonTextColor: Colors.white,
                dButtonTextSize: 18.0),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Enjoy RM20 off", style: getTextBold(size: 28.0)),
                const SizedBox(height: 12),
                Text("On your first purchase in Ariani app!*",
                    style: getTextMedium(size: 16.0)),
                const SizedBox(height: 32),
                rectangleButton(
                    onTap: () {},
                    dButtonWidth: Get.width,
                    sButtonTitle: "${AppStrings.useCode}: Ariani20",
                    cButtonBackGroundColor: Colors.white,
                    cButtonTextColor: Colors.black)
              ],
            ),
          )
        ]),
      ),
    );
  }
}

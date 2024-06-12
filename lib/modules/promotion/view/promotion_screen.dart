import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:member_app_v2/common/app_strings.dart';
import 'package:member_app_v2/common/button_constants.dart';
import 'package:member_app_v2/common/image_assets.dart';
import 'package:member_app_v2/common/size_constants.dart';
import 'package:member_app_v2/common/text_styles_constants.dart';
import 'package:member_app_v2/modules/promotion/promotion_controller.dart';

class PromotionScreenWidget extends StatefulWidget {
  const PromotionScreenWidget({super.key});

  @override
  State<PromotionScreenWidget> createState() => _PromotionScreenWidgetState();
}

class _PromotionScreenWidgetState extends State<PromotionScreenWidget> {
  PromotionController promotionController = Get.put(PromotionController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: Get.width,
          height: Get.height,
          child: Stack(children: [
            Image.asset(
              ImageAssets.imagePromotion,
              fit: BoxFit.fill,
              height: Get.height,
              width: Get.width,
            ),
            Padding(
              padding: EdgeInsets.all(SizeConstants.s_16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    alignment: Alignment.centerRight,
                    child: textButton(
                        appbarActionInterface: (val) =>
                            promotionController.skip(),
                        sButtonTitle: AppStrings.skipIntro,
                        cButtonTextColor: Colors.white,
                        dButtonTextSize: 16.0),
                  ),
                  Column(
                    children: [
                      Text(AppStrings.promotionCaption,
                          style: getTextBold(size: 24.0)),
                      SizedBox(height: SizeConstants.s_12),
                      Text(AppStrings.promotionSubtitle,
                          textAlign: TextAlign.center,
                          style: getTextMedium(size: 14.0)),
                      SizedBox(height: SizeConstants.s_30),
                    ],
                  )
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:member_app_v2/common/app_strings.dart';
import 'package:member_app_v2/common/appbars_constants.dart';
import 'package:member_app_v2/common/color_constants.dart';
import 'package:member_app_v2/common/text_styles_constants.dart';
import 'package:member_app_v2/modules/checkout/checkout_controller.dart';

class ShippingOptionsScreenWidget extends StatefulWidget {
  const ShippingOptionsScreenWidget({super.key});

  @override
  State<ShippingOptionsScreenWidget> createState() =>
      _ShippingOptionsScreenWidgetState();
}

class _ShippingOptionsScreenWidgetState
    extends State<ShippingOptionsScreenWidget> {
  CheckoutController checkoutController = Get.find<CheckoutController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBars.arianiAppBar(title: Text(AppStrings.chooseShippingOptions)),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          menuTile("Ship (Order will be ship to your address)", null, null),
          const Divider(),
          menuTile("Pick up (you pick up order from store)", null, null),
          const Divider(),
        ],
      ),
    );
  }

  Widget menuTile(String title, String? subtitle, String? price) {
    return GestureDetector(
      onTap: () {
        checkoutController.selectedShippingOptions.value = title;
        Get.back();
      },
      behavior: HitTestBehavior.translucent,
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: getTextBold(
                        size: 18.0, colors: ColorConstants.cPrimaryTextColor),
                  ),
                  if (subtitle != null) ...[
                    const SizedBox(height: 5),
                    Text(
                      subtitle,
                      style: getTextMedium(
                          size: 16.0, colors: ColorConstants.cPrimaryTextColor),
                    )
                  ]
                ],
              ),
            ),
            if (price != null) ...[
              Text(
                price,
                style: getTextBold(
                    size: 18.0, colors: ColorConstants.kPrimaryColor),
              )
            ]
          ],
        ),
      ),
    );
  }
}

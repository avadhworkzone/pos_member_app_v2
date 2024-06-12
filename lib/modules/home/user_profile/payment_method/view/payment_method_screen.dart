import 'package:flutter/material.dart';
import 'package:focus_detector/focus_detector.dart';
import 'package:get/get.dart';
import 'package:member_app_v2/common/app_strings.dart';
import 'package:member_app_v2/common/appbars_constants.dart';
import 'package:member_app_v2/common/color_constants.dart';
import 'package:member_app_v2/common/image_assets.dart';
import 'package:member_app_v2/common/size_constants.dart';
import 'package:member_app_v2/common/text_styles_constants.dart';
import 'package:member_app_v2/modules/checkout/checkout_controller.dart';
import 'package:member_app_v2/modules/home/user_profile/payment_method/payment_failed/view/payment_failed_screen.dart';
import 'package:member_app_v2/modules/home/user_profile/payment_method/payment_successful/view/payment_successful_screen.dart';
import 'package:member_app_v2/modules/home/user_profile/payment_method/processing_payment/view/processing_payment_screen.dart';

class PaymentMethodScreenWidget extends StatefulWidget {
  const PaymentMethodScreenWidget({super.key});

  @override
  State<PaymentMethodScreenWidget> createState() =>
      _PaymentMethodScreenWidgetState();
}

class _PaymentMethodScreenWidgetState extends State<PaymentMethodScreenWidget> {
  CheckoutController checkoutController = Get.find<CheckoutController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBars.arianiAppBar(
            title: Text(AppStrings.choosePaymentMethod,
                style: getTextSemiBold(
                  colors: ColorConstants.cWhite,
                  size: SizeConstants.s1 * 18,
                )),
            noActions: true),
        body: _buildMyPaymentMethodScreenScreenWidgetView());
  }

  _buildMyPaymentMethodScreenScreenWidgetView() {
    return FocusDetector(
        onVisibilityGained: () {},
        child: SafeArea(
            child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
              SizedBox(
                height: SizeConstants.s1 * 10,
              ),
              menuTile(
                ImageAssets.onlineBank,
                AppStrings.onlineBanking,
              ),
              const Divider(color: ColorConstants.cDividerColor),
              menuTile(
                ImageAssets.creditDebitCard,
                AppStrings.creditDebitCard,
              ),
              const Divider(color: ColorConstants.cDividerColor),
              menuTile(
                ImageAssets.grab,
                AppStrings.payLaterByGrab,
              ),
              const Divider(color: ColorConstants.cDividerColor),
              menuTile(
                ImageAssets.frame,
                AppStrings.shopBack,
              ),
              const Divider(color: ColorConstants.cDividerColor),
            ]))));
  }

  navigateBack() {
    Get.back();
  }

  menuTile(String leadingIcon, String title) {
    return ListTile(
      contentPadding: EdgeInsets.only(
          left: SizeConstants.s1 * 15, right: SizeConstants.s1 * 15),
      onTap: () {
        switch (title) {
          case "Online Banking":
            checkoutController.selectedPaymentMethod.value = title;
            Get.back();
            //Get.to(() => const ProcessingPaymentScreenWidget());
            break;
          case "Credit/Debit Card":
            checkoutController.selectedPaymentMethod.value = title;
            Get.back();
            //Get.to(() => const PaymentSuccessfulScreenWidget());
            break;
          case "Pay Later by Grab":
            checkoutController.selectedPaymentMethod.value = title;
            Get.back();
            //Get.to(() => const PaymentFailedScreenWidget());
            break;
          case "Shop Back":
            checkoutController.selectedPaymentMethod.value = title;
            Get.back();
            // Get.to(() => const ChangeAddressScreenWidget());
            break;
        }
      },
      iconColor: ColorConstants.kPrimaryColor,
      leading: Container(
        width: SizeConstants.s1 * 22,
        height: SizeConstants.s1 * 23,
        alignment: Alignment.bottomCenter,
        child: Image.asset(leadingIcon,
            width: SizeConstants.s1 * 20,
            height: SizeConstants.s1 * 20,
            fit: BoxFit.cover),
      ),
      title: Text(title),
      titleTextStyle: getTextMedium(
          colors: ColorConstants.cNavyBlueColor, size: SizeConstants.s1 * 18),
      horizontalTitleGap: 0,
    );
  }
}

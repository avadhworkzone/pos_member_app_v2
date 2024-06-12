import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:member_app_v2/common/app_strings.dart';
import 'package:member_app_v2/common/appbars_constants.dart';
import 'package:member_app_v2/common/button_constants.dart';
import 'package:member_app_v2/common/color_constants.dart';
import 'package:member_app_v2/common/text_styles_constants.dart';
import 'package:member_app_v2/common/widget/app_getx_future_builder.dart';
import 'package:member_app_v2/modules/cart/cart_controller.dart';
import 'package:member_app_v2/modules/cart/model/cart_summary_response_model.dart';
import 'package:member_app_v2/modules/cart/widget/cart_item_widget.dart';
import 'package:member_app_v2/modules/checkout/checkout_controller.dart';
import 'package:member_app_v2/modules/home/user_profile/payment_method/processing_payment/view/processing_payment_screen.dart';
import 'package:member_app_v2/modules/home/user_profile/payment_method/view/payment_method_screen.dart';
import 'package:member_app_v2/modules/shipping_options/view/shipping_options_screen.dart';

class CheckoutScreenWidget extends StatefulWidget {
  const CheckoutScreenWidget({super.key});

  @override
  State<CheckoutScreenWidget> createState() => _CheckoutScreenWidgetState();
}

class _CheckoutScreenWidgetState extends State<CheckoutScreenWidget> {
  CartScreenController cartScreenController = Get.find<CartScreenController>();
  CheckoutController checkoutController = Get.put(CheckoutController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBars.arianiAppBar(
          title: Text(AppStrings.checkout), noActions: true),
      body: AppGetXFutureBuilder<CartSummaryResponseModel>(
        controller: cartScreenController,
        builder: (data) {
          return Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(AppStrings.products.toUpperCase(),
                            style: getTextSemiBold(
                                size: 14.0,
                                colors: ColorConstants.cPrimaryTextColor)),
                      ),
                      const SizedBox(height: 8),
                      Column(
                        children: data?.cartItems
                                ?.map<Widget>((e) => CartItemWidget(
                                      isCartData: true,
                                      cartScreenController:
                                          cartScreenController,
                                      price: ((e.price?.subTotal ?? 0.0) *
                                              (e.quantity ?? 0))
                                          .toStringAsFixed(2),
                                      color: e.itemVariant?.color?.name,
                                      size: e.itemVariant?.size?.name,
                                      image: e.item?.coverPic,
                                      itemId: e.itemId,
                                      itemVariantId: e.itemVariantId,
                                      productName: e.item?.name,
                                      quantity: e.quantity,
                                    ))
                                .toList() ??
                            [],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(AppStrings.shippingDetails.toUpperCase(),
                            style: getTextSemiBold(
                                size: 14.0,
                                colors: ColorConstants.cPrimaryTextColor)),
                      ),
                      sectionItem(
                          icon: Icons.location_on_outlined,
                          title: AppStrings.deliveryAddress,
                          subtitle: "Maisarah Ali",
                          contact: "+60123456789",
                          description:
                              "No 1, Jalan 2, \n Apartment 3 \n 42500 Petaling Jaya"),
                      const Divider(),
                      Obx(() => sectionItem(
                          icon: Icons.delivery_dining_outlined,
                          title: AppStrings.shippingOptions,
                          //subtitle: AppStrings.standardDelivery,
                          description: checkoutController
                                  .selectedShippingOptions.value.isNotEmpty
                              ? checkoutController.selectedShippingOptions.value
                              : AppStrings.noShippingMethodSelected,
                          //price: "RM2.00",
                          onTap: () => Get.to(
                              () => const ShippingOptionsScreenWidget()))),
                      const Divider(),
                      sectionItem(
                          icon: Icons.card_giftcard_outlined,
                          title: AppStrings.vouchers,
                          description: AppStrings.noVouchersSelected),
                      const Divider(),
                      Obx(() => sectionItem(
                          icon: Icons.credit_card,
                          title: AppStrings.paymentMethod,
                          description: checkoutController
                                  .selectedPaymentMethod.value.isNotEmpty
                              ? checkoutController.selectedPaymentMethod.value
                              : AppStrings.noPaymentMethodSelected,
                          onTap: () =>
                              Get.to(() => const PaymentMethodScreenWidget()))),
                      const Divider(),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(AppStrings.subtotal,
                                style: getTextBold(
                                    size: 18.0,
                                    colors: ColorConstants.cPrimaryTextColor)),
                            Text(
                                "RM ${data?.subTotal?.toStringAsFixed(2) ?? 0.0}",
                                style: getTextBold(
                                    size: 18.0,
                                    colors: ColorConstants.kPrimaryColor))
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(AppStrings.discountAmount,
                                style: getTextBold(
                                    size: 18.0,
                                    colors: ColorConstants.cPrimaryTextColor)),
                            Text(
                                "RM ${data?.totalDiscount?.toStringAsFixed(2) ?? 0.0}",
                                style: getTextBold(
                                    size: 18.0,
                                    colors: ColorConstants.kPrimaryColor))
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                                AppStrings.tax(
                                    data?.taxPercent?.toStringAsFixed(2) ??
                                        "0.0"),
                                style: getTextBold(
                                    size: 18.0,
                                    colors: ColorConstants.cPrimaryTextColor)),
                            Text(
                                "RM ${cartScreenController.cartSummaryResponseModel?.tax?.toStringAsFixed(2) ?? 0.0}",
                                style: getTextBold(
                                    size: 18.0,
                                    colors: ColorConstants.kPrimaryColor))
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(AppStrings.total,
                                style: getTextBold(
                                    size: 18.0,
                                    colors: ColorConstants.cPrimaryTextColor)),
                            Text("RM ${data?.total?.toStringAsFixed(2) ?? 0.0}",
                                style: getTextBold(
                                    size: 18.0,
                                    colors: ColorConstants.kPrimaryColor))
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              rectangleButton(
                  onTap: () =>
                      Get.to(() => const ProcessingPaymentScreenWidget()),
                  sButtonTitle: AppStrings.proceedToPayment,
                  dButtonWidth: Get.width,
                  dButtonTextSize: 16.0)
            ],
          );
        },
      ),
    );
  }

  Widget sectionItem(
      {required IconData icon,
      required String title,
      String? subtitle,
      String? contact,
      required String description,
      String? price,
      Function? onTap}) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => onTap?.call(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    icon,
                    color: ColorConstants.kPrimaryColor,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(title,
                            style: getTextBold(
                                size: 18.0,
                                colors: ColorConstants.cPrimaryTextColor)),
                        const SizedBox(
                          height: 5,
                        ),
                        if (subtitle != null) ...[
                          const SizedBox(
                            height: 5,
                          ),
                          Text(subtitle,
                              style: getTextMedium(
                                  size: 16.0,
                                  colors: ColorConstants.cPrimaryTextColor)),
                        ],
                        if (contact != null) ...[
                          const SizedBox(
                            height: 5,
                          ),
                          Text(contact,
                              style: getTextMedium(
                                  size: 16.0,
                                  colors: ColorConstants.cPrimaryTextColor)),
                        ],
                        const SizedBox(
                          height: 5,
                        ),
                        Text(description,
                            style: getTextMedium(
                                size: 16.0,
                                colors: ColorConstants.cPrimaryTextColor)),
                      ],
                    ),
                  )
                ],
              ),
            ),
            if (price != null) ...[
              Row(
                children: [
                  Text(
                    price,
                    style: getTextBold(
                        size: 18.0, colors: ColorConstants.kPrimaryColor),
                  ),
                  const Icon(
                    Icons.arrow_forward_ios,
                    color: ColorConstants.kPrimaryColor,
                  ),
                ],
              )
            ] else ...[
              const Icon(
                Icons.arrow_forward_ios,
                color: ColorConstants.kPrimaryColor,
              ),
            ]
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:member_app_v2/common/app_strings.dart';
import 'package:member_app_v2/common/appbars_constants.dart';
import 'package:member_app_v2/common/button_constants.dart';
import 'package:member_app_v2/common/image_assets.dart';
import 'package:member_app_v2/common/widget/app_getx_future_builder.dart';
import 'package:member_app_v2/modules/cart/cart_controller.dart';
import 'package:member_app_v2/modules/cart/model/cart_summary_response_model.dart';
import 'package:member_app_v2/modules/cart/widget/cart_item_widget.dart';
import 'package:member_app_v2/modules/product_detail/view/product_detail_screen.dart';

class CartScreenWidget extends StatefulWidget {
  const CartScreenWidget({super.key});

  @override
  State<CartScreenWidget> createState() => _CartScreenWidgetState();
}

class _CartScreenWidgetState extends State<CartScreenWidget> {
  CartScreenController cartScreenController = Get.find<CartScreenController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBars.arianiAppBar(
          title: Text(AppStrings.cartTitle), noActions: true),
      body: AppGetXFutureBuilder<CartSummaryResponseModel>(
        controller: cartScreenController,
        image: ImageAssets.imageCartEmpty,
        emptyDataTitle: AppStrings.cartEmptyMessage,
        builder: (data) {
          return SizedBox(
            height: Get.height,
            child: Column(
              children: [
                Expanded(
                  child: GetBuilder<CartScreenController>(builder: (context) {
                    return ListView.builder(
                      itemCount: data?.cartItems?.length,
                      itemBuilder: (context,
                              index) => /* SwipeActionCell(
                          index: index,
                          key: UniqueKey(),
                          controller:
                              cartScreenController.swipeActionController,
                          trailingActions: <SwipeAction>[
                            SwipeAction(
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.white,
                              ),
                              onTap: cartScreenController.onDeleteItem,
                              color: ColorConstants.cError,
                            ),
                          ],
                          selectedForegroundColor: Colors.transparent,
                          selectedIndicator: const Icon(
                            Icons.check_box,
                            color: ColorConstants.kPrimaryColor,
                          ),
                          unselectedIndicator: const Icon(
                            Icons.check_box_outline_blank,
                            color: ColorConstants.kPrimaryColor,
                          ),
                          child: GestureDetector(
                              behavior: HitTestBehavior.translucent,
                              onLongPress: () => cartScreenController
                                  .startEditingModeForItemSelection(),
                              onTap: () {
                                Get.to(() => ProductDetailScreenWidget(
                                    id: data?.cartItems?[index].itemId ?? 0,
                                    name: data?.cartItems?[index].item?.name ??
                                        ""));
                              },
                              child: CartItemWidget(
                                isCartData: true,
                                cartScreenController: cartScreenController,
                                price: ((data?.cartItems?[index].price
                                                ?.subTotal ??
                                            0.0) *
                                        (data?.cartItems?[index].quantity ?? 0))
                                    .toStringAsFixed(2),
                                color: data?.cartItems?[index].itemVariant
                                    ?.color?.name,
                                size: data
                                    ?.cartItems?[index].itemVariant?.size?.name,
                                image: data?.cartItems?[index].item?.coverPic,
                                itemId: data?.cartItems?[index].itemId,
                                itemVariantId:
                                    data?.cartItems?[index].itemVariantId,
                                productName: data?.cartItems?[index].item?.name,
                                quantity: data?.cartItems?[index].quantity,
                              ))) */
                          GestureDetector(
                              behavior: HitTestBehavior.translucent,
                              /* onLongPress: () => cartScreenController
                                  .startEditingModeForItemSelection(), */
                              onTap: () {
                                Get.to(() => ProductDetailScreenWidget(
                                    id: data?.cartItems?[index].itemId ?? 0,
                                    name: data?.cartItems?[index].item?.name ??
                                        ""));
                              },
                              child: CartItemWidget(
                                isCartData: true,
                                cartScreenController: cartScreenController,
                                price: ((data?.cartItems?[index].price
                                                ?.subTotal ??
                                            0.0) *
                                        (data?.cartItems?[index].quantity ?? 0))
                                    .toStringAsFixed(2),
                                color: data?.cartItems?[index].itemVariant
                                    ?.color?.name,
                                size: data
                                    ?.cartItems?[index].itemVariant?.size?.name,
                                image: data?.cartItems?[index].item?.coverPic,
                                itemId: data?.cartItems?[index].itemId,
                                itemVariantId:
                                    data?.cartItems?[index].itemVariantId,
                                productName: data?.cartItems?[index].item?.name,
                                quantity: data?.cartItems?[index].quantity,
                              )),
                    );
                  }),
                ),
                rectangleButton(
                    onTap: () => cartScreenController.proceedToCheckout(),
                    sButtonTitle: AppStrings.checkout,
                    dButtonWidth: Get.width,
                    dButtonTextSize: 16.0)
              ],
            ),
          );
        },
      ),
    );
  }
}

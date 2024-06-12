import 'package:flutter/material.dart';
import 'package:member_app_v2/common/color_constants.dart';
import 'package:member_app_v2/common/text_styles_constants.dart';
import 'package:member_app_v2/common/widget/app_image_widget.dart';
import 'package:member_app_v2/modules/cart/cart_controller.dart';

class CartItemWidget extends StatelessWidget {
  final String? image, productName, color, size, price;
  final int? quantity, itemId, itemVariantId;
  final bool isCartData;
  final CartScreenController? cartScreenController;

  CartItemWidget(
      {super.key,
      this.image,
      this.productName,
      this.color,
      this.size,
      this.price,
      this.quantity,
      this.itemId,
      this.itemVariantId,
      this.cartScreenController,
      required this.isCartData});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
      child: Row(
        children: [
          Container(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: ColorConstants.cDividerColor)),
              child: AppImageWidget(asset: image, height: 130, width: 130)),
          const SizedBox(
            width: 20,
          ),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productName ?? "",
                  style: getTextBold(
                      size: 18.0, colors: ColorConstants.cPrimaryTextColor),
                ),
                if (isCartData) ...[
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      /* DropdownButtonHideUnderline(
                        child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: ColorConstants.cDividerColor),
                          borderRadius: BorderRadius.circular(5.0)),
                      child: DropdownButton<String>(
                        isDense: true,
                        value: "A",
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        icon: const Icon(Icons.keyboard_arrow_down,
                            color: ColorConstants.kPrimaryColor),
                        items: <String>['A', 'B', 'C', 'D'].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value,
                                style: getTextMedium(
                                    size: 16.0,
                                    colors: ColorConstants.cPrimaryTextColor)),
                          );
                        }).toList(),
                        onChanged: (_) {},
                      ),
                    )), */
                      Container(
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                            border:
                                Border.all(color: ColorConstants.cDividerColor),
                            borderRadius: BorderRadius.circular(5.0)),
                        child: Text(
                          color ?? "",
                          style: getTextSemiBold(
                              colors: ColorConstants.cPrimaryTextColor,
                              size: 14.0),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                            border:
                                Border.all(color: ColorConstants.cDividerColor),
                            borderRadius: BorderRadius.circular(5.0)),
                        child: Text(
                          size ?? "",
                          style: getTextSemiBold(
                              colors: ColorConstants.cPrimaryTextColor,
                              size: 14.0),
                        ),
                      )
                      /* DropdownButtonHideUnderline(
                        child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: ColorConstants.cDividerColor),
                          borderRadius: BorderRadius.circular(5.0)),
                      child: DropdownButton<String>(
                        isDense: true,
                        value: "D",
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        icon: const Icon(Icons.keyboard_arrow_down,
                            color: ColorConstants.kPrimaryColor),
                        items: <String>['A', 'B', 'C', 'D'].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (_) {},
                      ),
                    )) */
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () => cartScreenController?.changeQuantity(
                            itemId ?? 0, itemVariantId ?? 0, true),
                        behavior: HitTestBehavior.translucent,
                        child: Container(
                          height: 35,
                          decoration: BoxDecoration(
                              color: ColorConstants.cDividerMoreLightColor,
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(5.0),
                                  bottomLeft: Radius.circular(5.0)),
                              border: Border.all(
                                  color: ColorConstants.cDividerColor)),
                          child: const Center(
                              child: Icon(
                            Icons.add,
                            color: ColorConstants.kPrimaryColor,
                            size: 32,
                          )),
                        ),
                      ),
                      Container(
                        height: 35,
                        constraints: const BoxConstraints(minWidth: 40),
                        decoration: const BoxDecoration(
                            border: Border.symmetric(
                                horizontal: BorderSide(
                                    color: ColorConstants.cDividerColor))),
                        child: Center(
                            child: Text(quantity?.toString() ?? "",
                                style: getTextSemiBold(
                                    size: 16.0,
                                    colors: ColorConstants.cPrimaryTextColor))),
                      ),
                      GestureDetector(
                        onTap: () => cartScreenController?.changeQuantity(
                            itemId ?? 0, itemVariantId ?? 0, false),
                        behavior: HitTestBehavior.translucent,
                        child: Container(
                          height: 35,
                          decoration: BoxDecoration(
                              color: ColorConstants.cDividerMoreLightColor,
                              borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(5.0),
                                  bottomRight: Radius.circular(5.0)),
                              border: Border.all(
                                  color: ColorConstants.cDividerColor)),
                          child: const Center(
                              child: Icon(
                            Icons.remove,
                            color: ColorConstants.kPrimaryColor,
                            size: 32,
                          )),
                        ),
                      )
                    ],
                  ),
                ],
                const SizedBox(height: 8),
                Text(
                  "RM $price",
                  style: getTextBold(
                      colors: ColorConstants.kPrimaryColor, size: 17.0),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

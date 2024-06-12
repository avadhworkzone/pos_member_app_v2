import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:member_app_v2/common/app_strings.dart';
import 'package:member_app_v2/common/appbars_constants.dart';
import 'package:member_app_v2/common/button_constants.dart';
import 'package:member_app_v2/common/color_constants.dart';
import 'package:member_app_v2/common/image_assets.dart';
import 'package:member_app_v2/common/text_styles_constants.dart';
import 'package:member_app_v2/common/widget/app_expandable_widget.dart';
import 'package:member_app_v2/common/widget/app_getx_future_builder.dart';
import 'package:member_app_v2/common/widget/app_image_widget.dart';
import 'package:member_app_v2/modules/home/home_screen/home_screen_controller.dart';
import 'package:member_app_v2/modules/product_detail/model/item_response.dart';
import 'package:member_app_v2/modules/product_detail/product_detail_controller.dart';

class ProductDetailScreenWidget extends StatefulWidget {
  final int id;
  final String name;
  const ProductDetailScreenWidget(
      {super.key, required this.id, required this.name});

  @override
  State<ProductDetailScreenWidget> createState() =>
      _ProductDetailScreenWidgetState();
}

class _ProductDetailScreenWidgetState extends State<ProductDetailScreenWidget> {
  ProductDetailController productDetailController =
      Get.put(ProductDetailController());
  HomeScreenController homeScreenController = Get.find<HomeScreenController>();

  @override
  void initState() {
    productDetailController.id = widget.id;
    productDetailController.productName = widget.name;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBars.arianiAppBar(
          title: Text(productDetailController.productName ?? ""),
        ),
        body: AppGetXFutureBuilder<ItemReponse>(
          controller: productDetailController,
          builder: (data) {
            return Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            CarouselSlider(
                              carouselController:
                                  productDetailController.carouselController,
                              options: CarouselOptions(
                                  height: Get.height * 0.6,
                                  viewportFraction: 1.0,
                                  enableInfiniteScroll: false,
                                  onPageChanged: (index, reason) =>
                                      productDetailController
                                          .activeProductImageIndex
                                          .value = index),
                              items: productDetailController.mediaUrls.map((i) {
                                return Builder(
                                  builder: (BuildContext context) {
                                    return Container(
                                      color: Colors.white,
                                      child: AppImageWidget(
                                        asset: i,
                                        width: Get.width,
                                        height: Get.height * 0.6,
                                        fit: BoxFit.contain,
                                      ),
                                    );
                                  },
                                );
                              }).toList(),
                            ),
                            Container(
                              padding: const EdgeInsets.only(left: 16),
                              alignment: Alignment.centerLeft,
                              child: GestureDetector(
                                  onTap: () => productDetailController
                                      .carouselController
                                      .previousPage(),
                                  child: Container(
                                    height: 35,
                                    width: 35,
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: ColorConstants.cDividerColor),
                                    child: const Center(
                                      child: Icon(
                                        Icons.arrow_back,
                                        color: ColorConstants.kPrimaryColor,
                                      ),
                                    ),
                                  )),
                            ),
                            Container(
                              padding: const EdgeInsets.only(right: 16),
                              alignment: Alignment.centerRight,
                              child: GestureDetector(
                                  onTap: () => productDetailController
                                      .carouselController
                                      .nextPage(),
                                  child: Container(
                                    height: 35,
                                    width: 35,
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: ColorConstants.cDividerColor),
                                    child: const Center(
                                      child: Icon(
                                        Icons.arrow_forward,
                                        color: ColorConstants.kPrimaryColor,
                                      ),
                                    ),
                                  )),
                            ),

                            /* Container(
                                  width: Get.width,
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 14.0, horizontal: 16),
                                  child: Wrap(
                                    alignment: WrapAlignment.center,
                                    runSpacing: 10,
                                    children: productDetailController.mediaUrls
                                        .asMap()
                                        .entries
                                        .map((e) => Obx(() => Container(
                                              height: 10,
                                              width: 10,
                                              margin: const EdgeInsets.only(
                                                  right: 8),
                                              decoration: BoxDecoration(
                                                  color: productDetailController
                                                              .activeProductImageIndex
                                                              .value !=
                                                          e.key
                                                      ? Colors.white
                                                      : ColorConstants
                                                          .kPrimaryColor,
                                                  shape: BoxShape.circle),
                                            )))
                                        .toList(),
                                  ),
                                ), */
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              /* Text(
                                data?.data?.name ?? "",
                                style: getTextMedium(
                                    colors: ColorConstants.cPrimaryTextColor,
                                    size: 14.0),
                              ),
                              const SizedBox(height: 8), */
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        data?.data?.name ?? "",
                                        style: getTextBold(
                                            colors:
                                                ColorConstants.cDarkTextColor,
                                            size: 20.0),
                                      ),
                                      const SizedBox(height: 5),
                                      Row(
                                        children: [
                                          Text(
                                            "RM ${data?.data?.originalPrice?.toStringAsFixed(2) ?? 0.00}",
                                            style: getTextBold(
                                                colors: ColorConstants
                                                    .kPrimaryColor,
                                                size: 18.0),
                                          ),
                                          /* const SizedBox(width: 8),
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 8, vertical: 3),
                                            decoration: const BoxDecoration(
                                                color: ColorConstants
                                                    .kPrimaryColor),
                                            child: Text(
                                              "30% OFF",
                                              style: getTextBold(size: 10.0),
                                            ),
                                          ) */
                                        ],
                                      )
                                    ],
                                  ),
                                  IconButton(
                                      onPressed: () => productDetailController
                                          .addRemoveWishlist(),
                                      icon: Obx(() => Icon(
                                            productDetailController
                                                    .isWishlist.value
                                                ? Icons.favorite_sharp
                                                : Icons.favorite_border,
                                            size: 30,
                                            color: ColorConstants.kPrimaryColor,
                                          )))
                                ],
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              /* Text(
                                "${AppStrings.refNo.toUpperCase()}  XXXXXXXX  |  ${AppStrings.color.toUpperCase()}  NAVY",
                                style: getTextMedium(
                                    colors: ColorConstants.cDarkTextColor,
                                    size: 14.0),
                              ),
                              const SizedBox(height: 24), */
                              Text(
                                "${AppStrings.brand}: ${data?.data?.brand?.name ?? ""}",
                                style: getTextMedium(
                                    colors: ColorConstants.cGrayColor,
                                    size: 16.0),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                "${AppStrings.shipping}: ${AppStrings.calculatedAtCheckout}",
                                style: getTextMedium(
                                    colors: ColorConstants.cGrayColor,
                                    size: 16.0),
                              ),
                              const SizedBox(height: 24),
                              Text(
                                AppStrings.color,
                                style: getTextSemiBold(
                                    colors: ColorConstants.cPrimaryTextColor,
                                    size: 14.0),
                              ),
                              const SizedBox(height: 24),
                              GetBuilder<ProductDetailController>(
                                  builder: (controller) {
                                return SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                      children: controller.allVariants.entries
                                          .map((e) => Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 10.0),
                                                child: GestureDetector(
                                                  behavior: HitTestBehavior
                                                      .translucent,
                                                  onTap: () => controller
                                                      .changeColorVariant(
                                                          e.key),
                                                  child: Container(
                                                    height: 45,
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    decoration: BoxDecoration(
                                                        color: controller
                                                                    .selectedColorVariant ==
                                                                e.key
                                                            ? ColorConstants
                                                                .cNavyBlueColor
                                                            : Colors
                                                                .transparent,
                                                        border: Border.all(
                                                            color: ColorConstants
                                                                .cDarkTextColor)),
                                                    child: Center(
                                                        child: Text(
                                                      e.key,
                                                      style: getTextBold(
                                                          colors: controller
                                                                      .selectedColorVariant ==
                                                                  e.key
                                                              ? Colors.white
                                                              : ColorConstants
                                                                  .cNavyBlueColor,
                                                          size: 18.0),
                                                    )),
                                                  ),
                                                ),
                                              ))
                                          .toList()),
                                );
                              }),
                              GetBuilder<ProductDetailController>(
                                  builder: (controller) {
                                return Visibility(
                                    visible: controller
                                        .selectedColorVariant.isNotEmpty,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(height: 24),
                                        Text(
                                          AppStrings.size,
                                          style: getTextSemiBold(
                                              colors: ColorConstants
                                                  .cPrimaryTextColor,
                                              size: 14.0),
                                        ),
                                        const SizedBox(height: 14),
                                        SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: Row(
                                              children: controller
                                                      .allVariants[controller
                                                          .selectedColorVariant]
                                                      ?.map((e) => Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .only(
                                                                    right:
                                                                        10.0),
                                                            child:
                                                                GestureDetector(
                                                              behavior:
                                                                  HitTestBehavior
                                                                      .translucent,
                                                              onTap: () =>
                                                                  controller
                                                                      .changeSizeVariant(
                                                                          e),
                                                              child: Container(
                                                                constraints:
                                                                    const BoxConstraints(
                                                                        minWidth:
                                                                            45),
                                                                height: 45,
                                                                padding:
                                                                    const EdgeInsets
                                                                        .all(
                                                                        8.0),
                                                                decoration: BoxDecoration(
                                                                    color: controller.selectedSizeVariant ==
                                                                            e
                                                                        ? ColorConstants
                                                                            .cNavyBlueColor
                                                                        : Colors
                                                                            .transparent,
                                                                    border: Border.all(
                                                                        color: ColorConstants
                                                                            .cDarkTextColor)),
                                                                child: Center(
                                                                    child: Text(
                                                                  e,
                                                                  style: getTextBold(
                                                                      colors: controller.selectedSizeVariant == e
                                                                          ? Colors
                                                                              .white
                                                                          : ColorConstants
                                                                              .cNavyBlueColor,
                                                                      size:
                                                                          18.0),
                                                                )),
                                                              ),
                                                            ),
                                                          ))
                                                      .toList() ??
                                                  []),
                                        ),
                                      ],
                                    ));
                              }),
                              if (productDetailController.qunatity.value >
                                  0) ...[
                                const SizedBox(height: 24),
                                Text(
                                  AppStrings.quantity,
                                  style: getTextSemiBold(
                                      colors: ColorConstants.cPrimaryTextColor,
                                      size: 14.0),
                                ),
                                const SizedBox(height: 14),
                                Row(
                                  children: [
                                    GestureDetector(
                                      behavior: HitTestBehavior.translucent,
                                      onTap: () => productDetailController
                                          .removQunatity(),
                                      child: Container(
                                        width: 45,
                                        height: 45,
                                        margin:
                                            const EdgeInsets.only(right: 16),
                                        padding: const EdgeInsets.all(8.0),
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: ColorConstants
                                                    .cDarkTextColor)),
                                        child: const Center(
                                            child:
                                                Icon(Icons.remove, size: 30)),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        height: 45,
                                        padding: const EdgeInsets.all(8.0),
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: ColorConstants
                                                    .cDarkTextColor)),
                                        child: Center(
                                            child: Obx(() => Text(
                                                  productDetailController
                                                      .qunatity.value
                                                      .toString(),
                                                  style: getTextBold(
                                                      colors: ColorConstants
                                                          .cNavyBlueColor,
                                                      size: 18.0),
                                                ))),
                                      ),
                                    ),
                                    GestureDetector(
                                      behavior: HitTestBehavior.translucent,
                                      onTap: () =>
                                          productDetailController.addQuantity(),
                                      child: Container(
                                        width: 45,
                                        height: 45,
                                        margin: const EdgeInsets.only(left: 16),
                                        padding: const EdgeInsets.all(8.0),
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: ColorConstants
                                                    .cDarkTextColor)),
                                        child: const Center(
                                            child: Icon(Icons.add, size: 30)),
                                      ),
                                    )
                                  ],
                                ),
                              ]
                            ],
                          ),
                        ),
                        const Divider(thickness: 2),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: AppExpandableWidget(
                              title: AppStrings.productDescription,
                              subtitle: data?.data?.description ?? ""),
                        ),
                        /* const Divider(thickness: 2),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: AppExpandableWidget(
                              title: AppStrings.returnExchange,
                              subtitle:
                                  "Review our return & exchange policy before returning items.Contact us at returnariani@gmail.com.Sale and discounted items cannot be exchanged, returned, or refunded."),
                        ),
                        const Divider(thickness: 2),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: AppExpandableWidget(
                              title: AppStrings.shippingDelivery,
                              subtitle:
                                  "Review our return & exchange policy before returning items.Contact us at returnariani@gmail.com.Sale and discounted items cannot be exchanged, returned, or refunded."),
                        ),
                        const Divider(thickness: 2),
                        const SizedBox(height: 16),
                        Center(
                          child: Text(
                            AppStrings.youMightLike,
                            style: getTextBold(
                                colors: ColorConstants.cDarkTextColor,
                                size: 18.0),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [_simillarProduct(), _simillarProduct()],
                          ),
                        ),
                        const SizedBox(height: 16), */
                      ],
                    ),
                  ),
                ),
                if (productDetailController.qunatity.value == 0) ...[
                  rectangleButton(
                    onTap: () => productDetailController.addToBag(),
                    sButtonTitle: AppStrings.addToBag,
                    dButtonWidth: Get.width,
                  )
                ]
              ],
            );
          },
        ));
  }

  _simillarProduct() {
    return SizedBox(
      width: Get.width / 2.3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(4.0)),
            child: Image.asset(
              ImageAssets.imageNewRelease,
              width: Get.width / 2.3,
              height: 250,
              fit: BoxFit.fill,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            "Shawl 249 Embroidery Iris In Lavender",
            maxLines: 2,
            style: getTextSemiBold(
                colors: ColorConstants.cDarkTextColor, size: 15.0),
          ),
          const SizedBox(height: 8),
          Text(
            "RM 119.99",
            maxLines: 2,
            style: getTextMedium(
                colors: ColorConstants.cPrimaryTextColor, size: 14.0),
          ),
        ],
      ),
    );
  }
}

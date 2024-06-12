import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:member_app_v2/common/app_strings.dart';
import 'package:member_app_v2/common/appbars_constants.dart';
import 'package:member_app_v2/common/color_constants.dart';
import 'package:member_app_v2/common/widget/app_getx_future_builder.dart';
import 'package:member_app_v2/modules/cart/widget/cart_item_widget.dart';
import 'package:member_app_v2/modules/product_detail/view/product_detail_screen.dart';
import 'package:member_app_v2/modules/wishlist/model/wishlist_response_model.dart';
import 'package:member_app_v2/modules/wishlist/wishlist_controller.dart';

class WishListScreenWidget extends StatefulWidget {
  const WishListScreenWidget({super.key});

  @override
  State<WishListScreenWidget> createState() => _WishListScreenWidgetState();
}

class _WishListScreenWidgetState extends State<WishListScreenWidget> {
  WishListController wishListController = Get.put(WishListController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBars.arianiAppBar(title: Text(AppStrings.myWishlist)),
      body: AppGetXFutureBuilder<WishlistResponseModel>(
        controller: wishListController,
        builder: (data) {
          return ListView.separated(
              itemCount: data?.data?.length ?? 0,
              separatorBuilder: (context, index) => const Divider(),
              itemBuilder: (context,
                      index) => /* SwipeActionCell(
                  key: UniqueKey(),
                  trailingActions: <SwipeAction>[
                    SwipeAction(
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.white,
                      ),
                      onTap: (handler) {
                        wishListController.onDeleteItem(handler, index);
                      },
                      color: ColorConstants.cError,
                    ),
                  ],
                  child: GestureDetector(
                    onTap: () {
                      Get.to(() => ProductDetailScreenWidget(
                          id: data?.data?[index].id ?? 0,
                          name: data?.data?[index].name ?? ""));
                    },
                    child: CartItemWidget(
                      isCartData: false,
                      image: data?.data?[index].coverPic,
                      productName: data?.data?[index].name,
                      price:
                          data?.data?[index].originalPrice?.toStringAsFixed(2),
                    ),
                  )) */
                  GestureDetector(
                    onTap: () {
                      Get.to(() => ProductDetailScreenWidget(
                          id: data?.data?[index].id ?? 0,
                          name: data?.data?[index].name ?? ""));
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: CartItemWidget(
                            isCartData: false,
                            image: data?.data?[index].coverPic,
                            productName: data?.data?[index].name,
                            price: data?.data?[index].originalPrice
                                ?.toStringAsFixed(2),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.favorite,
                            color: ColorConstants.kPrimaryColor,
                            size: 30,
                          ),
                          onPressed: () {
                            wishListController.onDeleteItem(index);
                          },
                        )
                      ],
                    ),
                  ));
        },
      ),
    );
  }
}

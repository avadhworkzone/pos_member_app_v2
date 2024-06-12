import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:member_app_v2/common/app_strings.dart';
import 'package:member_app_v2/common/appbars_constants.dart';
import 'package:member_app_v2/common/color_constants.dart';
import 'package:member_app_v2/common/text_styles_constants.dart';
import 'package:member_app_v2/common/widget/app_getx_future_builder.dart';
import 'package:member_app_v2/common/widget/app_image_widget.dart';
import 'package:member_app_v2/modules/home/home_tab/model/items_response.dart';
import 'package:member_app_v2/modules/product_detail/view/product_detail_screen.dart';
import 'package:member_app_v2/modules/recently_viewed/recently_viewd_controller.dart';

class RecentlyViewedScreenWidget extends StatefulWidget {
  const RecentlyViewedScreenWidget({super.key});

  @override
  State<RecentlyViewedScreenWidget> createState() =>
      _RecentlyViewedScreenWidgetState();
}

class _RecentlyViewedScreenWidgetState
    extends State<RecentlyViewedScreenWidget> {
  RecentlyViewedController recentlyViewedController =
      Get.put(RecentlyViewedController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBars.arianiAppBar(title: Text(AppStrings.recentlyViewd)),
      body: AppGetXFutureBuilder<ItemsReponse>(
        controller: recentlyViewedController,
        builder: (data) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Expanded(
                  child: GridView.builder(
                    controller: recentlyViewedController.scrollController,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 8,
                            mainAxisSpacing: 12,
                            childAspectRatio: 0.5),
                    itemCount: data?.data?.edges?.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: () => Get.to(() => ProductDetailScreenWidget(
                            id: data?.data?.edges?[index].node?.id ?? 0,
                            name: data?.data?.edges?[index].node?.name ?? "")),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: ColorConstants.cDividerColor),
                                  borderRadius: BorderRadius.circular(8.0)),
                              child: AppImageWidget(
                                asset: data?.data?.edges?[index].node?.coverPic,
                                height: Get.height * 0.3,
                                width: Get.width,
                                fit: BoxFit.contain,
                              ),
                            ),
                            SizedBox(height: Get.height * 0.01),
                            Text(
                              data?.data?.edges?[index].node?.name ?? "",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: getTextSemiBold(
                                  size: 16.0,
                                  colors: ColorConstants.cDarkTextColor),
                            ),
                            SizedBox(height: Get.height * 0.01),
                            Text(
                              'RM ${data?.data?.edges?[index].node?.originalPrice?.toStringAsFixed(2) ?? ""}',
                              style: getTextSemiBold(
                                  size: 14.0,
                                  colors: ColorConstants.cPrimaryTextColor),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Obx(() => Visibility(
                    visible: recentlyViewedController.isProgressShow.value,
                    child: const Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 16.0),
                        child: CircularProgressIndicator(),
                      ),
                    )))
              ],
            ),
          );
        },
      ),
    );
  }
}

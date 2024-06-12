import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:member_app_v2/common/app_strings.dart';
import 'package:member_app_v2/common/appbars_constants.dart';
import 'package:member_app_v2/common/color_constants.dart';
import 'package:member_app_v2/common/image_assets.dart';
import 'package:member_app_v2/common/text_styles_constants.dart';
import 'package:member_app_v2/common/widget/app_getx_future_builder.dart';
import 'package:member_app_v2/modules/order/model/order_response_model.dart';
import 'package:member_app_v2/modules/order/order_controller.dart';

class OrderScreenWidget extends StatefulWidget {
  const OrderScreenWidget({super.key});

  @override
  State<OrderScreenWidget> createState() => _OrderScreenWidgetState();
}

class _OrderScreenWidgetState extends State<OrderScreenWidget> {
  OrderScreenController orderScreenController =
      Get.put(OrderScreenController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBars.arianiAppBar(title: Text(AppStrings.orders)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: AppGetXFutureBuilder<OrderResponseModel>(
          controller: orderScreenController,
          image: ImageAssets.imageCartEmpty,
          emptyDataTitle: AppStrings.noMoreData,
          builder: (data) {
            return Column(
              children: [
                Expanded(
                  child: ListView.separated(
                      controller: orderScreenController.scrollController,
                      itemCount: data?.data?.orders?.length ?? 0,
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 5),
                      itemBuilder: (context, index) => Card(
                            color: ColorConstants.cDividerMoreLightColor,
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(children: [
                                itemRowWidget(
                                    AppStrings.orderNumber,
                                    data?.data?.orders?[index].node?.id
                                            ?.toString() ??
                                        "0"),
                                const SizedBox(height: 5),
                                itemRowWidget(
                                    AppStrings.orderDate,
                                    DateFormat('yyyy-MM-dd').format(data
                                            ?.data
                                            ?.orders?[index]
                                            .node
                                            ?.createDateTime ??
                                        DateTime.now())),
                                const SizedBox(height: 5),
                                itemRowWidget(
                                    AppStrings.status,
                                    data?.data?.orders?[index].node
                                            ?.orderStatus ??
                                        ""),
                                const SizedBox(height: 5),
                                itemRowWidget(
                                    AppStrings.trackingId,
                                    data?.data?.orders?[index].node
                                            ?.trackingId ??
                                        "N/A"),
                                const SizedBox(height: 5),
                                itemRowWidget(
                                    AppStrings.totalPrice,
                                    data?.data?.orders?[index].node?.total
                                            ?.toStringAsFixed(2) ??
                                        "0.00"),
                              ]),
                            ),
                          )),
                ),
                Obx(() => Visibility(
                    visible: orderScreenController.isProgressShow.value,
                    child: const Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        child: CircularProgressIndicator(),
                      ),
                    )))
              ],
            );
          },
        ),
      ),
    );
  }

  Widget itemRowWidget(String title, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text("$title : ",
            style:
                getTextBold(size: 16.0, colors: ColorConstants.cDarkTextColor)),
        Flexible(
          child: Text(value,
              style: getTextMedium(
                  size: 16.0, colors: ColorConstants.cPrimaryTextColor)),
        )
      ],
    );
  }
}

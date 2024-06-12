import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:member_app_v2/common/alert/app_alert.dart';
import 'package:member_app_v2/common/app_strings.dart';
import 'package:member_app_v2/common/utils/network_utils.dart';
import 'package:member_app_v2/data/remote/api.dart';
import 'package:member_app_v2/modules/order/model/order_response_model.dart';

class OrderScreenController extends GetxController
    with StateMixin<OrderResponseModel> {
  OrderResponseModel? orderResponseModel;
  ScrollController scrollController = ScrollController();
  RxBool isProgressShow = false.obs;
  @override
  void onInit() {
    super.onInit();
    getOrders();
    initiateScrollListner();
  }

  void getOrders() {
    NetworkUtils().checkInternetConnection().then((value) async {
      if (value) {
        try {
          orderResponseModel =
              await Api.getOrders(pageNo: 1, pageSize: 10, userId: 52335);
          if (orderResponseModel?.data?.orders?.isNotEmpty ?? false) {
            change(orderResponseModel, status: RxStatus.success());
          } else {
            change(null, status: RxStatus.empty());
          }
        } catch (e) {
          change(null, status: RxStatus.error());
          Get.log("Order Exception : $e");
        }
      } else {
        change(null, status: RxStatus.error());
        AppAlert.showSnackBar(Get.context!, AppStrings.noInternetConnection);
      }
    });
  }

  void initiateScrollListner() {
    scrollController.addListener(() async {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        if ((orderResponseModel?.data?.pageInfo?.totalPages ?? 0) >
            (orderResponseModel?.data?.pageInfo?.pageNo ?? 0)) {
          try {
            isProgressShow.value = true;
            int currentPage = orderResponseModel?.data?.pageInfo?.pageNo ?? 0;
            OrderResponseModel response = await Api.getOrders(
                pageNo: currentPage + 1, pageSize: 10, userId: 52335);
            if (response.data?.orders?.isNotEmpty ?? false) {
              orderResponseModel?.data?.orders
                  ?.addAll(response.data?.orders ?? []);
              orderResponseModel?.data?.pageInfo = response.data?.pageInfo;
              isProgressShow.value = false;
              change(orderResponseModel, status: RxStatus.success());
            } else {
              isProgressShow.value = false;
            }
          } catch (e) {
            isProgressShow.value = false;
            Get.log("Exception filter item : $e");
          }
        }
      }
    });
  }
}

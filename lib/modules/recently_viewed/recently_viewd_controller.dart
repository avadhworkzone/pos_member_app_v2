import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:member_app_v2/common/alert/app_alert.dart';
import 'package:member_app_v2/common/app_strings.dart';
import 'package:member_app_v2/common/utils/network_utils.dart';
import 'package:member_app_v2/data/remote/api.dart';
import 'package:member_app_v2/modules/home/home_tab/model/items_response.dart';

class RecentlyViewedController extends GetxController
    with StateMixin<ItemsReponse> {
  ItemsReponse? itemsReponse;
  ScrollController scrollController = ScrollController();
  RxBool isProgressShow = false.obs;

  @override
  void onInit() {
    super.onInit();
    initScrollListner();
    getProducts();
  }

  void getProducts() async {
    await NetworkUtils()
        .checkInternetConnection()
        .then((isInternetAvailable) async {
      if (isInternetAvailable) {
        try {
          itemsReponse = await Api.getItems(
            pageNo: 1,
            pageSize: 10,
            bestSellers: true,
            onlyActive: true,
          );
          if (itemsReponse?.data?.edges?.isNotEmpty ?? false) {
            change(itemsReponse, status: RxStatus.success());
          } else {
            change(null, status: RxStatus.empty());
          }
        } catch (e) {
          change(null, status: RxStatus.error());
          Get.log("Recently Viewed exception : $e");
        }
      } else {
        change(null, status: RxStatus.error());
        AppAlert.showSnackBar(Get.context!, AppStrings.noInternetConnection);
      }
    });
  }

  void initScrollListner() {
    scrollController.addListener(() async {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        if ((itemsReponse?.data?.pageInfo?.totalPages ?? 0) >
            (int.parse(itemsReponse?.data?.pageInfo?.pageNo ?? "0"))) {
          try {
            isProgressShow.value = true;
            int currentPage =
                int.parse(itemsReponse?.data?.pageInfo?.pageNo ?? "0");
            ItemsReponse response = await Api.getItems(
                onlyActive: true,
                pageNo: currentPage + 1,
                pageSize: 10,
                bestSellers: true);
            if (itemsReponse?.data?.edges?.isNotEmpty ?? false) {
              itemsReponse?.data?.edges?.addAll(response.data?.edges ?? []);
              itemsReponse?.data?.pageInfo = response.data?.pageInfo;
              isProgressShow.value = false;
              change(itemsReponse, status: RxStatus.success());
            } else {
              isProgressShow.value = false;
            }
          } catch (e) {
            isProgressShow.value = false;
            Get.log("Exception recently viewed item : $e");
          }
        } else {
          print("not");
        }
      }
    });
  }
}

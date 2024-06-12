import 'package:get/get.dart';
import 'package:member_app_v2/common/alert/app_alert.dart';
import 'package:member_app_v2/common/app_strings.dart';
import 'package:member_app_v2/common/utils/network_utils.dart';
import 'package:member_app_v2/data/remote/api.dart';
import 'package:member_app_v2/modules/home/home_tab/model/banner_response.dart';
import 'package:member_app_v2/modules/home/home_tab/model/categories_response.dart';
import 'package:member_app_v2/modules/home/home_tab/model/items_response.dart';

class HomeTabController extends GetxController
    with StateMixin<HomeScreenResponse> {
  RxInt currentBannerIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    getHomeData();
  }

  void getHomeData() async {
    await NetworkUtils()
        .checkInternetConnection()
        .then((isInternetAvailable) async {
      if (isInternetAvailable) {
        try {
          BannersReponse banners = await Api.getBanners(
              isActive: true, pageNo: 1, position: "top", sizePerPage: 5);
          BannersReponse bottomBanners = await Api.getBanners(
              isActive: true, pageNo: 1, position: "middle", sizePerPage: 5);
          CategoriesReponse categories = await Api.getCategories(
              onlyTopMenu: true, onlyWithItems: true, pageNo: 1, pageSize: 10);
          ItemsReponse homeItemsNewArrival = await Api.getItems(
              newArrivals: true, onlyActive: true, pageNo: 1, pageSize: 5);
          ItemsReponse homeItemsBestSeller = await Api.getItems(
              bestSellers: true, onlyActive: true, pageNo: 1, pageSize: 5);
          change(
              HomeScreenResponse(
                  bannersReponse: banners,
                  bottomBannersReponse: bottomBanners,
                  categoriesReponse: categories,
                  homeItemNewArrival: homeItemsNewArrival,
                  homeItemBestSeller: homeItemsBestSeller),
              status: RxStatus.success());
        } catch (e) {
          change(null, status: RxStatus.error());
          Get.log("Home Screen Exception $e");
        }
      } else {
        change(null, status: RxStatus.error());
        AppAlert.showSnackBar(Get.context!, AppStrings.noInternetConnection);
      }
    });
  }
}

class HomeScreenResponse {
  BannersReponse? bannersReponse;
  BannersReponse? bottomBannersReponse;
  CategoriesReponse? categoriesReponse;
  ItemsReponse? homeItemNewArrival;
  ItemsReponse? homeItemBestSeller;

  HomeScreenResponse(
      {this.bannersReponse,
      this.bottomBannersReponse,
      this.categoriesReponse,
      this.homeItemBestSeller,
      this.homeItemNewArrival});
}

class CategoryData {
  String image, title;
  CategoryData({required this.image, required this.title});
}

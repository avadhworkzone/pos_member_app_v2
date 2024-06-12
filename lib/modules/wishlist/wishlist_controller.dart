import 'package:get/get.dart';
import 'package:member_app_v2/common/alert/app_alert.dart';
import 'package:member_app_v2/common/app_strings.dart';
import 'package:member_app_v2/common/utils/network_utils.dart';
import 'package:member_app_v2/data/model/common_response_model.dart';
import 'package:member_app_v2/data/remote/api.dart';
import 'package:member_app_v2/data/remote/api_util.dart';
import 'package:member_app_v2/modules/wishlist/model/wishlist_response_model.dart';

class WishListController extends GetxController
    with StateMixin<WishlistResponseModel> {
  WishlistResponseModel? wishlistResponseModel;
  @override
  void onInit() {
    super.onInit();
    getWishlistData();
  }

  void getWishlistData() async {
    await NetworkUtils()
        .checkInternetConnection()
        .then((isInternetAvailable) async {
      if (isInternetAvailable) {
        try {
          wishlistResponseModel = await Api.getWishList();
          if (wishlistResponseModel?.data?.isNotEmpty ?? false) {
            change(wishlistResponseModel, status: RxStatus.success());
          } else {
            change(null, status: RxStatus.empty());
          }
        } catch (e) {
          Get.log("Wishlist Exception : $e");
          change(null, status: RxStatus.error());
        }
      } else {
        change(null, status: RxStatus.error());
        AppAlert.showSnackBar(Get.context!, AppStrings.noInternetConnection);
      }
    });
  }

  void onDeleteItem(/* CompletionHandler handler, */ int index) async {
    ApiUtil.apiCallHandler<CommonResponseModel>(
      () => Api.removeFromWishLIst(
          id: wishlistResponseModel?.data?[index].id ?? 0),
      onApiCallSuccess: (data) async {
        if (data?.status == "success") {
          //await handler(true);
          wishlistResponseModel?.data?.removeAt(index);
          if (wishlistResponseModel?.data?.isEmpty ?? false) {
            change(null, status: RxStatus.empty());
          } else {
            change(wishlistResponseModel, status: RxStatus.success());
          }
        }
      },
    );
  }
}

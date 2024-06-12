import 'package:flutter_swipe_action_cell/flutter_swipe_action_cell.dart';
import 'package:get/get.dart';
import 'package:member_app_v2/common/alert/app_alert.dart';
import 'package:member_app_v2/common/app_strings.dart';
import 'package:member_app_v2/common/utils/network_utils.dart';
import 'package:member_app_v2/data/model/common_response_model.dart';
import 'package:member_app_v2/data/remote/api.dart';
import 'package:member_app_v2/data/remote/api_util.dart';
import 'package:member_app_v2/modules/cart/model/cart_summary_response_model.dart';
import 'package:member_app_v2/modules/checkout/view/checkout_screen.dart';

class CartScreenController extends GetxController
    with StateMixin<CartSummaryResponseModel> {
  //SwipeActionController swipeActionController = SwipeActionController();
  CartSummaryResponseModel? cartSummaryResponseModel;
  RxInt cartItemCount = 0.obs;

  @override
  void onInit() {
    super.onInit();
    /* swipeActionController.selectedIndexPathsChangeCallback = (changedIndexPaths,
            selected, currentSelectedCount) =>
        selectionCallBack(changedIndexPaths, selected, currentSelectedCount); */
    //getCartData();
  }

  void getCartData() async {
    await NetworkUtils()
        .checkInternetConnection()
        .then((isInternetAvailable) async {
      if (isInternetAvailable) {
        try {
          cartSummaryResponseModel = await Api.getCartSummary();
          cartItemCount.value =
              cartSummaryResponseModel?.cartItems?.length ?? 0;
          if (cartSummaryResponseModel?.cartItems?.isNotEmpty ?? false) {
            change(cartSummaryResponseModel, status: RxStatus.success());
          } else {
            change(null, status: RxStatus.empty());
          }
        } catch (e) {
          change(null, status: RxStatus.error());
          Get.log("Cart Exception : $e");
        }
      } else {
        change(null, status: RxStatus.error());
        AppAlert.showSnackBar(Get.context!, AppStrings.noInternetConnection);
      }
    });
  }

  /* void selectionCallBack(
      List<int> changedIndexPaths, bool selected, int currentSelectedCount) {
    if (currentSelectedCount == 0) {
      swipeActionController.isEditing.value = false;
    }
    update();
  } */

  void onDeleteItem(CompletionHandler handler) async {
    await handler(true);
    update();
  }

  /* void startEditingModeForItemSelection() {
    swipeActionController.startEditingMode();
  } */

  void proceedToCheckout() {
    Get.to(() => const CheckoutScreenWidget());
  }

  void changeQuantity(int id, int variantId, bool isIncrement) {
    ApiUtil.apiCallHandler<CommonResponseModel>(
      () => isIncrement
          ? Api.incrementCart(itemId: id, itemVariantId: variantId)
          : Api.decrementCart(itemId: id, itemVariantId: variantId),
      onApiCallSuccess: (data) {
        if (data?.status == "success") {
          getCartData();
        }
      },
    );
  }
}

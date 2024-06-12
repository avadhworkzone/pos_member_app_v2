import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:member_app_v2/common/alert/app_alert.dart';
import 'package:member_app_v2/common/app_strings.dart';
import 'package:member_app_v2/common/utils/network_utils.dart';
import 'package:member_app_v2/data/model/common_response_model.dart';
import 'package:member_app_v2/data/remote/api.dart';
import 'package:member_app_v2/data/remote/api_util.dart';
import 'package:member_app_v2/modules/cart/cart_controller.dart';
import 'package:member_app_v2/modules/cart/model/cart_summary_response_model.dart';
import 'package:member_app_v2/modules/product_detail/model/item_response.dart';

class ProductDetailController extends GetxController
    with StateMixin<ItemReponse> {
  int? id;
  String? productName;
  ItemReponse? response;
  CarouselController carouselController = CarouselController();

  RxInt activeProductImageIndex = 0.obs;
  RxInt qunatity = 0.obs;

  Map<String, List<String>> allVariants = {};
  String selectedSizeVariant = "";
  String selectedColorVariant = "";
  List<String> mediaUrls = [];
  List<String> uniqueColors = [];
  int? selectedVariantId;

  RxBool isWishlist = false.obs;

  CartScreenController cartScreenController = Get.find<CartScreenController>();

  @override
  void onInit() {
    super.onInit();
    getProduct();
  }

  void getProduct() async {
    await NetworkUtils()
        .checkInternetConnection()
        .then((isInternetAvailable) async {
      if (isInternetAvailable) {
        try {
          response = await Api.getItem(id: id ?? 0);
          CommonResponseModel wishListResponse =
              await Api.checkWishlistStatus(id: id!);

          if (wishListResponse.status == "success") {
            isWishlist.value = wishListResponse.data;
          }

          if (response?.data?.variants != null) {
            for (var element in response!.data!.variants!) {
              /// get all media url for carousel
              mediaUrls.addAll(element.media ?? []);

              /// get unique colors from variants
              if (!uniqueColors.contains(element.color?.name)) {
                uniqueColors.add(element.color?.name ?? "");
              }
            }
          }

          /// store unique size variant base on colors
          for (var i = 0; i < uniqueColors.length; i++) {
            allVariants.addAll({uniqueColors[i]: []});
            if (response?.data?.variants != null) {
              List<String> sizes = [];
              for (var element in response!.data!.variants!) {
                if (uniqueColors[i] == element.color?.name) {
                  sizes.add(element.size?.name ?? "");
                }
              }
              allVariants[uniqueColors[i]]?.addAll(sizes);
            }
          }
          change(response, status: RxStatus.success());
        } catch (e) {
          change(null, status: RxStatus.error());
          Get.log("Items api Exception $e");
        }
      }
    });
  }

  changeSizeVariant(String size) async {
    selectedSizeVariant = size;
    if (selectedColorVariant.isNotEmpty) {
      int cartQuantity = await checkProductInCart();
      qunatity.value = cartQuantity;
      for (var element in response!.data!.variants!) {
        if (element.size!.name == size &&
            element.color!.name == selectedColorVariant) {
          selectedVariantId = element.id;
        }
      }
    }
    change(response, status: RxStatus.success());
  }

  changeColorVariant(String color) async {
    selectedColorVariant = color;
    if (selectedSizeVariant.isNotEmpty) {
      int cartQuantity = await checkProductInCart();
      qunatity.value = cartQuantity;
      for (var element in response!.data!.variants!) {
        if (element.size!.name == selectedSizeVariant &&
            element.color!.name == color) {
          selectedVariantId = element.id;
        }
      }
    }
    change(response, status: RxStatus.success());
  }

  addQuantity() {
    if (selectedColorVariant.isEmpty || selectedSizeVariant.isEmpty) {
      AppAlert.showSnackBar(Get.context!, AppStrings.selectSizeAndColor);
      return;
    }
    addToBag();
  }

  removQunatity() {
    if (selectedColorVariant.isEmpty || selectedSizeVariant.isEmpty) {
      AppAlert.showSnackBar(Get.context!, AppStrings.selectSizeAndColor);
      return;
    } else {
      removeFromBag();
    }
  }

  addToBag() {
    if (selectedColorVariant.isEmpty || selectedSizeVariant.isEmpty) {
      AppAlert.showSnackBar(Get.context!, AppStrings.selectSizeAndColor);
      return;
    }
    ApiUtil.apiCallHandler<CommonResponseModel>(
      () => Api.incrementCart(itemId: id!, itemVariantId: selectedVariantId!),
      onApiCallSuccess: (data) {
        if (data?.status == "success") {
          qunatity.value = qunatity.value + 1;
          AppAlert.showSnackBar(Get.context!, AppStrings.itemAddedToCart);
          change(response, status: RxStatus.success());
          cartScreenController.getCartData();
        }
      },
    );
  }

  removeFromBag() {
    ApiUtil.apiCallHandler<CommonResponseModel>(
      () => Api.decrementCart(itemId: id!, itemVariantId: selectedVariantId!),
      onApiCallSuccess: (data) {
        if (data?.status == "success") {
          qunatity.value = qunatity.value - 1;
          change(response, status: RxStatus.success());
          cartScreenController.getCartData();
        }
      },
    );
  }

  Future<int> checkProductInCart() async {
    try {
      CartSummaryResponseModel cartSummaryResponseModel =
          await Api.getCartSummary();
      if (cartSummaryResponseModel.cartItems?.isNotEmpty ?? false) {
        for (var element in cartSummaryResponseModel.cartItems!) {
          if (element.item?.id == id) {
            if (element.itemVariant?.color?.name == selectedColorVariant &&
                element.itemVariant?.size?.name == selectedSizeVariant) {
              return element.quantity ?? 0;
            }
          }
        }
      }
      return 0;
    } catch (e) {
      Get.log("Cart Exception : $e");
      return 0;
    }
  }

  addRemoveWishlist() {
    ApiUtil.apiCallHandler<CommonResponseModel>(
      () => isWishlist.value
          ? Api.removeFromWishLIst(id: id!)
          : Api.addToWishLIst(id: id!),
      onApiCallSuccess: (data) {
        if (data?.status == "success") {
          if (isWishlist.value) {
            AppAlert.showSnackBar(
                Get.context!, AppStrings.itemRemoveFromWishlist);
          } else {
            AppAlert.showSnackBar(Get.context!, AppStrings.itemAddedToWishlist);
          }
          isWishlist.value = !isWishlist.value;
        }
      },
    );
  }
}

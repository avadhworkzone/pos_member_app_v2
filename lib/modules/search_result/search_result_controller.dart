import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:member_app_v2/common/alert/app_alert.dart';
import 'package:member_app_v2/common/app_strings.dart';
import 'package:member_app_v2/common/utils/network_utils.dart';
import 'package:member_app_v2/data/remote/api.dart';
import 'package:member_app_v2/modules/home/home_tab/model/categories_response.dart';
import 'package:member_app_v2/modules/home/home_tab/model/items_response.dart'
    as item;
import 'package:member_app_v2/modules/product_detail/view/product_detail_screen.dart';
import 'package:member_app_v2/modules/search_result/model/brands_response.dart';
import 'package:member_app_v2/modules/search_result/model/colors_response.dart';
import 'package:member_app_v2/modules/search_result/model/sizes_response.dart';

class SearchResultController extends GetxController
    with StateMixin<item.ItemsReponse> {
  item.ItemsReponse? itemsReponse;
  CategoriesReponse? categoriesReponse;
  BrandsReponse? brandsReponse;
  ColorsReponse? colorsReponse;
  SizesReponse? sizesReponse;

  ScrollController scrollController = ScrollController();
  TextEditingController searchbarController = TextEditingController();

  List<int> selectedFilterCategory = [];
  List<int> selectedFilterBrands = [];
  List<int> selectedFilterColors = [];
  List<int> selectedFilterSizes = [];

  List<SortBy> sortBy = [
    SortBy(title: "Featured", value: ""),
    SortBy(title: "Price, low to high", value: "lowest-price"),
    SortBy(title: "Price, high to low", value: "highest-price")
  ];
  SortBy? selectedSortBy;

  RxBool isProgressShow = false.obs;
  RxBool isTypingOnSearch = false.obs;

  /* String category = "";

  Rx<RangeValues> priceRangeFilter = RangeValues(10, 1000).obs;
  List<String> sizeFilter = ["XS", "S", "M", "L", "XL", "2XL"];
  List<String> colorFilter = [
    "Black",
    "Blue",
    "Brown",
    "Green",
    "Grey",
    "Orange",
    "Pink",
    "Purple"
  ];
  RxList<String> selectedSizeFilter = RxList();
  RxList<String> selectedColorFilter = RxList(); */

  @override
  void onInit() {
    super.onInit();
    selectedSortBy = sortBy.first;
    getItems();
    initScrollListner();
  }

  void getItems() async {
    await NetworkUtils()
        .checkInternetConnection()
        .then((isInternetAvailable) async {
      if (isInternetAvailable) {
        try {
          itemsReponse = await Api.getItems(
              onlyActive: true,
              pageNo: 1,
              pageSize: 10,
              sortby: selectedSortBy?.value);
          categoriesReponse = await Api.getCategories(
              pageNo: 1,
              pageSize: 100,
              parentId: 0,
              onlyActive: true,
              sortBy: "priority-asc");
          brandsReponse = await Api.getBrands();
          colorsReponse = await Api.getColors();
          sizesReponse = await Api.getSizes();
          if (itemsReponse?.data?.edges?.isNotEmpty ?? false) {
            change(itemsReponse, status: RxStatus.success());
          } else {
            change(null, status: RxStatus.empty());
          }
        } catch (e) {
          change(null, status: RxStatus.error());
          Get.log("Items api Exception $e");
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
            item.ItemsReponse response = await Api.getItems(
                onlyActive: true,
                pageNo: currentPage + 1,
                pageSize: 10,
                brandIds: selectedFilterBrands.join(","),
                categoryIds: selectedFilterCategory.join(","),
                colorIds: selectedFilterColors.join(","),
                sizeIds: selectedFilterSizes.join(","),
                sortby: selectedSortBy?.value);
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
            Get.log("Exception filter item : $e");
          }
        }
      }
    });
  }

  void onCategorySelected(int id) {
    if (selectedFilterCategory.contains(id)) {
      selectedFilterCategory.remove(id);
    } else {
      selectedFilterCategory.add(id);
    }
    update(["category_filter"]);
  }

  void onSizeSelected(int id) {
    if (selectedFilterSizes.contains(id)) {
      selectedFilterSizes.remove(id);
    } else {
      selectedFilterSizes.add(id);
    }
    update(["size_filter"]);
  }

  void onColorSelected(int id) {
    if (selectedFilterColors.contains(id)) {
      selectedFilterColors.remove(id);
    } else {
      selectedFilterColors.add(id);
    }
    update(["color_filter"]);
  }

  void onBrandSelected(int id) {
    if (selectedFilterBrands.contains(id)) {
      selectedFilterBrands.remove(id);
    } else {
      selectedFilterBrands.add(id);
    }
    update(["brand_filter"]);
  }

  void clearAllFilter({bool callAPi = false}) async {
    selectedFilterBrands.clear();
    selectedFilterCategory.clear();
    selectedFilterSizes.clear();
    selectedFilterColors.clear();
    searchbarController.text = "";
    update(["category_filter", "size_filter", "color_filter", "brand_filter"]);
    if (callAPi) {
      applyFilters();
    }
  }

  void selectSortBy(SortBy item) {
    selectedSortBy = item;
    applyFilters();
  }

  void applyFilters({bool isSearch = false}) async {
    try {
      change(null, status: RxStatus.loading());
      itemsReponse = await Api.getItems(
          onlyActive: true,
          pageNo: 1,
          pageSize: 10,
          brandIds: selectedFilterBrands.join(","),
          categoryIds: selectedFilterCategory.join(","),
          colorIds: selectedFilterColors.join(","),
          sizeIds: selectedFilterSizes.join(","),
          sortby: selectedSortBy?.value,
          search: isSearch ? searchbarController.text : "");
      if (itemsReponse?.data?.edges?.isNotEmpty ?? false) {
        change(itemsReponse, status: RxStatus.success());
      } else {
        change(null, status: RxStatus.empty());
      }
    } catch (e) {
      Get.log("Exception filter item : $e");
      change(null, status: RxStatus.error());
    }
  }

  void onSearch() {
    if (searchbarController.text.trim().isNotEmpty) {
      applyFilters(isSearch: true);
    } else {
      AppAlert.showSnackBar(Get.context!, "Please enter valid search term");
    }
  }

  void clearSearch() {
    searchbarController.text = "";
    isTypingOnSearch.value = false;
    applyFilters();
  }

  void onTypeSearch(String text) {
    if (text.trim().isNotEmpty) {
      isTypingOnSearch.value = true;
    } else {
      isTypingOnSearch.value = false;
    }
  }

  void onProductTap(item.Node? product) {
    Get.to(() => ProductDetailScreenWidget(
        id: product?.id ?? 0, name: product?.name ?? ""));
  }
}

class SortBy {
  String title, value;
  SortBy({required this.title, required this.value});
}

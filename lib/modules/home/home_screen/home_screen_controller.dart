import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:member_app_v2/common/app_strings.dart';
import 'package:member_app_v2/modules/cart/cart_controller.dart';
import 'package:member_app_v2/modules/home/home_tab/view/home_tab_screen.dart';
import 'package:member_app_v2/modules/home/membership/view/membership_screen.dart';
import 'package:member_app_v2/modules/home/profile/model/get_members_details_response.dart';
import 'package:member_app_v2/modules/home/profile/view/profile_screen.dart';
import 'package:member_app_v2/modules/search_result/view/search_result_screen.dart';

enum ScreenList {
  homeScreen,
  searchResultScreen,
  memberScreen,
  profileScreen,
}

class HomeScreenController extends GetxController {
  late GetMemberDetailsResponse memberDetailsResponse;

  RxInt selectedIndex = 0.obs;

  List<Widget> tabWidget = [
    const HomeTabScreenWidget(),
    const SearchResultWidgetScreen(),
    const MembershipScreenWidget(),
    const ProfileScreenWidget(),
  ];

  List<String> sTitle = [
    AppStrings.tabHome,
    AppStrings.products,
    AppStrings.tabMembership,
    AppStrings.tabProfile,
  ];

  @override
  void onInit() {
    super.onInit();
    getCartData();
  }

  void getCartData() {
    CartScreenController cartScreenController =
        Get.find<CartScreenController>();
    cartScreenController.getCartData();
  }

  void onItemTapped(int index) {
    selectedIndex.value = index;
  }
}

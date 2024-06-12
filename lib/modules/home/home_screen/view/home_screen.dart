import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:member_app_v2/common/app_strings.dart';
import 'package:member_app_v2/common/appbars_constants.dart';
import 'package:member_app_v2/common/color_constants.dart';
import 'package:member_app_v2/common/image_assets.dart';
import 'package:member_app_v2/common/size_constants.dart';
import 'package:member_app_v2/common/text_styles_constants.dart';
import 'package:member_app_v2/modules/home/home_screen/home_screen_controller.dart';

class HomeScreenWidget extends StatefulWidget {
  const HomeScreenWidget({super.key});

  @override
  State<HomeScreenWidget> createState() => _HomeScreenWidgetState();
}

class _HomeScreenWidgetState extends State<HomeScreenWidget> {
  HomeScreenController homeScreenController = Get.put(HomeScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(56),
          child: Obx(() => AppBars.arianiAppBar(
                title: homeScreenController.selectedIndex.value == 0
                    ? Image.asset(ImageAssets.imageAppBarLogo)
                    : Text(homeScreenController
                        .sTitle[homeScreenController.selectedIndex.value]),
              ))),
      body: Obx(() => homeScreenController.tabWidget
          .elementAt(homeScreenController.selectedIndex.value)),
      bottomNavigationBar: Container(
        color: Colors.grey.shade50,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade50,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 1,
                blurRadius: 3,
                offset: const Offset(0, 1), // changes position of shadow
              ),
            ],
          ),
          child: Obx(() => BottomNavigationBar(
                items: <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Image.asset(
                          homeScreenController.selectedIndex.value == 0
                              ? ImageAssets.imageHomeTabActive
                              : ImageAssets.imageHomeTab,
                          height: SizeConstants.s_20,
                          width: SizeConstants.s_20),
                    ),
                    label: AppStrings.tabHome,
                  ),
                  BottomNavigationBarItem(
                    icon: Container(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Image.asset(
                            homeScreenController.selectedIndex.value == 1
                                ? ImageAssets.imageCategoriesTabActive
                                : ImageAssets.imageCategoriesTab,
                            height: SizeConstants.s_20,
                            width: SizeConstants.s_20)),
                    label: AppStrings.products,
                  ),
                  BottomNavigationBarItem(
                    icon: Container(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Image.asset(
                            homeScreenController.selectedIndex.value == 2
                                ? ImageAssets.imageMembershipTabActive
                                : ImageAssets.imageMembershipTab,
                            height: SizeConstants.s_20,
                            width: SizeConstants.s_20)),
                    label: AppStrings.tabMembership,
                  ),
                  BottomNavigationBarItem(
                    icon: Container(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Image.asset(
                            homeScreenController.selectedIndex.value == 3
                                ? ImageAssets.imageProfileTabActive
                                : ImageAssets.imageProfileTab,
                            height: SizeConstants.s_20,
                            width: SizeConstants.s_20)),
                    label: AppStrings.tabProfile,
                  ),
                ],
                type: BottomNavigationBarType.fixed,
                currentIndex: homeScreenController.selectedIndex.value,
                showUnselectedLabels: true,
                showSelectedLabels: true,
                selectedItemColor: ColorConstants.kPrimaryColor,
                selectedLabelStyle: getTextMedium(
                    colors: ColorConstants.kPrimaryColor, size: 16.0),
                unselectedItemColor: ColorConstants.cHintText,
                unselectedLabelStyle: getTextRegular(
                    colors: ColorConstants.cHintText, size: 16.0),
                backgroundColor: Colors.white,
                onTap: (value) => homeScreenController.onItemTapped(value),
              )),
        ),
      ),
    );
  }
}

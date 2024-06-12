import 'package:flutter/material.dart';
import 'package:focus_detector/focus_detector.dart';
import 'package:get/get.dart';
import 'package:member_app_v2/common/app_strings.dart';
import 'package:member_app_v2/common/color_constants.dart';
import 'package:member_app_v2/common/image_assets.dart';
import 'package:member_app_v2/common/size_constants.dart';
import 'package:member_app_v2/common/text_styles_constants.dart';
import 'package:member_app_v2/common/widget/app_getx_future_builder.dart';
import 'package:member_app_v2/common/widget/app_image_widget.dart';
import 'package:member_app_v2/modules/home/profile/model/get_members_details_response.dart';
import 'package:member_app_v2/modules/home/profile/profile_controller.dart';
import 'package:member_app_v2/modules/home/user_profile/view/user_profile_screen.dart';
import 'package:member_app_v2/modules/order/view/order_screen.dart';
import 'package:member_app_v2/modules/recently_viewed/view/recently_viewed_screen.dart';
import 'package:member_app_v2/modules/weview_data/view/webview_screen.dart';
import 'package:member_app_v2/modules/wishlist/view/wishlist_screen.dart';

class ProfileScreenWidget extends StatefulWidget {
  const ProfileScreenWidget({super.key});

  @override
  State<ProfileScreenWidget> createState() => _ProfileScreenWidgetState();
}

class _ProfileScreenWidgetState extends State<ProfileScreenWidget> {
  ProfileController profileController = Get.find<ProfileController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _buildMyProfileScreenWidgetView());
  }

  _buildMyProfileScreenWidgetView() {
    return FocusDetector(
        onVisibilityGained: () {},
        child: SafeArea(
          child: AppGetXFutureBuilder<GetMemberDetailsResponse>(
            controller: profileController,
            builder: (data) {
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.to(() => const UserProfileScreenWidget());
                      },
                      child: Container(
                        margin: const EdgeInsets.all(16.0),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 20),
                        decoration: BoxDecoration(
                            border:
                                Border.all(color: ColorConstants.cDividerColor),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(8.0))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: SizeConstants.width * 0.18,
                                  width: SizeConstants.width * 0.18,
                                  padding: EdgeInsets.all(SizeConstants.s_10),
                                  decoration: BoxDecoration(
                                    color:
                                        ColorConstants.kPrimaryColor.shade100,
                                    shape: BoxShape.circle,
                                  ),
                                  child: ClipOval(
                                      child: Image.asset(
                                    ImageAssets.imageProfileLogo,
                                  )),
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${data?.memberDetails?.firstName ?? ""} ${data?.memberDetails?.lastName ?? ""}",
                                      style: getTextBold(
                                          colors:
                                              ColorConstants.cPrimaryTextColor,
                                          size: 16.0),
                                    ),
                                    const SizedBox(height: 3),
                                    Text(
                                      data?.memberDetails?.email ?? "",
                                      style: getTextSemiBold(
                                          colors:
                                              ColorConstants.cPrimaryTextColor),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            const Icon(
                              Icons.arrow_forward_ios,
                              color: ColorConstants.kPrimaryColor,
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: Text(
                        AppStrings.profileManagement,
                        style: getTextRegular(
                            colors: ColorConstants.cPrimaryTextColor,
                            size: 12.0),
                      ),
                    ),
                    const SizedBox(height: 30),
                    menuTile(
                        ImageAssets.iconWishlist,
                        AppStrings.myWishlist,
                        Icons.arrow_forward_ios,
                        () => Get.to(() => const WishListScreenWidget())),
                    const Divider(color: ColorConstants.cDividerColor),
                    /* menuTile(
                        ImageAssets.iconWishlist,
                        AppStrings.orders,
                        Icons.arrow_forward_ios,
                        () => Get.to(() => const OrderScreenWidget())), */
                    ListTile(
                      onTap: () => Get.to(() => const OrderScreenWidget()),
                      iconColor: ColorConstants.kPrimaryColor,
                      leading: const Icon(Icons.receipt_long_outlined),
                      title: Text(AppStrings.orders),
                      titleTextStyle: getTextBold(
                          colors: ColorConstants.cPrimaryTextColor, size: 18.0),
                      trailing: const Icon(Icons.arrow_forward_ios),
                      horizontalTitleGap: 0,
                    ),
                    const Divider(color: ColorConstants.cDividerColor),
                    menuTile(
                        ImageAssets.iconRecentlyViewed,
                        AppStrings.recentlyViewd,
                        Icons.arrow_forward_ios,
                        () => Get.to(() => const RecentlyViewedScreenWidget())),
                    const Divider(color: ColorConstants.cDividerColor),
                    const SizedBox(height: 15),
                    Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: Text(
                        AppStrings.support,
                        style: getTextRegular(
                            colors: ColorConstants.cPrimaryTextColor,
                            size: 12.0),
                      ),
                    ),
                    const SizedBox(height: 30),
                    menuTile(
                        ImageAssets.iconStorelocator,
                        AppStrings.storeLocator,
                        Icons.arrow_forward_ios,
                        () => Get.to(() => WebviewScreenWidget(
                            title: AppStrings.storeLocator,
                            url:
                                "https://ecom-front.artisanscloud.com/store_locator"))),
                    const Divider(color: ColorConstants.cDividerColor),
                    menuTile(
                        ImageAssets.iconContactus,
                        AppStrings.contactUsKiv,
                        Icons.arrow_forward_ios,
                        () => Get.to(() => WebviewScreenWidget(
                            title: AppStrings.storeLocator,
                            url:
                                "https://ecom-front.artisanscloud.com/contact-us"))),
                    const Divider(color: ColorConstants.cDividerColor),
                    menuTile(ImageAssets.iconSettings, AppStrings.settings,
                        Icons.arrow_forward_ios, null),
                    const Divider(color: ColorConstants.cDividerColor),
                    menuTile(
                        ImageAssets.iconTermOfUse,
                        AppStrings.termOfUse,
                        Icons.arrow_forward_ios,
                        () => Get.to(() => WebviewScreenWidget(
                            title: AppStrings.termOfUse,
                            url:
                                "https://ecom-front.artisanscloud.com/terms"))),
                    const Divider(color: ColorConstants.cDividerColor),
                    menuTile(
                        ImageAssets.iconPrivacypolicy,
                        AppStrings.privacyPolicy,
                        Icons.arrow_forward_ios,
                        () => Get.to(() => WebviewScreenWidget(
                            title: AppStrings.privacyPolicy,
                            url:
                                "https://ecom-front.artisanscloud.com/privacy"))),
                    const Divider(color: ColorConstants.cDividerColor),
                    /* menuTile(
                        Icons.logout_outlined,
                        AppStrings.logout,
                        Icons.arrow_forward_ios,
                        () => profileController.showLogoutDialog()), */
                    ListTile(
                      onTap: () => profileController.showLogoutDialog(),
                      iconColor: ColorConstants.kPrimaryColor,
                      leading: const Icon(Icons.logout_outlined),
                      title: Text(AppStrings.logout),
                      titleTextStyle: getTextBold(
                          colors: ColorConstants.cPrimaryTextColor, size: 18.0),
                      trailing: const Icon(Icons.arrow_forward_ios),
                      horizontalTitleGap: 0,
                    )
                  ],
                ),
              );
            },
          ),
        ));
  }

  menuTile(
      String leadingIcon, String title, IconData trailIcon, Function? onTap) {
    return ListTile(
      onTap: () => onTap?.call(),
      iconColor: ColorConstants.kPrimaryColor,
      leading: AppImageWidget(
          asset: leadingIcon, height: 20, width: 20, fit: BoxFit.contain),
      title: Text(title),
      titleTextStyle:
          getTextBold(colors: ColorConstants.cPrimaryTextColor, size: 18.0),
      trailing: Icon(trailIcon),
      horizontalTitleGap: 0,
    );
  }
}

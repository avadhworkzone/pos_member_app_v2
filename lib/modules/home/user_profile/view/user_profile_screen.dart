import 'package:flutter/material.dart';
import 'package:focus_detector/focus_detector.dart';
import 'package:get/get.dart';
import 'package:member_app_v2/common/app_strings.dart';
import 'package:member_app_v2/common/appbars_constants.dart';
import 'package:member_app_v2/common/color_constants.dart';
import 'package:member_app_v2/common/image_assets.dart';
import 'package:member_app_v2/common/size_constants.dart';
import 'package:member_app_v2/common/text_styles_constants.dart';
import 'package:member_app_v2/modules/home/user_profile/account_settings/view/account_settings_screen.dart';
import 'package:member_app_v2/modules/home/user_profile/change_address/view/change_address_screen.dart';
import 'package:member_app_v2/modules/home/user_profile/change_password/view/change_password_screen.dart';
import 'package:member_app_v2/modules/home/user_profile/edit_profile/view/edit_profile_screen.dart';
import 'package:member_app_v2/modules/home/user_profile/payment_method/view/payment_method_screen.dart';

class UserProfileScreenWidget extends StatefulWidget {
  const UserProfileScreenWidget({super.key});

  @override
  State<UserProfileScreenWidget> createState() =>
      _UserProfileScreenWidgetState();
}

class _UserProfileScreenWidgetState extends State<UserProfileScreenWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBars.arianiAppBar(
            title: Text(AppStrings.userProfile,
                style: getTextSemiBold(
                  colors: ColorConstants.cWhite,
                  size: SizeConstants.s1 * 20,
                )),
            leading: IconButton(
                onPressed: () => navigateBack(),
                icon: const Icon(Icons.arrow_back))),
        body: _buildMyUserProfileScreenWidgetView());
  }

  _buildMyUserProfileScreenWidgetView() {
    return FocusDetector(
        onVisibilityGained: () {},
        child: SafeArea(
            child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
              Container(
                margin: EdgeInsets.only(
                    left: SizeConstants.s1 * 15,
                    right: SizeConstants.s1 * 15,
                    top: SizeConstants.s1 * 10,
                    bottom: SizeConstants.s1 * 5),
                child: Text(
                  AppStrings.accountManagement,
                  style: getTextMedium(
                    colors: ColorConstants.cGrayColor,
                    size: SizeConstants.s1 * 13,
                  ),
                ),
              ),
              menuTile(ImageAssets.editProfile, AppStrings.editProfile,
                  Icons.arrow_forward_ios),
              const Divider(color: ColorConstants.cDividerColor),
              menuTile(ImageAssets.accountSettings, AppStrings.accountSettings,
                  Icons.arrow_forward_ios),
              const Divider(color: ColorConstants.cDividerColor),
              menuTile(ImageAssets.changePassword, AppStrings.changePassword,
                  Icons.arrow_forward_ios),
              const Divider(color: ColorConstants.cDividerColor),
              Container(
                margin: EdgeInsets.only(
                    left: SizeConstants.s1 * 15,
                    right: SizeConstants.s1 * 15,
                    top: SizeConstants.s1 * 5,
                    bottom: SizeConstants.s1 * 5),
                child: Text(
                  AppStrings.payment,
                  style: getTextMedium(
                    colors: ColorConstants.cGrayColor,
                    size: SizeConstants.s1 * 13,
                  ),
                ),
              ),
              menuTile(ImageAssets.paymentMethod, AppStrings.paymentMethod,
                  Icons.arrow_forward_ios),
              const Divider(color: ColorConstants.cDividerColor),
              menuTile(ImageAssets.changePassword, AppStrings.changeAddress,
                  Icons.arrow_forward_ios),
              const Divider(color: ColorConstants.cDividerColor),
            ]))));
  }

  navigateBack() {
    Get.back();
  }

  menuTile(String leadingIcon, String title, IconData trailIcon) {
    return ListTile(
      contentPadding: EdgeInsets.only(
          left: SizeConstants.s1 * 15, right: SizeConstants.s1 * 15),
      onTap: () {
        switch (title) {
          case "Edit Profile":
            Get.to(() => const EditProfileScreenWidget());
            break;
          case "Account Settings (KIV)":
            Get.to(() => const AccountSettingsScreenWidget());
            break;
          case "Change Password (KIV)":
            Get.to(() => const ChangePasswordScreenWidget());
            break;
          case "Payment Method":
            Get.to(() => const PaymentMethodScreenWidget());
            break;
          case "Change Address":
            Get.to(() => const ChangeAddressScreenWidget());
            break;
        }
      },
      iconColor: ColorConstants.kPrimaryColor,
      leading: Container(
        width: SizeConstants.s1 * 20,
        height: SizeConstants.s1 * 21,
        alignment: Alignment.bottomCenter,
        child: Image.asset(leadingIcon,
            width: SizeConstants.s1 * 18,
            height: SizeConstants.s1 * 18,
            fit: BoxFit.cover),
      ),
      title: Text(title),
      titleTextStyle: getTextMedium(
          colors: ColorConstants.cNavyBlueColor, size: SizeConstants.s1 * 16),
      trailing: Icon(trailIcon, size: SizeConstants.s1 * 18),
      horizontalTitleGap: 0,
    );
  }
}

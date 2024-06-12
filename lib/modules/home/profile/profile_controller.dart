import 'dart:convert';

import 'package:get/get.dart';
import 'package:member_app_v2/common/alert/app_alert.dart';
import 'package:member_app_v2/common/app_strings.dart';
import 'package:member_app_v2/common/color_constants.dart';
import 'package:member_app_v2/common/text_styles_constants.dart';
import 'package:member_app_v2/common/utils/network_utils.dart';
import 'package:member_app_v2/data/remote/api.dart';
import 'package:member_app_v2/data/shared_prefs/shared_prefs.dart';
import 'package:member_app_v2/modules/home/profile/model/get_members_details_response.dart';
import 'package:member_app_v2/modules/login/view/login_screen.dart';

class ProfileController extends GetxController
    with StateMixin<GetMemberDetailsResponse> {
  GetMemberDetailsResponse? memberDetailsResponse;

  @override
  onInit() {
    super.onInit();
    initGetMemberDetails();
  }

  Future<void> initGetMemberDetails() async {
    await NetworkUtils()
        .checkInternetConnection()
        .then((isInternetAvailable) async {
      if (isInternetAvailable) {
        try {
          memberDetailsResponse = await Api.getMemberDetail();
          await SharedPrefs.setMember(
              jsonEncode(memberDetailsResponse?.memberDetails?.toJson()));
          Get.log(SharedPrefs.getMember);
          change(memberDetailsResponse, status: RxStatus.success());
        } catch (e) {
          change(null, status: RxStatus.error());
          AppAlert.showSnackBar(
              Get.context!, AppStrings.unableToProcessRequest);
        }
      } else {
        change(null, status: RxStatus.error());
        AppAlert.showSnackBar(Get.context!, AppStrings.noInternetConnection);
      }
    });
  }

  void showLogoutDialog() {
    Get.defaultDialog(
      title: AppStrings.logout,
      middleText: AppStrings.logoutConfirmMessage,
      onCancel: () => Get.back(),
      barrierDismissible: false,
      titleStyle:
          getTextBold(size: 22.0, colors: ColorConstants.cPrimaryTextColor),
      middleTextStyle:
          getTextMedium(size: 18.0, colors: ColorConstants.cPrimaryTextColor),
      onConfirm: () async {
        await SharedPrefs.clearSharedPreferences();
        Get.offAll(() => const LoginScreenWidget());
      },
    );
  }
}

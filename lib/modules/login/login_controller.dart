import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:member_app_v2/common/alert/app_alert.dart';
import 'package:member_app_v2/common/app_strings.dart';
import 'package:member_app_v2/common/utils/network_utils.dart';
import 'package:member_app_v2/data/remote/api.dart';
import 'package:member_app_v2/data/remote/api_util.dart';
import 'package:member_app_v2/modules/create_account/model/login_mobile_number_screen_request.dart';
import 'package:member_app_v2/modules/create_account/model/login_mobile_number_screen_response.dart';
import 'package:member_app_v2/modules/create_account/view/create_account_screen.dart';
import 'package:member_app_v2/modules/login_mobile_number_otp/view/login_mobile_number_otp_screen.dart';

class LoginController extends GetxController {
  TextEditingController emailPhoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  login() async {
    if (emailPhoneController.text.trim().isEmpty) {
      AppAlert.showSnackBar(Get.context!, AppStrings.enterValidEmailPhone);
    } /* else if (passwordController.text.trim().isEmpty) {
      AppAlert.showSnackBar(Get.context!, AppStrings.enterValidPassword);
    } */
    else {
      await NetworkUtils()
          .checkInternetConnection()
          .then((isInternetAvailable) {
        if (isInternetAvailable) {
          try {
            ApiUtil.apiCallHandler<LoginMobileNumberScreenResponse>(
              () => Api.sendOtp(LoginMobileNumberScreenRequest(
                  mobileNumber: emailPhoneController.text)),
              onApiCallSuccess: (data) {
                if (data?.status ?? false) {
                  AppAlert.showSnackBar(Get.context!, data?.message ?? "");
                  Get.to(() => LoginMobileNumberOtpScreenWidget(
                      sMobileNumber: emailPhoneController.text,
                      isNewUser: false));
                } else {
                  AppAlert.showSnackBar(Get.context!, data?.message ?? "");
                }
              },
            );
          } catch (e) {
            AppAlert.showSnackBar(
                Get.context!, AppStrings.unableToProcessRequest);
          }
        } else {
          AppAlert.showSnackBar(Get.context!, AppStrings.noInternetConnection);
        }
      });
    }
  }

  goToCreateAccount() {
    Get.off(() => const CreateAccountScreenWidget());
  }
}

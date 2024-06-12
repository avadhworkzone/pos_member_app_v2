import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:member_app_v2/common/alert/app_alert.dart';
import 'package:member_app_v2/common/app_strings.dart';
import 'package:member_app_v2/data/remote/api.dart';
import 'package:member_app_v2/data/remote/api_util.dart';
import 'package:member_app_v2/modules/create_account/model/login_mobile_number_screen_request.dart';
import 'package:member_app_v2/modules/create_account/model/login_mobile_number_screen_response.dart';
import 'package:member_app_v2/modules/login_mobile_number_otp/view/login_mobile_number_otp_screen.dart';
import 'package:member_app_v2/modules/welcome/welcome_controller.dart';

class ChangePasswordController extends GetxController {
  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerMobileNumber = TextEditingController();
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerDateofbirth = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  RxBool isTermAccept = false.obs;
  RxBool isReceiveUpdate = false.obs;

  sendOtp() {
    if (controllerMobileNumber.text.toString().length >= 10) {
      _initLoginMobileNumberScreen(controllerMobileNumber.text.toString());
    } else {
      AppAlert.showSnackBar(
        Get.context!,
        AppStrings.pleaseVerifyPhoneNumber,
      );
    }
  }

  Future<void> _initLoginMobileNumberScreen(String sMobileNumber) async {
    try {
      ApiUtil.apiCallHandler<LoginMobileNumberScreenResponse>(
        () => Api.sendOtp(LoginMobileNumberScreenRequest(
            mobileNumber: controllerMobileNumber.text)),
        onApiCallSuccess: (data) {
          if (data?.status ?? false) {
            /* WelcomeScreenController welcomeScreenController =
                Get.put(WelcomeScreenController(), permanent: true);
            welcomeScreenController.isNewUser = true; */
            Get.to(() =>
                LoginMobileNumberOtpScreenWidget(sMobileNumber: sMobileNumber));
          } else {
            AppAlert.showSnackBar(Get.context!, data?.message ?? "");
          }
        },
      );
    } catch (e) {
      AppAlert.showSnackBar(Get.context!, AppStrings.unableToProcessRequest);
    }
  }
}

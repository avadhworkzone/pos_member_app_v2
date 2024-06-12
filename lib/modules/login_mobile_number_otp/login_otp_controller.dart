import 'package:get/get.dart';
import 'package:member_app_v2/common/alert/app_alert.dart';
import 'package:member_app_v2/common/app_strings.dart';
import 'package:member_app_v2/common/otp_under_line_view/otp_field.dart';
import 'package:member_app_v2/common/utils/network_utils.dart';
import 'package:member_app_v2/data/remote/api.dart';
import 'package:member_app_v2/data/remote/api_util.dart';
import 'package:member_app_v2/data/remote/web_constants.dart';
import 'package:member_app_v2/data/shared_prefs/shared_prefs.dart';
import 'package:member_app_v2/modules/create_account/model/login_mobile_number_screen_request.dart';
import 'package:member_app_v2/modules/create_account/model/login_mobile_number_screen_response.dart';
import 'package:member_app_v2/modules/login/model/login_mobile_number_otp_screen_request.dart';
import 'package:member_app_v2/modules/login/model/login_mobile_number_otp_screen_response.dart';
import 'package:member_app_v2/modules/thank_you/view/thank_you_screen.dart';

class LoginOtpController extends GetxController {
  OtpFieldController controllerMobileNumberOtp = OtpFieldController();
  String sOtpPin = "";
  bool isNewUser = true;

  Future<void> initLoginMobileNumberOtpScreen(String phoneNumber) async {
    await NetworkUtils().checkInternetConnection().then((isInternetAvailable) {
      if (isInternetAvailable) {
        try {
          ApiUtil.apiCallHandler<LoginMobileNumberOtpScreenResponse>(
              () => Api.verifyOtp(LoginMobileNumberOtpScreenRequest(
                    userName: phoneNumber,
                    password: sOtpPin,
                    grantType: WebConstants.baseGrantType,
                    scope: WebConstants.baseScope,
                    clientId: WebConstants.baseClientId,
                    clientSecret: WebConstants.baseClientSecret,
                  )),
              onApiCallSuccess: (data) {
                SharedPrefs.setUserToken(data?.token);
                Get.offAll(() => ThankYouScreenWidget(isNewUser: isNewUser));
              },
              onApiCallFail: (errorMessage) => AppAlert.showSnackBar(
                  Get.context!, AppStrings.somethingWentWrong));
        } catch (e) {
          AppAlert.showSnackBar(
              Get.context!, AppStrings.unableToProcessRequest);
        }
      } else {
        AppAlert.showSnackBar(Get.context!, AppStrings.noInternetConnection);
      }
    });
  }

  Future<void> initLoginMobileNumberScreen(String phoneNumber) async {
    await NetworkUtils().checkInternetConnection().then((isInternetAvailable) {
      if (isInternetAvailable) {
        try {
          ApiUtil.apiCallHandler<LoginMobileNumberScreenResponse>(
              () => Api.sendOtp(
                  LoginMobileNumberScreenRequest(mobileNumber: phoneNumber)),
              onApiCallSuccess: (data) {
                AppAlert.showSnackBar(Get.context!, data?.message ?? "");
              },
              onApiCallFail: (errorMessage) => AppAlert.showSnackBar(
                  Get.context!, AppStrings.somethingWentWrong));
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

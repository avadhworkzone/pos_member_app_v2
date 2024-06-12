import 'package:flutter/material.dart';
import 'package:focus_detector/focus_detector.dart';
import 'package:get/get.dart';
import 'package:member_app_v2/common/alert/app_alert.dart';
import 'package:member_app_v2/common/app_strings.dart';
import 'package:member_app_v2/common/button_constants.dart';
import 'package:member_app_v2/common/color_constants.dart';
import 'package:member_app_v2/common/image_assets.dart';
import 'package:member_app_v2/common/otp_under_line_view/otp_field.dart';
import 'package:member_app_v2/common/otp_under_line_view/otp_style.dart';
import 'package:member_app_v2/common/text_styles_constants.dart';
import 'package:member_app_v2/modules/login_mobile_number_otp/login_otp_controller.dart';

import '../../../common/size_constants.dart';

class LoginMobileNumberOtpScreenWidget extends StatefulWidget {
  final String sMobileNumber;
  final bool isNewUser;

  const LoginMobileNumberOtpScreenWidget(
      {super.key, required this.sMobileNumber, this.isNewUser = true});

  @override
  State<LoginMobileNumberOtpScreenWidget> createState() =>
      _LoginMobileNumberOtpScreenWidgetState();
}

class _LoginMobileNumberOtpScreenWidgetState
    extends State<LoginMobileNumberOtpScreenWidget> {
  LoginOtpController loginOtpController = Get.put(LoginOtpController());

  @override
  void initState() {
    super.initState();
    loginOtpController.isNewUser = widget.isNewUser;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(SizeConstants.height * 0.35),
        child: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          flexibleSpace: Container(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(15.0),
                  bottomRight: Radius.circular(15.0)),
              image: DecorationImage(
                image: AssetImage(ImageAssets.imageOtp),
                fit: BoxFit.cover,
              ),
            ),
          ),
          backgroundColor: Colors.white,
          title: Text(
            AppStrings.otpVerification,
            style: getTextBold(
                colors: ColorConstants.cPrimaryTextColor,
                size: SizeConstants.s_18),
          ),
          centerTitle: true,
          elevation: 0,
        ),
      ),
      body: _buildLoginMobileNumberOtpView(),
    );
  }

  _buildLoginMobileNumberOtpView() {
    return FocusDetector(
        child: SafeArea(
      child: SingleChildScrollView(
        child: Column(children: [
          Column(
            children: [
              SizedBox(
                height: SizeConstants.s_16,
              ),
              Center(
                child: Text(
                  AppStrings.enterVerificationCodeHere,
                  style: getTextSemiBold(
                      size: SizeConstants.s_14,
                      colors: ColorConstants.kPrimaryColor),
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                    left: SizeConstants.s_50,
                    right: SizeConstants.s_50,
                    top: SizeConstants.s_20,
                    bottom: SizeConstants.s_30),
                child: OTPTextField(
                  controller: loginOtpController.controllerMobileNumberOtp,
                  onChanged: ((pin) {
                    loginOtpController.sOtpPin = pin;
                  }),
                  length: 4,
                  width: MediaQuery.of(context).size.width,
                  fieldWidth: SizeConstants.s1 * 43,
                  contentPadding: EdgeInsets.only(
                      left: SizeConstants.s4,
                      top: SizeConstants.s_15,
                      bottom: SizeConstants.s_15),
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: SizeConstants.s_18,
                      color: ColorConstants.cBlack),
                  textFieldAlignment: MainAxisAlignment.spaceAround,
                  fieldStyle: FieldStyle.box,
                  onCompleted: (pin) {
                    loginOtpController.sOtpPin = pin;
                    loginOtpController
                        .initLoginMobileNumberOtpScreen(widget.sMobileNumber);
                  },
                ),
              ),
            ],
          ),
          SizedBox(
            height: SizeConstants.s_100,
          ),
          Column(
            children: [
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(horizontal: SizeConstants.s_16),
                child: rectangleRoundedCornerButton(
                    appbarActionInterface: (value) {
                      if (loginOtpController.sOtpPin.length == 4) {
                        loginOtpController.initLoginMobileNumberOtpScreen(
                            widget.sMobileNumber);
                      } else {
                        AppAlert.showSnackBar(
                          context,
                          AppStrings.enterValidPhoneNumberOtp,
                        );
                      }
                    },
                    sButtonTitle: AppStrings.verifyNow,
                    cButtonBackGroundColor: ColorConstants.kPrimaryColor,
                    cButtonTextColor: ColorConstants.cWhite,
                    dButtonTextSize: SizeConstants.s_16,
                    cButtonBorderColor: ColorConstants.kPrimaryColor,
                    dButtonWidth: SizeConstants.width),
              ),
              SizedBox(
                height: SizeConstants.s_16,
              ),
              GestureDetector(
                onTap: () {
                  loginOtpController
                      .initLoginMobileNumberScreen(widget.sMobileNumber);
                },
                child: Text(
                  AppStrings.resendCode,
                  textAlign: TextAlign.center,
                  style: getTextBold(
                      size: SizeConstants.s_14,
                      colors: ColorConstants.cPrimaryTextColor),
                ),
              ),
              SizedBox(
                height: SizeConstants.s_16,
              ),
            ],
          ),
        ]),
      ),
    ));
  }
}

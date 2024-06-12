import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:focus_detector/focus_detector.dart';
import 'package:get/get.dart';
import 'package:member_app_v2/common/app_strings.dart';
import 'package:member_app_v2/common/button_constants.dart';
import 'package:member_app_v2/common/color_constants.dart';
import 'package:member_app_v2/common/size_constants.dart';
import 'package:member_app_v2/common/text_styles_constants.dart';
import 'package:member_app_v2/common/widget/edit_text_field.dart';
import 'package:member_app_v2/modules/create_account/create_account_controller.dart';
import 'package:member_app_v2/modules/weview_data/view/webview_screen.dart';

class CreateAccountScreenWidget extends StatefulWidget {
  const CreateAccountScreenWidget({super.key});

  @override
  State<CreateAccountScreenWidget> createState() =>
      _CreateAccountScreenWidgetState();
}

class _CreateAccountScreenWidgetState extends State<CreateAccountScreenWidget> {
  CreateAccountController createAccountController =
      Get.put(CreateAccountController());

  @override
  Widget build(BuildContext context) {
    SizeConstants(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Login/Create Account",
          style: getTextBold(
              size: SizeConstants.s_18,
              colors: ColorConstants.cPrimaryTextColor),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: _buildLoginMobileNumberView(),
    );
  }

  /*  _fLoginMobileNumberScreenBlocListener(
      BuildContext context, LoginMobileNumberScreenState state) {
    switch (state.status) {
      case LoginMobileNumberScreenStatus.loading:
        AppAlert.showProgressDialog(context);
        break;
      case LoginMobileNumberScreenStatus.failed:
        AppAlert.closeDialog(context);
        if (state.webResponseFailed != null) {
          AppAlert.showSnackBar(
              context, state.webResponseFailed!.statusMessage ?? "");
        } else {
          AppAlert.showSnackBar(
            context,
            MessageConstants.wSomethingWentWrong,
          );
        }
        break;
      case LoginMobileNumberScreenStatus.success:
        AppAlert.closeDialog(context);
        if (state.mLoginMobileNumberScreenResponse!.status!) {
          AppAlert.showSuccess(
            context,
            state.mLoginMobileNumberScreenResponse!.message.toString(),
          ).then((value) async {
            Navigator.pushNamed(
                context, RouteConstants.rLoginMobileNumberOtpScreenWidget,
                arguments: _controllerMobileNumber.text);
          });
        } else {
          AppAlert.showSuccess(
            context,
            state.mLoginMobileNumberScreenResponse!.message.toString(),
          ).then((value) async {});
        }

        break;
    }
  }

  Widget _fLoginMobileNumberScreenViewBuilder(
      BuildContext context, LoginMobileNumberScreenState state) {
    return _buildLoginMobileNumberView();
  } */

  _buildLoginMobileNumberView() {
    return FocusDetector(
        child: SafeArea(
            child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  editTextFiled(createAccountController.controllerName,
                      labelText: "Name"),
                  SizedBox(
                    height: SizeConstants.s_16,
                  ),
                  editTextFiled(createAccountController.controllerMobileNumber,
                      labelText: "Phone No."),
                  SizedBox(
                    height: SizeConstants.s_16,
                  ),
                  editTextFiled(createAccountController.controllerEmail,
                      labelText: "Email"),
                  SizedBox(
                    height: SizeConstants.s_16,
                  ),
                  editTextFiled(createAccountController.controllerDateofbirth,
                      labelText: "Date of Birth"),
                  SizedBox(
                    height: SizeConstants.s_16,
                  ),
                  editTextFiled(createAccountController.controllerPassword,
                      labelText: "Password"),
                  SizedBox(
                    height: SizeConstants.s_16,
                  ),
                  Obx(
                    () => CheckboxListTile(
                      value: createAccountController.isTermAccept.value,
                      onChanged: (value) {
                        createAccountController.isTermAccept.value = value!;
                      },
                      controlAffinity: ListTileControlAffinity.leading,
                      title: RichText(
                        text: TextSpan(
                          text: AppStrings.iAcceptThe,
                          style: getTextMedium(
                              size: SizeConstants.s_14,
                              colors: ColorConstants.cPrimaryTextColor),
                          children: <TextSpan>[
                            TextSpan(
                                text: AppStrings.termCondition,
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () => Get.to(() => WebviewScreenWidget(
                                      title: AppStrings.termCondition,
                                      url:
                                          "https://ecom-front.artisanscloud.com/terms")),
                                style: getTextMedium(
                                    size: SizeConstants.s_14,
                                    colors:
                                        ColorConstants.kPrimaryColor.shade600,
                                    mTextDecoration: TextDecoration.underline)),
                            TextSpan(
                              text: AppStrings.and,
                            ),
                            TextSpan(
                                text: AppStrings.pdpNotice,
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () => Get.to(() => WebviewScreenWidget(
                                      title: AppStrings.termCondition,
                                      url:
                                          "https://ecom-front.artisanscloud.com/terms")),
                                style: getTextRegular(
                                    size: SizeConstants.s_14,
                                    colors:
                                        ColorConstants.kPrimaryColor.shade600,
                                    mTextDecoration: TextDecoration.underline)),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: SizeConstants.s_10,
                  ),
                  Obx(() => CheckboxListTile(
                        value: createAccountController.isReceiveUpdate.value,
                        onChanged: (value) {
                          createAccountController.isReceiveUpdate.value =
                              value!;
                        },
                        controlAffinity: ListTileControlAffinity.leading,
                        title: RichText(
                          text: TextSpan(
                            text: AppStrings.recieveUpdate,
                            style: getTextMedium(
                                size: SizeConstants.s_14,
                                colors: ColorConstants.cPrimaryTextColor),
                            children: <TextSpan>[
                              TextSpan(
                                  text: AppStrings.contactUs,
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () => Get.to(() =>
                                        WebviewScreenWidget(
                                            title: AppStrings.contactUs,
                                            url:
                                                "https://ecom-front.artisanscloud.com/contact-us")),
                                  style: getTextMedium(
                                      size: SizeConstants.s_14,
                                      colors:
                                          ColorConstants.kPrimaryColor.shade600,
                                      mTextDecoration:
                                          TextDecoration.underline)),
                              TextSpan(
                                text: AppStrings.anytime,
                              ),
                            ],
                          ),
                        ),
                      )),
                  SizedBox(
                    height: SizeConstants.s_18,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: GestureDetector(
                      onTap: () => createAccountController.goToLogin(),
                      child: RichText(
                          text: TextSpan(
                              text: AppStrings.alreadyHaveAccount,
                              style: getTextSemiBold(
                                  colors: ColorConstants.cPrimaryTextColor,
                                  size: 16.0),
                              children: <TextSpan>[
                            TextSpan(
                                text: " ${AppStrings.login}",
                                style: getTextBold(
                                    colors: ColorConstants.kPrimaryColor,
                                    size: 16.0))
                          ])),
                    ),
                  )
                ],
              ),
            ),
          ),
          rectangleButton(
              onTap: () {
                createAccountController.sendOtp();
              },
              sButtonTitle: AppStrings.sendOtpCode,
              dButtonWidth: SizeConstants.width),
        ],
      ),
    )));
  }
}

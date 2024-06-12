import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:member_app_v2/common/app_strings.dart';
import 'package:member_app_v2/common/button_constants.dart';
import 'package:member_app_v2/common/color_constants.dart';
import 'package:member_app_v2/common/size_constants.dart';
import 'package:member_app_v2/common/text_styles_constants.dart';
import 'package:member_app_v2/common/widget/edit_text_field.dart';
import 'package:member_app_v2/modules/login/login_controller.dart';

class LoginScreenWidget extends StatefulWidget {
  const LoginScreenWidget({super.key});

  @override
  State<LoginScreenWidget> createState() => _LoginScreenWidgetState();
}

class _LoginScreenWidgetState extends State<LoginScreenWidget> {
  LoginController loginController = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppStrings.login,
          style: getTextBold(
              size: SizeConstants.s_18,
              colors: ColorConstants.cPrimaryTextColor),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(SizeConstants.s_16),
        child: Column(
          children: [
            Expanded(
                child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  editTextFiled(loginController.emailPhoneController,
                      labelText: AppStrings.emailOrPhone),
                  /* SizedBox(
                    height: SizeConstants.s_16,
                  ),
                  editTextFiled(loginController.passwordController,
                      labelText: AppStrings.password), */
                  SizedBox(
                    height: SizeConstants.s_12,
                  ),
                  /* GestureDetector(
                    onTap: () => loginController.goToCreateAccount(),
                    child: RichText(
                        text: TextSpan(
                            text: AppStrings.notHaveAccount,
                            style: getTextSemiBold(
                                colors: ColorConstants.cPrimaryTextColor,
                                size: 16.0),
                            children: <TextSpan>[
                          TextSpan(
                              text: " ${AppStrings.createAccount}",
                              style: getTextBold(
                                  colors: ColorConstants.kPrimaryColor,
                                  size: 16.0))
                        ])),
                  ) */
                  /* textButton(
                      appbarActionInterface: (val) {},
                      sButtonTitle: AppStrings.forgotYourPassword) */
                ],
              ),
            )),
            rectangleButton(
              onTap: () => loginController.login(),
              sButtonTitle: AppStrings.signIn,
              dButtonWidth: SizeConstants.width,
            )
          ],
        ),
      ),
    );
  }
}

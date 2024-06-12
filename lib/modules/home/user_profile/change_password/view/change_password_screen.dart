import 'package:flutter/material.dart';
import 'package:focus_detector/focus_detector.dart';
import 'package:get/get.dart';
import 'package:member_app_v2/common/app_strings.dart';
import 'package:member_app_v2/common/appbars_constants.dart';
import 'package:member_app_v2/common/button_constants.dart';
import 'package:member_app_v2/common/color_constants.dart';
import 'package:member_app_v2/common/image_assets.dart';
import 'package:member_app_v2/common/size_constants.dart';
import 'package:member_app_v2/common/text_styles_constants.dart';
import 'package:member_app_v2/common/widget/edit_text_field.dart';
import 'package:member_app_v2/modules/home/user_profile/change_password/change_password_controller.dart';

class ChangePasswordScreenWidget extends StatefulWidget {
  const ChangePasswordScreenWidget({super.key});

  @override
  State<ChangePasswordScreenWidget> createState() =>
      _ChangePasswordScreenWidgetState();
}

class _ChangePasswordScreenWidgetState
    extends State<ChangePasswordScreenWidget> {
  ChangePasswordController mChangePasswordController =
      Get.put(ChangePasswordController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBars.arianiAppBar(
            title: Text(AppStrings.changePasswordTitle,
                style: getTextSemiBold(
                  colors: ColorConstants.cWhite,
                  size: SizeConstants.s1 * 20,
                )),
            leading: IconButton(
                onPressed: () => navigateBack(),
                icon: const Icon(Icons.arrow_back))),
        body: _buildMyChangePasswordScreenScreenWidgetView());
  }

  _buildMyChangePasswordScreenScreenWidgetView() {
    return FocusDetector(
        onVisibilityGained: () {},
        child: SafeArea(
            child: Column(children: [
          Expanded(
              child: Container(
                  padding: const EdgeInsets.all(16.0),
                  child: SingleChildScrollView(
                      child: Column(children: [
                    editTextFiled(mChangePasswordController.controllerPassword,
                        labelText: "Old Password"),
                    SizedBox(
                      height: SizeConstants.s_16,
                    ),
                    editTextFiled(mChangePasswordController.controllerName,
                        labelText: "New Password"),
                    SizedBox(
                      height: SizeConstants.s_16,
                    ),
                    editTextFiled(mChangePasswordController.controllerName,
                        labelText: "Confirm password"),
                  ])))),
          rectangleButton(
              onTap: () {},
              sButtonTitle: AppStrings.saveInformation,
              dButtonWidth: SizeConstants.width),
        ])));
  }

  navigateBack() {
    Get.back();
  }
}

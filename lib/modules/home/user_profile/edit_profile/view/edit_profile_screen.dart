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
import 'package:member_app_v2/modules/home/user_profile/edit_profile/edit_profile_controller.dart';

class EditProfileScreenWidget extends StatefulWidget {
  const EditProfileScreenWidget({super.key});

  @override
  State<EditProfileScreenWidget> createState() =>
      _EditProfileScreenWidgetState();
}

class _EditProfileScreenWidgetState extends State<EditProfileScreenWidget> {
  EditProfileController editProfileController =
      Get.put(EditProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBars.arianiAppBar(
            title: Text(AppStrings.editProfile,
                style: getTextSemiBold(
                  colors: ColorConstants.cWhite,
                  size: SizeConstants.s1 * 20,
                )),
            leading: IconButton(
                onPressed: () => navigateBack(),
                icon: const Icon(Icons.arrow_back))),
        body: _buildMyEditProfileScreenScreenWidgetView());
  }

  navigateBack() {
    Get.back();
  }

  _buildMyEditProfileScreenScreenWidgetView() {
    return FocusDetector(
        child: SafeArea(
      child: Column(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: SizeConstants.width * 0.18,
                      width: SizeConstants.width * 0.18,
                      padding: EdgeInsets.all(SizeConstants.s_10),
                      decoration: BoxDecoration(
                        color: ColorConstants.kPrimaryColor.shade100,
                        shape: BoxShape.circle,
                      ),
                      child: ClipOval(
                          child: Image.asset(
                        ImageAssets.imageProfileLogo,
                      )),
                    ),
                    SizedBox(height: SizeConstants.s1 * 8),
                    Text(
                      "Maisarah Ali",
                      style: getTextBold(
                          colors: ColorConstants.cPrimaryTextColor, size: SizeConstants.s1 * 16.0),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      "Ariani Family",
                      style: getTextSemiBold(
                          colors: ColorConstants.cPrimaryTextColor,
                          size: SizeConstants.s1 * 12.0),
                    ),
                    SizedBox(height: SizeConstants.s1 * 8),
                    editTextFiled(editProfileController.controllerName,
                        labelText: "Title"),
                    SizedBox(
                      height: SizeConstants.s_16,
                    ),
                    editTextFiled(editProfileController.controllerName,
                        labelText: "Name"),
                    SizedBox(
                      height: SizeConstants.s_16,
                    ),
                    Row(
                      children: [
                        Expanded(child: editTextFiled(editProfileController.controllerName,
                            labelText: "Race"),),
                        SizedBox(
                          width: SizeConstants.s1*10,
                        ),
                        Expanded(child: editTextFiled(editProfileController.controllerName,
                            labelText: "Gender"),),
                      ],
                    ),
                    SizedBox(
                      height: SizeConstants.s_16,
                    ),

                    editTextFiled(editProfileController.controllerEmail,
                        labelText: "Email"),
                    SizedBox(
                      height: SizeConstants.s_16,
                    ),
                    editTextFiled(editProfileController.controllerDateofbirth,
                        labelText: "Date of Birth"),
                    SizedBox(
                      height: SizeConstants.s_16,
                    ),
                    editTextFiled(editProfileController.controllerMobileNumber,
                        labelText: "Phone No."),
                    SizedBox(
                      height: SizeConstants.s_16,
                    ),
                  ],
                ),
              ),
            ),
          ),
          rectangleButton(
              onTap: () {},
              sButtonTitle: AppStrings.saveInformation,
              dButtonWidth: SizeConstants.width),
        ],
      ),
    ));
  }
}

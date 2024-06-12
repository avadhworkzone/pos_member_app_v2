import 'package:flutter/material.dart';
import 'package:focus_detector/focus_detector.dart';
import 'package:get/get.dart';
import 'package:member_app_v2/common/app_strings.dart';
import 'package:member_app_v2/common/appbars_constants.dart';
import 'package:member_app_v2/common/color_constants.dart';
import 'package:member_app_v2/common/image_assets.dart';
import 'package:member_app_v2/common/size_constants.dart';
import 'package:member_app_v2/common/text_styles_constants.dart';

class AccountSettingsScreenWidget extends StatefulWidget {
  const AccountSettingsScreenWidget({super.key});

  @override
  State<AccountSettingsScreenWidget> createState() =>
      _AccountSettingsScreenWidgetState();
}

class _AccountSettingsScreenWidgetState extends State<AccountSettingsScreenWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBars.arianiAppBar(
            title: Text(AppStrings.accountSettingsTitle,
                style: getTextSemiBold(
                  colors: ColorConstants.cWhite,
                  size: SizeConstants.s1 * 20,
                )),
            leading: IconButton(
                onPressed: () => navigateBack(),
                icon: const Icon(Icons.arrow_back))),
        body: _buildMyAccountSettingsScreenScreenWidgetView());
  }

  _buildMyAccountSettingsScreenScreenWidgetView() {
    return FocusDetector(
        onVisibilityGained: () {},
        child: SafeArea(
            child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

            ]))));
  }

  navigateBack() {
    Get.back();
  }
}

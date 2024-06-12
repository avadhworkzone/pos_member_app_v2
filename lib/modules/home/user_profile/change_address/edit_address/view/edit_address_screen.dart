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
import 'package:member_app_v2/modules/home/user_profile/change_address/edit_address/edit_address_controller.dart';
import 'package:member_app_v2/modules/home/user_profile/change_address/mode/model_address.dart';

class EditAddressScreenWidget extends StatefulWidget {
  final ModelAddress mModelAddress;

  const EditAddressScreenWidget({super.key, required this.mModelAddress});

  @override
  State<EditAddressScreenWidget> createState() =>
      _EditAddressScreenWidgetState();
}

class _EditAddressScreenWidgetState extends State<EditAddressScreenWidget> {
  EditAddressController mEditAddressController =
      Get.put(EditAddressController());

  ///AppStrings.editAddress
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBars.arianiAppBar(
            title: Text(widget.mModelAddress.sTitle,
                style: getTextSemiBold(
                  colors: ColorConstants.cWhite,
                  size: SizeConstants.s1 * 20,
                )),
            leading: IconButton(
                onPressed: () => navigateBack(),
                icon: const Icon(Icons.arrow_back))),
        body: _buildMyEditAddressScreenScreenWidgetView());
  }

  _buildMyEditAddressScreenScreenWidgetView() {
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
                    editTextFiled(mEditAddressController.controllerName,
                        labelText: "Recipient Name"),
                    SizedBox(
                      height: SizeConstants.s_16,
                    ),
                    editTextFiled(mEditAddressController.controllerMobileNumber,
                        labelText: "Phone Number"),
                    SizedBox(
                      height: SizeConstants.s_16,
                    ),
                    editTextFiled(mEditAddressController.controllerMobileNumber,
                        labelText: "Address"),
                    SizedBox(
                      height: SizeConstants.s_16,
                    ),
                    editTextFiled(mEditAddressController.controllerMobileNumber,
                        labelText: "Postcode"),
                    SizedBox(
                      height: SizeConstants.s_16,
                    ),
                    editTextFiled(mEditAddressController.controllerMobileNumber,
                        labelText: "State"),
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
              sButtonTitle: AppStrings.makeDefaultAddress,
              dButtonWidth: SizeConstants.width),
        ],
      ),
    ));
  }

  navigateBack() {
    Get.back();
  }
}

import 'package:flutter/material.dart';
import 'package:focus_detector/focus_detector.dart';
import 'package:get/get.dart';
import 'package:member_app_v2/common/app_strings.dart';
import 'package:member_app_v2/common/appbars_constants.dart';
import 'package:member_app_v2/common/button_constants.dart';
import 'package:member_app_v2/common/color_constants.dart';
import 'package:member_app_v2/common/size_constants.dart';
import 'package:member_app_v2/common/text_styles_constants.dart';
import 'package:member_app_v2/modules/home/user_profile/change_address/edit_address/view/edit_address_screen.dart';
import 'package:member_app_v2/modules/home/user_profile/change_address/mode/model_address.dart';

class ChangeAddressScreenWidget extends StatefulWidget {
  const ChangeAddressScreenWidget({super.key});

  @override
  State<ChangeAddressScreenWidget> createState() =>
      _ChangeAddressScreenWidgetState();
}

class _ChangeAddressScreenWidgetState extends State<ChangeAddressScreenWidget> {
  late List<AddressDetails> mAddressDetailsList = [];

  @override
  void initState() {
    mAddressDetailsList.add(AddressDetails(
      sAddress: "No 1, Jalan 2, Apartment 3",
      sPhoneNumber: "+60123456789",
      sPostcode: "42500",
      sRecipientName: "Maisarah Ali",
      sState: "Petaling Jaya",
    ));

    mAddressDetailsList.add(AddressDetails(
      sAddress: "Usj 19 city mall",
      sPhoneNumber: "+60176172385",
      sPostcode: "42800",
      sRecipientName: "Partha paul",
      sState: "Suban Jaya",
    ));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBars.arianiAppBar(
            title: Text(AppStrings.changeAddress,
                style: getTextSemiBold(
                  colors: ColorConstants.cWhite,
                  size: SizeConstants.s1 * 20,
                )),
            leading: IconButton(
                onPressed: () => navigateBack(),
                icon: const Icon(Icons.arrow_back))),
        body: _buildMyChangeAddressScreenScreenWidgetView());
  }

  _buildMyChangeAddressScreenScreenWidgetView() {
    return FocusDetector(
        onVisibilityGained: () {},
        child: SafeArea(
            child: Column(
          children: [
            Expanded(
                child: Container(
                    padding: EdgeInsets.all(SizeConstants.s1 * 15),
                    child: ListView.builder(
                        itemCount: mAddressDetailsList.length,
                        itemBuilder: (context, index) {
                         return rowViewAddress(mAddressDetailsList[index]);
                        }))),
            rectangleButton(
                onTap: () {
                  Get.to(() => EditAddressScreenWidget(
                        mModelAddress: ModelAddress(
                            AppStrings.addAddress, AddressDetails()),
                      ));
                },
                sButtonTitle: AppStrings.addNewAddress,
                dButtonWidth: SizeConstants.width),
          ],
        )));
  }

  navigateBack() {
    Get.back();
  }

  rowViewAddress(AddressDetails mAddressDetails) {
    return
      GestureDetector(
        onTap: () {
          Get.to(() => EditAddressScreenWidget(
            mModelAddress: ModelAddress(
                AppStrings.editProfile, mAddressDetails),
          ));
        },
        child:Container(
          color: Colors.transparent,
          margin: EdgeInsets.only(bottom: SizeConstants.s1*15),
          child: Row(
            children: [Expanded(child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(mAddressDetails.sRecipientName??"",style: getTextSemiBold(
                    colors: ColorConstants.cNavyBlueColor, size: SizeConstants.s1 * 16),),
                SizedBox(height: SizeConstants.s1*5,),
                Text(mAddressDetails.sPhoneNumber??"",style: getTextRegular(
                    colors: ColorConstants.cNavyBlueColor, size: SizeConstants.s1 * 16),),
                SizedBox(height: SizeConstants.s1*5,),

                Text(mAddressDetails.sAddress??"",style: getTextRegular(
                    colors: ColorConstants.cNavyBlueColor, size: SizeConstants.s1 * 16),),
                Text(mAddressDetails.sState??"",style: getTextRegular(
                    colors: ColorConstants.cNavyBlueColor, size: SizeConstants.s1 * 16),),
                Text(mAddressDetails.sPostcode??"",style: getTextRegular(
                    colors: ColorConstants.cNavyBlueColor, size: SizeConstants.s1 * 16),),

              ],
            )),
              Icon( Icons.arrow_forward_ios, size: SizeConstants.s1 * 18,color: ColorConstants.kPrimaryColor,)

            ],
          ),
        ) ,
      );
  }
}

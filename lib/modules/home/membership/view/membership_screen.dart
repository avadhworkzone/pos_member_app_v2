import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:member_app_v2/common/app_strings.dart';
import 'package:member_app_v2/common/color_constants.dart';
import 'package:member_app_v2/common/image_assets.dart';
import 'package:member_app_v2/common/size_constants.dart';
import 'package:member_app_v2/common/text_styles_constants.dart';
import 'package:member_app_v2/common/widget/app_getx_future_builder.dart';
import 'package:member_app_v2/common/widget/app_image_widget.dart';
import 'package:member_app_v2/modules/home/membership/view/view_transaction_screen.dart';
import 'package:member_app_v2/modules/home/profile/model/get_members_details_response.dart';
import 'package:member_app_v2/modules/home/profile/profile_controller.dart';
import '../../../../common/utils/type_def_utils.dart' as tpdf;
import 'claim_rewards_screen.dart';
import 'my_voucher_screen.dart';

class MembershipScreenWidget extends StatefulWidget {
  const MembershipScreenWidget({super.key});

  @override
  State<MembershipScreenWidget> createState() => _MembershipScreenWidgetState();
}

class _MembershipScreenWidgetState extends State<MembershipScreenWidget> {
  ProfileController profileController = Get.find<ProfileController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppGetXFutureBuilder<GetMemberDetailsResponse>(
        controller: profileController,
        builder: (data) {
          return SizedBox(
            width: SizeConstants.width,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 15),
                  Text(
                    data?.memberDetails?.availableLoyaltyPoints?.toString() ??
                        "",
                    style: getTextBigBold(
                        colors: ColorConstants.kPrimaryColor, size: 44.0),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    AppStrings.loyaltyPoints,
                    style: getTextMedium(
                        colors: ColorConstants.cPrimaryTextColor, size: 16.0),
                  ),
                  const SizedBox(height: 15),
                  SizedBox(
                      width: SizeConstants.width * 0.95,
                      child: Image.asset(ImageAssets.imageMemberCard,
                          fit: BoxFit.fill)),
                  const SizedBox(height: 10),
                  Text(
                    AppStrings.membershipCard,
                    style: getTextMedium(
                        colors: ColorConstants.cPrimaryTextColor, size: 16.0),
                  ),
                  const SizedBox(height: 20),
                  ListTile(
                    leading: Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Image.asset(ImageAssets.imageApplePay),
                    ),
                    title: Text(
                      AppStrings.addToAppleWallet,
                      style: getTextBold(
                          colors: ColorConstants.cPrimaryTextColor, size: 18.0),
                    ),
                    trailing: const Icon(
                      Icons.arrow_forward_ios,
                      color: ColorConstants.kPrimaryColor,
                    ),
                    horizontalTitleGap: 0,
                  ),
                  const Divider(color: ColorConstants.cDividerColor),
                  const SizedBox(height: 15),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only(left: 16),
                    child: Text(
                      AppStrings.membershipManagement,
                      style: getTextRegular(
                          colors: ColorConstants.cPrimaryTextColor, size: 12.0),
                    ),
                  ),
                  const SizedBox(height: 20),
                  menuTile(ImageAssets.iconRewards, AppStrings.claimRewards,
                      Icons.arrow_forward_ios, () {
                    Get.to(() => const ClaimRewardsScreen());
                  }),
                  const Divider(color: ColorConstants.cDividerColor),
                  menuTile(ImageAssets.iconVouchers, AppStrings.myVouchers,
                      Icons.arrow_forward_ios, () {
                    Get.to(() => const MyVoucherScreen());
                  }, "10"),
                  const Divider(color: ColorConstants.cDividerColor),
                  menuTile(ImageAssets.iconTransactions,
                      AppStrings.viewTransactions, Icons.arrow_forward_ios, () {
                    Get.to(() => const ViewTransactionScreen());
                  })
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  menuTile(String leadingIcon, String title, IconData trailIcon,
      final tpdf.OnTap? onDataTap,
      [String? badgeCount]) {
    return ListTile(
      onTap: onDataTap,
      iconColor: ColorConstants.kPrimaryColor,
      leading: AppImageWidget(
          asset: leadingIcon, height: 20, width: 20, fit: BoxFit.contain),
      title: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(title),
        if (badgeCount != null) ...[
          Container(
              padding: const EdgeInsets.all(5),
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: ColorConstants.kPrimaryColor),
              child: Text(
                badgeCount,
                style: getTextBold(),
              ))
        ]
      ]),
      titleTextStyle:
          getTextBold(colors: ColorConstants.cPrimaryTextColor, size: 18.0),
      trailing: Icon(trailIcon),
      horizontalTitleGap: 0,
    );
  }
}

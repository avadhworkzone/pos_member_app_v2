import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:member_app_v2/common/app_strings.dart';
import 'package:member_app_v2/common/appbars_constants.dart';
import 'package:member_app_v2/common/widget/app_getx_future_builder.dart';
import '../../../../common/color_constants.dart';
import '../../../../common/text_styles_constants.dart';
import '../get_voucher_controller.dart';

class ViewTransactionScreen extends StatefulWidget {
  const ViewTransactionScreen({Key? key}) : super(key: key);

  @override
  State<ViewTransactionScreen> createState() => _ViewTransactionScreenState();
}

class _ViewTransactionScreenState extends State<ViewTransactionScreen> {
  MyVoucherController voucherController = Get.put(MyVoucherController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBars.arianiAppBar(
          title: Text(AppStrings.viewTransactions,
              style: getTextSemiBold(colors: Colors.white, size: 16.0)),
          leading: IconButton(
              icon: GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: const Icon(Icons.arrow_back)),
              onPressed: () {})),
      body: AppGetXFutureBuilder<MemberShipScreenResponse>(
        builder: (data) {
          return Column(
            children: [
              Align(
                alignment: Alignment.center,
                child: Text('${data!.transactionReponse!.totalPoints}',
                    style: getTextBigBold(
                        colors: ColorConstants.kPrimaryColor, size: 40.0)),
              ),
              Text(AppStrings.loyaltyPoints,
                  style: getTextRegular(
                      colors: ColorConstants.cPrimaryTextColor, size: 14.0)),
              Expanded(
                child: ListView.builder(
                  controller: voucherController.scrollController1,
                  itemCount: voucherController.transactionList.length,
                  itemBuilder: (context, index) {
                    return Column(children: [
                      const Divider(),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 15, right: 15, top: 10, bottom: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              voucherController.transactionList[index].type ??
                                  '',
                              style: getTextBold(
                                  colors: ColorConstants.cTextColor),
                            ),
                            Text(
                              '${voucherController.transactionList[index].points ?? ''}',
                              style: getTextBold(
                                  colors: ColorConstants.cPinkTextColor),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 15, right: 15, bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'x1 Shawl 249 Embroidery Iris In Lavender',
                              style: getTextRegular(
                                  colors: ColorConstants.cLightGreyTextColor),
                            ),
                            Text(
                              'RM299',
                              style: getTextMedium(
                                  colors: ColorConstants.cTextColor),
                            ),
                          ],
                        ),
                      ),
                    ]);
                  },
                ),
              )
            ],
          );
        },
        controller: voucherController,
      ),
    );
  }
}

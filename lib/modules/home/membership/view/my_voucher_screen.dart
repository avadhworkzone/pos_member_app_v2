import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:member_app_v2/common/widget/app_getx_future_builder.dart';
import '../../../../common/app_strings.dart';
import '../../../../common/appbars_constants.dart';
import '../../../../common/color_constants.dart';
import '../../../../common/text_styles_constants.dart';
import '../get_voucher_controller.dart';

class MyVoucherScreen extends StatefulWidget {
  const MyVoucherScreen({super.key});

  @override
  State<MyVoucherScreen> createState() => _MyVoucherScreenState();
}

class _MyVoucherScreenState extends State<MyVoucherScreen> {
  TextEditingController searchController = TextEditingController();
  MyVoucherController voucherController = Get.put(MyVoucherController());
  // int page = 1;
  // ScrollController? scrollController;
  // bool isFirstTime = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: Scaffold(
          appBar: AppBars.arianiAppBar(
              title: Text(AppStrings.myVouchers,
                  style: getTextSemiBold(colors: Colors.white, size: 16.0)),
              leading: IconButton(
                  icon: GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: const Icon(Icons.arrow_back)),
                  onPressed: () {})),
          body: Column(children: [
            Container(
              color: ColorConstants.kPrimaryColor,
              child: TabBar(indicatorColor: Colors.white, tabs: [
                Tab(
                    child:
                        Text(AppStrings.myVouchers, style: getTextSemiBold())),
                Tab(child: Text(AppStrings.history, style: getTextSemiBold())),
                const SizedBox()
              ]),
            ),
            SizedBox(height: Get.width / 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TextFormField(
                  controller: searchController,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                      hintText: AppStrings.searchHistory,
                      fillColor: ColorConstants.cSearchBarColor,
                      border: InputBorder.none,
                      filled: true,
                      disabledBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      contentPadding: const EdgeInsets.all(15),
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(left: Get.width / 9),
                        child: const Icon(Icons.search_rounded),
                      ))),
            ),

            // SizedBox(
            //   height: Get.width/7,
            //   width: Get.width/1.1,
            //   child: EasySearchBar(
            //     searchBackIconTheme: const IconThemeData(color: Colors.red,opacity: 0,),
            //     putActionsOnRight: false,
            //     appBarHeight: Get.width/3,
            //     title: Text('Search voucher'),
            //     titleTextStyle: getTextLight(colors: Colors.grey, size: 14.0),
            //     searchHintText: 'Search voucher',
            //     iconTheme: const IconThemeData(color: Colors.grey),
            //     backgroundColor: ColorConstants.cSearchBarColor,
            //     // onSearch: (value) => categoriesController.searchValue = value,
            //     // suggestions: categoriesController.suggestions,
            //     // onSuggestionTap: (data) => categoriesController.onSuggestionTap(data),
            //     suggestionBuilder: (data) {
            //       return Container(
            //         padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            //         child: Text(
            //           data,
            //           style: getTextSemiBold(colors: ColorConstants.cPrimaryTextColor),
            //         ),
            //       );
            //     },
            //     elevation: 0,
            //     openOverlayOnSearch: true,
            //     suggestionsElevation: 0,
            //     searchHintStyle:
            //     getTextMedium(colors: ColorConstants.cPrimaryTextColor), onSearch: (String ) {  },
            //   ),
            // ),

            AppGetXFutureBuilder<MemberShipScreenResponse>(
              controller: voucherController,
              builder: (data) {
                return data == null ||
                        data.voucherReponse == null ||
                        data.voucherReponse!.vouchers == null
                    ? const SizedBox()
                    : Expanded(
                        child: ListView.builder(
                          itemCount: voucherController.voucherDataList.length,
                          shrinkWrap: true,
                          controller: voucherController.scrollController,
                          // physics: ClampingScrollPhysics(),
                          // shrinkWrap: true,
                          // physics: NeverScrollableScrollPhysics(),
                          padding: const EdgeInsets.only(top: 20, bottom: 20),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(left: 15),
                                    decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(20.0),
                                            bottomLeft: Radius.circular(20.0))),
                                    height: 90,
                                    width: Get.width / 1.5,
                                    child: ClipPath(
                                      clipper: TopBottomRightCircleClipper(),
                                      child: Container(
                                        decoration: const BoxDecoration(
                                            color: Colors.orange,
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(20.0),
                                                bottomLeft:
                                                    Radius.circular(20.0))),
                                        child: ClipRRect(
                                            borderRadius:
                                                const BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(10.0),
                                                    bottomLeft:
                                                        Radius.circular(10.0)),
                                            child: Image.asset(
                                                "assets/images/category_scarves.png",
                                                fit: BoxFit.fill)),
                                      ),
                                    ),
                                  ),
                                  ClipPath(
                                    clipper: TopLeftCircleClipper(),
                                    child: Container(
                                      height: 90,
                                      width: Get.width / 4,
                                      decoration: const BoxDecoration(
                                          color: Color(0XFFB32572),
                                          borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(10.0),
                                              bottomRight:
                                                  Radius.circular(10.0))),
                                      child: Center(
                                          child: voucherController
                                                      .voucherDataList[index]
                                                      .discountType ==
                                                  'PERCENTAGE'
                                              ? Text(
                                                  '${voucherController.voucherDataList[index].percentage ?? '0.00'}%',
                                                  // data.vouchers![index].percentage ??
                                                  //     "0.00",
                                                  style: const TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w900,
                                                      fontSize: 16))
                                              : Text(
                                                  'RM${voucherController.voucherDataList[index].flatAmount ?? '0.00'} OFF',

                                                  // data.vouchers![index].percentage ??
                                                  //     "0.00",
                                                  style: const TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w900,
                                                      fontSize: 16),
                                                  textAlign: TextAlign.center,
                                                )),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      );
              },
            )
          ])),
    );
  }
}

///===============bottomrigth======================///
class TopBottomRightCircleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(0, 0); // Start from the top-left corner
    path.lineTo(
        size.width - 20, 0); // Move to the top-right corner with an offset
    path.arcToPoint(
      Offset(size.width, 20),
      radius: const Radius.circular(20),
      clockwise: false,
    ); // Draw the quarter-circle at the top-right corner
    path.lineTo(size.width,
        size.height - 20); // Move to the bottom-right corner with an offset
    path.arcToPoint(
      Offset(size.width - 20, size.height),
      radius: const Radius.circular(20),
      clockwise: false,
    ); // Draw the quarter-circle at the bottom-right corner
    path.lineTo(0, size.height); // Move to the bottom-left corner
    path.close(); // Close the path to form a clipped shape
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

///===============bottomleft======================///

class TopLeftCircleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(0, 20);
    path.arcToPoint(
      const Offset(20, 0),
      radius: const Radius.circular(20),
      clockwise: false,
    );
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(20, size.height);
    path.arcToPoint(Offset(0, size.height - 20),
        radius: const Radius.circular(20), clockwise: false);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

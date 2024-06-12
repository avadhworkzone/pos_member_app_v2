import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:member_app_v2/common/color_constants.dart';
import 'package:member_app_v2/modules/home/membership/get_voucher_controller.dart';
import 'package:member_app_v2/modules/home/membership/model/get_voucher_response.dart';
import '../../../../common/app_strings.dart';
import '../../../../common/appbars_constants.dart';
import '../../../../common/text_styles_constants.dart';
import '../../../../common/widget/app_getx_future_builder.dart';

class ClaimRewardsScreen extends StatefulWidget {
  const ClaimRewardsScreen({super.key});

  @override
  State<ClaimRewardsScreen> createState() => _ClaimRewardsScreenState();
}

class _ClaimRewardsScreenState extends State<ClaimRewardsScreen> {
  int currentIndex = 0;
  bool isVoucherClick = false;
  bool isBool = false;
  MyVoucherController voucherController = Get.put(MyVoucherController());
  List imageList = [
    'assets/images/category_scarves.png',
    'assets/images/category_ready_wear.png',
    'assets/images/category_scarves.png',
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: Scaffold(
          appBar: AppBars.arianiAppBar(
            title: Text(
              AppStrings.claimRewards,
              style: getTextSemiBold(colors: Colors.white, size: 16.0),
            ),
            leading: IconButton(
                icon: GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: const Icon(Icons.arrow_back)),
                onPressed: () {}),
          ),
          body: Column(children: [
            Container(
              color: ColorConstants.kPrimaryColor,
              child: TabBar(indicatorColor: Colors.white, tabs: [
                Tab(child: Text('Discount Vouchers', style: getTextSemiBold())),
                Tab(child: Text('Exclusive Items', style: getTextSemiBold())),
                Tab(child: Text('Others', style: getTextSemiBold())),
              ]),
            ),
            isVoucherClick == false
                ? Expanded(
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              border: Border.all(color: Colors.grey)),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Stack(
                              alignment: Alignment.bottomCenter,
                              children: [
                                CarouselSlider(
                                  options: CarouselOptions(
                                      height: 200,
                                      aspectRatio: Get.width,
                                      viewportFraction: 1.5,
                                      initialPage: 0,
                                      scrollDirection: Axis.horizontal,
                                      onPageChanged: (index, reason) {
                                        setState(() {
                                          currentIndex = index;
                                        });
                                      }),
                                  items: imageList
                                      .map(
                                        (item) => imageList.isEmpty
                                            ? Image.asset(
                                                'assets/images/no_image_available.png',
                                                width: Get.width,
                                                fit: BoxFit.fill)
                                            : Image.asset(
                                                item,
                                                width: Get.width,

                                                ///MediaQuery.of(context).size.width,
                                                fit: BoxFit.cover,
                                              ),
                                      )
                                      .toList(),

                                  // data?.bottomBannersReponse?.data?.edges?.map((i) {
                                  //   return Builder(
                                  //     builder: (BuildContext context) {
                                  //       return Container(
                                  //           clipBehavior: Clip.antiAliasWithSaveLayer,
                                  //           decoration: const BoxDecoration(
                                  //               color: ColorConstants.cBlack,
                                  //               borderRadius:
                                  //               BorderRadius.all(Radius.circular(8.0))),
                                  //           width: SizeConstants.width * 0.9,
                                  //           height: SizeConstants.height,
                                  //           child: AppImageWidget(
                                  //               asset: i.node?.imageUrl ?? "",
                                  //               fit: BoxFit.contain));
                                  //     },
                                  //   );
                                  // }).toList(),
                                ),
                                DotsIndicator(
                                  dotsCount: 3,
                                  position: currentIndex,
                                  decorator: DotsDecorator(
                                    color: Colors.white,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.0)),
                                    activeShape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.0)),
                                    size: const Size(10, 10),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),

                        // AppGetXFutureBuilder<MemberShipScreenResponse>(
                        //   builder: (data) {
                        //     return Text(
                        //         '${data!.transactionReponse!.totalPoints}',
                        //         style: getTextBigBold(
                        //             colors: ColorConstants.kPrimaryColor,
                        //             size: 40.0));
                        //   },
                        //   controller: voucherController,
                        // ),
                        // Text(AppStrings.loyaltyPoints,
                        //     style: getTextRegular(
                        //         colors: ColorConstants.cPrimaryTextColor,
                        //         size: 14.0)),

                        AppGetXFutureBuilder<MemberShipScreenResponse>(
                          controller: voucherController,
                          builder: (data) {
                            return Expanded(
                              child: Column(
                                children: [
                                  Text(
                                      '${data!.transactionReponse!.totalPoints}',
                                      style: getTextBigBold(
                                          colors: ColorConstants.kPrimaryColor,
                                          size: 40.0)),
                                  Text(AppStrings.loyaltyPoints,
                                      style: getTextRegular(
                                          colors:
                                              ColorConstants.cPrimaryTextColor,
                                          size: 14.0)),
                                  Expanded(
                                    child: ListView.builder(
                                      controller:
                                          voucherController.scrollController,
                                      itemCount: voucherController
                                          .voucherDataList.length,
                                      padding: const EdgeInsets.only(
                                          top: 20, bottom: 20),
                                      itemBuilder: (context, index) {
                                        return Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 10),
                                          child: InkWell(
                                            onTap: () {
                                              isVoucherClick = true;
                                              setState(() {});
                                            },
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Container(
                                                  margin: const EdgeInsets.only(
                                                      left: 15),
                                                  decoration: const BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.only(
                                                              topLeft: Radius
                                                                  .circular(
                                                                      20.0),
                                                              bottomLeft: Radius
                                                                  .circular(
                                                                      20.0))),
                                                  height: 90,
                                                  width: Get.width / 1.5,
                                                  child: ClipPath(
                                                    clipper:
                                                        TopBottomRightCircleClipper(),
                                                    child: Container(
                                                      decoration: const BoxDecoration(
                                                          color: Colors.orange,
                                                          borderRadius:
                                                              BorderRadius.only(
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          20.0),
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          20.0))),
                                                      child: ClipRRect(
                                                          borderRadius:
                                                              const BorderRadius
                                                                  .only(
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          10.0),
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          10.0)),
                                                          child: Image.asset(
                                                              "assets/images/category_scarves.png",
                                                              fit:
                                                                  BoxFit.fill)),
                                                    ),
                                                  ),
                                                ),
                                                ClipPath(
                                                  clipper:
                                                      TopLeftCircleClipper(),
                                                  child: Container(
                                                    height: 90,
                                                    width: Get.width / 4,
                                                    decoration: const BoxDecoration(
                                                        color:
                                                            Color(0XFFB32572),
                                                        borderRadius:
                                                            BorderRadius.only(
                                                                topRight: Radius
                                                                    .circular(
                                                                        10.0),
                                                                bottomRight: Radius
                                                                    .circular(
                                                                        10.0))),
                                                    child: Center(
                                                      child: voucherController
                                                                  .voucherDataList[
                                                                      index]
                                                                  .discountType ==
                                                              'PERCENTAGE'
                                                          ? Text(
                                                              '${voucherController.voucherDataList[index].percentage ?? '0.00'}%',
                                                              // data.vouchers![index].percentage ??
                                                              //     "0.00",
                                                              style: const TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w900,
                                                                  fontSize: 16))
                                                          : Text(
                                                              'RM${voucherController.voucherDataList[index].flatAmount ?? '0.00'} OFF',

                                                              // data.vouchers![index].percentage ??
                                                              //     "0.00",
                                                              style: const TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w900,
                                                                  fontSize: 16),
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                            ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        )
                      ],
                    ),
                  )
                : Expanded(
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: Get.height * 0.02),
                              child: Image.asset(
                                  "assets/images/category_scarves.png"),
                            ),
                            isBool == false
                                ? Column(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: Get.width * 0.05),
                                        child: const Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "20% OFF for",
                                              style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 18,
                                                color: Color(0XFFB32572),
                                              ),
                                            ),
                                            Text(
                                              "200",
                                              style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 22,
                                                color: Color(0XFFB32572),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: Get.width * 0.05),
                                        child: const Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "ICONIC II Series",
                                              style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 18,
                                                color: Color(0XFFB32572),
                                              ),
                                            ),
                                            Text(
                                              "Points",
                                              style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 14,
                                                color: Color(0XFF98A2B3),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: Get.width * 0.05,
                                            vertical: Get.height * 0.02),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text(
                                              "What’s inside?",
                                              style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 17,
                                                color: Color(0XFF1D2939),
                                              ),
                                            ),
                                            Icon(
                                              Icons.minimize,
                                              color: const Color(0XFF1D2939),
                                              size: Get.width * 0.06,
                                            )
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: Get.width * 0.05),
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.circle_rounded,
                                              color: const Color(0XFF1D2939),
                                              size: Get.width * 0.01,
                                            ),
                                            const Text(
                                              "  A limited time 20% off for Iconic II Series.",
                                              style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 12,
                                                color: Color(0XFF475467),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: Get.width * 0.05),
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.circle_rounded,
                                              color: const Color(0XFF1D2939),
                                              size: Get.width * 0.01,
                                            ),
                                            const Text(
                                              "  Only available at certain outlets.",
                                              style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 12,
                                                color: Color(0XFF475467),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const Divider(
                                        color: Color(0XFFD0D5DD),
                                        thickness: 2,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: Get.width * 0.05,
                                            vertical: Get.height * 0.01),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text(
                                              "Applicable outlets",
                                              style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 17,
                                                color: Color(0XFF1D2939),
                                              ),
                                            ),
                                            Icon(
                                              Icons.minimize,
                                              color: const Color(0XFF1D2939),
                                              size: Get.width * 0.06,
                                            )
                                          ],
                                        ),
                                      ),
                                      const Divider(
                                        color: Color(0XFFD0D5DD),
                                        thickness: 2,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: Get.width * 0.05,
                                            vertical: Get.height * 0.01),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text(
                                              "Terms & Conditions",
                                              style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 17,
                                                color: Color(0XFF1D2939),
                                              ),
                                            ),
                                            Icon(
                                              Icons.minimize,
                                              color: const Color(0XFF1D2939),
                                              size: Get.width * 0.06,
                                            )
                                          ],
                                        ),
                                      ),
                                      const Divider(
                                        color: Color(0XFFD0D5DD),
                                        thickness: 2,
                                      ),
                                    ],
                                  )
                                : Expanded(
                                    flex: 3,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          "assets/images/successRound.png",
                                          height: 50,
                                          width: 50,
                                        ),
                                        const Text(
                                          "Vouchers claimed!",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16,
                                            color: Color(0XFF1D2939),
                                          ),
                                        ),
                                        const Text(
                                          "Bringing you back...",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12,
                                            color: Color(0XFF667085),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                          ],
                        ),
                        isBool == false
                            ? Positioned(
                                bottom: 0,
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      isBool = true;
                                    });
                                  },
                                  child: Container(
                                    height: Get.height * 0.08,
                                    width: Get.width,
                                    color: const Color(0XFFB32572),
                                    child: const Center(
                                      child: Text(
                                        "Claim now",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 18,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            : SizedBox()
                      ],
                    ),
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

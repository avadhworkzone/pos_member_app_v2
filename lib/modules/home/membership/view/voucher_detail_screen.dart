import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/appbars_constants.dart';
import '../../../../common/text_styles_constants.dart';

class VoucherDetailScreen extends StatefulWidget {
  const VoucherDetailScreen({Key? key}) : super(key: key);

  @override
  State<VoucherDetailScreen> createState() => _VoucherDetailScreenState();
}

class _VoucherDetailScreenState extends State<VoucherDetailScreen> {
  bool isBool = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBars.arianiAppBar(
          title: Text('Iconic II 20% Off',
              style: getTextSemiBold(colors: Colors.white, size: 16.0)),
          leading: IconButton(
              icon: GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: const Icon(Icons.arrow_back)),
              onPressed: () {})),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: Get.height * 0.02),
                child: Image.asset("assets/images/category_scarves.png"),
              ),
              isBool == false
                  ? Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: Get.width * 0.05),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("assets/images/successRound.png"),
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
    );
  }
}

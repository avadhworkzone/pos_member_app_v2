import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:member_app_v2/common/app_strings.dart';
import 'package:member_app_v2/common/button_constants.dart';
import 'package:member_app_v2/common/color_constants.dart';
import 'package:member_app_v2/common/size_constants.dart';
import 'package:member_app_v2/common/text_styles_constants.dart';
import 'package:member_app_v2/modules/introduction/introduction_controller.dart';

class IntroductionScreenWidget extends StatefulWidget {
  const IntroductionScreenWidget({super.key});

  @override
  State<IntroductionScreenWidget> createState() =>
      _IntroductionScreenWidgetState();
}

class _IntroductionScreenWidgetState extends State<IntroductionScreenWidget> {
  IntroductionControlller introductionControlller =
      Get.put(IntroductionControlller());

  @override
  Widget build(BuildContext context) {
    SizeConstants(context);
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            alignment: Alignment.center,
            children: [
              CarouselSlider(
                carouselController: introductionControlller.carouselController,
                options: CarouselOptions(
                  height: MediaQuery.of(context).size.height,
                  viewportFraction: 1.0,
                  autoPlay: false,
                  enableInfiniteScroll: false,
                  onPageChanged: (index, reason) =>
                      introductionControlller.currentPage.value = index,
                ),
                items: introductionControlller.introList.map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                          child: Image.asset(
                            i.image,
                            fit: BoxFit.fill,
                          ));
                    },
                  );
                }).toList(),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Obx(() => Visibility(
                        visible: introductionControlller.currentPage.value !=
                            (introductionControlller.introList.length - 1),
                        child: Container(
                            alignment: Alignment.centerRight,
                            padding: const EdgeInsets.only(top: 30, right: 16),
                            child: textButton(
                                dButtonTextSize: 16,
                                cButtonTextColor: Colors.white,
                                appbarActionInterface: (value) =>
                                    introductionControlller.skipIntro(),
                                sButtonTitle: AppStrings.skipIntro)),
                      )),
                  Obx(() => Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                              introductionControlller
                                  .introList[
                                      introductionControlller.currentPage.value]
                                  .title,
                              textAlign: TextAlign.center,
                              style: getTextMedium(
                                  colors: Colors.white, size: 24.0)),
                          const SizedBox(height: 5),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: Text(
                                introductionControlller
                                    .introList[introductionControlller
                                        .currentPage.value]
                                    .subtitle,
                                textAlign: TextAlign.center,
                                style: getTextRegular(
                                    colors: Colors.white, size: 12.0)),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          DotsIndicator(
                            dotsCount: introductionControlller.introList.length,
                            position: introductionControlller.currentPage.value,
                            decorator: DotsDecorator(
                              size: const Size.square(9.0),
                              activeSize: const Size(18.0, 9.0),
                              activeColor: Colors.white,
                              color: Colors.white,
                              activeShape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0)),
                            ),
                          ),
                          SizedBox(
                            height: SizeConstants.height * 0.06,
                          ),
                          Visibility(
                            visible: introductionControlller
                                    .currentPage.value ==
                                (introductionControlller.introList.length - 1),
                            child: rectangleButton(
                                onTap: () => introductionControlller.signIn(),
                                sButtonTitle: AppStrings.signIn,
                                cButtonBackGroundColor:
                                    ColorConstants.kPrimaryColor.shade600,
                                cButtonTextColor: ColorConstants.cWhite,
                                dButtonTextSize: SizeConstants.s_16,
                                cButtonBorderColor:
                                    ColorConstants.kPrimaryColor.shade600,
                                dButtonWidth: SizeConstants.width * 0.8),
                          ),
                          /* Visibility(
                            visible: introductionControlller
                                    .currentPage.value ==
                                (introductionControlller.introList.length - 1),
                            child: rectangleButton(
                                onTap: () =>
                                    introductionControlller.createAccount(),
                                sButtonTitle: AppStrings.createAccount,
                                cButtonBackGroundColor:
                                    ColorConstants.kPrimaryColor.shade600,
                                cButtonTextColor: ColorConstants.cWhite,
                                dButtonTextSize: SizeConstants.s_16,
                                cButtonBorderColor:
                                    ColorConstants.kPrimaryColor.shade600,
                                dButtonWidth: SizeConstants.width * 0.8),
                          ), */
                          /* const SizedBox(height: 10),
                          Visibility(
                            visible: introductionControlller
                                    .currentPage.value ==
                                (introductionControlller.introList.length - 1),
                            child: textButton(
                                appbarActionInterface: (value) =>
                                    introductionControlller.signIn(),
                                cButtonTextColor: Colors.white,
                                sButtonTitle: AppStrings.signIn),
                          ), */
                          SizedBox(
                            height: SizeConstants.height * 0.15,
                          ),
                        ],
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

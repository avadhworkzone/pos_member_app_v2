import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:member_app_v2/common/app_strings.dart';
import 'package:member_app_v2/common/color_constants.dart';
import 'package:member_app_v2/common/image_assets.dart';
import 'package:member_app_v2/common/size_constants.dart';
import 'package:member_app_v2/common/text_styles_constants.dart';
import 'package:member_app_v2/common/widget/app_getx_future_builder.dart';
import 'package:member_app_v2/common/widget/app_image_widget.dart';
import 'package:member_app_v2/modules/home/home_screen/home_screen_controller.dart';
import 'package:member_app_v2/modules/home/home_tab/home_tab_controller.dart';

class HomeTabScreenWidget extends StatefulWidget {
  const HomeTabScreenWidget({super.key});

  @override
  State<HomeTabScreenWidget> createState() => _HomeTabScreenWidgetState();
}

class _HomeTabScreenWidgetState extends State<HomeTabScreenWidget> {
  HomeTabController homeTabController = Get.put(HomeTabController());
  HomeScreenController homeScreenController = Get.find<HomeScreenController>();
  @override
  Widget build(BuildContext context) {
    SizeConstants(context);
    return Scaffold(
      body: getRoot(),
    );
  }

  getRoot() {
    return AppGetXFutureBuilder<HomeScreenResponse>(
      controller: homeTabController,
      builder: (data) {
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (data?.bannersReponse?.data != null &&
                  (data?.bannersReponse?.data?.edges?.isNotEmpty ?? false)) ...[
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    CarouselSlider(
                      options: CarouselOptions(
                          height: SizeConstants.height * 0.55,
                          viewportFraction: 1.0,
                          autoPlay: true,
                          onPageChanged: (index, reason) => homeTabController
                              .currentBannerIndex.value = index),
                      items: data?.bannersReponse?.data?.edges?.map((i) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                                color: Colors.black,
                                width: SizeConstants.width,
                                height: SizeConstants.height,
                                child: AppImageWidget(
                                    asset: i.node?.imageUrl ?? "",
                                    fit: BoxFit.contain));
                          },
                        );
                      }).toList(),
                    ),
                    Column(
                      children: [
                        SizedBox(
                          width: Get.width * 0.4,
                          height: 44,
                          child: ElevatedButton(
                              onPressed: () {
                                homeScreenController.onItemTapped(
                                    ScreenList.searchResultScreen.index);
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(AppStrings.shopNow,
                                      style: getTextBold(size: 16.0)),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 5, left: 5),
                                    child: AppImageWidget(
                                      asset: ImageAssets.iconArrowRight,
                                      width: 15,
                                    ),
                                  )
                                ],
                              )),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Obx(() => DotsIndicator(
                              dotsCount:
                                  data?.bannersReponse?.data?.edges?.length ??
                                      0,
                              position:
                                  homeTabController.currentBannerIndex.value,
                              decorator: const DotsDecorator(
                                  color: Colors.white,
                                  size: Size(10, 10),
                                  activeSize: Size(10, 10)),
                            )),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
              ],
              if (data?.categoriesReponse?.data != null &&
                  (data?.categoriesReponse?.data?.edges?.isNotEmpty ??
                      false)) ...[
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: data!.categoriesReponse!.data!.edges!
                        .map((e) => GestureDetector(
                              onTap: () {
                                homeScreenController.onItemTapped(
                                    ScreenList.searchResultScreen.index);
                              },
                              child: Container(
                                width: Get.width * 0.3,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: Column(children: [
                                  Container(
                                    width: Get.width * 0.3,
                                    padding: const EdgeInsets.all(12.0),
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color:
                                                ColorConstants.cDividerColor),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(8.0))),
                                    child: Center(
                                      child: Text(
                                        e.node?.name?.characters.first ?? "",
                                        style: getTextBold(
                                            size: 46.0,
                                            colors:
                                                ColorConstants.kPrimaryColor),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    e.node?.name ?? "",
                                    maxLines: 1,
                                    style: getTextRegular(
                                        colors:
                                            ColorConstants.cPrimaryTextColor),
                                  )
                                ]),
                              ),
                            ))
                        .toList(),
                  ),
                ),
                const SizedBox(height: 25),
              ],
              if (data?.homeItemNewArrival?.data != null &&
                  (data?.homeItemNewArrival?.data?.edges?.isNotEmpty ??
                      false)) ...[
                Center(
                    child: Text(AppStrings.newRelease,
                        style: getTitleText(
                          colors: ColorConstants.cDarkTextColor,
                          size: 30.0,
                        ))),
                const SizedBox(height: 5),
                Center(
                    child: Text(AppStrings.discoverNewProduct,
                        style: getTextMedium(
                            colors: ColorConstants.cPrimaryTextColor,
                            size: 16.0))),
                const SizedBox(height: 25),
                CarouselSlider(
                  options: CarouselOptions(
                    height: SizeConstants.height * 0.4,
                    viewportFraction: 0.9,
                    autoPlay: false,
                    enableInfiniteScroll: false,
                  ),
                  items: data?.homeItemNewArrival?.data?.edges?.map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return GestureDetector(
                          onTap: () => homeScreenController.onItemTapped(
                              ScreenList.searchResultScreen.index),
                          child: Stack(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image:
                                          NetworkImage(i.node?.coverPic ?? "")),
                                ),
                                child: Container(
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          Colors.transparent,
                                          Colors.black.withOpacity(0.5)
                                        ],
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        stops: const [0.7, 1.0],
                                      ),
                                      border: Border.all(
                                          color: ColorConstants.cDividerColor),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(8.0))),
                                  width: SizeConstants.width * 0.85,
                                  height: SizeConstants.height,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(i.node?.name ?? "",
                                        style: getTextSemiBold(
                                            colors: Colors.white, size: 16.0)),
                                    const SizedBox(height: 3),
                                    Text(i.node?.description ?? "",
                                        style: getTextLight(
                                            colors: Colors.white, size: 14.0)),
                                    const SizedBox(height: 20),
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
                const SizedBox(height: 25),
              ],
              if (data?.homeItemBestSeller?.data != null &&
                  (data?.homeItemBestSeller?.data?.edges?.isNotEmpty ??
                      false)) ...[
                Center(
                    child: Text(AppStrings.bestSelling,
                        style: getTitleText(
                          colors: ColorConstants.cDarkTextColor,
                          size: 30.0,
                        ))),
                const SizedBox(height: 5),
                Center(
                    child: Text(AppStrings.wontMissOffer,
                        style: getTextMedium(
                            colors: ColorConstants.cPrimaryTextColor,
                            size: 16.0))),
                const SizedBox(height: 25),
                CarouselSlider(
                  options: CarouselOptions(
                      height: SizeConstants.height * 0.4,
                      viewportFraction: 0.9,
                      autoPlay: false,
                      enableInfiniteScroll: false),
                  items: data?.homeItemBestSeller?.data?.edges?.map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return GestureDetector(
                          onTap: () => homeScreenController.onItemTapped(
                              ScreenList.searchResultScreen.index),
                          child: Stack(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image:
                                          NetworkImage(i.node?.coverPic ?? "")),
                                ),
                                child: Container(
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          Colors.transparent,
                                          Colors.black.withOpacity(0.5)
                                        ],
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        stops: const [0.7, 1.0],
                                      ),
                                      border: Border.all(
                                          color: ColorConstants.cDividerColor),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(8.0))),
                                  width: SizeConstants.width * 0.85,
                                  height: SizeConstants.height,
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(i.node?.name ?? "",
                                        style: getTextSemiBold(
                                            colors: Colors.white, size: 16.0)),
                                    const SizedBox(height: 3),
                                    Text(i.node?.description ?? "",
                                        style: getTextLight(
                                            colors: Colors.white, size: 14.0)),
                                    const SizedBox(height: 20),
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
                const SizedBox(height: 25),
              ],
              /* Center(
                  child: Text(
                AppStrings.readyToWear,
                style: getTitleText(
                  colors: ColorConstants.cDarkTextColor,
                  size: 30.0,
                ),
              )),
              const SizedBox(height: 5),
              Center(
                  child: Text(AppStrings.ourCuratedProduct,
                      style: getTextMedium(
                          colors: ColorConstants.cPrimaryTextColor,
                          size: 16.0))),
              const SizedBox(height: 25),
              CarouselSlider(
                options: CarouselOptions(
                    height: SizeConstants.height * 0.4,
                    viewportFraction: 0.9,
                    autoPlay: false,
                    enableInfiniteScroll: false),
                items: homeTabController.readyToWearList.map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Stack(
                        children: [
                          Container(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8.0))),
                              width: SizeConstants.width * 0.85,
                              height: SizeConstants.height,
                              child: Image.asset(i.image, fit: BoxFit.fill)),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 15.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(i.title,
                                    style: getTextSemiBold(
                                        colors: Colors.white, size: 16.0)),
                                const SizedBox(height: 3),
                                Text(i.subtitle,
                                    style: getTextLight(
                                        colors: Colors.white, size: 14.0)),
                                const SizedBox(height: 20),
                              ],
                            ),
                          )
                        ],
                      );
                    },
                  );
                }).toList(),
              ), */
              if (data?.bottomBannersReponse?.data != null &&
                  (data?.bottomBannersReponse?.data?.edges?.isNotEmpty ??
                      false)) ...[
                const SizedBox(height: 25),
                CarouselSlider(
                  options: CarouselOptions(
                      height: SizeConstants.height * 0.25,
                      viewportFraction: 1.0,
                      onPageChanged: (index, reason) =>
                          homeTabController.currentBannerIndex.value = index),
                  items: data?.bottomBannersReponse?.data?.edges?.map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            decoration: const BoxDecoration(
                                color: ColorConstants.cBlack,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8.0))),
                            width: SizeConstants.width * 0.9,
                            height: SizeConstants.height,
                            child: AppImageWidget(
                                asset: i.node?.imageUrl ?? "",
                                fit: BoxFit.contain));
                      },
                    );
                  }).toList(),
                ),
              ],
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(vertical: 14),
                child: SizedBox(
                  width: Get.width * 0.8,
                  height: 44,
                  child: ElevatedButton(
                      onPressed: () {
                        homeScreenController
                            .onItemTapped(ScreenList.searchResultScreen.index);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(AppStrings.browseFullCollection,
                              style: getTextBold(size: 16.0)),
                          Padding(
                            padding: const EdgeInsets.only(top: 4, left: 5),
                            child: AppImageWidget(
                              asset: ImageAssets.iconArrowRight,
                              width: 15,
                            ),
                          )
                        ],
                      )),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

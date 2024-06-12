import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:member_app_v2/common/app_strings.dart';
import 'package:member_app_v2/common/button_constants.dart';
import 'package:member_app_v2/common/color_constants.dart';
import 'package:member_app_v2/common/image_assets.dart';
import 'package:member_app_v2/common/size_constants.dart';
import 'package:member_app_v2/common/text_styles_constants.dart';
import 'package:member_app_v2/common/widget/app_getx_future_builder.dart';
import 'package:member_app_v2/common/widget/app_image_widget.dart';
import 'package:member_app_v2/common/widget/edit_text_field.dart';
import 'package:member_app_v2/modules/home/home_screen/home_screen_controller.dart';
import 'package:member_app_v2/modules/home/home_tab/model/items_response.dart';
import 'package:member_app_v2/modules/search_result/search_result_controller.dart';
import 'package:member_app_v2/modules/search_result/view/filter_screen.dart';

class SearchResultWidgetScreen extends StatefulWidget {
  const SearchResultWidgetScreen({super.key});

  @override
  State<SearchResultWidgetScreen> createState() =>
      _SearchResultWidgetScreenState();
}

class _SearchResultWidgetScreenState extends State<SearchResultWidgetScreen> {
  SearchResultController searchResultController =
      Get.find<SearchResultController>();
  HomeScreenController homeScreenController = Get.find<HomeScreenController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AppGetXFutureBuilder<ItemsReponse>(
      controller: searchResultController,
      emptyWidget: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppImageWidget(asset: ImageAssets.imageEmptyBox),
          Text(AppStrings.noMoreData,
              style: getTextBold(
                  colors: ColorConstants.cPrimaryTextColor, size: 18.0)),
          const SizedBox(height: 10),
          textButton(
              appbarActionInterface: (_) {
                searchResultController.clearAllFilter(callAPi: true);
              },
              sButtonTitle: AppStrings.clearAllRetry,
              dButtonTextSize: 18.0,
              cButtonTextColor: ColorConstants.kPrimaryColor)
        ],
      ),
      builder: (data) {
        return Column(
          children: [
            SizedBox(height: SizeConstants.s_14),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: getTextField(searchResultController.searchbarController,
                    hintText: AppStrings.searchByKeyword,
                    textInputAction: TextInputAction.search,
                    onSubmitted: (value) => searchResultController.onSearch(),
                    onChanged: (text) =>
                        searchResultController.onTypeSearch(text),
                    suffix: GestureDetector(
                        onTap: () =>
                            searchResultController.isTypingOnSearch.value
                                ? searchResultController.clearSearch()
                                : searchResultController.onSearch(),
                        child: Obx(() => Icon(
                              searchResultController.isTypingOnSearch.value
                                  ? Icons.clear
                                  : Icons.search,
                              color: ColorConstants.kPrimaryColor,
                            ))))),
            SizedBox(height: SizeConstants.s_14),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppStrings.items(data?.data?.edges?.length ?? 0),
                    style: getTextBold(
                        colors: ColorConstants.kPrimaryColor, size: 18.0),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      PopupMenuButton(
                        initialValue: searchResultController.selectedSortBy,
                        onSelected: (SortBy item) {
                          searchResultController.selectSortBy(item);
                        },
                        itemBuilder: (context) => searchResultController.sortBy
                            .map<PopupMenuEntry<SortBy>>(
                                (e) => PopupMenuItem<SortBy>(
                                      value: e,
                                      child: Text(e.title),
                                    ))
                            .toList(),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(Icons.sort_outlined,
                                color: ColorConstants.cPrimaryTextColor),
                            SizedBox(width: SizeConstants.s4),
                            Text(
                              AppStrings.sortBy,
                              style: getTextMedium(
                                  size: 16.0,
                                  colors: ColorConstants.cPrimaryTextColor),
                            )
                          ],
                        ),
                      ),
                      /* Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(Icons.sort_outlined,
                              color: ColorConstants.cPrimaryTextColor),
                          SizedBox(width: SizeConstants.s4),
                          Text(
                            AppStrings.sortBy,
                            style: getTextMedium(
                                size: 16.0,
                                colors: ColorConstants.cPrimaryTextColor),
                          )
                        ],
                      ), */
                      SizedBox(width: SizeConstants.s_18),
                      GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: () => Get.to(() => const FilterScreenWidget()),
                        child: Text(
                          AppStrings.filter,
                          style: getTextMedium(
                              size: 16.0, colors: ColorConstants.kPrimaryColor),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: SizeConstants.s_20),
            Expanded(
              child: getProductList(data),
            ),
            Obx(() => Visibility(
                visible: searchResultController.isProgressShow.value,
                child: const Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    child: CircularProgressIndicator(),
                  ),
                )))
          ],
        );
      },
    ));
  }

  getProductList(ItemsReponse? data) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: GridView.builder(
        controller: searchResultController.scrollController,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 12,
            childAspectRatio: 0.5),
        itemCount: data?.data?.edges?.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () => searchResultController
                .onProductTap(data?.data?.edges?[index].node),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  decoration: BoxDecoration(
                      border: Border.all(color: ColorConstants.cDividerColor),
                      borderRadius: BorderRadius.circular(8.0)),
                  child: AppImageWidget(
                    asset: data?.data?.edges?[index].node?.coverPic ?? "",
                    height: Get.height * 0.3,
                    width: Get.width,
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(height: Get.height * 0.01),
                Text(
                  data?.data?.edges?[index].node?.name ?? "",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: getTextSemiBold(
                      size: 16.0, colors: ColorConstants.cDarkTextColor),
                ),
                SizedBox(height: Get.height * 0.01),
                Text(
                  'RM ${data?.data?.edges?[index].node?.originalPrice?.toStringAsFixed(2) ?? 0.00}',
                  style: getTextSemiBold(
                      size: 14.0, colors: ColorConstants.cPrimaryTextColor),
                ),
                /* SizedBox(height: Get.height * 0.01),
                mediumRoundedCornerButton(
                    appbarActionInterface: (val) {},
                    sButtonTitle: AppStrings.addToBag,
                    cButtonBorderColor: ColorConstants.kPrimaryColor,
                    cButtonBackGroundColor: Colors.transparent,
                    cButtonTextColor: ColorConstants.cPrimaryTextColor,
                    dButtonWidth: Get.width,
                    dButtonTextSize: 16.0,
                    dButtonRadius: 0.0) */
              ],
            ),
          );
        },
      ),
    );
  }

  /* _filterSheet() {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      isDismissible: false,
      enableDrag: false,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      builder: (context) => Container(
        height: Get.height * 0.8,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppStrings.reset,
                  style: getTextBold(
                      colors: ColorConstants.kPrimaryColor, size: 16.0),
                ),
                Text(
                  AppStrings.filter,
                  style: getTextBold(
                      colors: ColorConstants.cDarkTextColor, size: 16.0),
                ),
                IconButton(
                    onPressed: () => Get.back(),
                    icon: const Icon(
                      Icons.close,
                      size: 20,
                      color: ColorConstants.cPrimaryTextColor,
                    )),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
                child: SingleChildScrollView(
              child: Column(children: [
                Text(
                  AppStrings.price,
                  style: getTextBold(
                      colors: ColorConstants.cDarkTextColor, size: 16.0),
                ),
                const SizedBox(height: 16),
                Obx(() => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RichText(
                            text: TextSpan(
                                text: AppStrings.from,
                                style: getTextSemiBold(
                                    colors: ColorConstants.cPrimaryTextColor,
                                    size: 14.0),
                                children: <TextSpan>[
                              TextSpan(
                                  text:
                                      " RM ${searchResultController.priceRangeFilter.value.start.roundToDouble()}",
                                  style: getTextBold(
                                      colors: ColorConstants.cDarkTextColor,
                                      size: 14.0))
                            ])),
                        RichText(
                            text: TextSpan(
                                text: AppStrings.to,
                                style: getTextSemiBold(
                                    colors: ColorConstants.cPrimaryTextColor,
                                    size: 14.0),
                                children: <TextSpan>[
                              TextSpan(
                                  text:
                                      " RM ${searchResultController.priceRangeFilter.value.end.roundToDouble()}",
                                  style: getTextBold(
                                      colors: ColorConstants.cDarkTextColor,
                                      size: 14.0))
                            ])),
                      ],
                    )),
                const SizedBox(height: 10),
                Obx(() => RangeSlider(
                      values: searchResultController.priceRangeFilter.value,
                      onChanged: (value) =>
                          searchResultController.priceRangeFilter.value = value,
                      min: 10,
                      max: 1000,
                    )),
                const SizedBox(height: 16),
                Obx(() => RichText(
                        text: TextSpan(
                            text: AppStrings.size,
                            style: getTextBold(
                                colors: ColorConstants.cDarkTextColor,
                                size: 16.0),
                            children: <TextSpan>[
                          TextSpan(
                              text:
                                  " (${AppStrings.selected(searchResultController.selectedSizeFilter.length)})",
                              style: getTextBold(
                                  colors: ColorConstants.kPrimaryColor,
                                  size: 16.0))
                        ]))),
                const SizedBox(height: 18),
                Wrap(
                  runSpacing: 10,
                  spacing: 10,
                  children: searchResultController.sizeFilter
                      .map((e) => SizedBox(
                          width: Get.width / 4,
                          child: Obx(() => CheckboxListTile(
                                contentPadding: EdgeInsets.zero,
                                dense: true,
                                controlAffinity:
                                    ListTileControlAffinity.leading,
                                value: searchResultController.selectedSizeFilter
                                    .contains(e),
                                onChanged: (val) {
                                  if (val!) {
                                    searchResultController.selectedSizeFilter
                                        .add(e);
                                  } else {
                                    searchResultController.selectedSizeFilter
                                        .remove(e);
                                  }
                                },
                                title: Text(
                                  e,
                                  style: getTextSemiBold(
                                      colors: ColorConstants.cPrimaryTextColor,
                                      size: 14.0),
                                ),
                              ))))
                      .toList(),
                ),
                Text(AppStrings.viewMoreOptions,
                    style: getTextBold(
                        colors: ColorConstants.kPrimaryColor, size: 14.0)),
                const SizedBox(height: 28),
                Obx(() => RichText(
                        text: TextSpan(
                            text: AppStrings.color,
                            style: getTextBold(
                                colors: ColorConstants.cDarkTextColor,
                                size: 16.0),
                            children: <TextSpan>[
                          TextSpan(
                              text:
                                  " (${AppStrings.selected(searchResultController.selectedColorFilter.length)})",
                              style: getTextBold(
                                  colors: ColorConstants.kPrimaryColor,
                                  size: 16.0))
                        ]))),
                const SizedBox(height: 18),
                Wrap(
                  runSpacing: 10,
                  spacing: 10,
                  children: searchResultController.colorFilter
                      .map((e) => SizedBox(
                          width: Get.width / 4,
                          child: Obx(() => CheckboxListTile(
                                contentPadding: EdgeInsets.zero,
                                dense: true,
                                controlAffinity:
                                    ListTileControlAffinity.leading,
                                value: searchResultController
                                    .selectedColorFilter
                                    .contains(e),
                                onChanged: (val) {
                                  if (val!) {
                                    searchResultController.selectedColorFilter
                                        .add(e);
                                  } else {
                                    searchResultController.selectedColorFilter
                                        .remove(e);
                                  }
                                },
                                title: Text(
                                  e,
                                  style: getTextSemiBold(
                                      colors: ColorConstants.cPrimaryTextColor,
                                      size: 14.0),
                                ),
                              ))))
                      .toList(),
                ),
                Text(AppStrings.viewMoreOptions,
                    style: getTextBold(
                        colors: ColorConstants.kPrimaryColor, size: 14.0)),
              ]),
            )),
            rectangleButton(
                onTap: () {},
                sButtonTitle: AppStrings.applyFilter,
                cButtonBackGroundColor: ColorConstants.kPrimaryColor,
                cButtonTextColor: Colors.white,
                dButtonTextSize: 16.0,
                dButtonWidth: Get.width)
          ],
        ),
      ),
    );
  } */
}

import 'package:flutter/material.dart';
import 'package:flutter_treeview/flutter_treeview.dart';
import 'package:get/get.dart' as getX;
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:member_app_v2/common/app_strings.dart';
import 'package:member_app_v2/common/appbars_constants.dart';
import 'package:member_app_v2/common/button_constants.dart';
import 'package:member_app_v2/common/color_constants.dart';
import 'package:member_app_v2/common/text_styles_constants.dart';
import 'package:member_app_v2/modules/search_result/search_result_controller.dart';

class FilterScreenWidget extends StatefulWidget {
  const FilterScreenWidget({super.key});

  @override
  State<FilterScreenWidget> createState() => _FilterScreenWidgetState();
}

class _FilterScreenWidgetState extends State<FilterScreenWidget> {
  SearchResultController searchResultController =
      getX.Get.find<SearchResultController>();
  TreeViewController treeViewController = TreeViewController();

  @override
  void initState() {
    super.initState();
    treeViewController = TreeViewController(
        children: searchResultController.categoriesReponse?.data?.edges
                ?.map((e) => Node(
                    key: e.node?.id?.toString() ?? "",
                    label: e.node?.name ?? "",
                    data: e.node,
                    children: e.node?.subCategories
                            ?.map((e) => Node(
                                data: e,
                                key: e.id?.toString() ?? "",
                                label: e.name ?? ""))
                            .toList() ??
                        []))
                .toList() ??
            []);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          searchResultController.applyFilters();
          return true;
        },
        child: Scaffold(
          appBar: AppBars.arianiAppBar(
              title: Text(AppStrings.filter), noActions: true),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: textButton(
                        appbarActionInterface: (_) =>
                            searchResultController.clearAllFilter(),
                        cButtonTextColor: ColorConstants.kPrimaryColor,
                        dButtonTextSize: 16.0,
                        sButtonTitle: AppStrings.clearAll),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    AppStrings.categories,
                    style: getTextSemiBold(
                        colors: ColorConstants.cPrimaryTextColor, size: 16.0),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: getX.Get.height * 0.5,
                    child: GetBuilder<SearchResultController>(
                      id: "category_filter",
                      builder: (controller) {
                        return TreeView(
                          allowParentSelect: true,
                          shrinkWrap: true,
                          theme: const TreeViewTheme(
                              dense: true,
                              expanderTheme: ExpanderThemeData(
                                  position: ExpanderPosition.end,
                                  animated: true,
                                  color: ColorConstants.cPrimaryTextColor,
                                  size: 26,
                                  modifier: ExpanderModifier.circleOutlined,
                                  type: ExpanderType.plusMinus)),
                          controller: treeViewController,
                          nodeBuilder: (context, node) {
                            return ListTile(
                                title: Text(node.label,
                                    style: getTextMedium(
                                        size: 15.0,
                                        colors:
                                            ColorConstants.cPrimaryTextColor)),
                                leading: Checkbox(
                                  value: searchResultController
                                      .selectedFilterCategory
                                      .contains(int.parse(node.key)),
                                  onChanged: (value) {
                                    searchResultController.onCategorySelected(
                                        int.parse(node.key));
                                  },
                                ));
                          },
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    AppStrings.brand,
                    style: getTextSemiBold(
                        colors: ColorConstants.cPrimaryTextColor, size: 16.0),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                      height: getX.Get.height * 0.3,
                      child: GetBuilder<SearchResultController>(
                          id: "brand_filter",
                          builder: (context) {
                            return ListView.builder(
                              shrinkWrap: true,
                              itemCount: searchResultController
                                  .brandsReponse?.data?.edges?.length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                    title: Text(
                                        searchResultController
                                                .brandsReponse
                                                ?.data
                                                ?.edges?[index]
                                                .node
                                                ?.name ??
                                            "",
                                        style: getTextMedium(
                                            size: 15.0,
                                            colors: ColorConstants
                                                .cPrimaryTextColor)),
                                    leading: Checkbox(
                                      value: searchResultController
                                          .selectedFilterBrands
                                          .contains(searchResultController
                                              .brandsReponse
                                              ?.data
                                              ?.edges?[index]
                                              .node
                                              ?.id),
                                      onChanged: (value) {
                                        searchResultController.onBrandSelected(
                                            searchResultController
                                                    .brandsReponse
                                                    ?.data
                                                    ?.edges?[index]
                                                    .node
                                                    ?.id ??
                                                0);
                                      },
                                    ));
                              },
                            );
                          })),
                  const SizedBox(height: 10),
                  Text(
                    AppStrings.color,
                    style: getTextSemiBold(
                        colors: ColorConstants.cPrimaryTextColor, size: 16.0),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                      height: getX.Get.height * 0.3,
                      child: GetBuilder<SearchResultController>(
                          id: "color_filter",
                          builder: (context) {
                            return ListView.builder(
                              shrinkWrap: true,
                              itemCount: searchResultController
                                  .colorsReponse?.data?.edges?.length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                    title: Text(
                                        searchResultController
                                                .colorsReponse
                                                ?.data
                                                ?.edges?[index]
                                                .node
                                                ?.name ??
                                            "",
                                        style: getTextMedium(
                                            size: 15.0,
                                            colors: ColorConstants
                                                .cPrimaryTextColor)),
                                    leading: Checkbox(
                                      value: searchResultController
                                          .selectedFilterColors
                                          .contains(searchResultController
                                              .colorsReponse
                                              ?.data
                                              ?.edges?[index]
                                              .node
                                              ?.id),
                                      onChanged: (value) {
                                        searchResultController.onColorSelected(
                                            searchResultController
                                                    .colorsReponse
                                                    ?.data
                                                    ?.edges?[index]
                                                    .node
                                                    ?.id ??
                                                0);
                                      },
                                    ));
                              },
                            );
                          })),
                  const SizedBox(height: 10),
                  Text(
                    AppStrings.size,
                    style: getTextSemiBold(
                        colors: ColorConstants.cPrimaryTextColor, size: 16.0),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                      height: getX.Get.height * 0.3,
                      child: GetBuilder<SearchResultController>(
                          id: "size_filter",
                          builder: (context) {
                            return ListView.builder(
                              shrinkWrap: true,
                              itemCount: searchResultController
                                  .sizesReponse?.data?.edges?.length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                    title: Text(
                                        searchResultController
                                                .sizesReponse
                                                ?.data
                                                ?.edges?[index]
                                                .node
                                                ?.name ??
                                            "",
                                        style: getTextMedium(
                                            size: 15.0,
                                            colors: ColorConstants
                                                .cPrimaryTextColor)),
                                    leading: Checkbox(
                                      value: searchResultController
                                          .selectedFilterSizes
                                          .contains(searchResultController
                                              .sizesReponse
                                              ?.data
                                              ?.edges?[index]
                                              .node
                                              ?.id),
                                      onChanged: (value) {
                                        searchResultController.onSizeSelected(
                                            searchResultController
                                                    .sizesReponse
                                                    ?.data
                                                    ?.edges?[index]
                                                    .node
                                                    ?.id ??
                                                0);
                                      },
                                    ));
                              },
                            );
                          })),
                ],
              ),
            ),
          ),
        ));
  }
}

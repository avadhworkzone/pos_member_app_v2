import 'package:easy_search_bar/easy_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:member_app_v2/common/app_strings.dart';
import 'package:member_app_v2/common/color_constants.dart';
import 'package:member_app_v2/common/image_assets.dart';
import 'package:member_app_v2/common/text_styles_constants.dart';
import 'package:member_app_v2/modules/home/categories/categories_controller.dart';
import 'package:member_app_v2/modules/home/home_tab/home_tab_controller.dart';

class CategoriesScreenWidget extends StatefulWidget {
  const CategoriesScreenWidget({super.key});

  @override
  State<CategoriesScreenWidget> createState() => _CategoriesScreenWidgetState();
}

class _CategoriesScreenWidgetState extends State<CategoriesScreenWidget> {
  CategoriesController categoriesController = Get.put(CategoriesController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EasySearchBar(
        title: Text(AppStrings.searchByKeyword),
        titleTextStyle: getTextLight(colors: Colors.grey, size: 14.0),
        searchHintText: AppStrings.searchByKeyword,
        iconTheme: const IconThemeData(color: Colors.grey),
        backgroundColor: ColorConstants.cSearchBarColor,
        onSearch: (value) => categoriesController.searchValue = value,
        suggestions: categoriesController.suggestions,
        onSuggestionTap: (data) => categoriesController.onSuggestionTap(data),
        suggestionBuilder: (data) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Text(
              data,
              style: getTextSemiBold(colors: ColorConstants.cPrimaryTextColor),
            ),
          );
        },
        elevation: 0,
        openOverlayOnSearch: true,
        suggestionsElevation: 0,
        searchHintStyle:
            getTextMedium(colors: ColorConstants.cPrimaryTextColor),
      ),
      body: Container(
        width: Get.width,
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _categoryBanner(
                  title: "Scarves", image: ImageAssets.imageCategoryScarves),
              const SizedBox(height: 16),
              _categoryGrid(categoriesController.categoryList),
              const SizedBox(height: 16),
              _categoryBanner(
                  isTextLeftAlign: false,
                  image: ImageAssets.imageCategoryReadyWear,
                  title: "Ready\nto\nWear"),
              const SizedBox(height: 16),
              _categoryGrid(categoriesController.categoryList),
            ],
          ),
        ),
      ),
    );
  }

  _categoryBanner(
      {bool isTextLeftAlign = true,
      required String image,
      required String title}) {
    return Container(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Stack(
        alignment:
            isTextLeftAlign ? Alignment.centerLeft : Alignment.centerRight,
        children: [
          Image.asset(image, width: Get.width, fit: BoxFit.fill),
          Padding(
            padding: EdgeInsets.only(
                left: isTextLeftAlign ? 32.0 : 0.0,
                right: isTextLeftAlign ? 0.0 : 32.0),
            child: Text(
              title,
              style: getTextBold(colors: Colors.black, size: 18.0),
            ),
          )
        ],
      ),
    );
  }

  _categoryGrid(List<CategoryData> listCategories) {
    return SizedBox(
      height: Get.height * 0.38,
      child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: listCategories.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              childAspectRatio: 0.5),
          itemBuilder: (context, index) => Column(children: [
                Container(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(8.0))),
                  child: Image.asset(
                    listCategories[index].image,
                    fit: BoxFit.contain,
                    height: 100,
                    width: 100,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  listCategories[index].title,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  style: getTextBold(colors: ColorConstants.cPrimaryTextColor),
                )
              ])),
    );
  }
}

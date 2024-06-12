import 'package:get/get.dart';
import 'package:member_app_v2/common/image_assets.dart';
import 'package:member_app_v2/modules/home/home_screen/home_screen_controller.dart';
import 'package:member_app_v2/modules/home/home_tab/home_tab_controller.dart';
import 'package:member_app_v2/modules/search_result/search_result_controller.dart';

class CategoriesController extends GetxController {
  String searchValue = '';
  List<String> suggestions = [
    'Plain',
    'Plain Shawl',
    'Plain Instant',
    'Waleema Collection',
    'Printed Shawl',
    'Tiara',
    'Printed Square',
  ];
  List<CategoryData> categoryList = [
    CategoryData(image: ImageAssets.imageCategory1, title: "Plain"),
    CategoryData(image: ImageAssets.imageCategory2, title: "Plain Shawl"),
    CategoryData(image: ImageAssets.imageCategory3, title: "Plain Instant"),
    CategoryData(
        image: ImageAssets.imageCategory1, title: "Waleema Collection"),
    CategoryData(image: ImageAssets.imageCategory2, title: "Harry Potter"),
    CategoryData(image: ImageAssets.imageCategory3, title: "Printed Shawl"),
    CategoryData(image: ImageAssets.imageCategory1, title: "Tiara"),
    CategoryData(image: ImageAssets.imageCategory2, title: "Printed Square"),
  ];

  HomeScreenController homeScreenController = Get.find<HomeScreenController>();

  onSuggestionTap(String category) {
    SearchResultController searchResultController =
        Get.put(SearchResultController());
    //searchResultController.category = category;
    //homeScreenController.onItemTapped(ScreenList.searchResultScreen.index);
  }
}

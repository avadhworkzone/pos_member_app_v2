import 'package:get/get.dart';
import 'package:member_app_v2/modules/cart/cart_controller.dart';
import 'package:member_app_v2/modules/home/profile/profile_controller.dart';
import 'package:member_app_v2/modules/search_result/search_result_controller.dart';

class AppInitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProfileController(), fenix: true);
    Get.lazyPut(() => SearchResultController(), fenix: true);
    Get.lazyPut(() => CartScreenController(), fenix: true);
  }
}

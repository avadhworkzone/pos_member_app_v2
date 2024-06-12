import 'package:get/get.dart';
import 'package:member_app_v2/modules/home/home_screen/view/home_screen.dart';

class VoucherIntroController extends GetxController {
  void skipIntro() {
    Get.offAll(() => const HomeScreenWidget());
  }
}

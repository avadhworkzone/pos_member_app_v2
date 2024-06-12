import 'package:get/get.dart';
import 'package:member_app_v2/modules/home/home_screen/view/home_screen.dart';
import 'package:member_app_v2/modules/voucher_intro/view/voucher_intro_screen.dart';

class WelcomeScreenController extends GetxController {
  bool isNewUser = false;
  void redirect() {
    Future.delayed(const Duration(seconds: 1), () {
      if (isNewUser) {
        Get.offAll(() => const VoucherIntroScreenWidget());
      } else {
        Get.offAll(() => const HomeScreenWidget());
      }
    });
  }
}

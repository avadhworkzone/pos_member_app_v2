import 'package:get/get.dart';
import 'package:member_app_v2/data/shared_prefs/shared_prefs.dart';
import 'package:member_app_v2/modules/introduction/view/introduction_screen.dart';
import 'package:member_app_v2/modules/login/view/login_screen.dart';
import 'package:member_app_v2/modules/promotion/view/promotion_screen.dart';

class SplashController extends GetxController {
  getToken() async {
    if (SharedPrefs.isIntroSeen) {
      String token = SharedPrefs.getUserToken;
      if (token.isNotEmpty) {
        Future.delayed(const Duration(seconds: 1),
            () => Get.offAll(() => const PromotionScreenWidget()));
      } else {
        Future.delayed(const Duration(seconds: 1),
            () => Get.offAll(() => const LoginScreenWidget()));
      }
    } else {
      Future.delayed(const Duration(seconds: 1),
          () => Get.offAll(() => const IntroductionScreenWidget()));
    }
  }
}

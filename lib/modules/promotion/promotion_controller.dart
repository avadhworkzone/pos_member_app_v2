import 'package:get/get.dart';
import 'package:member_app_v2/modules/welcome/view/welcome_screen.dart';

class PromotionController extends GetxController {
  skip() {
    Get.offAll(() => const WelcomeScreenWidget(isNewUser: false));
  }
}

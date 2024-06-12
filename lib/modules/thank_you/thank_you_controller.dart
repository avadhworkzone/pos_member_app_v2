import 'package:get/get.dart';
import 'package:member_app_v2/modules/welcome/view/welcome_screen.dart';

class ThankYouController extends GetxController {
  bool isNewUser = true;
  navigateToWelcome() {
    Future.delayed(const Duration(seconds: 1), () {
      Get.offAll(() => WelcomeScreenWidget(isNewUser: isNewUser));
    });
  }
}

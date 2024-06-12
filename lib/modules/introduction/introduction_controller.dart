import 'package:carousel_slider/carousel_controller.dart';
import 'package:get/get.dart';
import 'package:member_app_v2/common/app_strings.dart';
import 'package:member_app_v2/common/image_assets.dart';
import 'package:member_app_v2/data/shared_prefs/shared_prefs.dart';
import 'package:member_app_v2/modules/create_account/view/create_account_screen.dart';
import 'package:member_app_v2/modules/login/view/login_screen.dart';

class IntroductionControlller extends GetxController {
  CarouselController carouselController = CarouselController();
  RxInt currentPage = 0.obs;
  List<IntroData> introList = [
    IntroData(
        title: AppStrings.introTitle1,
        image: ImageAssets.imageIntroScreenBg1,
        subtitle: AppStrings.introSubtitle1),
    IntroData(
        title: AppStrings.introTitle2,
        image: ImageAssets.imageIntroScreenBg2,
        subtitle: AppStrings.introSubtitle2),
    IntroData(
        title: AppStrings.introTitle3,
        image: ImageAssets.imageIntroScreenBg3,
        subtitle: AppStrings.introSubtitle3)
  ];

  skipIntro() async {
    carouselController.jumpToPage(2);
    currentPage.value = 2;
  }

  createAccount() async {
    await SharedPrefs.setIntroSeen();
    Get.offAll(() => const CreateAccountScreenWidget());
  }

  signIn() async {
    await SharedPrefs.setIntroSeen();
    Get.offAll(() => const LoginScreenWidget());
  }
}

class IntroData {
  String title, subtitle, image;

  IntroData({required this.title, required this.subtitle, required this.image});
}

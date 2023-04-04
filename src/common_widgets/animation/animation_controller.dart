import 'package:get/get.dart';

import '../../../decidescreen.dart';


class MyAnimationController extends GetxController {
  static MyAnimationController get find => Get.find();

  RxBool animate = false.obs;

  Future startSplashAnimation() async {
    await Future.delayed(const Duration(milliseconds: 500));
    animate.value = true;
    await Future.delayed(const Duration(milliseconds: 4000));
    animate.value = false;
    await Future.delayed(const Duration(milliseconds: 3200));
    Get.offAllNamed('/decide');
  }

  Future startAnimation() async {
    await Future.delayed(const Duration(milliseconds: 500));
    animate.value = true;
  }
}

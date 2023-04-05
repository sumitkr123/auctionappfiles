import 'package:flutter_zoom_drawer/config.dart';
import 'package:get/get.dart';

import '../../../repository/authentication_repository/authentication_repository.dart';
import '../../authentication/screens/login/login_screen.dart';

class MyDrawerController extends GetxController {
  final authController = Get.put(AuthenticationRepository());
  final zoomDrawerController = ZoomDrawerController();

  void toggleDrawer() {
    zoomDrawerController.toggle!.call();
    update();
  }

  void signOut() {
    authController.logout();
  }

  void signIn() {
    Get.to(const LoginScreen());
  }

  void github() {
    // _launch('https://github.com/CodeFoxLk');
  }

  void email() {
    // final Uri emailLaunchUri = Uri(
    //   scheme: 'mailto',
    //   path: 'codefoxlk@gmail.com',
    // );
    // _launch(emailLaunchUri.toString());
  }

  void downloadSourceCode() {
    // _launch('https://github.com/CodeFoxLk/quizzle_public.git');
  }

  // Future<void> _launch(String url) async {
  //   if (!await launch(
  //     url,
  //   )) {
  //     throw 'Could not launch $url';
  //   }
  // }
}

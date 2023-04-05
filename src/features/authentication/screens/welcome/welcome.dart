import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common_widgets/animation/animation_controller.dart';
import '../../../../common_widgets/animation/animation_design.dart';
import '../../../../common_widgets/animation/animation_model.dart';
import '../../../../../../public/utils/constants/refer_to_constants.dart';
import '../login/login_screen.dart';
import '../signup/signup_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    final controller = Get.put(MyAnimationController());
    controller.startAnimation();

    return Scaffold(
      body: Stack(
        children: [
          TAnimation(
            durationInMs: 2000,
            animatePosition: TAnimatePosition(
              bottomBefore: -700,
              bottomAfter: 0,
              topAfter: 0,
              topBefore: 0,
              leftAfter: 0,
              leftBefore: 0,
              rightAfter: 0,
              rightBefore: 0,
            ),
            child: Container(
              padding: const EdgeInsets.all(tDefaultSize),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image(
                    image: const AssetImage(tWelcomeImage),
                    width: width * 0.7,
                    height: height * 0.5,
                  ),
                  Column(
                    children: [
                      Text(
                        tWelcomeTitle,
                        style: Theme.of(context).textTheme.headline5,
                      ),
                      Text(
                        tWelcomeSubtitle,
                        style: Theme.of(context).textTheme.subtitle1,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {
                            Get.toNamed('/login');
                          },
                          child: Text(
                            tLogin.toUpperCase(),
                            style: Theme.of(context).textTheme.subtitle1,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            Get.toNamed('/signup');
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(60),
                            ),
                            side: const BorderSide(color: tSecondaryColor),
                            padding: const EdgeInsets.all(20),
                          ),
                          child: Text(
                            tSignup.toUpperCase(),
                            style: Theme.of(context).textTheme.subtitle2,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

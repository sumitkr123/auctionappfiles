import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'src/common_widgets/animation/animation_controller.dart';
import 'src/common_widgets/animation/animation_design.dart';
import 'src/common_widgets/animation/animation_model.dart';
import 'public/utils/constants/refer_to_constants.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    final controller = Get.put(MyAnimationController());
    controller.startSplashAnimation();

    return Scaffold(
      body: Stack(
        children: [
          TAnimation(
            durationInMs: 3000,
            animatePosition: TAnimatePosition(
              topAfter: 130,
              topBefore: 130,
              leftAfter: 50,
              leftBefore: -30,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  tAppName,
                  style: Theme.of(context).textTheme.headline3,
                ),
                Text(
                  tAppTagLine,
                  style: Theme.of(context).textTheme.subtitle1,
                ),
              ],
            ),
          ),
          TAnimation(
            durationInMs: 3000,
            animatePosition: TAnimatePosition(
              bottomBefore: 0,
              bottomAfter: 170,
            ),
            child: Image(
              width: width,
              height: height * 0.4,
              image: const AssetImage(tWelcomeImage),
            ),
          ),
        ],
      ),
    );
  }
}

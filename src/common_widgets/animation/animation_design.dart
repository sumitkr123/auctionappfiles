import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'animation_controller.dart';
import 'animation_model.dart';

class TAnimation extends StatelessWidget {
  TAnimation({
    Key? key,
    required this.durationInMs,
    required this.child,
    this.animatePosition,
  }) : super(key: key);

  final controller = Get.put(MyAnimationController());
  final int durationInMs;
  final TAnimatePosition? animatePosition;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AnimatedPositioned(
        top: controller.animate.value
            ? animatePosition!.topAfter
            : animatePosition!.topBefore,
        left: controller.animate.value
            ? animatePosition!.leftAfter
            : animatePosition!.leftBefore,
        bottom: controller.animate.value
            ? animatePosition!.bottomAfter
            : animatePosition!.bottomBefore,
        right: controller.animate.value
            ? animatePosition!.rightAfter
            : animatePosition!.rightBefore,
        duration: Duration(milliseconds: durationInMs),
        child: AnimatedOpacity(
          duration: Duration(milliseconds: durationInMs),
          opacity: controller.animate.value ? 1 : 0,
          child: child,
        ),
      ),
    );
  }
}

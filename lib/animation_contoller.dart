import 'package:flutter/animation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class AnimationManager extends GetxController {
  late AnimationController controller;
  Animation<double>? animation1;
  Animation<double>? animation2;
  Animation<double>? opacityAnimation;
  Tween<double> defultTween1 = Tween<double>(begin: -0.013, end: 0.014);
  Tween<double> defultTween2 = Tween<double>(begin: 0.013, end: -0.014);
  bool isAnimated = false;
  @override
  void onReady() {
    super.onReady();
    animation1 = Tween<double>(begin: 0.0, end: 0.0).animate(controller);
    animation2 = Tween<double>(begin: 0.0, end: 0.0).animate(controller);
    opacityAnimation = Tween<double>(begin: 0.0, end: 1.0)
        .animate(CurvedAnimation(parent: controller, curve: Curves.linear));
    Future.delayed(const Duration(seconds: 2), () {
      animate();
    });
  }

  void animate() {
    isAnimated = true;
    update();
    animation1 = defultTween1.animate(
        CurvedAnimation(parent: controller, curve: Curves.bounceInOut));
    animation2 = defultTween2.animate(
        CurvedAnimation(parent: controller, curve: Curves.bounceInOut));
    controller.forward(from: 0);
    controller.repeat();
  }

  void stop() {
    isAnimated = false;
    update();
    controller.animateTo(0.5);
  }
}

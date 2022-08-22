import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:ios_shake_animation/animation_contoller.dart';

class AppWidget extends GetView<AnimationManager> {
  final String icon;
  final double opaticy;
  final int index;
  AppWidget(this.icon, this.opaticy, this.index);
  @override
  Widget build(BuildContext context) {
    return AnimatedRotation(
      turns:index.isOdd ? controller.animation1?.value ?? 0.0 : controller.animation2?.value ?? 0.0,
      duration: const Duration(milliseconds: 150),
      child: GetBuilder<AnimationManager>(
        builder: (controller) => GestureDetector(
          onLongPress: () => controller.animate(),
          child: Stack(
            alignment: AlignmentDirectional.topStart,
            clipBehavior: Clip.none,
            children: [
              Column(
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(
                        icon,
                        width: 65,
                      )),
                  const SizedBox(height: 5),
                  const Text(
                    "Flutter App",
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  )
                ],
              ),
              if (controller.isAnimated)
                Positioned(
                  left: -5,
                  top: -5,
                  child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 300),
                    opacity: opaticy,
                    child: Container(
                      width: 25,
                      height: 25,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white70.withOpacity(0.8)),
                      child: const Icon(
                        Icons.remove,
                        size: 23,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

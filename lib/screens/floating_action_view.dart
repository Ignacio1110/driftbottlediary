import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rive/rive.dart';

import 'float_action_controller.dart';

class FloatingActionView extends GetView<FloatingActionController> {
  const FloatingActionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 140,
      height: 140,
      child: RiveAnimation.asset(
        'assets/animations/cat_following_the_mouse.riv',
        animations: [
          'Idle',
          'Blink',
        ],
        stateMachines: ['State Machine 1'],
      ),
    );
  }
}

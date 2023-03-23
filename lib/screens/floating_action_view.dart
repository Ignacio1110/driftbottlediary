import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'float_action_controller.dart';

class FloatingActionView extends GetView<FloatingActionController> {
  const FloatingActionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(FloatingActionController());
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).padding.bottom / 2,
        top: MediaQuery.of(context).padding.bottom / 2,
      ),
      child: FloatingActionButton(
        child: Stack(
          clipBehavior: Clip.none,
          children: const [
            Icon(Icons.add),
          ],
        ),
        onPressed: () {
          controller.addDiary();
        },
      ),
    );
  }
}

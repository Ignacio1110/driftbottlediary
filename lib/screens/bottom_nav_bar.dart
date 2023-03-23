import 'package:driftbottlediary/consts.dart';
import 'package:driftbottlediary/screens/bottom_nav_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class BottomNavBar extends GetView<BottomNavController> {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceTint.withOpacity(.1),
      ),
      child: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).padding.bottom / 2,
          top: MediaQuery.of(context).padding.bottom / 2,
          left: MediaQuery.of(context).padding.bottom / 2 + kBottomSheetPadding,
          right:
              MediaQuery.of(context).padding.bottom / 2 + kBottomSheetPadding,
        ),
        child: ConstrainedBox(
          constraints: BoxConstraints.tightFor(height: 56),
          child: Row(
            children: [
              IconButton(
                onPressed: () {
                  controller.changePage(0);
                },
                icon: const FaIcon(
                  FontAwesomeIcons.bookQuran,
                  size: 30,
                ),
              ),
              IconButton(
                onPressed: () {
                  controller.changePage(1);
                },
                icon: const Icon(
                  Icons.settings,
                  size: 30,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

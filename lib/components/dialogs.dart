import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../translations.dart';
import 'anim.dart';

Widget simpleDeleteDialog(BuildContext context, {Function()? confirm}) {
  return AlertDialog(
    title: Text(DiaryTranslations.delete_diary_dialog_title.tr),
    content: Text(DiaryTranslations.delete_diary_dialog_content.tr),
    actions: [
      TextButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Text(DiaryTranslations.cancel.tr),
      ),
      if (confirm != null)
        TextButton(
          onPressed: () {
            confirm();
            Navigator.pop(context);
          },
          child: Text(DiaryTranslations.confirm.tr),
        ),
    ],
  );
  // return AwesomeDialog(
  //   context: context,
  //   dialogType: DialogType.info,
  //   animType: AnimType.rightSlide,
  //   title: 'Dialog Title',
  //   desc: 'Dialog description here.............',
  //   btnCancelOnPress: () {},
  //   btnOkOnPress: () {},
  // )..show();
}

///提供客製化方法給Getx
extension ExtensionCustomDialog on GetInterface {
  /// Show a dialog.
  /// You can pass a [transitionDuration] and/or [transitionCurve],
  /// overriding the defaults when the dialog shows up and closes.
  /// When the dialog closes, uses those animations in reverse.
  Future<T?> customDialog<T>(
    Widget widget, {
    AnimType animType = AnimType.scale,
    bool barrierDismissible = true,
    Color? barrierColor,
    bool useSafeArea = true,
    GlobalKey<NavigatorState>? navigatorKey,
    Object? arguments,
    Duration? transitionDuration,
    Curve? transitionCurve,
    String? name,
    RouteSettings? routeSettings,
  }) {
    assert(debugCheckHasMaterialLocalizations(context!));

    //  final theme = Theme.of(context, shadowThemeOnly: true);
    final theme = Theme.of(context!);
    return generalDialog<T>(
      pageBuilder: (buildContext, animation, secondaryAnimation) {
        final pageChild = widget;
        Widget dialog = Builder(builder: (context) {
          return Theme(data: theme, child: pageChild);
        });
        if (useSafeArea) {
          dialog = SafeArea(child: dialog);
        }
        return dialog;
      },
      barrierDismissible: barrierDismissible,
      barrierLabel: MaterialLocalizations.of(context!).modalBarrierDismissLabel,
      barrierColor: barrierColor ?? Colors.black54,
      transitionDuration: transitionDuration ?? defaultDialogTransitionDuration,
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        switch (animType) {
          case AnimType.RIGHSLIDE:
          case AnimType.rightSlide:
            return AnimationTransition.fromRight(
              animation,
              secondaryAnimation,
              child,
            );
          case AnimType.LEFTSLIDE:
          case AnimType.leftSlide:
            return AnimationTransition.fromLeft(
              animation,
              secondaryAnimation,
              child,
            );
          case AnimType.TOPSLIDE:
          case AnimType.topSlide:
            return AnimationTransition.fromTop(
              animation,
              secondaryAnimation,
              child,
            );
          case AnimType.BOTTOMSLIDE:
          case AnimType.bottomSlide:
            return AnimationTransition.fromBottom(
              animation,
              secondaryAnimation,
              child,
            );
          case AnimType.SCALE:
          case AnimType.scale:
            return AnimationTransition.scale(
              animation,
              secondaryAnimation,
              child,
            );
        }
      },
      navigatorKey: navigatorKey,
      routeSettings:
          routeSettings ?? RouteSettings(arguments: arguments, name: name),
    );
  }
}

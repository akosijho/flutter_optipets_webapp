import 'package:flutter/material.dart';
import 'package:flutter_optipets_webapp/utils/my_colors.dart';
import 'package:get/get.dart';

SnackbarController showSnackbar(
    {required String title, required String message, Widget? icon,  double maxWidth = 400}) {
  return Get.snackbar(
    title,
    message,
    maxWidth: maxWidth,
    icon: icon,
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: MyColors.blueButtonColor,
    borderRadius: 20,
    margin: const EdgeInsets.all(16),
    colorText: Colors.white,
    duration: const Duration(seconds: 4),
    isDismissible: true,
    dismissDirection: DismissDirection.horizontal,
    forwardAnimationCurve: Curves.easeOutBack,
  );
}

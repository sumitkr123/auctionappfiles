import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> snack(String title,String msg)
async {
  Get.snackbar(
    title ?? 'Issue :-',
    msg,
    duration: const Duration(milliseconds: 1000),
    snackPosition: SnackPosition.BOTTOM,
    borderRadius: 20,
    margin: const EdgeInsets.all(15),
    isDismissible: true,
    dismissDirection: DismissDirection.horizontal,
  );
}
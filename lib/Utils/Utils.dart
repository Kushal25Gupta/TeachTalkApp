import 'package:get/get.dart';
import 'package:flutter/material.dart';

class Utils {
  static fieldFocusChange(
      BuildContext context, FocusNode currentNode, FocusNode nextNode) {
    currentNode.unfocus();
    FocusScope.of(context).requestFocus(nextNode);
  }

  static removeFocus(FocusNode currentNode) {
    currentNode.unfocus();
  }

  static successSnackBar(String title, String message) {
    Get.snackbar(
      title,
      message,
      backgroundColor: Colors.teal.shade200,
      duration: const Duration(seconds: 2),
    );
  }

  static errorSnackBar(String title, String message) {
    Get.snackbar(
      title,
      message,
      backgroundColor: Colors.red.shade200,
      duration: const Duration(seconds: 2),
    );
  }
}

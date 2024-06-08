import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Colors/App_Colors.dart';

class CustomLoaderDialog {
  static void showLoader() {
    Get.dialog(
      const Center(
        child: CircularProgressIndicator(
          color: AppColor.primaryButton,
          strokeWidth: 2,
        ),
      ),
      barrierDismissible: false,
    );
  }

  static Future<void> hideLoader() async {
    print(Get.isDialogOpen!);
    if (Get.isDialogOpen ?? false) {
      await Future.delayed(const Duration(milliseconds: 100));
      Get.back();
    }
  }
}

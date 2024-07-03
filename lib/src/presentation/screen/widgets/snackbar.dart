import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';

class SnackbarWidget {
  static void showNeutralSnackbar(String message, {int seconds = 3}) {
    Get.showSnackbar(GetSnackBar(
      message: message,
      duration: Duration(seconds: seconds),
      margin: const EdgeInsets.all(24),
      padding: const EdgeInsets.all(16),
      borderRadius: 12,
    ));
  }

  static void showSuccessSnackbar(String message, {int seconds = 3}) {
    Get.showSnackbar(GetSnackBar(
      messageText: Text(message,
          textAlign: TextAlign.start,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.green,
            fontWeight: FontWeight.w600,
          )),
      duration: Duration(seconds: seconds),
      margin: const EdgeInsets.all(24),
      padding: const EdgeInsets.all(16),
      backgroundColor: Colors.greenAccent,
      borderRadius: 12,
      icon: Icon(
        Icons.check_box,
        size: 24,
      ),
    ));
  }

  static void showFailedSnackbar(String message, {int seconds = 3}) {
    Get.showSnackbar(GetSnackBar(
      messageText: Text(
        message,
        textAlign: TextAlign.start,
        style: const TextStyle(
          fontSize: 14,
          color: Colors.red,
          fontWeight: FontWeight.w600,
        ),
      ),
      duration: Duration(seconds: seconds),
      margin: const EdgeInsets.all(24),
      padding: const EdgeInsets.all(16),
      backgroundColor: Colors.redAccent,
      borderRadius: 12,
      icon: Icon(
        Icons.warning_rounded,
        size: 24,
      ),
    ));
  }
}

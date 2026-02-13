import 'package:bond/features/settings/presentation/widgets/app_success_dialog_design.dart';
import 'package:flutter/material.dart';

class SettingsHelper {
  static void showAlertDialog({
    required BuildContext context,
    required String title,
    required String body,
    String? buttonText,
    VoidCallback? onButtonPressed,
  }) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AppSuccessDialogDesign(
          title: title,
          body: body,
          buttonText: buttonText,
          onButtonPressed: onButtonPressed,
        );
      },
    );
  }
}

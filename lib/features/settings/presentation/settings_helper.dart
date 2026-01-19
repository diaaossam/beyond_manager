import 'package:bond/features/settings/presentation/widgets/app_success_dialog_design.dart';
import 'package:flutter/material.dart';

class SettingsHelper {
  static void showAlertDialog({
    required BuildContext context,
    required String title,
    required String body,
  }) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AppSuccessDialogDesign(title: title, body: body);
      },
    );
  }
}

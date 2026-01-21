import 'package:bond/core/extensions/color_extensions.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class PoliciesHelper {
  Future<void> showCustomDatePicker(
      {required BuildContext context,
        required bool isSingle,
        required Function(Map<String, dynamic>) map}) async {
/*    showCupertinoModalBottomSheet(
      context: context,
      builder: (context) => DatePickerDesign(
        isSingle: isSingle,
        date: map,
      ),
    );*/
  }

  String formatDate({required DateTime date}) {
    return DateFormat.yMMMEd().format(date);
  }
  Color setUpStatusColor({
    required String status,
    required BuildContext context,
  }) {
    if (status.toLowerCase().contains("active")) {
      return context.colorScheme.tertiary;
    }
    if (status.toLowerCase().contains("expire")) {
      return context.colorScheme.error;
    }
    if (status.toLowerCase().contains("pending")) {
      return context.colorScheme.primary;
    } else {
      return context.colorScheme.shadow;
    }
  }
}

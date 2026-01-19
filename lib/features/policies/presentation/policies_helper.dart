import 'package:beymanger/features/policies/presentation/widgets/active_list/date_picker_design.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class PoliciesHelper {
  Future<void> showCustomDatePicker(
      {required BuildContext context,
        required bool isSingle,
        required Function(Map<String, dynamic>) map}) async {
    showCupertinoModalBottomSheet(
      context: context,
      builder: (context) => DatePickerDesign(
        isSingle: isSingle,
        date: map,
      ),
    );
  }
  String formatDate({required DateTime date}) {
    return DateFormat.yMMMEd().format(date);
  }
  static String policiesStatus({required int value}) {
    print(value);
    if (value == 1) {
      return "Active Policy";
    } else if (value == 2) {
      return "Expired";
    } else if (value == 3) {
      return "Suspended";
    } else if (value == 4) {
      return "Terminated With Insurance Company";
    } else if (value == 5) {
      return "Under Issuance";
    } else if (value == 6) {
      return "Draft";
    } else if (value == 7) {
      return "Terminated With Beyond";
    } else if (value == 8) {
      return "Lapsed Bupa";
    } else if (value == 9) {
      return "Cancel";
    } else {
      return "All";
    }
  }

  Color setUpStatusColor({required String status}) {
    if (status == "Active Policy") {
      return const Color(0xff14c286);
    } else if (status == "Expired") {
      return Colors.redAccent;
    } else {
      return Colors.orangeAccent;
    }
  }
  String formatDateToApi({required DateTime date, String locale = "en"}) {
    String formattedDate = DateFormat('yyyy-MM-dd', locale).format(date);
    return formattedDate;
  }

  List<String> options = [
    'All',
    'Active',
    'Expired',
    'Suspended',
    'Terminated with Insurance Company',
    'Under Issuance',
    "Draft",
    "Terminated With Beyond",
    "Lapsed Bupa",
    "Cancel",
  ];
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }


}

import 'package:bond/core/extensions/color_extensions.dart';
import 'package:bond/features/policies/presentation/widget/active_list/date_picker_design.dart';
import 'package:bond/generated/l10n.dart';
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

  String formatDateToApi({required DateTime date, String locale = "en"}) {
    String formattedDate = DateFormat('yyyy-MM-dd', locale).format(date);
    return formattedDate;
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


  String convertMonth({required String month}){
    if(month == "1"){
      return S.current.january;
    }
    if(month == "2"){
      return S.current.february;
    }
    if(month == "3"){
      return S.current.march;
    }
    if(month == "4"){
      return S.current.april;
    }
    if(month == "5"){
      return S.current.may;
    }
    if(month == "6"){
      return S.current.june;
    }
    if(month == "7"){
      return S.current.july;
    }
    if(month == "8"){
      return S.current.august;
    }
    if(month == "9"){
      return S.current.september;
    }
    if(month == "10"){
      return S.current.october;
    }
    if(month == "11"){
      return S.current.november;
    }
    if(month == "12"){
      return S.current.december;
    }
    return "";
  }
}

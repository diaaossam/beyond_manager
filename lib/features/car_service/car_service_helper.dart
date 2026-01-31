import 'package:flutter/cupertino.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import 'data/models/company_model.dart';
import 'presentation/widgets/car_service_model_bottom_sheet.dart';

Future<void> showBottomSheetChoose(
    {required String titleText,
    required BuildContext context,
    required List<String> data,
    List<CompanyModel> dataCompany = const [],
    CompanyModel? initCompany,
    String? initValue,
    required void Function(dynamic indices) onPressed}) async {
  showCupertinoModalBottomSheet(
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
    enableDrag: false,
    context: context,
    builder: (context) {
      return CartServiceModelBottomSheetSelection(
        titleText: titleText,
        companyList: dataCompany,
        data: data,
        initCompany: initCompany,
        initValue: initValue,
        onPressed: onPressed,
      );
    },
  );
}

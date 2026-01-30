import 'package:bond/features/network/data/models/response/tiers_model.dart';
import 'package:bond/features/network/data/models/response/tpa_model.dart';
import 'package:flutter/material.dart';
import 'presentation/widgets/search/company_model_bottom_sheet.dart';
import 'presentation/widgets/search/generic_model_bottom_sheet_selection.dart';
import 'presentation/widgets/search/tpa_model_bottom_sheet.dart';

class NetworkHelper {
  final String tiers = "Tiers";
  final String city = "Cities";
  final String area = "Area";
  final String providerType = "Provider Type";
  final String specialty = "Specialty";


  Future<void> showBottomSheet(
      {required String title,
      required BuildContext context,
      required bool isWithConcatenated,
      required bool isSingleChoose,
      required List<MainTiersModel> data,
      required List<Tiers> tiersData,
      required List<MainTiersModel> initData,
      Tiers? initTiersData,
      required void Function(dynamic indices) onPressed}) async {
    showModalBottomSheet(
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      context: context,
      builder: (context) {
        return GenericModelBottomSheetSelection(
          title: title,
          isWithConcatenated: isWithConcatenated,
          initData: initData,
          initTiersData: initTiersData,
          data: data,
          isSingleChoose: isSingleChoose,
          onPressed: onPressed,
        );
      },
    );
  }

  Future<void> showTpaBottomSheet(
      {required String title,
      required BuildContext context,
      required List<TpaModel> tpaModel,
      required void Function(dynamic indices) onPressed}) async {
    showModalBottomSheet(
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      context: context,
      builder: (context) {
        return TpaModelBottomSheetSelection(
          title: title,
          tpaListModel: tpaModel,
          onPressed: onPressed,
        );
      },
    );
  }

  Future<void> showCompanyBottomSheet({
    required String title,
    required BuildContext context,
    required List<Company> company,
  }) async {
    showModalBottomSheet(
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      context: context,
      builder: (context) {
        return CompanyModelBottomSheetSelection(
          title: title,
          companyList: company,
        );
      },
    );
  }

  String handleMainTierModelToString({required List<MainTiersModel> list}) {
    List<String> stringList = [];
    for (var element in list) {
      stringList.add(element.name.toString());
    }
    return stringList.toString();
  }

  List<String> handleMainTierModelToListOfString(
      {required List<MainTiersModel> list}) {
    List<String> stringList = [];
    for (var element in list) {
      stringList.add(element.name.toString());
    }
    return stringList;
  }
}

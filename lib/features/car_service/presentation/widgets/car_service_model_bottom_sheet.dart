import 'package:flutter/material.dart';

import '../../../../core/extensions/app_localizations_extension.dart';
import '../../../../core/extensions/color_extensions.dart';
import '../../../../core/utils/app_size.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../widgets/image_picker/app_image.dart';
import '../../../../widgets/main_widget/app_text.dart';
import '../../../../widgets/main_widget/custom_button.dart';
import '../../../../widgets/main_widget/custom_text_form_field.dart';
import '../../../../widgets/rotate.dart';
import '../../data/models/company_model.dart';

class CartServiceModelBottomSheetSelection extends StatefulWidget {
  final String titleText;
  final void Function(dynamic indices) onPressed;
  final List<String> data;
  final List<CompanyModel> companyList;
  final CompanyModel? initCompany;
  final String? initValue;

  const CartServiceModelBottomSheetSelection({
    super.key,
    required this.onPressed,
    required this.data,
    required this.titleText,
    required this.companyList,
    this.initCompany,
    this.initValue,
  });

  @override
  State<CartServiceModelBottomSheetSelection> createState() =>
      _CartServiceModelBottomSheetSelectionState();
}

class _CartServiceModelBottomSheetSelectionState
    extends State<CartServiceModelBottomSheetSelection> {
  final ValueNotifier<String?> selectedIndex = ValueNotifier<String?>(null);
  List<String> searchedList = [];
  final ValueNotifier<CompanyModel?> selectedCompany =
      ValueNotifier<CompanyModel?>(null);
  List<CompanyModel> searchedListCompany = [];

  void filterData(String query) {
    if (widget.companyList.isNotEmpty) {
      searchedListCompany = widget.companyList
          .where((value) => value.insuranceCompany
              .toString()
              .toLowerCase()
              .contains(query.toLowerCase()))
          .toList();
    } else {
      searchedList = widget.data
          .where((value) =>
              value.toString().toLowerCase().contains(query.toLowerCase()))
          .toList();
    }

    setState(() {});
  }

  void clearData() {
    searchedList.clear();
    searchedListCompany.clear();
    setState(() {});
  }

  @override
  void initState() {
    initData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.bodyHeight * .95,
      padding: const EdgeInsets.only(top: 15),
      child: Scaffold(
        appBar: AppBar(
          title: AppText(
            text: widget.titleText,
            fontWeight: FontWeight.w600,
            textSize: 14,
          ),
          leading: IconButton(
            icon: AppImage.asset(Assets.icons.arrow2),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              CustomTextFormField(
                onChanged: (p0) {
                  if (p0 != null && p0.isNotEmpty) {
                    filterData(p0);
                  } else {
                    setState(() {
                      searchedList = widget.data;
                      searchedListCompany = widget.companyList;
                    });
                  }
                },
                prefixIcon: AppImage.asset(Assets.icons.search),
                hintText: context.localizations.search,
              ),
              if (widget.companyList.isNotEmpty)
                Expanded(
                  child: ValueListenableBuilder<CompanyModel?>(
                    valueListenable: selectedCompany,
                    builder: (context, selected, _) {
                      return ListView.builder(
                        itemCount: searchedListCompany.length,
                        itemBuilder: (context, index) {
                          final value = searchedListCompany[index];
                          return ListTile(
                            onTap: () {
                              if (selected == value) {
                                selectedCompany.value = null;
                              } else {
                                selectedCompany.value = value;
                              }
                            },
                            selected: selected == value,
                            title: AppText(
                              text: value.insuranceCompany.toString(),
                              fontWeight: FontWeight.w500,
                              textSize: 12,
                            ),
                            trailing: AppImage.asset(
                              Assets.icons.radio,
                              color: selected == value
                                  ? context.colorScheme.primary
                                  : context.colorScheme.shadow,
                            ),
                          );
                        },
                      );
                    },
                  ),
                )
              else
                Expanded(
                  child: ValueListenableBuilder<String?>(
                    valueListenable: selectedIndex,
                    builder: (context, selected, _) {
                      return ListView.builder(
                        itemCount: searchedList.length,
                        itemBuilder: (context, index) {
                          final value = searchedList[index];
                          return ListTile(
                            onTap: () {
                              if (selected == value) {
                                selectedIndex.value = null;
                              } else {
                                selectedIndex.value = value;
                              }
                            },
                            selected: selected == value,
                            title: AppText(
                              text: value.toString(),
                              fontWeight: FontWeight.w500,
                              textSize: 12,
                            ),
                            trailing: AppImage.asset(
                              Assets.icons.radio,
                              color: selected == value
                                  ? context.colorScheme.primary
                                  : context.colorScheme.shadow,
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              CustomButton(
                press: () {
                  if (widget.companyList.isNotEmpty) {
                    widget.onPressed(selectedCompany.value);
                    Navigator.pop(context);
                  } else {
                    widget.onPressed(selectedIndex.value);
                    Navigator.pop(context);
                  }
                },
                text: context.localizations.done,
              ),
              SizedBox(height: SizeConfig.bodyHeight * .04),
            ],
          ),
        ),
      ),
    );
  }

  void initData() {
    if (widget.companyList.isNotEmpty) {
      searchedListCompany = widget.companyList;
      selectedCompany.value = widget.initCompany;
    } else {
      searchedList = widget.data;
      selectedIndex.value = widget.initValue;
    }
  }
}

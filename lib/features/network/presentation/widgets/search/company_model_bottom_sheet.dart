import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:bond/gen/assets.gen.dart';
import 'package:bond/widgets/image_picker/app_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/extensions/app_localizations_extension.dart';
import '../../../../../core/utils/app_size.dart';
import '../../../../../widgets/main_widget/app_text.dart';
import '../../../../../widgets/main_widget/custom_text_form_field.dart';
import '../../../data/models/response/tpa_model.dart';
import '../../bloc/search/search_cubit.dart';

class CompanyModelBottomSheetSelection extends StatefulWidget {
  final String title;
  final List<Company> companyList;

  const CompanyModelBottomSheetSelection({
    super.key,
    required this.title,
    required this.companyList,
  });

  @override
  State<CompanyModelBottomSheetSelection> createState() =>
      _CompanyModelBottomSheetSelectionState();
}

class _CompanyModelBottomSheetSelectionState
    extends State<CompanyModelBottomSheetSelection> {
  final ValueNotifier<Company?> selectedIndex = ValueNotifier<Company?>(null);
  List<Company> searchedTiersList = [];

  void filterData(String query) {
    setState(() {
      final list = widget.companyList
          .where(
            (tier) => tier.name.toString().toLowerCase().contains(
              query.toLowerCase(),
            ),
          )
          .toList();
      searchedTiersList = list;
    });
  }

  void clearData() => setState(() => searchedTiersList.clear());

  @override
  void initState() {
    _addList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, BaseState<List<TpaModel>>>(
      builder: (context, state) {
        return Container(
          height: SizeConfig.bodyHeight * .95,
          padding: const EdgeInsets.only(top: 15),
          child: Scaffold(
            appBar: AppBar(
              title: AppText(
                text: widget.title,
                fontWeight: FontWeight.w600,
                textSize: 14,
              ),
              leading: IconButton(
                icon: AppImage.asset(Assets.icons.arrowLeft),
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
                        setState(() => searchedTiersList = widget.companyList);
                      }
                    },
                    prefixIcon: AppImage.asset(Assets.icons.search),
                    hintText: context.localizations.search,
                  ),
                  Expanded(
                    child: ValueListenableBuilder<Company?>(
                      valueListenable: selectedIndex,
                      builder: (context, selected, _) {
                        final listToShow = searchedTiersList;
                        return ListView.builder(
                          itemCount: listToShow.length,
                          itemBuilder: (context, index) {
                            final tpa = listToShow[index];
                            return ListTile(
                              onTap: () {
                                context.read<SearchCubit>().getAllTiers(
                                  company: tpa,
                                );
                                Navigator.pop(context);
                              },
                              selected: selected == tpa,
                              title: AppText(
                                text: tpa.name,
                                fontWeight: FontWeight.w500,
                                textSize: 12,
                              ),
                              trailing: AppImage.asset(
                                Assets.icons.radio,
                                colorFilter: ColorFilter.mode(
                                  selected == tpa
                                      ? Theme.of(context).primaryColor
                                      : Colors.grey,
                                  BlendMode.srcIn,
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                  SizedBox(height: SizeConfig.bodyHeight * .02),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _addList() {
    setState(() => searchedTiersList = widget.companyList);
  }
}

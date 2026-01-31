import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:bond/core/extensions/app_localizations_extension.dart';
import 'package:bond/core/extensions/color_extensions.dart';
import 'package:bond/core/utils/app_size.dart';
import 'package:bond/features/network/data/models/response/tpa_model.dart';
import 'package:bond/gen/assets.gen.dart';
import 'package:bond/widgets/image_picker/app_image.dart';
import 'package:bond/widgets/main_widget/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../widgets/main_widget/custom_text_form_field.dart';
import '../../bloc/search/search_cubit.dart';

class TpaModelBottomSheetSelection extends StatefulWidget {
  final String title;
  final void Function(dynamic indices) onPressed;
  final List<TpaModel> tpaListModel;

  const TpaModelBottomSheetSelection({
    super.key,
    required this.title,
    required this.onPressed,
    required this.tpaListModel,
  });

  @override
  State<TpaModelBottomSheetSelection> createState() =>
      _TpaModelBottomSheetSelectionState();
}

class _TpaModelBottomSheetSelectionState
    extends State<TpaModelBottomSheetSelection> {
  final ValueNotifier<TpaModel?> selectedIndex = ValueNotifier<TpaModel?>(null);
  List<TpaModel> searchedTiersList = [];

  void filterData(String query) {
    setState(() {
      searchedTiersList = widget.tpaListModel
          .where(
            (tier) => tier.tpaName.toString().toLowerCase().contains(
              query.toLowerCase(),
            ),
          )
          .toList();
    });
  }

  @override
  void initState() {
    initData();
    super.initState();
  }

  void clearData() {
    setState(() {
      searchedTiersList.clear();
    });
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
                fontWeight: FontWeight.bold,
                textSize: 18,
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
                        setState(() => searchedTiersList = widget.tpaListModel);
                      }
                    },
                    prefixIcon: AppImage.asset(Assets.icons.search),
                    hintText: context.localizations.search,
                  ),
                  Expanded(
                    child: ValueListenableBuilder<TpaModel?>(
                      valueListenable: selectedIndex,
                      builder: (context, selected, _) {
                        final listToShow = searchedTiersList;
                        return ListView.builder(
                          itemCount: listToShow.length,
                          itemBuilder: (context, index) {
                            final tpa = listToShow[index];
                            return ListTile(
                              onTap: () {
                                context.read<SearchCubit>().selectTpa(tpa);
                                Navigator.pop(context);
                              },
                              selected: selected == tpa,
                              title: AppText(
                                text: tpa.tpaName ?? "",
                                fontWeight: FontWeight.w500,
                                textSize: 12,
                              ),
                              subtitle: Row(
                                children: [
                                  AppText(
                                    text: context.localizations.lastUpdated,
                                    textSize: 12,
                                    color: context.colorScheme.shadow,
                                  ),
                                  AppText(
                                    text: tpa.lastUpdate ?? "",
                                    textSize: 12,
                                    color: context.colorScheme.shadow,
                                  ),
                                ],
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

  void initData() {
    setState(() {
      searchedTiersList = widget.tpaListModel;
    });
  }
}

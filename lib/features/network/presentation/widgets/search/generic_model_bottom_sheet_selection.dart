import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:bond/core/extensions/color_extensions.dart';
import 'package:bond/features/network/data/models/response/tpa_model.dart';
import 'package:bond/gen/assets.gen.dart';
import 'package:bond/widgets/image_picker/app_image.dart';
import 'package:bond/widgets/loading/loading_widget.dart';
import 'package:bond/widgets/main_widget/back_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/extensions/app_localizations_extension.dart';
import '../../../../../core/utils/app_size.dart';
import '../../../../../widgets/app_failure.dart';
import '../../../../../widgets/main_widget/app_text.dart';
import '../../../../../widgets/main_widget/custom_button.dart';
import '../../../../../widgets/main_widget/custom_text_form_field.dart';
import '../../../data/models/response/tiers_model.dart';
import '../../bloc/search/search_cubit.dart';

class GenericModelBottomSheetSelection extends StatefulWidget {
  final String title;
  final bool isWithConcatenated;
  final void Function(dynamic indices) onPressed;
  final bool isSingleChoose;
  final List<MainTiersModel> data;
  final List<MainTiersModel> initData;
  final Tiers? initTiersData;

  const GenericModelBottomSheetSelection({
    super.key,
    required this.title,
    required this.onPressed,
    required this.isSingleChoose,
    required this.data,
    required this.isWithConcatenated,
    required this.initData,
    this.initTiersData,
  });

  @override
  State<GenericModelBottomSheetSelection> createState() =>
      _GenericModelBottomSheetSelectionState();
}

class _GenericModelBottomSheetSelectionState
    extends State<GenericModelBottomSheetSelection> {
  final ValueNotifier<List<MainTiersModel>> selectedIndices = ValueNotifier([]);
  final ValueNotifier<Tiers?> selectedIndex = ValueNotifier<Tiers?>(null);

  List<MainTiersModel> searchedList = [];
  List<Tiers> searchedTiersList = [];

  void filterData(String query) {
    if (widget.isSingleChoose) {
      searchedTiersList = BlocProvider.of<SearchCubit>(context).tiers
          .where(
            (tier) => tier.value.toString().toLowerCase().contains(
              query.toLowerCase(),
            ),
          )
          .toList();
    } else {
      searchedList = widget.data
          .where(
            (item) => item.name!.toLowerCase().contains(query.toLowerCase()),
          )
          .toList();
    }
    setState(() {});
  }

  void clearData() {
    searchedList.clear();
    searchedTiersList.clear();
    setState(() {});
  }

  @override
  void initState() {
    initData(cubit: context.read<SearchCubit>());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isSingleChoose) {
      return BlocBuilder<SearchCubit, BaseState<List<TpaModel>>>(
        builder: (context, state) {
          SearchCubit cubit = BlocProvider.of<SearchCubit>(context);
          
          // Check if loading tiers
          if (state.isLoading && cubit.tiers.isEmpty) {
            return SizedBox(
              height: SizeConfig.bodyHeight * .95,
              child: const LoadingWidget(),
            );
          } else if (state.isFailure) {
            return SizedBox(
              height: SizeConfig.bodyHeight * .95,
              child: AppFailureWidget(
                body: state.error?.toString() ?? 'Error loading data',
                callback: () {},
              ),
            );
          } else if (cubit.tiers.isNotEmpty) {
            return Container(
              height: SizeConfig.bodyHeight * .95,
              padding: const EdgeInsets.only(top: 15),
              child: Scaffold(
                appBar: AppBar(
                  title: AppText(
                    text: widget.title,
                    fontWeight: FontWeight.bold,
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
                            setState(() {
                              searchedTiersList = cubit.tiers;
                            });
                          }
                        },
                        prefixIcon: AppImage.asset(Assets.icons.search),
                        hintText: context.localizations.search,
                      ),
                      Expanded(
                        child: ValueListenableBuilder<Tiers?>(
                          valueListenable: selectedIndex,
                          builder: (context, selected, _) {
                            return ListView.builder(
                              itemCount: searchedTiersList.length,
                              itemBuilder: (context, index) {
                                final tier = searchedTiersList[index];

                                return ListTile(
                                  onTap: () {
                                    widget.onPressed(tier);
                                    Navigator.pop(context);
                                  },
                                  selected: selected == tier,
                                  title: AppText(
                                    text: tier.value.toString(),
                                    fontWeight: FontWeight.w500,
                                    textSize: 12,
                                  ),
                                  trailing: AppImage.asset(
                                    Assets.icons.radio,
                                    colorFilter: ColorFilter.mode(
                                      selected == tier
                                          ? context.colorScheme.primary
                                          : context.colorScheme.shadow,
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
          } else {
            return const Center(child: LoadingWidget());
          }
        },
      );
    } else {
      return Container(
        height: SizeConfig.bodyHeight * .95,
        padding: const EdgeInsets.only(top: 15),
        child: Scaffold(
          appBar: AppBar(
            title: AppText(
              text: widget.title,
              fontWeight: FontWeight.bold,
              textSize: 14,
            ),
            leading: BackArrowWidget(),
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
                      });
                    }
                  },
                  prefixIcon: AppImage.asset(Assets.icons.search),
                  hintText: context.localizations.search,
                ),
                ListTile(
                  onTap: () {
                    final isSelectedAll = searchedList.isNotEmpty
                        ? selectedIndices.value.length == searchedList.length
                        : selectedIndices.value.length == widget.data.length;
                    if (isSelectedAll) {
                      selectedIndices.value = [];
                    } else {
                      selectedIndices.value = List<MainTiersModel>.from(
                        searchedList.isNotEmpty ? searchedList : widget.data,
                      );
                    }
                  },
                  title: AppText(
                    text: context.localizations.all,
                    fontWeight: FontWeight.w500,
                    textSize: 12,
                  ),
                  trailing: AppImage.asset(
                    Assets.icons.radio,
                    colorFilter: ColorFilter.mode(
                      selectedIndices.value.length == widget.data.length
                          ? context.colorScheme.primary
                          : context.colorScheme.shadow,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
                Expanded(
                  child: ValueListenableBuilder<List<MainTiersModel>>(
                    valueListenable: selectedIndices,
                    builder: (context, selected, _) {
                      return ListView.builder(
                        itemCount: searchedList.length,
                        itemBuilder: (context, index) {
                          final item = searchedList[index];
                          return ListTile(
                            onTap: () {
                              final updatedSelection =
                                  List<MainTiersModel>.from(selected);
                              if (selected.contains(item)) {
                                updatedSelection.remove(item);
                              } else {
                                updatedSelection.add(item);
                              }
                              selectedIndices.value = updatedSelection;
                            },
                            selected: selected.contains(item),
                            title: AppText(
                              text: widget.isWithConcatenated
                                  ? item.concatenatedValue.toString()
                                  : item.name.toString(),
                              fontWeight: FontWeight.w500,
                              textSize: 12,
                            ),
                            trailing: AppImage.asset(
                              Assets.icons.radio,
                              color:selected.contains(item)
                                  ? context.colorScheme.primary
                                  : context.colorScheme.shadow,
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
                SizedBox(height: SizeConfig.bodyHeight * .02),
                CustomButton(
                  press: () {
                    widget.onPressed(selectedIndices.value);
                    Navigator.pop(context);
                  },
                  text: context.localizations.done,
                ),
                SizedBox(height: SizeConfig.bodyHeight * .02),
              ],
            ),
          ),
        ),
      );
    }
  }

  void initData({required SearchCubit cubit}) {
    selectedIndices.value = widget.initData;
    selectedIndex.value = widget.initTiersData;
    setState(() {
      if (widget.isSingleChoose) {
        searchedTiersList = cubit.tiers;
      } else {
        searchedList = widget.data;
      }
    });
  }
}

import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:bond/core/extensions/app_localizations_extension.dart';
import 'package:bond/core/extensions/color_extensions.dart';
import 'package:bond/core/utils/app_size.dart';
import 'package:bond/features/reservation/data/models/response/hospitals_model.dart';
import 'package:bond/features/reservation/presentation/cubit/new_reservation/new_reservation_cubit.dart';
import 'package:bond/features/reservation/presentation/widgets/new_reservation/circle_check_button.dart';
import 'package:bond/widgets/main_widget/app_text.dart';
import 'package:bond/widgets/main_widget/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../gen/assets.gen.dart';
import '../../../../../widgets/image_picker/app_image.dart';

class CustomBranchExpandedList extends StatefulWidget {
  final Function(List<HospitalsModel>) onCallBack;

  const CustomBranchExpandedList({super.key, required this.onCallBack});

  @override
  State<CustomBranchExpandedList> createState() =>
      _CustomBranchExpandedListState();
}

class _CustomBranchExpandedListState extends State<CustomBranchExpandedList> {
  List<HospitalsModel> branchesList = [];
  List<HospitalsModel> filteredBranches = [];
  bool isExpanded = false;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    final bloc = context.read<NewReservationCubit>();
    filteredBranches = List.from(bloc.state.data?.branches ?? []);
  }

  void _filterBranches(String query) {
    final bloc = context.read<NewReservationCubit>();
    final branches = bloc.state.data?.branches ?? [];
    if (query.isEmpty) {
      filteredBranches = List.from(branches);
    } else {
      filteredBranches = branches.where((branch) {
        return branch.designation?.toLowerCase().contains(
              query.toLowerCase(),
            ) ??
            false;
      }).toList();
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewReservationCubit, BaseState<NewReservationData>>(
      builder: (context, state) {
        final branches = state.data?.branches ?? [];
        return ExpansionTile(
          onExpansionChanged: (value) {
            setState(() {
              isExpanded = value;
              if (value) {
                filteredBranches = List.from(branches);
              }
            });
          },
          leading: Container(
            height: SizeConfig.bodyHeight * .1,
            width: SizeConfig.bodyHeight * .1,
            padding: const EdgeInsets.all(12),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xffFDEEE6),
            ),
            child: AppImage.asset(Assets.icons.branch, color: context.colorScheme.primary),
          ),
          tilePadding: EdgeInsets.zero,
          childrenPadding: EdgeInsets.zero,
          title: AppText(
            text: context.localizations.branch,
            fontWeight: FontWeight.w600,
          ),
          subtitle: AppText(text: context.localizations.selectBranch),
          trailing: Container(
            margin: EdgeInsetsDirectional.only(
              end: SizeConfig.screenWidth * .02,
            ),
            child: isExpanded
                ? AppImage.asset(Assets.icons.arrowDown)
                : AppImage.asset(Assets.icons.arrowRight1),
          ),
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                vertical: SizeConfig.bodyHeight * .01,
              ),
              decoration: const BoxDecoration(color: Color(0xffFEFAF8)),
              child: Column(
                children: [
                  Padding(
                    padding: screenPadding(),
                    child: CustomTextFormField(
                      controller: _searchController,
                      hintText: context.localizations.search,
                      suffixIcon: AppImage.asset(Assets.icons.search),
                      onChanged: (p0) {
                        _filterBranches(p0.toString());
                      },
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: filteredBranches.length,
                    itemBuilder: (context, index) {
                      final item = filteredBranches[index];
                      final isSelected = branchesList.contains(item);
                      return InkWell(
                        key: Key(item.code.toString()),
                        onTap: () {
                          setState(() {
                            if (branchesList.contains(item)) {
                              branchesList.remove(item);
                            } else {
                              branchesList.add(item);
                            }
                            widget.onCallBack(branchesList);
                          });
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: SizeConfig.screenWidth * .04,
                            vertical: SizeConfig.bodyHeight * .008,
                          ),
                          child: Row(
                            children: [
                              SizedBox(width: SizeConfig.screenWidth * .1),
                              CircleCheckButton(isSelected: isSelected),
                              SizedBox(width: SizeConfig.screenWidth * .015),
                              Expanded(
                                child: AppText(
                                  text: item.designation ?? "",
                                  color: const Color(0xff898A8D),
                                  maxLines: 2,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

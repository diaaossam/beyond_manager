import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:bond/core/extensions/app_localizations_extension.dart';
import 'package:bond/core/extensions/color_extensions.dart';
import 'package:bond/core/utils/app_size.dart';
import 'package:bond/features/reservation/data/models/response/speciality_model.dart';
import 'package:bond/features/reservation/presentation/cubit/new_reservation/new_reservation_cubit.dart';
import 'package:bond/features/reservation/presentation/widgets/new_reservation/circle_toggle_button.dart';
import 'package:bond/widgets/main_widget/app_text.dart';
import 'package:bond/widgets/main_widget/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../gen/assets.gen.dart';
import '../../../../../widgets/image_picker/app_image.dart';

class CustomSpecialitiesExpandedList extends StatefulWidget {
  final Function(SpecialityModel) onSpecialitySelected;

  const CustomSpecialitiesExpandedList({
    super.key,
    required this.onSpecialitySelected,
  });

  @override
  State<CustomSpecialitiesExpandedList> createState() =>
      _CustomSpecialitiesExpandedListState();
}

class _CustomSpecialitiesExpandedListState
    extends State<CustomSpecialitiesExpandedList> {
  num? code;
  bool isExpanded = false;
  final TextEditingController _searchController = TextEditingController();
  List<SpecialityModel> filteredList = [];

  @override
  void initState() {
    super.initState();
  }

  void _filterList(String value) {
    final bloc = context.read<NewReservationCubit>();
    final allSpecialities = bloc.state.data?.specialities ?? [];
    final query = value.toLowerCase().trim();

    setState(() {
      filteredList = allSpecialities.where((item) {
        return (item.designation?.toLowerCase().contains(query) ?? false) ||
            (item.designationAr?.toLowerCase().contains(query) ?? false);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewReservationCubit, BaseState<NewReservationData>>(
      listener: (context, state) {
        if (state.identifier == 'get_specialities' && state.isSuccess) {
          setState(() => filteredList = state.data?.specialities ?? []);
        }
      },
      builder: (context, state) {
        final specialities = state.data?.specialities ?? [];
        final displayList =
            filteredList.isEmpty && _searchController.text.isEmpty
            ? specialities
            : filteredList;

        return ExpansionTile(
          onExpansionChanged: (value) => setState(() {
            isExpanded = value;
            if (value) {
              filteredList = specialities;
            }
          }),
          leading: Container(
            height: SizeConfig.bodyHeight * .1,
            width: SizeConfig.bodyHeight * .1,
            padding: const EdgeInsets.all(12),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xffFDEEE6),
            ),
            child: AppImage.asset(
              Assets.icons.specialty,
              color: context.colorScheme.primary,
            ),
          ),
          tilePadding: EdgeInsets.zero,
          childrenPadding: EdgeInsets.zero,
          title: AppText(
            text: context.localizations.specialty,
            fontWeight: FontWeight.w600,
          ),
          subtitle: AppText(text: context.localizations.selectSpecialty),
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
                      suffixIcon: AppImage.asset(Assets.icons.search2),
                      onChanged: (p0) {
                        _filterList(p0.toString());
                      },
                    ),
                  ),
                  ...displayList.map((branch) {
                    final isSelected = branch.code == code;
                    return InkWell(
                      onTap: () {
                        setState(() => code = branch.code!);
                        widget.onSpecialitySelected(branch);
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: SizeConfig.screenWidth * .04,
                          vertical: SizeConfig.bodyHeight * .008,
                        ),
                        child: Row(
                          children: [
                            SizedBox(width: SizeConfig.screenWidth * .1),
                            CircleToggleButton(isSelected: isSelected),
                            SizedBox(width: SizeConfig.screenWidth * .015),
                            Expanded(
                              child: AppText(
                                text:
                                    "${branch.designation} - ${branch.designationAr} ",
                                color: const Color(0xff898A8D),
                                maxLines: 2,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:bond/core/extensions/app_localizations_extension.dart';
import 'package:bond/core/extensions/color_extensions.dart';
import 'package:bond/core/utils/app_size.dart';
import 'package:bond/core/global_models/generic_model.dart';
import 'package:bond/features/reservation/presentation/cubit/new_reservation/new_reservation_cubit.dart';
import 'package:bond/features/reservation/presentation/widgets/new_reservation/circle_toggle_button.dart';
import 'package:bond/widgets/main_widget/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../gen/assets.gen.dart';
import '../../../../../widgets/image_picker/app_image.dart';

class CustomHospitalsExpandedList extends StatefulWidget {
  final Function(String) onHospitalSelected;

  const CustomHospitalsExpandedList({
    super.key,
    required this.onHospitalSelected,
  });

  @override
  State<CustomHospitalsExpandedList> createState() =>
      _CustomHospitalsExpandedListState();
}

class _CustomHospitalsExpandedListState
    extends State<CustomHospitalsExpandedList> {
  GenericModel? hospitalsModel;
  bool isExpanded = false;

  @override
  void initState() {
    context.read<NewReservationCubit>().getAllHospitals();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewReservationCubit, BaseState<NewReservationData>>(
      builder: (context, state) {
        final hospitals = state.data?.hospitals ?? [];
        return ExpansionTile(
          onExpansionChanged: (value) => setState(() => isExpanded = value),
          leading: Container(
            height: SizeConfig.bodyHeight * .1,
            width: SizeConfig.bodyHeight * .1,
            padding: const EdgeInsets.all(12),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xffFDEEE6),
            ),
            child: AppImage.asset(
              Assets.icons.hospital,
              color: context.colorScheme.primary,
            ),
          ),
          tilePadding: EdgeInsets.zero,
          childrenPadding: EdgeInsets.zero,
          title: AppText(
            text: context.localizations.hospital,
            fontWeight: FontWeight.w600,
          ),
          subtitle: AppText(text: context.localizations.selectHospital),
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
                  ...hospitals.map((hospital) {
                    final isSelected = hospital == hospitalsModel;
                    return InkWell(
                      onTap: () {
                        setState(() => hospitalsModel = hospital);
                        widget.onHospitalSelected(hospital.name);
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
                            AppText(
                              text: hospital.name,
                              color: const Color(0xff898A8D),
                              fontWeight: FontWeight.w500,
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

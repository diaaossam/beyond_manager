import 'package:bond/core/extensions/app_localizations_extension.dart';
import 'package:bond/core/extensions/color_extensions.dart';
import 'package:bond/core/utils/app_size.dart';
import 'package:bond/features/reservation/presentation/widgets/new_reservation/circle_toggle_button.dart';
import 'package:bond/gen/assets.gen.dart';
import 'package:bond/widgets/image_picker/app_image.dart';
import 'package:bond/widgets/main_widget/app_text.dart';
import 'package:flutter/material.dart';

class CustomAppointmentExpandedList extends StatefulWidget {
  final Function(String) onCallBack;

  const CustomAppointmentExpandedList({super.key, required this.onCallBack});

  @override
  State<CustomAppointmentExpandedList> createState() =>
      _CustomAppointmentExpandedListState();
}

class _CustomAppointmentExpandedListState
    extends State<CustomAppointmentExpandedList> {
  bool isExpanded = false;
  PartOfTimeEnum? _selectedAppointment;

  @override
  Widget build(BuildContext context) {
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
          Assets.icons.clock,
          color: context.colorScheme.primary,
        ),
      ),
      tilePadding: EdgeInsets.zero,
      childrenPadding: EdgeInsets.zero,
      title: AppText(
        text: context.localizations.appointmentTime,
        fontWeight: FontWeight.w600,
      ),
      subtitle: AppText(text: context.localizations.selectAppointmentTime),
      trailing: Container(
        margin: EdgeInsetsDirectional.only(end: SizeConfig.screenWidth * .02),
        child: isExpanded
            ? AppImage.asset(Assets.icons.arrowDown)
            : AppImage.asset(Assets.icons.arrowRight1),
      ),
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: SizeConfig.bodyHeight * .01),
          decoration: const BoxDecoration(color: Color(0xffFEFAF8)),
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  setState(() => _selectedAppointment = PartOfTimeEnum.morning);
                  widget.onCallBack(PartOfTimeEnum.morning.name);
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.screenWidth * .04,
                    vertical: SizeConfig.bodyHeight * .008,
                  ),
                  child: Row(
                    children: [
                      SizedBox(width: SizeConfig.screenWidth * .1),
                      CircleToggleButton(
                        isSelected:
                            _selectedAppointment == PartOfTimeEnum.morning,
                      ),
                      SizedBox(width: SizeConfig.screenWidth * .015),
                      AppText(
                        text: "${context.localizations.morning} (10 am - 1 pm)",
                        color: const Color(0xff898A8D),
                        fontWeight: FontWeight.w500,
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  setState(
                    () => _selectedAppointment = PartOfTimeEnum.afternoon,
                  );
                  widget.onCallBack(PartOfTimeEnum.afternoon.name);
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.screenWidth * .04,
                    vertical: SizeConfig.bodyHeight * .008,
                  ),
                  child: Row(
                    children: [
                      SizedBox(width: SizeConfig.screenWidth * .1),
                      CircleToggleButton(
                        isSelected:
                            _selectedAppointment == PartOfTimeEnum.afternoon,
                      ),
                      SizedBox(width: SizeConfig.screenWidth * .015),
                      AppText(
                        text:
                            "${context.localizations.afternoon} (2 pm - 5 pm)",
                        color: const Color(0xff898A8D),
                        fontWeight: FontWeight.w500,
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() => _selectedAppointment = PartOfTimeEnum.evening);
                  widget.onCallBack(PartOfTimeEnum.evening.name);
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.screenWidth * .04,
                    vertical: SizeConfig.bodyHeight * .008,
                  ),
                  child: Row(
                    children: [
                      SizedBox(width: SizeConfig.screenWidth * .1),
                      CircleToggleButton(
                        isSelected:
                            _selectedAppointment == PartOfTimeEnum.evening,
                      ),
                      SizedBox(width: SizeConfig.screenWidth * .015),
                      AppText(
                        text: "${context.localizations.evening} (6 pm - 12 am)",
                        color: const Color(0xff898A8D),
                        fontWeight: FontWeight.w500,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

enum PartOfTimeEnum {
  evening("EVENING"),
  morning("MORNING"),
  afternoon("AFTERNOON");

  final String name;

  const PartOfTimeEnum(this.name);
}

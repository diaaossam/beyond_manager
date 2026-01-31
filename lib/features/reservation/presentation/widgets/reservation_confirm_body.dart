import 'package:bond/core/extensions/app_localizations_extension.dart';
import 'package:bond/core/extensions/color_extensions.dart';
import 'package:bond/core/utils/app_size.dart';
import 'package:bond/features/reservation/data/models/request/post_reservation_param.dart';
import 'package:bond/features/reservation/data/models/response/doctors_result.dart';
import 'package:bond/features/reservation/presentation/widgets/new_reservation/circle_toggle_button.dart';
import 'package:bond/gen/assets.gen.dart';
import 'package:bond/widgets/image_picker/app_image.dart';
import 'package:bond/widgets/main_widget/app_text.dart';
import 'package:bond/widgets/main_widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ReservationConfirmBody extends StatefulWidget {
  final Function(bool) resultCallback;
  final ReservationParams reservationParams;
  final DoctorsResult doctorsResult;

  const ReservationConfirmBody({
    super.key,
    required this.resultCallback,
    required this.reservationParams,
    required this.doctorsResult,
  });

  @override
  State<ReservationConfirmBody> createState() => _ReservationConfirmBodyState();
}

class _ReservationConfirmBodyState extends State<ReservationConfirmBody> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (context, setState) {
        return Container(
          width: SizeConfig.screenWidth,
          height: SizeConfig.bodyHeight * .48,
          padding: screenPadding(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: SizeConfig.bodyHeight * .04),
              AppText(
                text: context.localizations.reservationBody,
                color: context.colorScheme.primary,
                textSize: 12,
              ),
              SizedBox(height: SizeConfig.bodyHeight * .02),
              AppText(
                text: widget.reservationParams.doctorName ?? "",
                fontWeight: FontWeight.w600,
                maxLines: 2,
                textSize: 13,
              ),
              SizedBox(height: SizeConfig.bodyHeight * .01),
              AppText(
                text: widget.doctorsResult.designationSpecialiteAr ?? "",
                color: context.colorScheme.shadow,
              ),
              SizedBox(height: SizeConfig.bodyHeight * .03),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  AppImage.asset(
                    Assets.icons.locationPoint,
                    color: context.colorScheme.primary,
                    height: 15,
                  ),
                  const SizedBox(width: 6),
                  AppText(
                    text: widget.doctorsResult.designationbranche ?? "",
                    color: context.colorScheme.shadow,
                  ),
                ],
              ),
              SizedBox(height: SizeConfig.bodyHeight * .01),
              Column(
                children: [
                  Row(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          AppImage.asset(
                            Assets.icons.calendar3,
                            height: 15,
                          ),
                          const SizedBox(width: 6),
                          AppText(
                            text: DateFormat.yMEd().format(
                              DateTime.parse(
                                widget.doctorsResult.jourLocalDateTime
                                    .toString(),
                              ),
                            ),
                            color: context.colorScheme.shadow,
                          ),
                        ],
                      ),
                      SizedBox(width: SizeConfig.screenWidth * .05),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          AppImage.asset(Assets.icons.clock, height: 15),
                          const SizedBox(width: 6),
                          AppText(
                            text: DateFormat.jm().format(
                              DateTime.parse(
                                widget.doctorsResult.heureDebutLocalDateTime
                                    .toString(),
                              ),
                            ),
                            color: context.colorScheme.shadow,
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: SizeConfig.bodyHeight * .01),
                ],
              ),
              SizedBox(height: SizeConfig.bodyHeight * .03),
              InkWell(
                onTap: () => setState(() => isChecked = !isChecked),
                child: Row(
                  children: [
                    CircleToggleButton(isSelected: isChecked, size: 20),
                    const SizedBox(width: 10),
                    Expanded(
                      child: AppText(
                        text: context.localizations.reservationCheck,
                        color: context.colorScheme.shadow,
                        textSize: 12,
                        maxLines: 3,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: SizeConfig.bodyHeight * .03),
              Padding(
                padding: screenPadding(),
                child: Row(
                  children: [
                    const Spacer(),
                    Expanded(
                      flex: 2,
                      child: CustomButton(
                        height: 40,
                        backgroundColor: Colors.transparent,
                        textColor: context.colorScheme.primary,
                        textSize: 12,
                        text: context.localizations.cancel,
                        press: () {
                          widget.resultCallback(false);
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    SizedBox(width: SizeConfig.screenWidth * .02),
                    Expanded(
                      flex: 2,
                      child: CustomButton(
                        height: 40,
                        textSize: 12,
                        isActive: isChecked,
                        text: context.localizations.bookNow,
                        press: () {
                          if (isChecked) {
                            widget.resultCallback(true);
                            Navigator.pop(context);
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

import 'package:bond/core/extensions/app_localizations_extension.dart';
import 'package:bond/core/extensions/color_extensions.dart';
import 'package:bond/core/utils/app_size.dart';
import 'package:bond/features/reservation/data/models/request/post_reservation_param.dart';
import 'package:bond/features/reservation/data/models/request/timeslot_params.dart';
import 'package:bond/features/reservation/presentation/pages/booking_doctor_screen.dart';
import 'package:bond/widgets/image_picker/app_image.dart';
import 'package:bond/widgets/main_widget/app_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../../gen/assets.gen.dart';
import '../../../data/models/response/doctors_result.dart';

class DoctorDesignItem extends StatelessWidget {
  final DoctorsResult doctorsResult;
  final DoctorBookingParams params;

  const DoctorDesignItem({
    super.key,
    required this.doctorsResult,
    required this.params,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        ReservationParams reservationParams = ReservationParams(
          gender: params.gender,
          idBranch: doctorsResult.idBranch?.toInt(),
          branchName: doctorsResult.branche?.designation,
          doctorName:
              doctorsResult.nomInterv ?? doctorsResult.nomIntervAr ?? "",
          hospitalName:
              doctorsResult.designationbranche ??
              doctorsResult.designationbrancheAr ??
              "",
          planningCabinetCode: doctorsResult.code.toString(),
          reservationTime: doctorsResult.partOfDay.toString(),
          reservationDate: doctorsResult.jourLocalDateTime.toString().split(
            " ",
          )[0],
          specialityName:
              doctorsResult.designationSpecialite ??
              doctorsResult.designationSpecialiteAr ??
              "",
        );
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BookingDoctorScreen(
              doctorsResult: doctorsResult,
              reservationParams: reservationParams,
            ),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.screenWidth * .04,
          vertical: SizeConfig.bodyHeight * .02,
        ),
        decoration: BoxDecoration(
          color: context.colorScheme.secondary,
          boxShadow: [
            BoxShadow(
              color: context.colorScheme.onSurface.withValues(alpha: 0.25),
              offset: const Offset(2, 2),
              blurRadius: 8,
              spreadRadius: -4,
            ),
          ],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: context.colorScheme.secondary,
                shape: BoxShape.circle,
              ),
              child: AppImage.asset(
                Assets.images.doctor.path,
                height: SizeConfig.bodyHeight * .08,
              ),
            ),
            SizedBox(width: SizeConfig.screenWidth * .04),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  AppText(
                    maxLines: 3,
                    text: "${doctorsResult.nomInterv} - ${doctorsResult.nomIntervAr}",
                    fontWeight: FontWeight.w600,
                    textSize: 12,
                  ),
                  AppText(
                    maxLines: 2,
                    text: doctorsResult.medecin?.scientificDegreeSec ?? "",
                    fontWeight: FontWeight.w400,
                    textSize: 11,
                    color: context.colorScheme.shadow,
                  ),
                  SizedBox(height: SizeConfig.bodyHeight * .01),
                  AppText(text: doctorsResult.designationSpecialiteAr ?? ""),
                  SizedBox(height: SizeConfig.bodyHeight * .01),
                  AppText(
                    maxLines: 2,
                    text:
                        "${doctorsResult.designationbranche} - ${doctorsResult.designationbrancheAr}",
                  ),
                  SizedBox(height: SizeConfig.bodyHeight * .01),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
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
                                      doctorsResult.jourLocalDateTime
                                          .toString(),
                                    ),
                                  ),
                                  color: context.colorScheme.shadow,
                                ),
                              ],
                            ),
                            SizedBox(height: SizeConfig.bodyHeight * .01),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                AppImage.asset(
                                  Assets.icons.clock,
                                  height: 15,
                                ),
                                const SizedBox(width: 6),
                                AppText(
                                  text: DateFormat.jm().format(
                                    DateTime.parse(
                                      doctorsResult.heureDebutLocalDateTime
                                          .toString(),
                                    ),
                                  ),
                                  color: context.colorScheme.shadow,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: SizeConfig.bodyHeight * .04,
                        padding: EdgeInsets.symmetric(
                          horizontal: SizeConfig.screenWidth * .04,
                        ),
                        decoration: BoxDecoration(
                          color: context.colorScheme.primary.withValues(alpha: 0.81),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: AppText(
                            text: context.localizations.bookNow,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            textSize: 11,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:bond/core/extensions/color_extensions.dart';
import 'package:bond/core/utils/app_size.dart';
import 'package:bond/features/reservation/data/models/response/doctors_result.dart';
import 'package:bond/features/reservation/presentation/pages/booking_doctor_screen.dart';
import 'package:bond/gen/assets.gen.dart';
import 'package:bond/widgets/image_picker/app_image.dart';
import 'package:bond/widgets/main_widget/app_text.dart';
import 'package:flutter/material.dart';

class DoctorDesignItem extends StatelessWidget {
  final int policyId;
  final DoctorsResult doctorsResult;

  const DoctorDesignItem({
    super.key,
    required this.policyId,
    required this.doctorsResult,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BookingDoctorScreen(policyId: policyId),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(bottom: SizeConfig.bodyHeight * .02),
        padding: EdgeInsets.all(SizeConfig.screenWidth * .04),
        decoration: BoxDecoration(
          color: context.colorScheme.surface,
          boxShadow: [
            BoxShadow(
              color: context.colorScheme.shadow.withValues(alpha: 0.1),
              offset: const Offset(0, 2),
              blurRadius: 8,
            )
          ],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(SizeConfig.screenWidth * .03),
              decoration: BoxDecoration(
                color: context.colorScheme.primaryContainer,
                shape: BoxShape.circle,
              ),
              child: AppImage.asset(
                Assets.icons.person,
                width: SizeConfig.screenWidth * .12,
              ),
            ),
            SizedBox(width: SizeConfig.screenWidth * .04),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    text: "${doctorsResult.nomInterv ?? ''} - ${doctorsResult.nomIntervAr ?? ''}",
                    fontWeight: FontWeight.w600,
                    textSize: 15,
                    maxLines: 2,
                  ),
                  SizedBox(height: SizeConfig.bodyHeight * .01),
                  AppText(
                    text: doctorsResult.medecin?.scientificDegreeSec ?? "",
                    textSize: 12,
                    color: context.colorScheme.onSurface.withValues(alpha: 0.6),
                    maxLines: 2,
                  ),
                  SizedBox(height: SizeConfig.bodyHeight * .015),
                  Row(
                    children: [
                      AppImage.asset(Assets.icons.hospital, width: 16),
                      SizedBox(width: SizeConfig.screenWidth * .02),
                      Expanded(
                        child: AppText(
                          text: doctorsResult.designationbranche ??
                              doctorsResult.designationbrancheAr ??
                              "",
                          textSize: 12,
                          maxLines: 1,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: SizeConfig.bodyHeight * .01),
                  Row(
                    children: [
                      AppImage.asset(Assets.icons.location, width: 16),
                      SizedBox(width: SizeConfig.screenWidth * .02),
                      Expanded(
                        child: AppText(
                          text: doctorsResult.branche?.designation ?? "",
                          textSize: 12,
                          maxLines: 1,
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

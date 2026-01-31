import 'package:bond/core/extensions/app_localizations_extension.dart';
import 'package:bond/core/extensions/color_extensions.dart';
import 'package:bond/features/reservation/data/models/response/my_reservation.dart';
import 'package:bond/features/reservation/presentation/reservation_helper.dart';
import 'package:bond/gen/assets.gen.dart';
import 'package:bond/widgets/image_picker/app_image.dart';
import 'package:bond/widgets/main_widget/app_text.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utils/app_size.dart';

class MyReservationItem extends StatelessWidget {
  final MyReservation myReservation;

  const MyReservationItem({super.key, required this.myReservation});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ReservationHelper().showReservationData(
          context: context,
          reservation: myReservation,
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: SizeConfig.bodyHeight * .01),
        decoration: BoxDecoration(
          color: context.colorScheme.secondary,
          boxShadow: [
            BoxShadow(
              color: Color(0xff000000).withValues(alpha: 0.25),
              spreadRadius: -4,
              blurRadius: 8,
              offset: Offset(2, 2),
            ),
          ],
          borderRadius: BorderRadius.circular(12),
        ),
        padding: screenPadding(),
        child: Column(
          children: [
            SizedBox(height: SizeConfig.bodyHeight * .02),
            Row(
              children: [
                Container(
                  decoration:  BoxDecoration(
                    color: context.colorScheme.onPrimary,
                    shape: BoxShape.circle,
                  ),
                  child: AppImage.asset(
                    Assets.images.doctorImage1.path,
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
                        maxLines: 2,
                        text: myReservation.doctorName ?? "",
                        fontWeight: FontWeight.w600,
                        textSize: 12,
                      ),
                      SizedBox(height: SizeConfig.bodyHeight * .01),
                      AppText(
                        text: myReservation.specialityName ?? "",
                        color: context.colorScheme.shadow,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: SizeConfig.bodyHeight * .01),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    vertical: SizeConfig.bodyHeight * .008,
                    horizontal: SizeConfig.screenWidth * .04,
                  ),
                  decoration: BoxDecoration(
                    color: myReservation.state == "upcoming"
                        ? context.colorScheme.tertiary
                        : context.colorScheme.error,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Center(
                    child: AppText(
                      text: myReservation.state ?? "",
                      textSize: 11,
                      color: Colors.white,
                    ),
                  ),
                ),
                const Spacer(),
                Container(
                  width: SizeConfig.screenWidth * .3,
                  padding: EdgeInsets.symmetric(
                    vertical: SizeConfig.bodyHeight * .01,
                  ),
                  decoration: BoxDecoration(
                    color: context.colorScheme.onPrimary,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      AppText(
                        text: context.localizations.showDetails,
                        textSize: 11,
                        fontWeight: FontWeight.w500,
                      ),
                      SizedBox(width: SizeConfig.screenWidth * .02),
                      const Icon(Icons.arrow_forward_ios, size: 14),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: SizeConfig.bodyHeight * .02),
          ],
        ),
      ),
    );
  }
}

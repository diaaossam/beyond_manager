import 'package:bond/core/extensions/color_extensions.dart';
import 'package:bond/core/utils/app_size.dart';
import 'package:bond/features/reservation/data/models/response/my_reservation.dart';
import 'package:bond/gen/assets.gen.dart';
import 'package:bond/widgets/image_picker/app_image.dart';
import 'package:bond/widgets/main_widget/app_text.dart';
import 'package:flutter/material.dart';

class MyReservationItem extends StatelessWidget {
  final MyReservation reservation;

  const MyReservationItem({super.key, required this.reservation});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(SizeConfig.screenWidth * .04),
      decoration: BoxDecoration(
        color: context.colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: context.colorScheme.shadow.withValues(alpha: 0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(SizeConfig.screenWidth * .03),
            decoration: BoxDecoration(
              color: context.colorScheme.primaryContainer,
              shape: BoxShape.circle,
            ),
            child: AppImage.asset(
              Assets.icons.person,
              width: SizeConfig.screenWidth * .10,
            ),
          ),
          SizedBox(width: SizeConfig.screenWidth * .04),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  text: reservation.doctorName ?? 'N/A',
                  fontWeight: FontWeight.w600,
                  textSize: 15,
                ),
                SizedBox(height: SizeConfig.bodyHeight * .01),
                AppText(
                  text: reservation.hospitalName ?? 'N/A',
                  textSize: 12,
                  color: context.colorScheme.onSurface.withValues(alpha: 0.6),
                ),
                SizedBox(height: SizeConfig.bodyHeight * .01),
                AppText(
                  text: reservation.reservationDate ?? 'N/A',
                  textSize: 12,
                  color: context.colorScheme.onSurface.withValues(alpha: 0.6),
                ),
              ],
            ),
          ),
          Icon(
            Icons.arrow_forward_ios,
            size: 16,
            color: context.colorScheme.onSurface.withValues(alpha: 0.4),
          ),
        ],
      ),
    );
  }
}

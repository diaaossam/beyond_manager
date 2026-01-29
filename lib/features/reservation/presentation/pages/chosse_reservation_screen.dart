import 'package:auto_route/annotations.dart';
import 'package:bond/core/extensions/app_localizations_extension.dart';
import 'package:bond/core/extensions/color_extensions.dart';
import 'package:bond/core/utils/app_size.dart';
import 'package:bond/gen/assets.gen.dart';
import 'package:bond/widgets/app_bar/custom_app_bar.dart';
import 'package:bond/widgets/image_picker/app_image.dart';
import 'package:bond/widgets/main_widget/app_text.dart';
import 'package:flutter/material.dart';

import 'new_reservation_screen.dart';

@RoutePage()
class ChooseReservationScreen extends StatelessWidget {
  const ChooseReservationScreen({super.key, required this.policyId});

  final int policyId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Reservation Type"),
      body: Padding(
        padding: EdgeInsets.all(SizeConfig.screenWidth * .04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: SizeConfig.bodyHeight * .02),
            _buildReservationCard(
              context: context,
              title: context.localizations.newReservation,
              icon: Assets.icons.newReservation,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      NewReservationScreen(policyId: policyId),
                ),
              ),
            ),
            SizedBox(height: SizeConfig.bodyHeight * .02),
            _buildReservationCard(
              context: context,
              title: "My Reservations",
              icon: Assets.icons.myReservation,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      NewReservationScreen(policyId: policyId),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildReservationCard({
    required BuildContext context,
    required String title,
    required String icon,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: EdgeInsets.all(SizeConfig.screenWidth * .04),
        decoration: BoxDecoration(
          color: context.colorScheme.surface,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: context.colorScheme.outline.withValues(alpha: 0.2),
          ),
        ),
        child: Row(
          children: [
            AppImage.asset(icon, width: 40, height: 40),
            SizedBox(width: SizeConfig.screenWidth * .04),
            Expanded(
              child: AppText(
                text: title,
                fontWeight: FontWeight.bold,
                textSize: 16,
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 18,
              color: context.colorScheme.onSurface,
            ),
          ],
        ),
      ),
    );
  }
}

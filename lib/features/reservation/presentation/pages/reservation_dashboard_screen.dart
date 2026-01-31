import 'package:auto_route/annotations.dart';
import 'package:bond/core/extensions/app_localizations_extension.dart';
import 'package:bond/core/extensions/color_extensions.dart';
import 'package:bond/core/utils/app_size.dart';
import 'package:bond/widgets/main_widget/app_text.dart';
import 'package:bond/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';

import '../widgets/choose_resevation_type/choose_resevation_grid.dart';

@RoutePage()
class ReservationDashboardScreen extends StatelessWidget {
  const ReservationDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: context.localizations.doctorReservations),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: SizeConfig.bodyHeight * 0.04,
            ),
            const DoctorReservationGridDesign(),
            SizedBox(
              height: SizeConfig.bodyHeight * 0.04,
            ),
            Padding(
              padding:screenPadding(),
              child: AppText(
                text: "",
                maxLines: 40,
                textHeight: 2,
                color: context.colorScheme.shadow,
                align: TextAlign.center,
                fontWeight: FontWeight.w600,
              ),
            )
          ],
        ),
      ),
    );
  }
}

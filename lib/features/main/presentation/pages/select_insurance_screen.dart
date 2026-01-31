import 'package:auto_route/auto_route.dart';
import 'package:bond/core/extensions/color_extensions.dart';
import 'package:bond/gen/assets.gen.dart';
import 'package:bond/widgets/image_picker/app_image.dart';
import 'package:flutter/material.dart';
import '../../../../config/router/app_router.gr.dart';
import '../../../../core/extensions/app_localizations_extension.dart';
import '../../../../core/utils/app_size.dart';
import '../../../../widgets/app_bar/custom_app_bar.dart';
import '../../../../widgets/main_widget/app_text.dart';

@RoutePage()
class SelectInsuranceScreen extends StatelessWidget {
  const SelectInsuranceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: context.localizations.insuranceNetwork),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: SizeConfig.bodyHeight * .02),
            _InsuranceCard(
              title: context.localizations.medicalNetwork,
              buttonText: context.localizations.exploreNow,
              imagePath: Assets.images.medicalInsurance.path,
              onTap: () => context.router.push(const MedicalFilterRoute()),
            ),
            SizedBox(height: SizeConfig.bodyHeight * .02),
            _InsuranceCard(
              title: context.localizations.doctorReservations,
              buttonText: context.localizations.bookNow,
              imagePath: Assets.images.doctor.path,
              onTap: () => context.router.push(ReservationDashboardRoute()),
            ),
            SizedBox(height: SizeConfig.bodyHeight * .02),
            _InsuranceCard(
              title: context.localizations.serviceCenters,
              buttonText: context.localizations.exploreNow,
              imagePath: Assets.images.carService.path,
              onTap: () => context.router.push(const CarServiceRoute()),
            ),
            SizedBox(height: SizeConfig.bodyHeight * .02),
            _InsuranceCard(
              title: context.localizations.uniqueService,
              buttonText: context.localizations.exploreNow,
              imagePath: Assets.images.hands.path,
              onTap: () => context.router.push(const UniqueServiceRoute()),
            ),
            SizedBox(height: SizeConfig.bodyHeight * .02),
          ],
        ),
      ),
    );
  }
}

class _InsuranceCard extends StatelessWidget {
  const _InsuranceCard({
    required this.title,
    required this.buttonText,
    required this.imagePath,
    required this.onTap,
  });

  final String title;
  final String buttonText;
  final String imagePath;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: screenPadding(),
        padding: EdgeInsets.symmetric(
          vertical: SizeConfig.bodyHeight * .02,
        ),
        decoration: BoxDecoration(
          color: context.colorScheme.secondary,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: context.colorScheme.shadow.withValues(alpha: 0.1),
              spreadRadius: 5,
              blurRadius: 2,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  AppText(
                    text: title,
                    fontWeight: FontWeight.w600,
                    textSize: 12,
                  ),
                  SizedBox(height: SizeConfig.bodyHeight * .015),
                  Container(
                    height: SizeConfig.bodyHeight * .05,
                    width: SizeConfig.screenWidth * .35,
                    margin: EdgeInsets.symmetric(
                      horizontal: SizeConfig.screenWidth * .12,
                    ),
                    decoration: BoxDecoration(
                      color: context.colorScheme.primary,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: AppText(
                        text: buttonText,
                        color: context.colorScheme.onSecondary,
                        fontWeight: FontWeight.w600,
                        textSize: 12,
                      ),
                    ),
                  ),
                  SizedBox(height: SizeConfig.bodyHeight * .015),
                ],
              ),
            ),
            AppImage.asset(
              imagePath,
              height: SizeConfig.bodyHeight * .15,
            ),
            SizedBox(width: SizeConfig.screenWidth * .08),
          ],
        ),
      ),
    );
  }
}

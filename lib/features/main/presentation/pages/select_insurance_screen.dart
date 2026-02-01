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
import '../widgets/insurance_card.dart';

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
            InsuranceCard(
              title: context.localizations.medicalNetwork,
              buttonText: context.localizations.exploreNow,
              imagePath: Assets.images.medicalInsurance.path,
              onTap: () => context.router.push(const MedicalFilterRoute()),
            ),
            SizedBox(height: SizeConfig.bodyHeight * .02),
            InsuranceCard(
              title: context.localizations.doctorReservations,
              buttonText: context.localizations.bookNow,
              imagePath: Assets.images.doctor.path,
              onTap: () => context.router.push(ReservationDashboardRoute()),
            ),
            SizedBox(height: SizeConfig.bodyHeight * .02),
            InsuranceCard(
              title: context.localizations.serviceCenters,
              buttonText: context.localizations.exploreNow,
              imagePath: Assets.images.carService.path,
              onTap: () => context.router.push(const CarServiceRoute()),
            ),
            SizedBox(height: SizeConfig.bodyHeight * .02),
            InsuranceCard(
              title: context.localizations.uniqueService,
              buttonText: context.localizations.exploreNow,
              imagePath: Assets.images.hands.path,
              onTap: () => context.router.push(const UniqueServiceRoute()),
            ),
            SizedBox(height: SizeConfig.bodyHeight * .02),
            InsuranceCard(
              title: context.localizations.additionAndDeletions,
              buttonText: context.localizations.exploreNow,
              imagePath: Assets.images.hands.path,
              onTap: () => context.router.push(const AdditionDeletionDashboard()),
            ),
            SizedBox(height: SizeConfig.bodyHeight * .02),
          ],
        ),
      ),
    );
  }
}

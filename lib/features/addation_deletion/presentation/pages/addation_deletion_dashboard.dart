import 'package:auto_route/auto_route.dart';
import 'package:bond/widgets/main_widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../config/router/app_router.gr.dart';
import '../../../../core/extensions/app_localizations_extension.dart';
import '../../../../core/extensions/color_extensions.dart';
import '../../../../core/utils/app_size.dart';
import '../../../../widgets/app_bar/custom_app_bar.dart';
import '../../../../widgets/main_widget/app_text.dart';

@RoutePage()
class AdditionDeletionDashboard extends StatelessWidget {
  const AdditionDeletionDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title:context.localizations.additionAndDeletions),
      body: Padding(
        padding: screenPadding(),
        child: Column(
          children: [
            SizedBox(height: SizeConfig.bodyHeight * .04),
            AppText(
              text: context.localizations.additionAndDeletions,
              fontWeight: FontWeight.w700,
              textSize: 18,
              color: context.colorScheme.onSurface,
            ),
            SizedBox(height: SizeConfig.bodyHeight * .02),
            AppText(
              text: context.localizations.manageMemberAdditionsDeletions,
              fontWeight: FontWeight.w500,
              maxLines: 2,
              align: TextAlign.center,
              color: context.colorScheme.shadow,
              textSize: 12,
            ),
            SizedBox(height: SizeConfig.bodyHeight * .1),
            Row(
              children: [
                buildSelectionCard(
                  context: context,
                  image: Icons.add,
                  title: context.localizations.createNewRequest,
                  body: context.localizations.createNewRequestDesc,
                  buttonText: context.localizations.getStarted,
                  press: () => context.router.push(const SelectPoliciesRoute()),
                ),
                const SizedBox(width: 10),
                buildSelectionCard(
                  context: context,
                  image: Icons.bar_chart,
                  title: context.localizations.viewTrackRequests,
                  body: context.localizations.viewTrackRequestsDesc,
                  buttonText: context.localizations.viewRequests,
                  press: () => context.router.push(const ViewTrackRequestsRoute()),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSelectionCard({
    required BuildContext context,
    required IconData image,
    required String title,
    required String body,
    required String buttonText,
    required VoidCallback press,
  }) {
    return Expanded(
      child: InkWell(
        onTap: press,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: context.colorScheme.outline),
            color: context.colorScheme.surface,
          ),
          child: Column(
            children: [
              Icon(image, size: 50, color: context.colorScheme.primary),
              const SizedBox(height: 20),
              AppText(
                text: title,
                fontWeight: FontWeight.w700,
                textSize: 12,
                color: context.colorScheme.onSurface,
              ),
              SizedBox(height: SizeConfig.bodyHeight * .02),
              AppText(
                text: body,
                fontWeight: FontWeight.w500,
                maxLines: 4,
                align: TextAlign.center,
                color: context.colorScheme.shadow,
                textSize: 10,
              ),
              SizedBox(height: SizeConfig.bodyHeight * .02),
              AbsorbPointer(
                  absorbing: true,
                  child: CustomButton(text: buttonText, press: (){},height: 30.h,)),
            ],
          ),
        ),
      ),
    );
  }
}

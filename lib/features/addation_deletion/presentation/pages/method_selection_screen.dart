import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../config/router/app_router.gr.dart';
import '../../../../core/extensions/app_localizations_extension.dart';
import '../../../../core/extensions/color_extensions.dart';
import '../../../../core/utils/app_size.dart';
import '../../../../widgets/app_bar/custom_app_bar.dart';
import '../../../../widgets/main_widget/app_text.dart';
import '../../../../widgets/main_widget/custom_button.dart';
import '../../../policies/data/models/response/main_policy_model.dart';
import '../widgets/step_indicator.dart';

@RoutePage()
class MethodSelectionScreen extends StatelessWidget {
  final List<MainPolicyModel> selectedPolicies;

  const MethodSelectionScreen({super.key, required this.selectedPolicies});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: context.localizations.selectMethod),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: screenPadding(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const StepIndicator(currentStep: 2),
                SizedBox(height: SizeConfig.bodyHeight * .02),
                // Method cards
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildMethodCard(
                      context: context,
                      emoji: "✍️",
                      title: context.localizations.manualEntry,
                      description: context.localizations.manualEntryDesc,
                      features: [
                        context.localizations.guidedStepByStep,
                        context.localizations.instantFieldValidation,
                        context.localizations.perfectFor1To10Members,
                      ],
                      buttonText: context.localizations.proceedWithManualEntry,
                      onTap: () {
                        context.router.push(
                          SelectRequestTypeRoute(selectedPolicies: selectedPolicies),
                        );
                      },
                    ),
                    SizedBox(width: SizeConfig.screenWidth * .03),
                    _buildMethodCard(
                      context: context,
                      emoji: "📥",
                      title: context.localizations.templateUpload,
                      description: context.localizations.templateUploadDesc,
                      features: [
                        context.localizations.efficientBulkProcessing,
                        context.localizations.comprehensiveErrorReporting,
                        context.localizations.perfectFor10PlusMembers,
                      ],
                      buttonText: context.localizations.proceedWithTemplate,
                      onTap: () {
                        context.router.push(const TemplateUploadRoute());
                      },
                    ),
                  ],
                ),
                SizedBox(height: SizeConfig.bodyHeight * .03),
                // Back button
                CustomButton.outline(
                  text: context.localizations.back,
                  press: () => context.router.back(),
                  borderColor: context.colorScheme.outline,
                  textColor: context.colorScheme.onSurface,
                ),
                SizedBox(height: SizeConfig.bodyHeight * .02),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMethodCard({
    required BuildContext context,
    required String emoji,
    required String title,
    required String description,
    required List<String> features,
    required String buttonText,
    required VoidCallback onTap,
  }) {
    return Container(
      padding: EdgeInsets.all(SizeConfig.screenWidth * .02),
      decoration: BoxDecoration(
        color: context.colorScheme.surface,
        border: Border.all(color: context.colorScheme.outline),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        children: [
          // Emoji icon
          Text(emoji, style: const TextStyle(fontSize: 50)),
          SizedBox(height: SizeConfig.bodyHeight * .02),
          // Title
          AppText(
            text: title,
            fontWeight: FontWeight.w700,
            textSize: 14,
            color: context.colorScheme.onSurface,
            align: TextAlign.center,
          ),
          SizedBox(height: SizeConfig.bodyHeight * .015),
          // Description
          AppText(
            text: description,
            fontWeight: FontWeight.w400,
            textSize: 11,
            color: context.colorScheme.shadow,
            align: TextAlign.center,
            maxLines: 5,
          ),
          SizedBox(height: SizeConfig.bodyHeight * .025),
          ...features.map(
            (feature) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 4),
                    child: Icon(
                      Icons.check,
                      color: context.colorScheme.tertiary,
                      size: 16,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: AppText(
                      text: feature,
                      fontWeight: FontWeight.w500,
                      textSize: 11,
                      color: context.colorScheme.onSurface,
                      maxLines: 2,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: SizeConfig.bodyHeight * .025),
          // Button
          CustomButton(text: buttonText, press: onTap, textSize: 13),
        ],
      ),
    );
  }
}

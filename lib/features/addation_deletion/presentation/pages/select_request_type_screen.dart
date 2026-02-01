import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../config/router/app_router.gr.dart';
import '../../../../core/extensions/app_localizations_extension.dart';
import '../../../../core/extensions/color_extensions.dart';
import '../../../../core/utils/app_size.dart';
import '../../../../widgets/app_bar/custom_app_bar.dart';
import '../../../../widgets/main_widget/app_text.dart';
import '../../../../widgets/main_widget/custom_button.dart';

@RoutePage()
class SelectRequestTypeScreen extends StatefulWidget {
  final List<String> selectedPolicyIds;

  const SelectRequestTypeScreen({
    super.key,
    required this.selectedPolicyIds,
  });

  @override
  State<SelectRequestTypeScreen> createState() =>
      _SelectRequestTypeScreenState();
}

class _SelectRequestTypeScreenState extends State<SelectRequestTypeScreen> {
  String? selectedType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: context.localizations.selectRequestType),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: screenPadding(),
                  child: Column(
                    children: [
                      SizedBox(height: SizeConfig.bodyHeight * .04),
                      // Title
                      AppText(
                        text: context.localizations.selectRequestType,
                        fontWeight: FontWeight.w700,
                        textSize: 24,
                        color: context.colorScheme.onSurface,
                        align: TextAlign.center,
                      ),
                      SizedBox(height: SizeConfig.bodyHeight * .015),
                      AppText(
                        text: context.localizations.chooseTypeOfAction,
                        fontWeight: FontWeight.w400,
                        textSize: 14,
                        color: context.colorScheme.shadow,
                        align: TextAlign.center,
                        maxLines: 2,
                      ),
                      SizedBox(height: SizeConfig.bodyHeight * .05),
                      // Request Type Cards
                      Row(
                        children: [
                          Expanded(
                            child: _buildRequestTypeCard(
                              icon: Icons.add,
                              title: context.localizations.additionOnly,
                              description: context.localizations.additionOnlyDesc,
                              buttonText: context.localizations.selectAddition,
                              requestType: "addition",
                            ),
                          ),
                          SizedBox(width: SizeConfig.screenWidth * .03),
                          Expanded(
                            child: _buildRequestTypeCard(
                              icon: Icons.remove,
                              title: context.localizations.deletionOnly,
                              description: context.localizations.deletionOnlyDesc,
                              buttonText: context.localizations.selectDeletion,
                              requestType: "deletion",
                            ),
                          ),
                          SizedBox(width: SizeConfig.screenWidth * .03),
                          Expanded(
                            child: _buildRequestTypeCard(
                              icon: Icons.sync,
                              title: context.localizations.both,
                              description: context.localizations.bothDesc,
                              buttonText: context.localizations.selectBoth,
                              requestType: "both",
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: SizeConfig.bodyHeight * .03),
                    ],
                  ),
                ),
              ),
            ),
            // Bottom navigation
            if (selectedType != null)
              Container(
                padding: EdgeInsets.all(SizeConfig.screenWidth * .04),
                decoration: BoxDecoration(
                  color: context.colorScheme.surface,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                      offset: const Offset(0, -2),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: CustomButton.outline(
                        text: context.localizations.back,
                        press: () {
                          context.router.back();
                        },
                        borderColor: context.colorScheme.outline,
                        textColor: context.colorScheme.onSurface,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      flex: 2,
                      child: CustomButton(
                        text: context.localizations.continueButton,
                        press: () {
                          if (selectedType == "deletion") {
                            context.router.push(SelectMembersToDeleteRoute(
                              selectedPolicyIds: widget.selectedPolicyIds,
                            ));
                          } else {
                            context.router.push(ManualEntryRoute(
                              requestType: selectedType!,
                              selectedPolicyIds: widget.selectedPolicyIds,
                            ));
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildRequestTypeCard({
    required IconData icon,
    required String title,
    required String description,
    required String buttonText,
    required String requestType,
  }) {
    bool isSelected = selectedType == requestType;

    return InkWell(
      onTap: () {
        setState(() {
          selectedType = requestType;
        });
      },
      child: Container(
        padding: EdgeInsets.all(SizeConfig.screenWidth * .04),
        decoration: BoxDecoration(
          color: isSelected
              ? context.colorScheme.primary.withOpacity(0.05)
              : context.colorScheme.surface,
          border: Border.all(
            color: isSelected
                ? context.colorScheme.primary
                : context.colorScheme.outline,
            width: isSelected ? 2 : 1,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: isSelected
                    ? context.colorScheme.primary.withOpacity(0.1)
                    : context.colorScheme.surface,
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                size: 40,
                color: isSelected
                    ? context.colorScheme.primary
                    : context.colorScheme.shadow,
              ),
            ),
            SizedBox(height: SizeConfig.bodyHeight * .02),
            AppText(
              text: title,
              fontWeight: FontWeight.w700,
              textSize: 18,
              color: context.colorScheme.onSurface,
              align: TextAlign.center,
            ),
            SizedBox(height: SizeConfig.bodyHeight * .015),
            AppText(
              text: description,
              fontWeight: FontWeight.w400,
              textSize: 12,
              color: context.colorScheme.shadow,
              align: TextAlign.center,
              maxLines: 5,
            ),
            SizedBox(height: SizeConfig.bodyHeight * .025),
            Container(
              width: double.infinity,
              padding:
                  EdgeInsets.symmetric(vertical: SizeConfig.bodyHeight * .015),
              decoration: BoxDecoration(
                color: isSelected
                    ? context.colorScheme.primary
                    : context.colorScheme.shadow,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: AppText(
                  text: buttonText,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  textSize: 13,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

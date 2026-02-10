import 'package:auto_route/auto_route.dart';
import 'package:bond/features/addation_deletion/presentation/widgets/select_request_type/request_type_card.dart';
import 'package:flutter/material.dart';

import '../../../../../config/router/app_router.gr.dart';
import '../../../../../core/extensions/app_localizations_extension.dart';
import '../../../../../core/extensions/color_extensions.dart';
import '../../../../../core/utils/app_size.dart';
import '../../../../../widgets/main_widget/app_text.dart';
import '../../../../../widgets/main_widget/custom_button.dart';
import '../../../data/models/response/policies_data_addation.dart';
import '../../addation_helper.dart';

class SelectRequestTypeBody extends StatefulWidget {
  final List<PoliciesDataModel> selectedPolicies;

  const SelectRequestTypeBody({super.key, required this.selectedPolicies});

  @override
  State<SelectRequestTypeBody> createState() => _SelectRequestTypeBodyState();
}

class _SelectRequestTypeBodyState extends State<SelectRequestTypeBody> {
  String? selectedType;
  final String addition = "addition";
  final String deletion = "deletion";
  final String both = "both";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: screenPadding(),
              child: Column(
                children: [
                  SizedBox(height: SizeConfig.bodyHeight * .015),
                  AppText.body(
                    text: context.localizations.chooseTypeOfAction,
                    fontWeight: FontWeight.w400,
                    color: context.colorScheme.shadow,
                    align: TextAlign.center,
                    maxLines: 2,
                  ),
                  SizedBox(height: SizeConfig.bodyHeight * .02),
                  RequestTypeCard(
                    icon: Icons.add,
                    title: context.localizations.additionOnly,
                    description: context.localizations.additionOnlyDesc,
                    buttonText: context.localizations.selectAddition,
                    requestType: addition,
                    onSelect: () => setState(() => selectedType = addition),
                    isSelected: selectedType == addition,
                  ),
                  SizedBox(height: SizeConfig.screenWidth * .03),
                  RequestTypeCard(
                    icon: Icons.remove,
                    title: context.localizations.deletionOnly,
                    description: context.localizations.deletionOnlyDesc,
                    buttonText: context.localizations.selectDeletion,
                    requestType: deletion,
                    onSelect: () => setState(() => selectedType = deletion),
                    isSelected: selectedType == deletion,
                  ),
                  SizedBox(height: SizeConfig.screenWidth * .03),
                  RequestTypeCard(
                    icon: Icons.sync,
                    title: context.localizations.both,
                    description: context.localizations.bothDesc,
                    buttonText: context.localizations.selectBoth,
                    requestType: both,
                    onSelect: () => setState(() => selectedType = both),
                    isSelected: selectedType == both,
                  ),
                  SizedBox(height: SizeConfig.bodyHeight * .03),
                ],
              ),
            ),
          ),
        ),
        if (selectedType != null)
          Container(
            padding: EdgeInsets.all(SizeConfig.screenWidth * .04),
            decoration: BoxDecoration(
              color: context.colorScheme.surface,
              boxShadow: [
                BoxShadow(
                  color: context.colorScheme.onSurface.withValues(alpha: 0.05),
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
                    press: () => context.router.back(),
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
                      if (selectedType == deletion) {
                        context.router.push(
                          SelectMembersToDeleteRoute(
                            selectedPolicies: widget.selectedPolicies,
                          ),
                        );
                      } else {
                        List<num> policyIds = widget.selectedPolicies
                            .map((policy) => policy.policyId!)
                            .toList();

                        final PoliciesDataModel policiesPermission =
                            AddationHelper.getPoliciesDataPermission(
                              list: widget.selectedPolicies,
                            );

                        context.router.push(
                          ManualEntryRoute(
                            requestType: selectedType!,
                            selectedPolicies: widget.selectedPolicies,
                            policyIds: policyIds,
                            policiesPermission: policiesPermission,
                          ),
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}

import 'package:auto_route/auto_route.dart';
import 'package:bond/features/addation_deletion/data/models/response/policies_data_addation.dart';
import 'package:bond/features/addation_deletion/presentation/cubit/policies_data/policies_data_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../config/router/app_router.gr.dart';
import '../../../../../core/bloc/helper/base_state.dart';
import '../../../../../core/extensions/app_localizations_extension.dart';
import '../../../../../core/extensions/color_extensions.dart';
import '../../../../../core/utils/app_size.dart';
import '../../../../../widgets/main_widget/app_text.dart';
import '../../../../../widgets/main_widget/custom_button.dart';
import '../../../../policies/presentation/widget/select_policy/policies_grid_design.dart';
import '../step_indicator.dart';

class SelectPolicyBody extends StatefulWidget {
  const SelectPolicyBody({super.key});

  @override
  State<SelectPolicyBody> createState() => _SelectPolicyBodyState();
}

class _SelectPolicyBodyState extends State<SelectPolicyBody> {
  List<PoliciesDataModel> selectedPolicies = [];
  List<num> selectedPolicyIds = [];

  void _onSelectionChanged(List<PoliciesDataModel> policies) {
    setState(() {
      selectedPolicies = policies;
      selectedPolicyIds = policies.map((p) => p.policyId ?? 0).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: screenPadding(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: SizeConfig.bodyHeight * .03),
                  const StepIndicator(currentStep: 2),
                  SizedBox(height: SizeConfig.bodyHeight * .03),
                  AppText(
                    text: context.localizations.selectInsurancePolicies,
                    fontWeight: FontWeight.w700,
                    textSize: 16,
                    color: context.colorScheme.onSurface,
                  ),
                  SizedBox(height: SizeConfig.bodyHeight * .015),
                  AppText(
                    text: context.localizations.chooseWhichInsurancePolicies,
                    fontWeight: FontWeight.w400,
                    textSize: 12,
                    color: context.colorScheme.shadow,
                    maxLines: 2,
                  ),
                  SizedBox(height: SizeConfig.bodyHeight * .03),
                  Container(
                    padding: EdgeInsets.all(SizeConfig.screenWidth * .04),
                    decoration: BoxDecoration(
                      color: context.colorScheme.scrim.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: context.colorScheme.scrim.withValues(alpha: 0.3),
                        width: 1,
                      ),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.check_circle,
                          color: Color(0xFF4A90E2),
                          size: 20,
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: AppText(
                            text:
                                "${context.localizations.noteLabel} ${context.localizations.noteSameMembersProcessed}",
                            fontWeight: FontWeight.w500,
                            textSize: 12,
                            color: const Color(0xFF2C3E50),
                            maxLines: 3,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: SizeConfig.bodyHeight * .03),
                  // Section header
                  Row(
                    children: [
                      Icon(
                        Icons.folder_outlined,
                        color: context.colorScheme.shadow,
                        size: 20,
                      ),
                      const SizedBox(width: 8),
                      AppText(
                        text: context.localizations.activePolicies,
                        fontWeight: FontWeight.w700,
                        textSize: 14,
                        color: context.colorScheme.onSurface,
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  AppText(
                    text: context.localizations.selectOneOrMorePolicies,
                    fontWeight: FontWeight.w400,
                    textSize: 11,
                    color: context.colorScheme.shadow,
                  ),
                  SizedBox(height: SizeConfig.bodyHeight * .01),
                  BlocBuilder<PoliciesDataCubit, BaseState<PoliciesDataAddation>>(
                    builder: (context, state) {
                      final bloc = context.read<PoliciesDataCubit>();
                      return SizedBox(
                        height: SizeConfig.bodyHeight * .6,
                        child: CustomScrollView(
                          physics: const AlwaysScrollableScrollPhysics(),
                          slivers: [
                            PolicyGridDesign(
                              pagingController: bloc.pagingController,
                              onItemTap: (PoliciesDataModel p1) {},
                              enableMultiSelect: true,
                              selectedPolicyIds: selectedPolicyIds,
                              onSelectionChanged: _onSelectionChanged,
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
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
          child: Column(
            children: [
              if (selectedPolicies.isNotEmpty) ...[
                SizedBox(height: SizeConfig.bodyHeight * .02),
                Container(
                  padding: EdgeInsets.all(SizeConfig.screenWidth * .04),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE8F4FD),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color:context.colorScheme.scrim.withOpacity(0.3),
                      width: 1,
                    ),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.check_circle,
                        color: Color(0xFF4A90E2),
                        size: 20,
                      ),
                      const SizedBox(width: 8),
                      AppText(
                        text: "${context.localizations.selected}",
                        fontWeight: FontWeight.w600,
                        textSize: 13,
                        color: const Color(0xFF2C3E50),
                      ),
                      AppText(
                        text: "(${selectedPolicies.length})",
                        fontWeight: FontWeight.w600,
                        textSize: 13,
                        color:context.colorScheme.scrim,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: AppText(
                          text: selectedPolicies
                              .map((p) => p.policyNumber ?? "")
                              .join(", "),
                          fontWeight: FontWeight.w500,
                          textSize: 12,
                          color: const Color(0xFF2C3E50),
                          maxLines: 2,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
              SizedBox(height: SizeConfig.bodyHeight * .02),
              Row(
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
                      text: context.localizations.continueToMethodSelection,
                      isActive: selectedPolicyIds.isNotEmpty,
                      press: () {
                        if (selectedPolicyIds.isNotEmpty) {
                          context.router.push(MethodSelectionRoute(selectedPolicies: selectedPolicies));
                        }
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

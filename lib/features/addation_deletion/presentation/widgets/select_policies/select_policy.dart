import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/bloc/helper/base_state.dart';
import '../../../../../core/enum/policy_status.dart';
import '../../../../../core/extensions/app_localizations_extension.dart';
import '../../../../../core/extensions/color_extensions.dart';
import '../../../../../core/utils/app_size.dart';
import '../../../../../widgets/main_widget/app_text.dart';
import '../../../../policies/data/models/response/main_policy_model.dart';
import '../../../../policies/presentation/widget/select_policy/policies_grid_design.dart';
import '../../../../sick_leave/presentation/cubit/sick_leave_active_list/sl_active_list_cubit.dart';
import '../step_indicator.dart';

class SelectPolicyBody extends StatelessWidget {
  const SelectPolicyBody({super.key});

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
                    textSize: 20,
                    color: context.colorScheme.onSurface,
                  ),
                  SizedBox(height: SizeConfig.bodyHeight * .015),
                  AppText(
                    text: context.localizations.chooseWhichInsurancePolicies,
                    fontWeight: FontWeight.w400,
                    textSize: 13,
                    color: context.colorScheme.shadow,
                    maxLines: 2,
                  ),
                  SizedBox(height: SizeConfig.bodyHeight * .03),
                  Container(
                    padding: EdgeInsets.all(SizeConfig.screenWidth * .04),
                    decoration: BoxDecoration(
                      color: const Color(0xFFE8F4FD),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: const Color(0xFF4A90E2).withOpacity(0.3),
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
                        textSize: 16,
                        color: context.colorScheme.onSurface,
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  AppText(
                    text: context.localizations.selectOneOrMorePolicies,
                    fontWeight: FontWeight.w400,
                    textSize: 12,
                    color: context.colorScheme.shadow,
                  ),
                  SizedBox(height: SizeConfig.bodyHeight * .02),
                  BlocBuilder<SlActiveListCubit, BaseState<PolicyStatus>>(
                    builder: (context, state) {
                      final bloc = context.read<SlActiveListCubit>();
                      return CustomScrollView(
                        slivers: [
                          PolicyGridDesign(pagingController: bloc.activePagingController,
                            onItemTap: (MainPolicyModel p1) {  },),
                        ],
                      );
                    },
                  )

                /*  ...policies.map((policy) => _buildPolicyCard(policy)),
                  SizedBox(height: SizeConfig.bodyHeight * .02),
                  // Selected count
                  if (selectedPolicyIds.isNotEmpty)
                    Container(
                      padding: EdgeInsets.all(SizeConfig.screenWidth * .04),
                      decoration: BoxDecoration(
                        color: const Color(0xFFE8F4FD),
                        borderRadius: BorderRadius.circular(8),
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
                            text: "${context.localizations.selected}  ",
                            fontWeight: FontWeight.w600,
                            textSize: 13,
                            color: const Color(0xFF2C3E50),
                          ),
                          AppText(
                            text: "(${selectedPolicyIds.length})",
                            fontWeight: FontWeight.w600,
                            textSize: 13,
                            color: const Color(0xFF2C3E50),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: AppText(
                              text: selectedPolicies
                                  .map((p) => p.name)
                                  .join(", "),
                              fontWeight: FontWeight.w500,
                              textSize: 13,
                              color: const Color(0xFF2C3E50),
                              maxLines: 2,
                            ),
                          ),
                        ],
                      ),
                    ),
                  SizedBox(height: SizeConfig.bodyHeight * .02),*/
                ],
              ),
            ),
          ),
        ),
        /*Container(
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
                  text: context.localizations.continueToMethodSelection,
                  isActive: selectedPolicyIds.isNotEmpty,
                  press: () {
                    if (selectedPolicyIds.isNotEmpty) {
                      context.router.push(const MethodSelectionRoute());
                    }
                  },
                ),
              ),
            ],
          ),
        ),*/
      ],
    );
  }
}

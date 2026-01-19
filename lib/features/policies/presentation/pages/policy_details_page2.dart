import 'package:beymanger/config/dependencies/core_di.dart';
import 'package:beymanger/config/helper/locale_helper/app_localizations_extension.dart';
import 'package:beymanger/core/utils/app_assets.dart';
import 'package:beymanger/core/utils/app_constant.dart';
import 'package:beymanger/features/policies/data/models/main_policy_model.dart';
import 'package:beymanger/features/policies/data/models/policy_access_model.dart';
import 'package:beymanger/features/policies/presentation/cubit/policy_access/policy_access_cubit.dart';
import 'package:beymanger/features/policies/presentation/pages/utilization_screen.dart';
import 'package:beymanger/features/policies/presentation/widgets/policy_details_page_2/policy_details_item_design.dart';
import 'package:beymanger/features/reimbursement/presentation/pages/reimbursement_screen.dart';
import 'package:beymanger/widgets/app_text.dart';
import 'package:beymanger/widgets/custom_app_bar.dart';
import 'package:beymanger/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'active_list_screen.dart';
import 'policy_info_screen.dart';
import 'policy_payment_screen.dart';

class PolicyDetailsPage2 extends StatelessWidget {
  final MainPolicyModel model;

  const PolicyDetailsPage2({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<PolicyAccessCubit>()
        ..getPolicyAccess(policyId: model.policyId!.toInt()),
      child: BlocBuilder<PolicyAccessCubit, PolicyAccessState>(
        builder: (context, state) {
          if (state is GetPolicyAccessSuccess) {
            final PolicyAccessModel model = state.model;
            return Scaffold(
                appBar: CustomAppBar(text: context.localizations.policyDetails),
                body: Column(
                  children: [
                    if (model.accessActiveList == true)
                      PolicyDetailsItemDesign(
                          icon: AppAssets.checkmark,
                          title: context.localizations.activeList,
                          press: () async => AppConstant.navigateTo(
                              context: context,
                              widget: ActiveListScreen(
                                policyId: model.policyId!.toInt(),
                              ))),
                    if (model.accessPolicyDetails == true)
                      PolicyDetailsItemDesign(
                          icon: AppAssets.info,
                          title: context.localizations.policyInformation,
                          press: () {
                            AppConstant.navigateTo(
                                context: context,
                                widget: PolicyInfoScreen(
                                  policyId: model.policyId!.toInt(),
                                ));
                          }),
                    if (model.accessUtilization == true)
                      PolicyDetailsItemDesign(
                          icon: AppAssets.utilization,
                          title: context.localizations.utilization,
                          press: () {
                            AppConstant.navigateTo(
                                context: context,
                                widget: UtilizationScreen(
                                    policyId: model.policyId!.toInt()));
                          }),
                    if (model.accessPayments == true)
                      PolicyDetailsItemDesign(
                          icon: AppAssets.policyPayment,
                          title: context.localizations.policyPayment,
                          press: () {
                            AppConstant.navigateTo(
                                context: context,
                                widget: PaymentDetailsScreen(
                                  policyId: model.policyId!.toInt(),
                                ));
                          }),
                    PolicyDetailsItemDesign(
                        icon: AppAssets.policies,
                        title: context.localizations.reimbursementRequests,
                        press: () => AppConstant.navigateTo(
                              context: context,
                              widget: ReimbursementScreen(
                                policyId: model.policyId!.toInt(),
                              ))),
                  ],
                ));
          } else if (state is GetPolicyAccessFailure) {
            return Scaffold(
              body: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(AppAssets.logo),
                    AppText(text: state.errorMsg)
                  ],
                ),
              ),
            );
          } else {
            return const Scaffold(
              body: LoadingWidget(),
            );
          }
        },
      ),
    );
  }
}

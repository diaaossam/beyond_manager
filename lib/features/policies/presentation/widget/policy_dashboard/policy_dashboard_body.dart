import 'package:auto_route/auto_route.dart';
import 'package:bond/config/router/app_router.gr.dart';
import 'package:bond/features/policies/presentation/widget/policy_dashboard/policy_dashboard_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/bloc/helper/base_state.dart';
import '../../../../../core/extensions/app_localizations_extension.dart';
import '../../../../../gen/assets.gen.dart';
import '../../../../../widgets/app_bar/custom_app_bar.dart';
import '../../../../../widgets/loading/loading_widget.dart';
import '../../../data/models/response/policy_access_model.dart';
import '../../cubit/policy_access/policy_access_cubit.dart';

class PolicyDashboardBody extends StatelessWidget {
  final int policyId;

  const PolicyDashboardBody({super.key, required this.policyId});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PolicyAccessCubit, BaseState<PolicyAccessModel>>(
      builder: (context, state) {
        if (state.isLoading) {
          return LoadingWidget();
        } else {
          final model = state.data!;
          return Scaffold(
            appBar: CustomAppBar(title: context.localizations.policyDetails),
            body: Column(
              children: [
                if (model.accessActiveList == true)
                  PolicyDashboardItem(
                    icon: Assets.icons.checkmark,
                    title: context.localizations.activeList,
                    press: () async => context.router.push(
                      ActiveListRoute(policyId: policyId),
                    ),
                  ),
                if (model.accessPolicyDetails == true)
                  PolicyDashboardItem(
                    icon: Assets.icons.info,
                    title: context.localizations.policyInformation,
                    press: () => context.router.push(
                      PolicyInfoRoute(policyId: policyId),
                    ),
                  ),
                if (model.accessUtilization == true)
                  PolicyDashboardItem(
                    icon: Assets.icons.utilization,
                    title: context.localizations.utilization,
                    press: () {
                      /*   AppConstant.navigateTo(
                          context: context,
                          widget: UtilizationScreen(
                            policyId: model.policyId!.toInt(),
                          ),
                        );*/
                    },
                  ),
                if (model.accessPayments == true)
                  PolicyDashboardItem(
                    icon: Assets.icons.policyPayment,
                    title: context.localizations.policyPayment,
                    press: () {
                      context.router.push(
                        PolicyPaymentRoute(policyId: policyId),
                      );
                    },
                  ),
                PolicyDashboardItem(
                  icon: Assets.icons.policies,
                  title: context.localizations.reimbursementRequests,
                  press: () {
                    /* AppConstant.navigateTo(
                      context: context,
                      widget: ReimbursementScreen(
                        policyId: model.policyId!.toInt(),
                      ),
                    );*/
                  },
                ),
              ],
            ),
          );
        }
      },
    );
  }
}

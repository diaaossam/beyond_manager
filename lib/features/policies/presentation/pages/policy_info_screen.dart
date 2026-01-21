import 'package:auto_route/annotations.dart';
import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:bond/widgets/loading/loading_widget.dart';
import 'package:bond/widgets/no_item_design.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../config/dependencies/injectable_dependencies.dart';
import '../../../../core/extensions/app_localizations_extension.dart';
import '../../../../widgets/app_bar/custom_app_bar.dart';
import '../../data/models/get_active_list_params.dart';
import '../../data/models/policy_details.dart';
import '../cubit/policy_details/policy_details_bloc.dart';
import '../widget/policy_info/policy_info_body.dart';

@RoutePage()
class PolicyInfoScreen extends StatelessWidget {
  final int policyId;

  const PolicyInfoScreen({super.key, required this.policyId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          sl<PolicyDetailsCubit>()..getPolicyDetails(policyId: policyId),
      child: Scaffold(
        appBar: CustomAppBar(title: context.localizations.policyInformation),
        body: BlocBuilder<PolicyDetailsCubit, BaseState<PolicyDetails>>(
          builder: (context, state) {
            if (state.isLoading) {
              return const LoadingWidget();
            }

            final policyDetails = state.data;
            if (policyDetails == null) {
              return EmptyWidgetDesign(
                title: context.localizations.noPolicyDetailsFound,
              );
            }

            return PolicyInfoBody(policyDetails: policyDetails);
          },
        ),
      ),
    );
  }
}

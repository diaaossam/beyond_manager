import 'package:beymanger/config/dependencies/core_di.dart';
import 'package:beymanger/config/helper/locale_helper/app_localizations_extension.dart';
import 'package:beymanger/features/policies/domain/entities/get_active_list_params.dart';
import 'package:beymanger/features/policies/presentation/cubit/utilization/utilization_bloc.dart';
import 'package:beymanger/features/policies/presentation/widgets/utilization/utilization_body.dart';
import 'package:beymanger/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UtilizationScreen extends StatelessWidget {
  final int policyId;

  const UtilizationScreen({super.key, required this.policyId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          sl<UtilizationBloc>()..add(GetUtilizationDataEvent(id: policyId)),
      child: BlocBuilder<UtilizationBloc, UtilizationState>(
        builder: (context, state) {
          return Scaffold(
            appBar: CustomAppBar(
              text: context.localizations.utilization,
              isHaveActions: false,
              onActionPress: () async {
                final list = await context
                    .read<UtilizationBloc>()
                    .getActiveList(
                        getActiveListParams:
                            GetActiveListParams(policyId: policyId));
              },
            ),
            body: UtilitzationBody(
              policyId: policyId,
            ),
          );
        },
      ),
    );
  }
}

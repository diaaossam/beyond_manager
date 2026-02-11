import 'package:auto_route/auto_route.dart';
import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:bond/features/policies/data/models/response/utilization_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../config/dependencies/injectable_dependencies.dart';
import '../../../../config/router/app_router.gr.dart';
import '../../../../core/extensions/app_localizations_extension.dart';
import '../../../../widgets/app_bar/custom_app_bar.dart';
import '../cubit/utilization/utilization_bloc.dart';
import '../widget/utilization/utilization_body.dart';

@RoutePage()
class UtilizationScreen extends StatelessWidget {
  final int policyId;

  const UtilizationScreen({super.key, required this.policyId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<UtilizationCubit>(),
      child: BlocBuilder<UtilizationCubit, BaseState<UtilizationModel>>(
        builder: (context, state) {
          return Scaffold(
            appBar: CustomAppBar(
              title: context.localizations.utilization,
              actions: [
                IconButton(
                  onPressed: () => context.router.push(
                    UtilizationNotificationsRoute(policyId: policyId),
                  ),
                  icon: const Icon(Icons.notification_add),
                )
              ],
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

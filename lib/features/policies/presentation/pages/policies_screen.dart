import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../config/dependencies/injectable_dependencies.dart';
import '../../../../core/extensions/app_localizations_extension.dart';
import '../../../../widgets/app_bar/custom_app_bar.dart';
import '../cubit/policies_cubit.dart';
import '../widget/select_policy/policies_body.dart';

@RoutePage()
class PoliciesScreen extends StatelessWidget {
  const PoliciesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<PoliciesCubit>(),
      child: Scaffold(
        appBar: CustomAppBar(
          pressIcon: () => context.tabsRouter.setActiveIndex(0),
          title: context.localizations.selectPolicy,
        ),
        body: const PoliciesBody(),
      ),
    );
  }
}

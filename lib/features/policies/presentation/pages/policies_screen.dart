import 'package:beymanger/config/dependencies/core_di.dart';
import 'package:beymanger/config/helper/locale_helper/app_localizations_extension.dart';
import 'package:beymanger/features/main/presentation/cubit/main_cubit.dart';
import 'package:beymanger/features/policies/presentation/cubit/policies_cubit.dart';
import 'package:beymanger/features/policies/presentation/widgets/select_policy_page1/custom_select_policy_list_view.dart';
import 'package:beymanger/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PoliciesScreen extends StatelessWidget {
  const PoliciesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<PoliciesCubit>(),
      child: BlocBuilder<PoliciesCubit, PoliciesState>(
        builder: (context, state) {
          PoliciesCubit cubit = context.read<PoliciesCubit>();
          return PopScope(
            canPop: false,
            onPopInvoked: (didPop) async =>
                context.read<MainCubit>().changeCurrentIndex(index: 0),
            child: Scaffold(
                appBar: CustomAppBar(
                    press: () =>
                        context.read<MainCubit>().changeCurrentIndex(index: 0),
                    text: context.localizations.selectPolicy),
                body: const CustomSelectPolicyListView()),
          );
        },
      ),
    );
  }
}

import 'package:auto_route/auto_route.dart';
import 'package:bond/config/router/app_router.gr.dart';
import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:bond/features/emergency/data/models/emergency_model.dart';
import 'package:bond/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/dependencies/injectable_dependencies.dart';
import '../../../../core/extensions/app_localizations_extension.dart';
import '../../../../core/utils/app_size.dart';
import '../../../../widgets/main_widget/custom_button.dart';
import '../cubit/emergency_cubit.dart';
import '../widgets/my_emergency/my_emergency_body.dart';

@RoutePage()
class MyEmergencyScreen extends StatelessWidget {
  const MyEmergencyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<EmergencyCubit>(),
      child: Scaffold(
        appBar: CustomAppBar(
          title: context.localizations.emergencySupport1,
          pressIcon: () => context.tabsRouter.setActiveIndex(0),
        ),
        body: const MyEmergencyBody(),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.screenWidth * .1,
          ),
          child: BlocBuilder<EmergencyCubit, BaseState<List<EmergencyModel>>>(
            builder: (context, state) {
              return CustomButton(
                text: context.localizations.addNewRequest,
                press: () {
                  context.router
                      .push(AddEmergenceRoute())
                      .then(
                        (value) => context
                            .read<EmergencyCubit>()
                            .pagingController
                            .refresh(),
                      );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}

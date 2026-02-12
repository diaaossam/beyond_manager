import 'package:auto_route/auto_route.dart';
import 'package:bond/features/hr_access/presentation/widgets/update_existing_manager_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/dependencies/injectable_dependencies.dart';
import '../../../../core/extensions/app_localizations_extension.dart';
import '../../../../widgets/app_bar/custom_app_bar.dart';
import '../cubit/update_hr_access/update_hr_access_cubit.dart';

@RoutePage()
class UpdateExistingManagerScreen extends StatelessWidget {
  const UpdateExistingManagerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<UpdateHrAccessCubit>(),
      child: Scaffold(
        appBar: CustomAppBar(title: context.localizations.updateExistingManager),
        body: const UpdateExistingManagerBody(),
      ),
    );
  }
}

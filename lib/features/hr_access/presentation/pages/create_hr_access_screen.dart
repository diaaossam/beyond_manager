import 'package:auto_route/auto_route.dart';
import 'package:bond/features/hr_access/presentation/widgets/create_hr_access_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/dependencies/injectable_dependencies.dart';
import '../../../../core/extensions/app_localizations_extension.dart';
import '../../../../widgets/app_bar/custom_app_bar.dart';
import '../cubit/create_hr_access/create_hr_access_cubit.dart';

@RoutePage()
class CreateHrAccessScreen extends StatelessWidget {
  const CreateHrAccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<CreateHrAccessCubit>(),
      child: Scaffold(
        appBar: CustomAppBar(title: context.localizations.createHrAccess),
        body: const CreateHrAccessBody(),
      ),
    );
  }
}

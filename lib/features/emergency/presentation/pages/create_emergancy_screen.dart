import 'package:auto_route/auto_route.dart';
import 'package:bond/features/emergency/presentation/cubit/create_emergency_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../config/dependencies/injectable_dependencies.dart';
import '../../../../core/extensions/app_localizations_extension.dart';
import '../../../../widgets/app_bar/custom_app_bar.dart';
import '../widgets/create_emergency/create_emergence_body.dart';

@RoutePage()
class AddEmergenceScreen extends StatelessWidget {
  const AddEmergenceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<CreateEmergencyCubit>(),
      child: Scaffold(
        appBar: CustomAppBar(title: context.localizations.addEmergency),
        body: const CreateEmergenceBody(),
      ),
    );
  }
}

import 'package:auto_route/annotations.dart';
import 'package:bond/config/dependencies/injectable_dependencies.dart';
import 'package:bond/core/extensions/app_localizations_extension.dart';
import 'package:bond/features/sick_leave/presentation/cubit/sick_leave_active_list/sl_active_list_cubit.dart';
import 'package:bond/features/sick_leave/presentation/widgets/active_list/sl_active_list.dart';
import 'package:bond/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class SickLeaveActiveListScreen extends StatelessWidget {
  const SickLeaveActiveListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<SlActiveListCubit>(),
      child: Scaffold(
        appBar: CustomAppBar(title: context.localizations.selectPolicy),
        body: const SlActiveListBody(),
      ),
    );
  }
}

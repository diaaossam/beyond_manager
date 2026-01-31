import 'package:auto_route/annotations.dart';
import 'package:bond/core/extensions/app_localizations_extension.dart';
import 'package:bond/features/reservation/presentation/cubit/doctor_result/doctor_result_cubit.dart';
import 'package:bond/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/dependencies/injectable_dependencies.dart';
import '../../data/models/request/timeslot_params.dart';
import '../../data/models/response/doctors_result.dart';
import '../widgets/doctor_result/doctor_result_body.dart';

@RoutePage()
class DoctorsResultScreen extends StatelessWidget {
  final List<DoctorsResult> allTimeSlot;
  final DoctorBookingParams params;

  const DoctorsResultScreen({
    super.key,
    required this.allTimeSlot,
    required this.params,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<DoctorResultCubit>()..setAllTimeSlot(allTimeSlot),
      child: Scaffold(
        appBar: CustomAppBar(title: context.localizations.availableDoctors),
        body: DoctorResultBody(params: params),
      ),
    );
  }
}

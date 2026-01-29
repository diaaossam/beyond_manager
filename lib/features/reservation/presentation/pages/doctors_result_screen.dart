import 'package:auto_route/annotations.dart';
import 'package:bond/config/dependencies/injectable_dependencies.dart';
import 'package:bond/features/reservation/data/models/response/doctors_result.dart';
import 'package:bond/features/reservation/presentation/cubit/doctor_result/doctor_result_cubit.dart';
import 'package:bond/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/doctor_result/doctor_result_body.dart';

@RoutePage()
class DoctorsResultScreen extends StatelessWidget {
  const DoctorsResultScreen({
    super.key,
    required this.policyId,
    required this.doctorsResult,
  });

  final int policyId;
  final DoctorsResult doctorsResult;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<DoctorResultCubit>()
        ..setDoctorResult(doctorsResult),
      child: Scaffold(
        appBar: CustomAppBar(title: "Booking"),
        body: DoctorResultBody(policyId: policyId),
      ),
    );
  }
}

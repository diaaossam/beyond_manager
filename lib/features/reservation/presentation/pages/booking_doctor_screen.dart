import 'package:auto_route/annotations.dart';
import 'package:bond/config/dependencies/injectable_dependencies.dart';
import 'package:bond/features/reservation/presentation/cubit/booking/booking_cubit.dart';
import 'package:bond/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/booking_doctor/booking_body.dart';

@RoutePage()
class BookingDoctorScreen extends StatelessWidget {
  const BookingDoctorScreen({super.key, required this.policyId});

  final int policyId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<BookingCubit>(),
      child: Scaffold(
        appBar: CustomAppBar(title: "Booking"),
        body: BookingBody(policyId: policyId),
      ),
    );
  }
}

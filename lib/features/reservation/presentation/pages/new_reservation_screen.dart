import 'package:auto_route/annotations.dart';
import 'package:bond/config/dependencies/injectable_dependencies.dart';
import 'package:bond/features/reservation/presentation/cubit/new_reservation/new_reservation_cubit.dart';
import 'package:bond/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/new_reservation/new_reservation_body.dart';

@RoutePage()
class NewReservationScreen extends StatelessWidget {
  const NewReservationScreen({super.key, required this.policyId});

  final int policyId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<NewReservationCubit>(),
      child: Scaffold(
        appBar: CustomAppBar(title: "Booking"),
        body: NewReservationBody(policyId: policyId),
      ),
    );
  }
}

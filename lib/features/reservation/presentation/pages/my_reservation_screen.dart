import 'package:auto_route/annotations.dart';
import 'package:bond/config/dependencies/injectable_dependencies.dart';
import 'package:bond/features/reservation/presentation/cubit/reservation_cubit.dart';
import 'package:bond/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/my_reservation/my_reservation.dart';

@RoutePage()
class MyReservationScreen extends StatelessWidget {
  const MyReservationScreen({super.key, required this.policyId});

  final int policyId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          sl<ReservationCubit>()..getMyReservations(status: 'all'),
      child: Scaffold(
        appBar: CustomAppBar(title: "My Reservations"),
        body: const MyReservationBody(),
      ),
    );
  }
}

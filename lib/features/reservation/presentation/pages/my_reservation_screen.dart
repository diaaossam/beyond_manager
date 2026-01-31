import 'package:bond/core/extensions/app_localizations_extension.dart';
import 'package:bond/features/reservation/presentation/cubit/reservation/reservation_cubit.dart';
import 'package:bond/features/reservation/presentation/widgets/my_reservation/my_reservation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/dependencies/injectable_dependencies.dart';
import '../../../../widgets/app_bar/custom_app_bar.dart';

class MyReservationScreen extends StatelessWidget {
  const MyReservationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          sl<ReservationCubit>()..getMyReservations(status: ""),
      child: Scaffold(
        appBar: CustomAppBar(title: context.localizations.myReservation),
        body: const MyReservationBody(),
      ),
    );
  }
}

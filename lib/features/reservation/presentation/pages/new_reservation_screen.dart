import 'package:auto_route/annotations.dart';
import 'package:bond/config/dependencies/injectable_dependencies.dart';
import 'package:bond/core/extensions/app_localizations_extension.dart';
import 'package:bond/features/reservation/data/models/request/timeslot_params.dart';
import 'package:bond/features/reservation/data/models/response/doctors_result.dart';
import 'package:bond/features/reservation/presentation/cubit/new_reservation/new_reservation_cubit.dart';
import 'package:bond/features/reservation/presentation/widgets/new_reservation/new_reservation_body.dart';
import 'package:bond/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class NewReservationScreen extends StatelessWidget {
  final bool isFilter;
  final DoctorBookingParams? params;
  final List<DoctorsResult>? list;

  const NewReservationScreen({
    super.key,
    this.isFilter = false,
    this.params,
    this.list,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<NewReservationCubit>(),
      child: Scaffold(
        appBar: CustomAppBar(title: context.localizations.newReservation),
        body: NewReservationBody(
          isFilter: isFilter,
          params: params,
          list: list,
        ),
      ),
    );
  }
}

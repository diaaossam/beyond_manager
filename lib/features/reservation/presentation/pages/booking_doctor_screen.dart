import 'package:auto_route/auto_route.dart';
import 'package:bond/core/extensions/app_localizations_extension.dart';
import 'package:bond/features/reservation/data/models/request/post_reservation_param.dart';
import 'package:bond/features/reservation/data/models/response/doctors_result.dart';
import 'package:bond/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/dependencies/injectable_dependencies.dart';
import '../cubit/booking/booking_cubit.dart';
import '../widgets/booking_doctor/booking_body.dart';

@RoutePage()
class BookingDoctorScreen extends StatelessWidget {
  final ReservationParams reservationParams;
  final DoctorsResult doctorsResult;

  const BookingDoctorScreen({
    super.key,
    required this.reservationParams,
    required this.doctorsResult,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<BookingCubit>(),
      child: Scaffold(
        appBar: CustomAppBar(title: context.localizations.patientInformation),
        body: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: BookingBody(
            doctorsResult: doctorsResult,
            reservationParams: reservationParams,
          ),
        ),
      ),
    );
  }
}

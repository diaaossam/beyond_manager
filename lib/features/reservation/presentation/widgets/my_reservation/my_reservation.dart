import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:bond/core/utils/app_size.dart';
import 'package:bond/features/reservation/data/models/response/my_reservation.dart';
import 'package:bond/features/reservation/presentation/cubit/reservation_cubit.dart';
import 'package:bond/features/reservation/presentation/widgets/my_reservation/my_reservation_item.dart';
import 'package:bond/widgets/loading/loading_widget.dart';
import 'package:bond/widgets/main_widget/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyReservationBody extends StatelessWidget {
  const MyReservationBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReservationCubit, BaseState<List<MyReservation>>>(
      builder: (context, state) {
        if (state.isLoading) {
          return const LoadingWidget();
        } else if (state.isSuccess && state.data != null) {
          final reservations = state.data!;
          if (reservations.isEmpty) {
            return Center(
              child: AppText(text: "No Data Found"),
            );
          }
          return ListView.separated(
            padding: EdgeInsets.all(SizeConfig.screenWidth * .04),
            itemCount: reservations.length,
            separatorBuilder: (context, index) =>
                SizedBox(height: SizeConfig.bodyHeight * .02),
            itemBuilder: (context, index) {
              return MyReservationItem(
                reservation: reservations[index],
              );
            },
          );
        } else if (state.isFailure) {
          return Center(
            child: AppText(text: state.error?.toString() ?? "Error occurred"),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}

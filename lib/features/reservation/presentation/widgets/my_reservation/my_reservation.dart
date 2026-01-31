import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:bond/core/extensions/app_localizations_extension.dart';
import 'package:bond/core/utils/app_size.dart';
import 'package:bond/features/reservation/data/models/response/my_reservation.dart';
import 'package:bond/features/reservation/presentation/cubit/reservation/reservation_cubit.dart';
import 'package:bond/widgets/app_failure.dart';
import 'package:bond/widgets/loading/loading_widget.dart';
import 'package:bond/widgets/main_widget/app_text.dart';
import 'package:bond/widgets/no_item_design.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'my_reservation_item.dart';

class MyReservationBody extends StatefulWidget {
  const MyReservationBody({super.key});

  @override
  State<MyReservationBody> createState() => _MyReservationBodyState();
}

class _MyReservationBodyState extends State<MyReservationBody> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReservationCubit, BaseState<List<MyReservation>>>(
      builder: (context, state) {
        final reservations = state.data ?? [];
        if (state.isLoading) {
          return LoadingWidget();
        } else if (state.isFailure) {
          return AppFailureWidget(body: state.error.toString());
        }
        return CustomScrollView(
          slivers: [
            if (reservations.isEmpty)
              SliverToBoxAdapter(
                child: EmptyWidgetDesign(title: context.localizations.thereIsNoReservation,),
              )
            else
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => MyReservationItem(myReservation: reservations[index]),
                childCount: reservations.length,
              ),
            ),
          ],
        );
      },
    );
  }
}

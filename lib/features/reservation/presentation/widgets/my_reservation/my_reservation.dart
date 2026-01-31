import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:bond/core/extensions/app_localizations_extension.dart';
import 'package:bond/core/utils/app_size.dart';
import 'package:bond/features/reservation/data/models/response/my_reservation.dart';
import 'package:bond/features/reservation/presentation/cubit/reservation/reservation_cubit.dart';
import 'package:bond/widgets/main_widget/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'my_reservation_item.dart';

class MyReservationBody extends StatefulWidget {
  const MyReservationBody({super.key});

  @override
  State<MyReservationBody> createState() => _MyReservationBodyState();
}

class _MyReservationBodyState extends State<MyReservationBody> {
  int tag = 0;
  bool isSearch = false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReservationCubit, BaseState<List<MyReservation>>>(
      builder: (context, state) {
        final reservations = state.data ?? [];

        return CustomScrollView(
          slivers: [
            if (state.isLoading)
              const SliverToBoxAdapter(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            if (state.isSuccess)
              if (reservations.isEmpty)
                SliverToBoxAdapter(
                  child: Container(
                    margin: EdgeInsets.only(top: SizeConfig.bodyHeight * .4),
                    child: Center(
                        child: AppText(
                      text: context.localizations.thereIsNoReservation,
                      fontWeight: FontWeight.w600,
                      textSize: 12,
                    )),
                  ),
                )
              else
                SliverList(
                    delegate: SliverChildBuilderDelegate(
                  (context, index) => MyReservationItem(
                    myReservation: reservations[index],
                  ),
                  childCount: reservations.length,
                ))
          ],
        );
      },
    );
  }
}

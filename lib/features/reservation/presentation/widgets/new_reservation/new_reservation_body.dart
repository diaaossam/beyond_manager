import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:bond/core/extensions/app_localizations_extension.dart';
import 'package:bond/core/utils/app_size.dart';
import 'package:bond/features/reservation/presentation/cubit/new_reservation/new_reservation_cubit.dart';
import 'package:bond/widgets/loading/loading_widget.dart';
import 'package:bond/widgets/main_widget/app_text.dart';
import 'package:bond/widgets/main_widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewReservationBody extends StatefulWidget {
  final int policyId;

  const NewReservationBody({super.key, required this.policyId});

  @override
  State<NewReservationBody> createState() => _NewReservationBodyState();
}

class _NewReservationBodyState extends State<NewReservationBody> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewReservationCubit, BaseState<dynamic>>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.all(SizeConfig.screenWidth * .04),
          child: Column(
            children: [
              SizedBox(height: SizeConfig.bodyHeight * .02),
              AppText(
                text: context.localizations.newReservation,
                fontWeight: FontWeight.bold,
                textSize: 18,
              ),
              SizedBox(height: SizeConfig.bodyHeight * .03),
              Expanded(
                child: state.isLoading
                    ? const LoadingWidget()
                    : Center(
                        child: AppText(
                          text: "Select Options",
                        ),
                      ),
              ),
              CustomButton(
                text: context.localizations.search,
                press: () {
                  // Search functionality
                },
              ),
              SizedBox(height: SizeConfig.bodyHeight * .02),
            ],
          ),
        );
      },
    );
  }
}

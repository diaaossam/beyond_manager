
import 'package:bond/core/extensions/app_localizations_extension.dart';
import 'package:bond/core/utils/app_size.dart';
import 'package:bond/features/reservation/data/models/response/doctors_result.dart';
import 'package:bond/features/reservation/data/models/response/my_reservation.dart';
import 'package:bond/features/reservation/presentation/widgets/reservation_confirm_body.dart';
import 'package:bond/widgets/main_widget/custom_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'data/models/request/post_reservation_param.dart';
import 'presentation/widgets/reservation_info_body.dart';

class ReservationHelper {
  Future<void> showReservationConfirmation(
      {required BuildContext context,
      required ReservationParams reservationParams,
      required DoctorsResult doctor,
      required Function(bool) resultCallback}) async {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        contentPadding: const EdgeInsets.all(0),
        insetPadding:
            EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth * 0.04),
        content: ReservationConfirmBody(
          doctorsResult: doctor,
          reservationParams: reservationParams,
          resultCallback: resultCallback,
        ),
      ),
    );
  }

  Future<void> showReservationData(
      {required BuildContext context,
      required MyReservation reservation}) async {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        contentPadding: const EdgeInsets.all(0),
        insetPadding:
            EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth * 0.04),
        content: ReservationInfoBody(
          myReservation: reservation,
        ),
      ),
    );
  }

  Future<String> showCustomDatePicker(BuildContext context) async {
    DateTime selectedDate = DateTime(2007);
    await showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) {
        return Container(
          color: Colors.white,
          height: SizeConfig.bodyHeight * .5,
          child: Column(
            children: [
              Expanded(
                child: CupertinoDatePicker(
                  mode: CupertinoDatePickerMode.date,
                  initialDateTime: DateTime.now(),
                  minimumDate: DateTime(1920),
                  maximumDate: DateTime.now(),
                  onDateTimeChanged: (DateTime dateTime) {
                    selectedDate = dateTime;
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.screenWidth * .15),
                child: CustomButton(
                    text: context.localizations.done,
                    press: () => Navigator.pop(context)),
              ),
              SizedBox(
                height: SizeConfig.bodyHeight * .02,
              ),
            ],
          ),
        );
      },
    );
    String formattedDateTime =
        DateFormat('yyyy-MM-dd', "en").format(selectedDate);
    return formattedDateTime;

  }
}

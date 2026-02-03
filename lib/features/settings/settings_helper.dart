import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../config/helper/context_helper.dart';
import '../../config/router/app_router.gr.dart';
import '../../core/extensions/app_localizations_extension.dart';
import '../../core/extensions/color_extensions.dart';
import '../../core/global_models/date_response.dart';
import '../../core/utils/app_size.dart';
import '../../widgets/main_widget/app_text.dart';
import '../../widgets/main_widget/custom_button.dart';

class SettingsHelper {
  Future<void> showGuestDialog(BuildContext context) async {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: SizedBox(
          height: SizeConfig.bodyHeight * .3,
          child: Center(
            child: Column(
              children: [
                20.verticalSpace,
                AppText(
                  text: context.localizations.login,
                  fontWeight: FontWeight.bold,
                  textSize: 18,
                  color: context.colorScheme.primary,
                ),
                SizedBox(height: SizeConfig.bodyHeight * .04),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.screenWidth * .02,
                  ),
                  child: AppText(
                    align: TextAlign.center,
                    maxLines: 5,
                    text: context.localizations.sessionExpired,
                    color: context.colorScheme.shadow,
                  ),
                ),
                20.verticalSpace,
                Row(
                  children: [
                    Expanded(
                      child: CustomButton(
                        textSize: 10,
                        height: SizeConfig.bodyHeight * .06,
                        text: context.localizations.login,
                        press: () async {
                          context.router.pushAndPopUntil(
                            const LoginRoute(),
                            predicate: (route) => false,
                          );
                        },
                      ),
                    ),
                    5.horizontalSpace,
                    Expanded(
                      child: CustomButton(
                        textSize: 10,
                        backgroundColor: Colors.transparent,
                        height: SizeConfig.bodyHeight * .06,
                        textColor: context.colorScheme.primary,
                        text: context.localizations.back,
                        press: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> showAuthDialog() async {
    final navigatorState = NavigationService.navigatorKey.currentState;
    if (navigatorState == null) return;

    final context = navigatorState.context;
    final router = AutoRouter.of(context);

    return showCupertinoDialog(
      context: context,
      builder: (dialogContext) => CupertinoAlertDialog(
        content: AppText(
          text: dialogContext.localizations.sessionExpired,
          maxLines: 4,
        ),
        actions: <Widget>[
          CupertinoDialogAction(
            isDefaultAction: true,
            isDestructiveAction: true,
            child: AppText(
              text: dialogContext.localizations.logout,
              textSize: 14,
              maxLines: 4,
              textHeight: 1.8,
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
            onPressed: () async {
              Navigator.of(dialogContext).pop();
              router.pushAndPopUntil(
                const LoginRoute(),
                predicate: (route) => false,
              );
            },
          ),
        ],
      ),
    );
  }

  Future<DateResponse?> showCustomDatePicker({
    required BuildContext context,
    DateTime? initialDate,
    required DateTime firstDate,
    required DateTime lastDate,
  }) async {
    if (Platform.isAndroid) {
      final dateTime = await showDatePicker(
        initialEntryMode: DatePickerEntryMode.calendarOnly,
        context: context,
        initialDate: initialDate,
        firstDate: firstDate,
        lastDate: lastDate,
      );
      if (dateTime != null) {
        String formattedDateTime = DateFormat(
          'yyyy-MM-dd',
          "en",
        ).format(dateTime);
        return DateResponse(formattedDate: formattedDateTime, dateTime: dateTime);
      }
    }
    else {
      DateTime selectedDate = initialDate ??DateTime.now();
      await showCupertinoModalPopup(
        context: context,
        builder: (BuildContext context) {
          return Column(
            children: [
              Expanded(
                child: CupertinoDatePicker(
                  mode: CupertinoDatePickerMode.date,
                  initialDateTime: selectedDate,
                  minimumDate: firstDate,
                  maximumDate: lastDate,
                  onDateTimeChanged: (DateTime dateTime) {
                    selectedDate = dateTime;
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.screenWidth * .15,
                ),
                child: CustomButton(
                  text: context.localizations.done,
                  press: () => Navigator.pop(context),
                ),
              ),
              30.verticalSpace,
            ],
          );
        },
      );
      String formattedDateTime = DateFormat(
        'yyyy-MM-dd',
        "en",
      ).format(selectedDate);
      return DateResponse(formattedDate: formattedDateTime, dateTime: selectedDate);
    }
    return null;
  }
}

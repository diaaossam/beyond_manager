import 'package:auto_route/auto_route.dart';
import 'package:bond/config/router/app_router.gr.dart';
import 'package:bond/core/extensions/color_extensions.dart';
import 'package:bond/gen/assets.gen.dart';
import 'package:bond/widgets/main_widget/back_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/utils/app_size.dart';
import '../../widgets/main_widget/app_text.dart';

class InsuranceHelper {
  static void showAlertDialog(
    BuildContext context,
    String title,
    String body,
    bool isEmergency,
  ) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: SizedBox(
            height: SizeConfig.bodyHeight * .4,
            child: Column(
              children: [
                SvgPicture.asset(Assets.icons.correct),
                AppText(
                  text: title,
                  textSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(height: SizeConfig.bodyHeight * .02),
                AppText(
                  align: TextAlign.center,
                  text: body,
                  maxLines: 2,
                ),
                SizedBox(height: SizeConfig.bodyHeight * .08),
                Visibility(
                  visible: !isEmergency,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                          SchedulerBinding.instance.addPostFrameCallback((_) {
                            context.router.pushAndPopUntil(
                              MainLayoutRoute(),
                              predicate: (route) => false,
                            );
                          });
                        },
                        child: AppText(
                          text: "Back",
                          textSize: 20,
                          color: context.colorScheme.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 5),
                      BackArrowWidget(color: context.colorScheme.primary),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

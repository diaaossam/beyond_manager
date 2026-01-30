import 'package:auto_route/auto_route.dart';
import 'package:bond/config/router/app_router.gr.dart';
import 'package:bond/config/theme/color_scheme.dart';
import 'package:bond/core/enum/status_enum.dart';
import 'package:bond/core/extensions/app_localizations_extension.dart';
import 'package:bond/core/extensions/color_extensions.dart';
import 'package:bond/core/utils/app_size.dart';
import 'package:bond/features/sick_leave/data/models/my_sick_leave.dart';
import 'package:bond/gen/assets.gen.dart';
import 'package:bond/widgets/image_picker/app_image.dart';
import 'package:bond/widgets/main_widget/app_text.dart';
import 'package:flutter/material.dart';

class CustomMyRequestItem extends StatelessWidget {
  final MySickLeave myRequestsModel;

  const CustomMyRequestItem({super.key, required this.myRequestsModel});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>context.router.push(FeedbackRoute(myRequestsModel: myRequestsModel)),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth * .03),
        margin: EdgeInsets.symmetric(
            horizontal: SizeConfig.screenWidth * .04,
            vertical: SizeConfig.bodyHeight * .015),
        decoration: BoxDecoration(
            color: context.colorScheme.secondary,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: context.colorScheme.outline)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: SizeConfig.bodyHeight * .015),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AppText(
                    text: myRequestsModel.insuredMemberName ?? "",
                    textSize: 12,
                    maxLines: 2,
                    fontWeight: FontWeight.bold),
                const Spacer(),
                Container(
                  padding: EdgeInsets.symmetric(
                      vertical: SizeConfig.bodyHeight * .009,
                      horizontal: SizeConfig.screenWidth * .03),
                  decoration: BoxDecoration(
                    color: _getColor(myRequestsModel.state),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppText(
                        text: myRequestsModel.state!.name,
                        textSize: 11,
                        fontWeight: FontWeight.w500,
                        color: myRequestsModel.state == StatusEnum.pending
                            ? Colors.black
                            : Colors.white,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            if (myRequestsModel.insuredMemberInsuranceId != null) ...{
              SizedBox(height: SizeConfig.bodyHeight * .012),
              Row(
                children: [
                  AppText(
                      text: "${context.localizations.insuranceID}: ",
                      textSize: 12),
                  AppText(
                      text: myRequestsModel.insuredMemberInsuranceId ?? "",
                      textSize: 12,
                      fontWeight: FontWeight.w600),
                ],
              ),
            },
            SizedBox(height: SizeConfig.bodyHeight * .015),
            if(myRequestsModel.state == StatusEnum.done)
              Container(
                padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                decoration: BoxDecoration(color: Colors.green.withValues(alpha: 0.3),borderRadius: BorderRadius.circular(10)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    AppText(text: "${myRequestsModel.number_of_days_approved} Days Approved ",fontWeight: FontWeight.w600,color: Colors.green,),
                    SizedBox(height: SizeConfig.bodyHeight*.01,),
                    AppText(text: "From: ${myRequestsModel.date_of_injury} - To: ${myRequestsModel.return_date}",fontWeight: FontWeight.bold,color: Colors.green,)
                  ],
                ),
              ),
            if(myRequestsModel.state == StatusEnum.notApproved)
              Container(
                padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                decoration: BoxDecoration(color: Colors.red.withValues(alpha: 0.3),borderRadius: BorderRadius.circular(10)),
                child: const AppText(text: "Not Approved",fontWeight: FontWeight.w600,color: Colors.red,),
              ),
            SizedBox(height: SizeConfig.bodyHeight * .025),
            Row(
              children: [
                Container(
                  width: SizeConfig.screenWidth * .3,
                  padding: EdgeInsets.symmetric(
                      vertical: SizeConfig.bodyHeight * .01),
                  decoration: BoxDecoration(
                    color: context.colorScheme.onPrimary,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      AppText(
                          text: context.localizations.viewFeedback,
                          textSize: 11),
                      SizedBox(width: SizeConfig.screenWidth * .02),
                      AppImage.asset(Assets.icons.arrowForward),
                    ],
                  ),
                ),
                const Spacer(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        AppText(
                            text: "${context.localizations.requestDate}: ",
                            textSize: 10),
                        AppText(
                            text: myRequestsModel.date.toString(),
                            textSize: 10,
                            fontWeight: FontWeight.w600),
                      ],
                    ),
                    SizedBox(
                      height: SizeConfig.bodyHeight * .01,
                    ),
                    if (myRequestsModel.state == StatusEnum.pending)
                      const AppText(
                          text: "Estimated response: 6-24 hours", textSize: 11)
                    else if (myRequestsModel.state == StatusEnum.processing)
                      const AppText(text: "Under medical review", textSize: 11)
                    else
                      if(myRequestsModel.change_state_date != null && myRequestsModel.change_state_date!.isNotEmpty)
                      Row(
                        children: [
                          AppText(
                              text: "${context.localizations.completed}: ",
                              textSize: 11),
                          AppText(
                              text: myRequestsModel.change_state_date.toString(),
                              textSize: 11,
                              fontWeight: FontWeight.w500),
                        ],
                      ),
                  ],
                ),
              ],
            ),
            SizedBox(height: SizeConfig.bodyHeight * .02),
          ],
        ),
      ),
    );
  }

  Color _getColor(StatusEnum? state) {
    switch (state) {
      case null:
        return Colors.red;
      case StatusEnum.done:
        return AppColorScheme.light.tertiary;
      case StatusEnum.pending:
        return Colors.amberAccent;
      case StatusEnum.processing:
        return Colors.blueAccent;
      default:
        return Colors.red;
    }
  }
}

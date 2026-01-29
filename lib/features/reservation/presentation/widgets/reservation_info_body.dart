import 'package:bond/widgets/image_picker/app_image.dart';
import 'package:bond/core/extensions/color_extensions.dart';
import 'package:bond/core/utils/app_size.dart';
import 'package:bond/features/reservation/data/models/response/my_reservation.dart';
import 'package:bond/widgets/main_widget/app_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:bond/gen/assets.gen.dart';

class ReservationInfoBody extends StatelessWidget {
  final MyReservation myReservation;

  const ReservationInfoBody({super.key, required this.myReservation});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.screenWidth,
      height: SizeConfig.bodyHeight * .4,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
                color: const Color(0xffFDEEE6),
                borderRadius: BorderRadius.circular(20)),
            padding: screenPadding(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Spacer(),
                    IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(Icons.close)),
                  ],
                ),
                AppText(
                  text:
                      "${myReservation.firstName} ${myReservation.fatherName} ${myReservation.lastName}",
                  fontWeight: FontWeight.w600,
                  maxLines: 2,
                  textSize: 15,
                ),
                const SizedBox(
                  height: 10,
                ),
                AppText(
                  text:
                      "Phone Number: ${myReservation.phone}",
                  fontWeight: FontWeight.w600,
                  maxLines: 2,
                  color: context.colorScheme.onSurface.withValues(alpha: 0.6),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
         Padding(
           padding: screenPadding(),
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             mainAxisAlignment: MainAxisAlignment.start,
             children: [
               SizedBox(
                 height: SizeConfig.bodyHeight * .04,
               ),
               AppText(
                 text: myReservation.doctorName ?? "",
                 fontWeight: FontWeight.w600,
                 maxLines: 2,
                 textSize: 16,
               ),
               SizedBox(
                 height: SizeConfig.bodyHeight * .01,
               ),
               AppText(
                 text: myReservation.specialityName ?? "",
                 color: context.colorScheme.onSurface.withValues(alpha: 0.4),
               ),
               SizedBox(
                 height: SizeConfig.bodyHeight * .03,
               ),
               Row(
                 mainAxisAlignment: MainAxisAlignment.start,
                 children: [
                   AppImage.asset(
                     Assets.icons.locationPoint,
                     color: context.colorScheme.primary,
                     height: 15,
                   ),
                   const SizedBox(
                     width: 6,
                   ),
                   AppText(
                     text: myReservation.branchName ?? "",
                     color: context.colorScheme.onSurface.withValues(alpha: 0.6),
                   )
                 ],
               ),
               SizedBox(
                 height: SizeConfig.bodyHeight * .01,
               ),
               Column(
                 children: [
                   Row(
                     children: [
                       Row(
                         mainAxisAlignment: MainAxisAlignment.start,
                         children: [
                           AppImage.asset(
                             "assets/svg/calendar3.svg",
                             height: 15,
                           ),
                           const SizedBox(
                             width: 6,
                           ),
                           AppText(
                             text: DateFormat.yMEd().format(DateTime.parse(
                                 myReservation.reservationDate.toString())),
                             color: context.colorScheme.onSurface.withValues(alpha: 0.6),
                           )
                         ],
                       ),
                       SizedBox(
                         width: SizeConfig.screenWidth * .05,
                       ),
                       if(myReservation.time != null && myReservation.time!.isNotEmpty)
                         Row(
                           mainAxisAlignment: MainAxisAlignment.start,
                           children: [
                             AppImage.asset(
                               "assets/icons/clock.svg",
                               height: 15,
                             ),
                             const SizedBox(
                               width: 6,
                             ),
                             AppText(
                               text: myReservation.time.toString() ,
                               color: context.colorScheme.onSurface.withValues(alpha: 0.6),
                             )
                           ],
                         ),
                     ],
                   ),
                   SizedBox(
                     height: SizeConfig.bodyHeight * .01,
                   ),
                 ],
               ),
             ],
           ),
         )
        ],
      ),
    );
  }
}

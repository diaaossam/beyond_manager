import 'package:auto_route/auto_route.dart';
import 'package:bond/config/router/app_router.gr.dart';
import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:bond/core/extensions/app_localizations_extension.dart';
import 'package:bond/core/extensions/color_extensions.dart';
import 'package:bond/core/utils/app_size.dart';
import 'package:bond/features/reservation/data/models/response/doctors_result.dart';
import 'package:bond/features/reservation/presentation/cubit/new_reservation/new_reservation_cubit.dart';
import 'package:bond/gen/assets.gen.dart';
import 'package:bond/widgets/main_widget/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../../../../widgets/image_picker/app_image.dart';
import '../../../../widgets/main_widget/app_searchable_drop_down.dart';
import '../../data/models/request/post_reservation_param.dart';

class DropDownDoctorsListDesign extends StatefulWidget {
  final Function(bool) isFilter;

  const DropDownDoctorsListDesign({super.key, required this.isFilter});

  @override
  State<DropDownDoctorsListDesign> createState() => _DropDownDoctorsListDesignState();
}

class _DropDownDoctorsListDesignState extends State<DropDownDoctorsListDesign> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewReservationCubit, BaseState<NewReservationData>>(
      builder: (context, state) {
        final data = state.data?.timeSlots;
        if (data != null && data.isNotEmpty) {
          return Padding(
            padding: screenPadding(),
            child: AppSearchableDropDown<DoctorsResult>(
              onChanged: (doctorsResult) async {
                ReservationParams reservationParams = ReservationParams(
                  idBranch: doctorsResult!.idBranch?.toInt(),
                  branchName: doctorsResult.branche?.designation,
                  doctorName:
                      doctorsResult.nomInterv ?? doctorsResult.nomIntervAr ?? "",
                  hospitalName:
                      doctorsResult.designationbranche ??
                      doctorsResult.designationbrancheAr ??
                      "",
                  planningCabinetCode: doctorsResult.code.toString(),
                  reservationTime: doctorsResult.partOfDay.toString(),
                  reservationDate: doctorsResult.jourLocalDateTime
                      .toString()
                      .split(" ")[0],
                  specialityName:
                      doctorsResult.designationSpecialite ??
                      doctorsResult.designationSpecialiteAr ??
                      "",
                );

                final response = await context.router.push(
                  BookingDoctorRoute(
                    reservationParams: reservationParams,
                    doctorsResult: doctorsResult,
                  ),
                );

                if(response != null){
                  setState(() => widget.isFilter(response as bool) );
                }
              },
              hint: context.localizations.selectDoctor,
              loadingText: context.localizations.loadingText,
              items: data
                  .map<DropdownMenuItem<DoctorsResult>>(
                    (DoctorsResult item) => DropdownMenuItem(
                      value: item,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText(
                            text: "${item.nomInterv} - ${item.nomIntervAr}",
                          ),
                          SizedBox(height: SizeConfig.bodyHeight * .005),
                          AppText(
                            text: item.designationSpecialiteAr ?? '',
                            color: context.colorScheme.shadow,
                          ),
                          SizedBox(height: SizeConfig.bodyHeight * .005),
                          SizedBox(height: SizeConfig.bodyHeight * .01),
                          AppText(
                            maxLines: 2,
                            text:
                                "${item.designationbranche} - ${item.designationbrancheAr}",
                          ),
                          AppText(
                            text: item.medecin?.scientificDegreeSec ?? "",
                            color: context.colorScheme.shadow,
                          ),
                          SizedBox(height: SizeConfig.bodyHeight * .02),
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        AppImage.asset(
                                          Assets.icons.calendar3,
                                          height: 15,
                                        ),
                                        const SizedBox(width: 6),
                                        AppText(
                                          text: DateFormat.yMEd().format(
                                            DateTime.parse(
                                              item.jourLocalDateTime.toString(),
                                            ),
                                          ),
                                          color: context.colorScheme.shadow,
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: SizeConfig.bodyHeight * .008,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        AppImage.asset(
                                          Assets.icons.clock,
                                          height: 15,
                                        ),
                                        const SizedBox(width: 6),
                                        AppText(
                                          text: DateFormat.jm().format(
                                            DateTime.parse(
                                              item.heureDebutLocalDateTime
                                                  .toString(),
                                            ),
                                          ),
                                          color: context.colorScheme.shadow,
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: SizeConfig.bodyHeight * .02),
                                  ],
                                ),
                              ),
                              Container(
                                height: SizeConfig.bodyHeight * .04,
                                padding: EdgeInsets.symmetric(
                                  horizontal: SizeConfig.screenWidth * .04,
                                ),
                                decoration: BoxDecoration(
                                  color: context.colorScheme.primary.withValues(
                                    alpha: 0.81,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                  child: AppText(
                                    text: context.localizations.bookNow,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    textSize: 12,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                  .toList(),
            ),
          );
        }
        else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}

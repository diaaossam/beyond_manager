import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:bond/core/extensions/app_localizations_extension.dart';
import 'package:bond/core/utils/app_constant.dart';
import 'package:bond/core/utils/app_size.dart';
import 'package:bond/features/reservation/data/models/request/speciality_params.dart';
import 'package:bond/features/reservation/data/models/request/timeslot_params.dart';
import 'package:bond/features/reservation/data/models/response/doctors_result.dart';
import 'package:bond/features/reservation/presentation/cubit/new_reservation/new_reservation_cubit.dart';
import 'package:bond/features/reservation/presentation/widgets/drop_down_list_design.dart';
import 'package:bond/features/reservation/presentation/widgets/new_reservation/custom_branchs_expanded_list.dart';
import 'package:bond/features/reservation/presentation/widgets/new_reservation/custom_date_expanded_list.dart';
import 'package:bond/features/reservation/presentation/widgets/new_reservation/custom_hospitals_expanded_list.dart';
import 'package:bond/features/reservation/presentation/widgets/new_reservation/custom_speciality_expanded_list.dart';
import 'package:bond/features/reservation/presentation/widgets/new_reservation/gender_choose.dart';
import 'package:bond/core/enum/gender.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../widgets/main_widget/custom_button.dart';
import '../../pages/doctors_result_screen.dart';

class NewReservationBody extends StatefulWidget {
  final bool isFilter;
  final List<DoctorsResult>? list;
  final DoctorBookingParams? params;

  const NewReservationBody({
    super.key,
    this.isFilter = false,
    this.params,
    this.list,
  });

  @override
  State<NewReservationBody> createState() => _NewReservationBodyState();
}

class _NewReservationBodyState extends State<NewReservationBody> {
  DoctorBookingParams params = DoctorBookingParams();
  GenderEnum? genderEnum;
  String? startDate;
  String? endDate;
  bool isFilter = false;

  @override
  void initState() {
    isFilter = widget.isFilter;
    if (widget.params != null) {
      params = widget.params!;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<NewReservationCubit, BaseState<NewReservationData>>(
      listener: (context, state) {
        if (state.identifier == 'get_timeslot') {
          if (state.isLoading) {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) => const Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else {
            // Dismiss loading dialog if it's showing
            if (Navigator.of(context, rootNavigator: true).canPop()) {
              Navigator.of(context, rootNavigator: true).pop();
            }

            if (state.isSuccess) {
              final data = state.data;
              if (data != null) {
                if (data.timeSlots.isEmpty) {
                  AppConstant.showCustomSnakeBar(
                      context, context.localizations.noReservationFound, false);
                } else if (data.shouldNavigate) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DoctorsResultScreen(
                        params: data.lastParams!,
                        allTimeSlot: data.timeSlots,
                      ),
                    ),
                  );
                }
              }
            }
          }
        }
      },
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: SizeConfig.bodyHeight * .04,
            ),
            if (isFilter) ...{
              CustomDateExpandedList(
                onCallBack: (map) {
                  final startDate = map['from'];
                  final endDate = map['to'];
                  if (startDate != null && endDate != null) {
                    setState(() {
                      this.startDate = startDate;
                      this.endDate = endDate;
                    });
                  }
                },
              ),
              GenderChoose(
                onSelected: (p0) => setState(() => genderEnum = p0),
              ),
              SizedBox(
                height: SizeConfig.bodyHeight * .02,
              ),
            }
            else ...{
              CustomHospitalsExpandedList(
                onHospitalSelected: (model) {},
              ),
              CustomBranchExpandedList(
                onCallBack: (p0) {
                  List<num> ids = p0.map((e) => e.code ?? 0).toList();
                  final specialityParams = SpecialityParams(
                    specialityIds: ids,
                  );
                  context
                      .read<NewReservationCubit>()
                      .getAllSpeciality(specialityParams: specialityParams);
                  params = params.copyWith(
                    idBranch: p0.map((e) => e.code ?? 0).toList(),
                  );
                  setState(() {});
                  context.read<NewReservationCubit>().getAllTimeSlot(
                      params: params, isNavigate: false, isFilter: false);
                },
              ),
              CustomSpecialitiesExpandedList(
                onSpecialitySelected: (p0) {
                  params = params.copyWith(codeSpecialite: p0.code);
                  setState(() {});
                  context.read<NewReservationCubit>().getAllTimeSlot(
                      params: params, isNavigate: false, isFilter: false);
                },
              ),
              SizedBox(height: 10,),
              DropDownDoctorsListDesign(
                isFilter: (p0) => setState(() => isFilter = p0),
              ),
            },
            SizedBox(
              height: SizeConfig.bodyHeight * .06,
            ),
            Padding(
              padding: screenPadding(),
              child: CustomButton(
                  text: context.localizations.showAllResult,
                  press: () {
                    if (params.idBranch == null || params.idBranch!.isEmpty) {
                      AppConstant.showCustomSnakeBar(context,
                          context.localizations.branchValidation, false);
                      return;
                    }

                    if (startDate != null &&
                        endDate != null &&
                        widget.list != null &&
                        widget.list!.isNotEmpty) {
                      params = params.copyWith(
                          startDate: startDate,
                          endDate: endDate,
                          gender: genderEnum?.name);
                      setState(() {});
                      context.read<NewReservationCubit>().getAllTimeSlot(
                          params: params,
                          isNavigate: true,
                          isFilter: true,
                          list: widget.list);
                    } else {
                      params = params.copyWith(
                          startDate: startDate,
                          endDate: endDate,
                          gender: genderEnum?.name);
                      setState(() {});
                      context.read<NewReservationCubit>().getAllTimeSlot(
                          params: params, isNavigate: true, isFilter: false);
                    }
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

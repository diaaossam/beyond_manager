import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:bond/core/extensions/app_localizations_extension.dart';
import 'package:bond/core/utils/app_size.dart';
import 'package:bond/features/reservation/presentation/cubit/doctor_result/doctor_result_cubit.dart';
import 'package:bond/features/reservation/presentation/pages/new_reservation_screen.dart';
import 'package:bond/features/reservation/presentation/widgets/doctor_result/doctor_design_item.dart';
import 'package:bond/gen/assets.gen.dart';
import 'package:bond/widgets/image_picker/app_image.dart';
import 'package:bond/widgets/main_widget/app_text.dart';
import 'package:bond/widgets/main_widget/custom_text_form_field.dart';
import 'package:bond/widgets/no_item_design.dart';
import 'package:chips_choice/chips_choice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../data/models/request/timeslot_params.dart';

class DoctorResultBody extends StatefulWidget {
  final DoctorBookingParams params;

  const DoctorResultBody({super.key, required this.params});

  @override
  State<DoctorResultBody> createState() => _DoctorResultBodyState();
}

class _DoctorResultBodyState extends State<DoctorResultBody> {
  final TextEditingController _searchController = TextEditingController();
  int tag = 0;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DoctorResultCubit, BaseState<DoctorResultData>>(
      listener: (context, state) {
        if (state.identifier == 'get_timeslot') {
          if (state.isLoading) {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) =>
                  const Center(child: CircularProgressIndicator()),
            );
          } else {
            if (Navigator.of(context, rootNavigator: true).canPop()) {
              Navigator.of(context, rootNavigator: true).pop();
            }
          }
        }
      },
      builder: (context, state) {
        final bloc = context.read<DoctorResultCubit>();
        final data = state.data;
        final filteredDoctors = data?.filteredTimeSlots ?? [];
        final allDoctors = data?.allTimeSlots ?? [];

        return Padding(
          padding: screenPadding(),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Row(
                  children: [
                    Expanded(
                      child: CustomTextFormField(
                        controller: _searchController,
                        onChanged: (p0) =>
                            bloc.filterDoctors(_searchController.text),
                        prefixIcon: SvgPicture.asset(Assets.icons.search),
                        hintText: context.localizations.searchForDoctor,
                      ),
                    ),
                    InkWell(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NewReservationScreen(
                            isFilter: true,
                            params: widget.params,
                            list: allDoctors,
                          ),
                        ),
                      ),
                      child: Container(
                        margin: EdgeInsetsDirectional.only(
                          start: SizeConfig.screenWidth * .04,
                        ),
                        child: AppImage.asset(Assets.icons.filter),
                      ),
                    ),
                  ],
                ),
              ),
              SliverToBoxAdapter(
                child: ChipsChoice<int>.single(
                  value: tag,
                  onChanged: (val) {
                    setState(() => tag = val);
                    String value = "All";
                    if (val == 1) {
                      value = "MORNING";
                    } else if (val == 2) {
                      value = "AFTERNOON";
                    } else if (val == 3) {
                      value = "EVENING";
                    }
                    DoctorBookingParams params = widget.params.copyWith(
                      partOfDay: value,
                    );
                    bloc.getAllTimeSlot(params: params);
                  },
                  choiceItems: C2Choice.listFrom<int, String>(
                    source: [
                      context.localizations.all,
                      "${context.localizations.morning} (10 am - 1 pm)",
                      "${context.localizations.afternoon} (2 pm - 5 pm)",
                      "${context.localizations.evening} (6 pm - 12 am)",
                    ],
                    value: (i, v) => i,
                    label: (i, v) => v,
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(height: SizeConfig.bodyHeight * .01),
              ),
              if (filteredDoctors.isNotEmpty)
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) => Container(
                      margin: EdgeInsets.symmetric(
                        vertical: SizeConfig.bodyHeight * .01,
                      ),
                      child: DoctorDesignItem(
                        doctorsResult: filteredDoctors[index],
                        params: widget.params,
                      ),
                    ),
                    childCount: filteredDoctors.length,
                  ),
                )
              else
                SliverToBoxAdapter(
                  child: Center(
                    child: EmptyWidgetDesign(body: context.localizations.noDoctors,),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}

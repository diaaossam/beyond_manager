import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:bond/core/extensions/app_localizations_extension.dart';
import 'package:bond/core/utils/app_size.dart';
import 'package:bond/features/reservation/data/models/request/timeslot_params.dart';
import 'package:bond/features/reservation/presentation/cubit/doctor_result/doctor_result_cubit.dart';
import 'package:bond/features/reservation/presentation/widgets/doctor_result/doctor_design_item.dart';
import 'package:bond/gen/assets.gen.dart';
import 'package:bond/widgets/custom_search_text_form_field.dart';
import 'package:bond/widgets/image_picker/app_image.dart';
import 'package:bond/widgets/loading/loading_widget.dart';
import 'package:bond/widgets/main_widget/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DoctorResultBody extends StatefulWidget {
  final int policyId;
  final DoctorBookingParams? params;

  const DoctorResultBody({super.key, required this.policyId, this.params});

  @override
  State<DoctorResultBody> createState() => _DoctorResultBodyState();
}

class _DoctorResultBodyState extends State<DoctorResultBody> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DoctorResultCubit, BaseState<Map<String, dynamic>>>(
      builder: (context, state) {
        final cubit = context.read<DoctorResultCubit>();
        return Padding(
          padding: EdgeInsets.all(SizeConfig.screenWidth * .04),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Row(
                  children: [
                    Expanded(
                      child: CustomSearchTextFormField(
                        controller: _searchController,
                        onChange: (value) {},
                        hintText: context.localizations.searchForDoctor,
                      ),
                    ),
                    SizedBox(width: SizeConfig.screenWidth * .02),
                    AppImage.asset(Assets.icons.filter, width: 24),
                  ],
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(height: SizeConfig.bodyHeight * .02),
              ),
              if (state.isLoading)
                const SliverFillRemaining(child: LoadingWidget())
              else if (cubit.doctorsResult != null)
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      return DoctorDesignItem(
                        policyId: widget.policyId,
                        doctorsResult: cubit.doctorsResult!,
                      );
                    },
                    childCount: 1,
                  ),
                )
              else
                SliverFillRemaining(
                  child: Center(
                    child: AppText(
                      text: "No Data Found",
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}

import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:bond/core/extensions/app_localizations_extension.dart';
import 'package:bond/core/extensions/color_extensions.dart';
import 'package:bond/core/utils/app_constant.dart';
import 'package:bond/core/utils/app_size.dart';
import 'package:bond/features/reservation/data/models/request/post_reservation_param.dart';
import 'package:bond/features/reservation/data/models/response/doctors_result.dart';
import 'package:bond/features/reservation/presentation/cubit/booking/booking_cubit.dart';
import 'package:bond/widgets/custom_search_text_form_field.dart';
import 'package:bond/widgets/loading/modern_button_loading.dart';
import 'package:bond/widgets/main_widget/app_text.dart';
import 'package:bond/widgets/main_widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class BookingBody extends StatefulWidget {
  final int policyId;
  final ReservationParams? reservationParams;
  final DoctorsResult? doctorsResult;

  const BookingBody({
    super.key,
    required this.policyId,
    this.reservationParams,
    this.doctorsResult,
  });

  @override
  State<BookingBody> createState() => _BookingBodyState();
}

class _BookingBodyState extends State<BookingBody> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BookingCubit, BaseState<Map<String, dynamic>>>(
      listener: (context, state) {
        if (state.isSuccess && state.identifier == 'book_doctor') {
          AppConstant.showToast(
            color: context.colorScheme.tertiary,
            msg: 'Booking successful',
            gravity: ToastGravity.TOP,
          );
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        final cubit = context.read<BookingCubit>();
        return SingleChildScrollView(
          padding: EdgeInsets.all(SizeConfig.screenWidth * .04),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(height: SizeConfig.bodyHeight * .02),
                AppText(
                  text: context.localizations.patientInformationBody,
                  fontWeight: FontWeight.bold,
                  textSize: 16,
                ),
                SizedBox(height: SizeConfig.bodyHeight * .03),
                CustomSearchTextFormField(
                  controller: _nameController,
                  hintText: context.localizations.fullName,
                  onChange: (value) {},
                ),
                SizedBox(height: SizeConfig.bodyHeight * .02),
                CustomSearchTextFormField(
                  controller: _phoneController,
                  hintText: "Phone",
                  onChange: (value) {},
                ),
                SizedBox(height: SizeConfig.bodyHeight * .02),
                CustomSearchTextFormField(
                  controller: _emailController,
                  hintText: "Email",
                  onChange: (value) {},
                ),
                SizedBox(height: SizeConfig.bodyHeight * .05),
                state.isLoading && state.identifier == 'book_doctor'
                    ? const ModernButtonLoading()
                    : CustomButton(
                        text: context.localizations.confirm,
                        press: () {
                          if (_formKey.currentState!.validate()) {
                            final params = widget.reservationParams ??
                                ReservationParams(
                                  policyId: widget.policyId,
                                  name: _nameController.text,
                                  phone: _phoneController.text,
                                  email: _emailController.text,
                                );
                            cubit.bookDoctor(params: params);
                          }
                        },
                      ),
              ],
            ),
          ),
        );
      },
    );
  }
}

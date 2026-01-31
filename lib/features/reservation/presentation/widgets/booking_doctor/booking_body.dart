import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:bond/core/extensions/app_localizations_extension.dart';
import 'package:bond/core/extensions/color_extensions.dart';
import 'package:bond/features/auth/data/models/response/user_model_helper.dart';
import 'package:bond/core/utils/app_size.dart';
import 'package:bond/features/reservation/data/models/response/doctors_result.dart';
import 'package:bond/features/reservation/presentation/cubit/booking/booking_cubit.dart';
import 'package:bond/core/enum/gender.dart';
import 'package:bond/widgets/main_widget/app_text.dart';
import 'package:bond/widgets/main_widget/custom_button.dart';
import 'package:bond/widgets/main_widget/custom_text_form_field.dart';
import 'package:dartz/dartz.dart' show Unit;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import '../../../../other_line/insurance_helper.dart';
import '../../../data/models/request/post_reservation_param.dart';
import '../../reservation_helper.dart';
import '../new_reservation/circle_toggle_button.dart';

class BookingBody extends StatefulWidget {
  final ReservationParams reservationParams;
  final DoctorsResult doctorsResult;

  const BookingBody({
    super.key,
    required this.reservationParams,
    required this.doctorsResult,
  });

  @override
  State<BookingBody> createState() => _BookingBodyState();
}

class _BookingBodyState extends State<BookingBody> {
  TextEditingController firstName = TextEditingController();
  FocusNode firstNameFocusNode = FocusNode();
  TextEditingController fatherName = TextEditingController();
  FocusNode fatherNameFocusNode = FocusNode();
  TextEditingController grandFatherName = TextEditingController();
  FocusNode grandFatherFocusNode = FocusNode();
  TextEditingController lastName = TextEditingController();
  FocusNode lastNameFocusNode = FocusNode();
  TextEditingController phone = TextEditingController();
  FocusNode phoneFocusNode = FocusNode();
  TextEditingController email = TextEditingController();
  FocusNode emailFocusNode = FocusNode();
  TextEditingController birthDate = TextEditingController();
  GenderEnum genderEnum = GenderEnum.male;
  bool showDatePicker = false;
  String date = "";

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    firstNameFocusNode.requestFocus();
    if (UserDataService().getUserData() != null) {
      firstName.text = UserDataService().getUserData()!.firstName ?? "";
      lastName.text = UserDataService().getUserData()!.lastName ?? "";
      fatherName.text = UserDataService().getUserData()!.secondName ?? "";
      grandFatherName.text = UserDataService().getUserData()!.thirdName ?? "";
      phone.text = UserDataService().getUserData()!.phone ?? "";
      email.text = UserDataService().getUserData()!.email ?? "";
      birthDate.text = UserDataService().getUserData()!.birthDate ?? "";
      date = UserDataService().getUserData()!.birthDate ?? "";
      if (UserDataService().getUserData()!.genderEnum != null) {
        genderEnum = UserDataService().getUserData()!.genderEnum!;
      }
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: screenPadding(),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: SizeConfig.bodyHeight * .04),
              AppText(
                text: context.localizations.patientInformationBody,
                textSize: 16,
              ),
              SizedBox(height: SizeConfig.bodyHeight * .04),
              Row(
                children: [
                  Expanded(
                    child: CustomTextFormField(
                      controller: firstName,
                      onSubmitted: (p0) => FocusScope.of(
                        context,
                      ).requestFocus(fatherNameFocusNode),
                      focusNode: firstNameFocusNode,
                      hintText: context.localizations.firstName,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return context.localizations.firstNameValidation;
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(width: SizeConfig.bodyHeight * .02),
                  Expanded(
                    child: CustomTextFormField(
                      controller: fatherName,
                      focusNode: fatherNameFocusNode,
                      hintText: context.localizations.fatherName,
                      onSubmitted: (p0) => FocusScope.of(
                        context,
                      ).requestFocus(grandFatherFocusNode),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return context.localizations.secondNameValidation;
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: SizeConfig.bodyHeight * .02),
              Row(
                children: [
                  Expanded(
                    child: CustomTextFormField(
                      controller: grandFatherName,
                      focusNode: grandFatherFocusNode,
                      onSubmitted: (p0) => FocusScope.of(
                        context,
                      ).requestFocus(lastNameFocusNode),
                      hintText: context.localizations.grandFatherName,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return context.localizations.thirdNameValidation;
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(width: SizeConfig.bodyHeight * .02),
                  Expanded(
                    child: CustomTextFormField(
                      controller: lastName,
                      onSubmitted: (p0) =>
                          FocusScope.of(context).requestFocus(phoneFocusNode),
                      focusNode: lastNameFocusNode,
                      hintText: context.localizations.lastName,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return context.localizations.lastNameValidation;
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: SizeConfig.bodyHeight * .02),
              CustomTextFormField(
                controller: phone,
                focusNode: phoneFocusNode,
                keyboardType: TextInputType.phone,
                inputFormatters: [LengthLimitingTextInputFormatter(11)],
                hintText: context.localizations.phoneNumber,
                onSubmitted: (p0) =>
                    FocusScope.of(context).requestFocus(emailFocusNode),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return context.localizations.phoneValidation;
                  }
                  return null;
                },
              ),
              SizedBox(height: SizeConfig.bodyHeight * .02),
              CustomTextFormField(
                controller: email,
                keyboardType: TextInputType.emailAddress,
                focusNode: emailFocusNode,
                hintText: context.localizations.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return context.localizations.emailAddressValidation;
                  }
                  if (!checkIfIsEmail(email: value)) {
                    return context.localizations.youMustAddValidEmail;
                  }
                  return null;
                },
              ),
              SizedBox(height: SizeConfig.bodyHeight * .02),
              CustomTextFormField(
                controller: birthDate,
                keyboardType: TextInputType.datetime,
                hintText: context.localizations.dateOfBirth,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return context.localizations.dateOfBirthValidation;
                  }
                  return null;
                },
                readOnly: true,
                onTap: () async {
                  final date1 = await ReservationHelper().showCustomDatePicker(
                    context,
                  );
                  birthDate.text = date1;
                  setState(() => date = date1);
                },
              ),
              SizedBox(height: SizeConfig.bodyHeight * .02),
              Row(
                children: [
                  AppText(
                    text: context.localizations.gender,
                    fontWeight: FontWeight.w500,
                    textSize: 14,
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () =>
                            setState(() => genderEnum = GenderEnum.male),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: SizeConfig.screenWidth * .04,
                            vertical: SizeConfig.bodyHeight * .008,
                          ),
                          child: Row(
                            children: [
                              SizedBox(width: SizeConfig.screenWidth * .1),
                              CircleToggleButton(
                                isSelected: genderEnum == GenderEnum.male,
                              ),
                              SizedBox(width: SizeConfig.screenWidth * .015),
                              AppText(
                                text: context.localizations.male,
                                color: const Color(0xff898A8D),
                                fontWeight: FontWeight.w500,
                              ),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () =>
                            setState(() => genderEnum = GenderEnum.female),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: SizeConfig.screenWidth * .04,
                            vertical: SizeConfig.bodyHeight * .008,
                          ),
                          child: Row(
                            children: [
                              SizedBox(width: SizeConfig.screenWidth * .1),
                              CircleToggleButton(
                                isSelected: genderEnum == GenderEnum.female,
                              ),
                              SizedBox(width: SizeConfig.screenWidth * .015),
                              AppText(
                                text: context.localizations.female,
                                color: const Color(0xff898A8D),
                                fontWeight: FontWeight.w500,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: SizeConfig.bodyHeight * .06),
              Row(
                children: [
                  Expanded(
                    child: CustomButton(
                      backgroundColor: Colors.transparent,
                      textColor: context.colorScheme.primary,
                      text: context.localizations.cancel,
                      press: () => Navigator.pop(context),
                    ),
                  ),
                  SizedBox(width: SizeConfig.screenWidth * .04),
                  Expanded(
                    child: BlocConsumer<BookingCubit, BaseState<Unit>>(
                      listener: (context, state) {
                        if (state.identifier == 'book_doctor') {
                          if (state.isLoading) {
                            showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (context) => const Center(
                                child: CircularProgressIndicator(),
                              ),
                            );
                          } else {
                            if (Navigator.of(
                              context,
                              rootNavigator: true,
                            ).canPop()) {
                              Navigator.of(context, rootNavigator: true).pop();
                            }

                            if (state.isSuccess) {
                              InsuranceHelper.showAlertDialog(
                                context,
                                context.localizations.successfulBooking,
                                context.localizations.successfulBookingBody,
                                false,
                              );
                            }
                          }
                        }
                      },
                      builder: (context, state) {
                        final bloc = context.read<BookingCubit>();
                        return CustomButton(
                          text: context.localizations.bookNow,
                          press: () {
                            if (!_formKey.currentState!.validate()) {
                              return;
                            }
                            ReservationParams params = widget.reservationParams
                                .copyWith(
                                  firstName: firstName.text,
                                  fatherName: fatherName.text,
                                  grandFatherName: grandFatherName.text,
                                  lastName: lastName.text,
                                  tel: phone.text,
                                  email: email.text,
                                  gender: genderEnum.name,
                                  birthDate: date,
                                  celoptraStartDate: widget
                                      .doctorsResult
                                      .custom_start_date_time,
                                  celoptraEndDate:
                                      widget.doctorsResult.custom_end_date_time,
                                );
                            ReservationHelper().showReservationConfirmation(
                              context: context,
                              doctor: widget.doctorsResult,
                              reservationParams: params,
                              resultCallback: (p0) {
                                if (p0) {
                                  bloc.bookDoctor(params: params);
                                }
                              },
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

bool checkIfIsEmail({required String email}) {
  final bool emailValid = RegExp(
    r"^(?!.*\.\.)[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~\-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$",
  ).hasMatch(email);
  return emailValid;
}

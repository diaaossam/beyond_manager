import 'package:auto_route/auto_route.dart';
import 'package:bond/config/router/app_router.gr.dart';
import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:bond/core/extensions/color_extensions.dart';
import 'package:bond/features/auth/data/models/request/otp_params.dart';
import 'package:bond/features/auth/presentation/cubit/otp/otp_cubit.dart';
import 'package:bond/features/settings/presentation/cubit/settings_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpPinCodeDesign extends StatelessWidget {
  final String phone;

  const OtpPinCodeDesign({super.key, required this.phone});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OtpCubit, BaseState<String>>(
      listener: (context, state) {
        if (state.isSuccess && state.identifier == "verifyOtp") {
          context.router.pushAndPopUntil(
            MainLayoutRoute(),
            predicate: (route) => false,
          );
        }
      },
      builder: (context, state) {
        return Directionality(
          textDirection: TextDirection.ltr,
          child: PinCodeTextField(
            appContext: context,
            autoFocus: true,
            cursorColor: Colors.black,
            keyboardType: TextInputType.number,
            length: 6,
            obscureText: false,
            animationType: AnimationType.scale,
            pinTheme: PinTheme(
              shape: PinCodeFieldShape.box,
              borderRadius: BorderRadius.circular(5),
              fieldHeight: 50,
              fieldWidth: 40,
              borderWidth: 1,
              activeColor: context.colorScheme.primary,
              inactiveColor: context.colorScheme.primary,
              inactiveFillColor: Colors.white,
              activeFillColor: context.colorScheme.primary.withValues(
                alpha: 0.2,
              ),
              selectedColor: context.colorScheme.primary,
              selectedFillColor: Colors.white,
            ),
            animationDuration: const Duration(milliseconds: 300),
            backgroundColor: Colors.white,
            onCompleted: (value) => context.read<OtpCubit>().verifyOtp(
              params: OtpParams(
                phone: phone,
                userOtpCode: value,
                otpCode: state.data,
                publicOtpCode: context
                    .read<SettingsCubit>()
                    .state
                    .data
                    ?.defaultSmsCode,
              ),
            ),
            enableActiveFill: true,
            onChanged: (String value) {},
          ),
        );
      },
    );
  }
}

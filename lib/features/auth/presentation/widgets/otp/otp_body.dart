import 'package:bond/core/extensions/color_extensions.dart';
import 'package:bond/features/auth/presentation/cubit/otp/otp_cubit.dart';
import 'package:bond/gen/assets.gen.dart';
import 'package:bond/widgets/image_picker/app_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/extensions/app_localizations_extension.dart';
import '../../../../../core/utils/app_size.dart';
import '../../../../../widgets/main_widget/app_text.dart';
import 'otp_counter.dart';
import 'otp_logo.dart';
import 'otp_pin_code_design.dart';

class OtpBody extends StatelessWidget {
  final String phone;

  const OtpBody({super.key, required this.phone});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: SizeConfig.bodyHeight * .03),
      child: Column(
        children: [
          SizedBox(height: SizeConfig.bodyHeight * .15),
          AppImage.asset(
            Assets.images.beyondManagerLogo1.path,
            height: SizeConfig.bodyHeight * .12,
          ),
          SizedBox(height: SizeConfig.bodyHeight * .05),
          AppText(
            text: context.localizations.welcome1,
            textSize: 19,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          SizedBox(height: SizeConfig.bodyHeight * .02),
          AppText(
            text: context.localizations.welcome2,
            align: TextAlign.center,
            color: context.colorScheme.surface,
          ),
          SizedBox(height: SizeConfig.bodyHeight * .07),
          Row(
            children: [
              AppText(
                text: '${context.localizations.enterOtp} : ',
                textSize: 12,
                color: Colors.black,
              ),
              Text(phone, style: TextStyle(fontWeight: FontWeight.w600)),
            ],
          ),
          SizedBox(height: SizeConfig.bodyHeight * .02),
          OtpPinCodeDesign(phone: phone),
          SizedBox(height: SizeConfig.bodyHeight * .04),
          OtpTimerDesign(onResend: () =>context.read<OtpCubit>().sendOtp(phone: phone, isWhatsApp: true)),
        ],
      ),
    );
  }
}

String convertToEnglishNumbers(String input) {
  return input.replaceAllMapped(RegExp(r'[۰-۹]'), (match) {
    return (int.parse(match.group(0)!) - 0x0660).toString();
  });
}

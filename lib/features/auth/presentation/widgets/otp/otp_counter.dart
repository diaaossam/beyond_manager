import 'dart:async';
import 'package:bond/core/extensions/app_localizations_extension.dart';
import 'package:bond/core/extensions/color_extensions.dart';
import 'package:bond/gen/assets.gen.dart';
import 'package:bond/widgets/image_picker/app_image.dart';
import 'package:flutter/material.dart';
import '../../../../../widgets/main_widget/app_text.dart';

class OtpTimerDesign extends StatefulWidget {
  final VoidCallback onResend;

  const OtpTimerDesign({super.key, required this.onResend});

  @override
  State<OtpTimerDesign> createState() => _OtpTimerDesignState();
}

class _OtpTimerDesignState extends State<OtpTimerDesign> {
  Timer? _timer;
  late int _countdown;

  @override
  void initState() {
    super.initState();
    _countdown = 60;
    startTimer();
  }

  @override
  void dispose() {
    _timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_countdown < 1) {
      return InkWell(
        onTap: () {
          widget.onResend.call();
          resetTimer();
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppText(
              text: context.localizations.sendSmsViaWhatsApp,
              color: context.colorScheme.shadow,
              fontWeight: FontWeight.w500,
              textDecoration: TextDecoration.underline,
            ),
            const SizedBox(width: 6),
            AppImage.asset(Assets.icons.whats, width: 20),
          ],
        ),
      );
    }
    return Center(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppText(
            text: context.localizations.sendSmsViaWhatsAppBody,
            color: context.colorScheme.shadow,
            fontWeight: FontWeight.w500,
          ),
          const SizedBox(width: 5),
          AppText(
            text: "00:$_countdown",
            color: context.colorScheme.primary,
            fontWeight: FontWeight.w600,
          ),
        ],
      ),
    );
  }

  void startTimer() {
    const oneSecond = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSecond,
      (Timer timer) => setState(() {
        if (_countdown < 1) {
          timer.cancel();
        } else {
          _countdown--;
        }
      }),
    );
    setState(() {});
  }

  void resetTimer() {
    _timer!.cancel();
    _countdown = 60;
    startTimer();
  }
}

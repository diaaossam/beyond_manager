import 'package:bond/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashBackgroundDesign extends StatelessWidget {
  const SplashBackgroundDesign({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: SvgPicture.asset(Assets.icons.splashScreen, fit: BoxFit.cover),
    );
  }
}

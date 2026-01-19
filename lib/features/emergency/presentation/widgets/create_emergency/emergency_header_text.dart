import 'package:flutter/material.dart';

import '../../../../../core/extensions/app_localizations_extension.dart';
import '../../../../../core/utils/app_size.dart';
import '../../../../../widgets/main_widget/app_text.dart';

class CreateEmergencyHeaderText extends StatelessWidget {
  const CreateEmergencyHeaderText({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.bodyHeight * .08,
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth * .04),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFFF7300), Color(0xFFE94A1D)],
          begin: FractionalOffset(0.0, 0.0),
          end: FractionalOffset(1.0, 0.0),
          stops: [0.0, 1.0],
          tileMode: TileMode.clamp,
        ),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Center(
        child: AppText(
          color: Colors.white,
          text: context.localizations.emergencySupport3,
        ),
      ),
    );
  }
}

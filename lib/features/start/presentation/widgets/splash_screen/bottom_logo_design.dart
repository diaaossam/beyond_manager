import 'package:bond/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../core/utils/app_size.dart';

class BottomLogoDesign extends StatelessWidget {
  const BottomLogoDesign({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: SizeConfig.bodyHeight * .08),
      alignment: AlignmentDirectional.bottomCenter,
      child: SizedBox(
        width: SizeConfig.screenWidth * .5,
        child: SvgPicture.asset(Assets.icons.splash3),
      ),
    );
  }
}

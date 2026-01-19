import 'package:bond/features/auth/presentation/widgets/login/login_form_design.dart';
import 'package:bond/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import '../../../../../config/helper/keyboard.dart';
import '../../../../../core/utils/app_size.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => KeyboardUtil.hideKeyboard(context),
      child: Stack(
        children: [
          Positioned.directional(
            start: 0,
            textDirection: TextDirection.ltr,
            child: Padding(
              padding: EdgeInsets.only(top: SizeConfig.bodyHeight * .46),
              child: Image.asset(Assets.images.bottomLogin.path),
            ),
          ),
          Positioned.directional(
            top: 0,
            end: 0,
            textDirection: TextDirection.ltr,
            child: Image.asset(Assets.images.topLogin.path),
          ),
          LoginFormDesign(),
        ],
      ),
    );
  }
}

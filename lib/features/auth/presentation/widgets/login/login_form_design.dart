import 'package:bond/core/extensions/color_extensions.dart';
import 'package:bond/features/auth/auth_helper.dart';
import 'package:bond/gen/assets.gen.dart';
import 'package:bond/widgets/image_picker/app_image.dart';
import 'package:flutter/material.dart';
import '../../../../../core/extensions/app_localizations_extension.dart';
import '../../../../../core/utils/app_size.dart';
import '../../../../../widgets/main_widget/app_text.dart';
import '../../../../../widgets/main_widget/custom_button.dart';
import '../../../../../widgets/phone_text_form_field.dart';
import 'login_button.dart';

class LoginFormDesign extends StatelessWidget {
  const LoginFormDesign({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: screenPadding(),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: SizeConfig.bodyHeight * .15),
            AppImage.asset(
              Assets.images.beyondManagerLogo1.path,
              height: SizeConfig.bodyHeight * .12,
            ),
            SizedBox(height: SizeConfig.bodyHeight * .1),
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
              color: context.colorScheme.scrim,
            ),
            SizedBox(height: SizeConfig.bodyHeight * .07),
            Align(
              alignment: AlignmentDirectional.topStart,
              child: AppText(
                text: context.localizations.enterPhoneNumber,
                textSize: 14,
                color: Colors.black,
              ),
            ),
            SizedBox(height: SizeConfig.bodyHeight * .01),
            LoginButtonDesign(),
            SizedBox(height: SizeConfig.bodyHeight * .02),
            CustomButton(
              isActive: true,
              text: context.localizations.requestDemo,
              borderColor: const Color(0xfffeefe7),
              backgroundColor: const Color(0xfffeefe7),
              textColor: const Color(0xffed7b3b),
              press: () => AuthHelper().showRequestDemoForm(context: context),
            ),
            SizedBox(height: SizeConfig.bodyHeight * .04),
          ],
        ),
      ),
    );
  }
}

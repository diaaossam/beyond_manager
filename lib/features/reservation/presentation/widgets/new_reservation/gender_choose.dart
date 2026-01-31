import 'package:bond/core/extensions/app_localizations_extension.dart';
import 'package:bond/core/enum/gender.dart';
import 'package:bond/core/extensions/color_extensions.dart';
import 'package:bond/gen/assets.gen.dart';
import 'package:bond/widgets/image_picker/app_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../core/utils/app_assets.dart';
import 'package:bond/config/theme/app_colors.dart';
import '../../../../../core/utils/app_size.dart';
import 'package:bond/widgets/main_widget/app_text.dart';
import 'circle_toggle_button.dart';

class GenderChoose extends StatefulWidget {
  final Function(GenderEnum?) onSelected;

  const GenderChoose({super.key, required this.onSelected});

  @override
  State<GenderChoose> createState() => _GenderChooseState();
}

class _GenderChooseState extends State<GenderChoose> {
  GenderEnum? genderEnum;
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: SizeConfig.bodyHeight * .01),
        Row(
          children: [
            SizedBox(width: SizeConfig.screenWidth * .028),
            Container(
              height: SizeConfig.bodyHeight * .073,
              width: SizeConfig.bodyHeight * .073,
              padding: const EdgeInsets.all(12),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xffFDEEE6),
              ),
              child: AppImage.asset(
                Assets.icons.gender,
                color: context.colorScheme.primary,
              ),
            ),
            SizedBox(width: SizeConfig.screenWidth * .06),
            AppText(
              text: context.localizations.doctorGender,
              fontWeight: FontWeight.w600,
            ),
          ],
        ),
        SizedBox(height: SizeConfig.bodyHeight * .01),
        Row(
          children: [
            GestureDetector(
              onTap: () {
                if (genderEnum == GenderEnum.male) {
                  setState(() => genderEnum = null);
                  widget.onSelected(null);
                } else {
                  setState(() => genderEnum = GenderEnum.male);
                  widget.onSelected(GenderEnum.male);
                }
              },
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
              onTap: () {
                if (genderEnum == GenderEnum.female) {
                  setState(() => genderEnum = null);
                  widget.onSelected(null);
                } else {
                  setState(() => genderEnum = GenderEnum.female);
                  widget.onSelected(GenderEnum.female);
                }
              },
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
    );
  }
}

import 'package:bond/features/settings/presentation/cubit/settings_cubit.dart';
import 'package:bond/features/settings/contact_helper.dart';
import 'package:bond/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/extensions/app_localizations_extension.dart';
import '../../../../core/utils/app_size.dart';
import '../../../../widgets/arrow_expanded_forward.dart';
import '../../../../widgets/main_widget/app_text.dart';

class ContactUsWithUsWhatsAppWidget extends StatelessWidget {
  const ContactUsWithUsWhatsAppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final phone = context.read<SettingsCubit>().state.data?.emergency ?? "";
    return InkWell(
      onTap: () =>
          ContactHelper.contactUsWithWhatsApp(phoneNumber: phone.toString()),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.screenWidth * .02,
          vertical: SizeConfig.bodyHeight * .02,
        ),
        margin: EdgeInsets.symmetric(vertical: SizeConfig.bodyHeight * .015),
        decoration: BoxDecoration(
          color: const Color(0xfffefaf8),
          border: Border.all(color: const Color(0xffF4F4F4)),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(5),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xffFDEEE6),
              ),
              child: SvgPicture.asset((Assets.icons.whats)),
            ),
            SizedBox(width: SizeConfig.screenWidth * .02),
            Expanded(
              child: AppText(text: "${context.localizations.whats1}\n$phone"),
            ),
            const ArrowExpandedForwardDesign(),
            SizedBox(width: SizeConfig.screenWidth * .02),
          ],
        ),
      ),
    );
  }
}

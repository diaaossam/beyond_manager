import 'package:auto_route/auto_route.dart';
import 'package:bond/config/router/app_router.gr.dart';
import 'package:bond/features/settings/presentation/cubit/settings_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/extensions/app_localizations_extension.dart';
import '../../../../core/utils/app_size.dart';
import '../../../../widgets/app_bar/custom_app_bar.dart';
import '../../../../widgets/main_widget/app_text.dart';

@RoutePage()
class ComplaintScreen extends StatelessWidget {
  const ComplaintScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: context.localizations.complaint),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth * .04),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: SizeConfig.bodyHeight * .06),
            AppText(
              text: context.localizations.complaint1,
              maxLines: 30,
              textSize: 18,
            ),
            AppText(
              text:
                  context.read<SettingsCubit>().state.data?.complaintsEmail ??
                  "",
              maxLines: 30,
              color: Colors.blue,
              textSize: 18,
            ),
            SizedBox(height: SizeConfig.bodyHeight * .02),

            SizedBox(height: SizeConfig.bodyHeight * .02),
            AppText(
              text: context.localizations.complaint3,
              maxLines: 30,
              textSize: 18,
            ),
            SizedBox(height: SizeConfig.bodyHeight * .02),
            AppText(
              text: context.localizations.complaint4,
              maxLines: 30,
              textSize: 18,
            ),
            SizedBox(height: SizeConfig.bodyHeight * .02),
            AppText(
              text: context.localizations.complaint5,
              maxLines: 30,
              textSize: 18,
            ),
            InkWell(
              onTap: () => context.router.push(
                PdfViewRoute(
                  url: context.read<SettingsCubit>().state.data?.pdfLink ?? "",
                ),
              ),
              child: AppText(
                text: context.read<SettingsCubit>().state.data?.pdfLinkUi ?? "",
                maxLines: 30,
                color: Colors.blue,
                textSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:bond/core/extensions/color_extensions.dart';
import 'package:bond/features/network/presentation/widgets/search_result/search_result_ttf.dart';
import 'package:bond/widgets/main_widget/back_widget.dart';
import 'package:flutter/material.dart';

import '../../../../core/extensions/app_localizations_extension.dart';
import '../../../../core/utils/app_size.dart';
import '../../../../widgets/main_widget/app_text.dart';

class SliverSearchAppBar extends StatelessWidget {
  final Widget bottom;
  const SliverSearchAppBar({super.key, required this.bottom});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: SizeConfig.bodyHeight * .05,
      floating: true,
      pinned: true,
      centerTitle: true,
      backgroundColor: context.colorScheme.surface,
      automaticallyImplyLeading: false,
      title: AppText(
        text: context.localizations.searchResults,
        fontWeight: FontWeight.w600,
        textSize: 14,
      ),
      leading: InkWell(
        onTap: () => Navigator.pop(context),
        child: const Padding(
          padding: EdgeInsets.all(18.0),
          child: BackArrowWidget(),
        ),
      ),
      bottom: PreferredSize(
        preferredSize: Size(SizeConfig.screenWidth, 100),
        child: bottom,
      ),
    );
  }
}

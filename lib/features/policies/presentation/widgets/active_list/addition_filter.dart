import 'package:beymanger/config/helper/locale_helper/app_localizations_extension.dart';
import 'package:beymanger/core/utils/app_colors.dart';
import 'package:beymanger/core/utils/app_strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_size.dart';
import '../../../../../widgets/app_text.dart';

class AdditionFilter extends StatelessWidget implements PreferredSizeWidget {
  final TabController tabController;
  final Function(int) onTap;
  final bool isAddition;

  const AdditionFilter(
      {super.key,
      required this.tabController,
      required this.onTap,
      required this.isAddition});

  @override
  Widget build(BuildContext context) {
    return TabBar(
      dividerColor: Colors.transparent,
      onTap: onTap,
      indicatorSize: TabBarIndicatorSize.tab,
      unselectedLabelColor: AppColors.black,
      labelColor: Colors.white,
      labelStyle: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w600,
        fontFamily: AppStrings.englishFont,
      ),
      indicator: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(8),
      ),
      controller: tabController,
      tabs: [
        Tab(
          text: context.localizations.allStatus,
        ),
        Tab(
          text: isAddition
              ? context.localizations.underAddition
              : context.localizations.underDeletion,
        ),
        Tab(
            text: isAddition
                ? context.localizations.added
                : context.localizations.deleted),
      ],
    );
  }

  @override
  Size get preferredSize => Size(double.infinity, SizeConfig.bodyHeight * .075);
}

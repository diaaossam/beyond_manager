import 'package:bond/core/extensions/color_extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../core/extensions/app_localizations_extension.dart';
import '../../../../../core/utils/app_size.dart';
import '../../../../../core/utils/app_strings.dart';

class MainActiveListFilter extends StatelessWidget
    implements PreferredSizeWidget {
  final TabController tabController;
  final Function(int) onTap;

  const MainActiveListFilter({
    super.key,
    required this.tabController,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ColoredTabBar(
      color: Colors.white,
      tabBar: TabBar(
        dividerColor: Colors.transparent,
        onTap: onTap,
        isScrollable: true,
        indicatorSize: TabBarIndicatorSize.tab,
        unselectedLabelColor: context.colorScheme.onSurface,
        labelColor: Colors.white,
        labelStyle: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          fontFamily: AppStrings.englishFont,
        ),
        indicator: BoxDecoration(
          color: context.colorScheme.primary,
          borderRadius: BorderRadius.circular(8),
        ),
        controller: tabController,
        tabs: [
          Tab(text: context.localizations.activeMembers),
          Tab(text: context.localizations.addition),
          Tab(text: context.localizations.deletion),
          Tab(text: context.localizations.analytics),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size(double.infinity, SizeConfig.bodyHeight * .075);
}

class ColoredTabBar extends ColoredBox implements PreferredSizeWidget {
  const ColoredTabBar({super.key, required this.color, required this.tabBar})
    : super(color: color, child: tabBar);

  @override
  final Color color;
  final TabBar tabBar;

  @override
  Size get preferredSize => tabBar.preferredSize;
}

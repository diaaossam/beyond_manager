import 'package:beymanger/config/helper/locale_helper/app_localizations_extension.dart';
import 'package:beymanger/core/utils/app_colors.dart';
import 'package:beymanger/core/utils/app_strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_size.dart';
import '../../../../../widgets/app_text.dart';

/*class MainActiveListFilter extends StatelessWidget {
  MainActiveListFilter({super.key});

  final ValueNotifier<num> valueListenable = ValueNotifier<num>(0);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: valueListenable,
      builder: (context, value, child) {
        return CupertinoSlidingSegmentedControl(
            backgroundColor: AppColors.lightGrey,
            padding: const EdgeInsets.all(8),
            thumbColor: AppColors.primary,
            children: {
              0: Container(
                width: SizeConfig.screenWidth,
                padding: EdgeInsets.symmetric(
                  vertical: SizeConfig.bodyHeight * .015,
                ),
                child: Center(
                  child: AppText(
                    text: context.localizations.activeMembers,
                    fontWeight: FontWeight.w600,
                    color: value == 0 ? Colors.white : Colors.black,
                  ),
                ),
              ),
              1: Container(
                width: SizeConfig.screenWidth,
                padding: EdgeInsets.symmetric(
                  vertical: SizeConfig.bodyHeight * .015,
                ),
                child: Center(
                  child: AppText(
                    text: context.localizations.addition,
                    fontWeight: FontWeight.w600,
                    color: value == 1 ? Colors.white : Colors.black,
                  ),
                ),
              ),
              2: Container(
                width: SizeConfig.screenWidth,
                padding: EdgeInsets.symmetric(
                  vertical: SizeConfig.bodyHeight * .015,
                ),
                child: Center(
                  child: AppText(
                    text: context.localizations.deletion,
                    fontWeight: FontWeight.w600,
                    color: value == 2 ? Colors.white : Colors.black,
                  ),
                ),
              ),
              3: Container(
                width: SizeConfig.screenWidth,
                padding: EdgeInsets.symmetric(
                  vertical: SizeConfig.bodyHeight * .015,
                ),
                child: Center(
                  child: AppText(
                    text: context.localizations.analytics,
                    fontWeight: FontWeight.w600,
                    color: value == 2 ? Colors.white : Colors.black,
                  ),
                ),
              ),
            },
            groupValue: value,
            onValueChanged: (value) => valueListenable.value = value!);
      },
    );
  }


}*/

class MainActiveListFilter extends StatelessWidget
    implements PreferredSizeWidget {
  final TabController tabController;
  final Function(int) onTap;

  const MainActiveListFilter(
      {super.key, required this.tabController,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ColoredTabBar(
      color: Colors.white,
      tabBar: TabBar(
        dividerColor: Colors.transparent,
        onTap: onTap,
        isScrollable: true,
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
            text: context.localizations.activeMembers,
          ),
          Tab(
            text: context.localizations.addition,
          ),
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

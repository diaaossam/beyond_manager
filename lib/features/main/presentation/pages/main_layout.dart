import 'package:auto_route/auto_route.dart';
import 'package:bond/config/router/app_router.gr.dart';
import 'package:bond/core/extensions/app_localizations_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/enum/nav_enum.dart';
import '../../../../core/extensions/color_extensions.dart';
import '../../../../core/utils/app_constant.dart';
import '../../../../widgets/image_picker/app_image.dart';

@RoutePage()
class MainLayoutScreen extends StatefulWidget {
  const MainLayoutScreen({super.key});

  @override
  State<MainLayoutScreen> createState() => _MainLayoutScreenState();
}

class _MainLayoutScreenState extends State<MainLayoutScreen> {
  DateTime? currentBackPressTime;

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: [
        HomeRoute(),
        MyEmergencyRoute(),
        PoliciesRoute(),
        ProfileRoute(),
      ],
      bottomNavigationBuilder: (context, tabsRouter) {
        return BottomNavigationBar(
          onTap: (value) => tabsRouter.setActiveIndex(value),
          currentIndex: tabsRouter.activeIndex,
          elevation: 10,
          unselectedItemColor: context.colorScheme.shadow,
          showUnselectedLabels: true,
          showSelectedLabels: true,
          items: UserNavItem.values.asMap().entries.map((entry) {
            final e = entry.value;
            return BottomNavigationBarItem(
              label: e.title,
              activeIcon: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 20.w,
                    height: 3.h,
                    color: context.colorScheme.primary,
                  ),
                  SizedBox(height: 4.h),
                  AppImage.asset(e.icons, color: context.colorScheme.primary),
                ],
              ),
              icon: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 20.w,
                    height: 1.h,
                    color: Colors.transparent,
                  ),
                  SizedBox(height: 4.h),
                  AppImage.asset(e.icons, color: context.colorScheme.shadow),
                ],
              ),
            );
          }).toList(),
        );
      },
    );
  }
}

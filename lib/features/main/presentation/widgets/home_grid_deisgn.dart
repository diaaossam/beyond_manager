import 'package:auto_route/auto_route.dart';
import 'package:bond/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import '../../../../core/extensions/app_localizations_extension.dart';
import '../../../../core/utils/app_size.dart';
import '../../data/models/generic_home_items.dart';
import 'hom_grid_item.dart';

class HomeGridDesign extends StatefulWidget {
  const HomeGridDesign({super.key});

  @override
  State<HomeGridDesign> createState() => _HomeGridDesignState();
}

class _HomeGridDesignState extends State<HomeGridDesign> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth * .04),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: homeEntityList(context).length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 1.1,
          crossAxisCount: 2,
          crossAxisSpacing: SizeConfig.screenWidth * .02,
          mainAxisSpacing: SizeConfig.bodyHeight * .03,
        ),
        itemBuilder: (context, index) => CustomItemHome(
          title: homeEntityList(context)[index].title,
          icon: homeEntityList(context)[index].icon,
          onPress: homeEntityList(context)[index].press,
        ),
      ),
    );
  }

  List<GenericHomeItems> homeEntityList(BuildContext context) {
    List<GenericHomeItems> homeEntityList = [];
    homeEntityList = [
      GenericHomeItems(
        title: context.localizations.emergencySupport2,
        press: () => context.tabsRouter.setActiveIndex(1),
        icon: Assets.icons.emergencySupport,
      ),
      GenericHomeItems(
        title: context.localizations.insurancePolicies2,
        press: () => context.tabsRouter.setActiveIndex(2),
        icon: Assets.icons.policies,
      ),
      GenericHomeItems(
        title: context.localizations.sickLeaveService,
        press: () {
          /* AppConstant.navigateTo(
          context: context,
          widget: const SickLeaveActiveList(),
        );*/
        },
        icon: Assets.icons.sick,
      ),
      GenericHomeItems(
        title: context.localizations.getCovered,
        press: () {
          /*  AppConstant.navigateTo(
          context: context,
          widget: const OtherLineScreen(),
        );*/
        },
        icon: Assets.icons.other,
      ),
    ];
    return homeEntityList;
  }
}

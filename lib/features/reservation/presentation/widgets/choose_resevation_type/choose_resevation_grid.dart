import 'package:bond/core/extensions/app_localizations_extension.dart';
import 'package:bond/core/utils/app_size.dart';
import 'package:bond/features/main/data/models/generic_home_items.dart';
import 'package:bond/features/main/presentation/widgets/hom_grid_item.dart';
import 'package:bond/features/reservation/presentation/pages/new_reservation_screen.dart';
import 'package:bond/features/reservation/presentation/pages/my_reservation_screen.dart';
import 'package:bond/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class DoctorReservationGridDesign extends StatelessWidget {
  const DoctorReservationGridDesign({super.key});

  List<GenericHomeItems> doctorReservationList(BuildContext context) {
    return [
      GenericHomeItems(
        title: context.localizations.newReservation,
        icon: Assets.icons.newReservation,
        press: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const NewReservationScreen()),
        ),
      ),
      GenericHomeItems(
        title: context.localizations.myReservation,
        icon: Assets.icons.myReservation,
        press: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const MyReservationScreen()),
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final items = doctorReservationList(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth * .04),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: items.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 1.1,
            crossAxisCount: items.length,
            crossAxisSpacing: SizeConfig.screenWidth * .02,
            mainAxisSpacing: SizeConfig.bodyHeight * .03),
        itemBuilder: (context, index) => CustomItemHome(
          title: items[index].title,
          icon: items[index].icon,
          onPress: items[index].press,
        ),
      ),
    );
  }
}

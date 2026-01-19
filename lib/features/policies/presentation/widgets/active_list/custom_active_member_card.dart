import 'package:beymanger/core/utils/app_size.dart';
import 'package:beymanger/features/policies/data/models/active_list_policy_model.dart';
import 'package:beymanger/widgets/app_text.dart';
import 'package:flutter/material.dart';

class CustomActiveMemberCardExpanded extends StatelessWidget {
  final ActiveListResult result;

  const CustomActiveMemberCardExpanded({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: SizeConfig.bodyHeight * .03,
          horizontal: SizeConfig.bodyHeight * .02),
      decoration: BoxDecoration(
        color: const Color(0xffFEFAF8),
        border: Border.all(color: const Color(0xffEAEAEA)),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
              text: "Item : ${result.name.toString()}",
              fontWeight: FontWeight.bold,
              maxLines: 2,
              textSize: 14),
          SizedBox(height: SizeConfig.bodyHeight * .01),
          AppText(text: "Description: ${result.value.toString()}"),
        ],
      ),
    );
  }
}

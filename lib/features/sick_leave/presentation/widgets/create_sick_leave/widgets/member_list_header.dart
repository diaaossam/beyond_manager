import 'package:flutter/material.dart';
import '../../../../../../core/extensions/app_localizations_extension.dart';
import '../../../../../../core/utils/app_size.dart';
import '../../../../../../widgets/main_widget/app_text.dart';

class MemberListHeader extends StatelessWidget {
  final int? totalMembers;

  const MemberListHeader({
    super.key,
    this.totalMembers,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.screenWidth * .04,
      ),
      sliver: SliverToBoxAdapter(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppText(
              text: context.localizations.chooseMember,
              fontWeight: FontWeight.bold,
            ),
            const Spacer(),
            if (totalMembers != null)
              AppText(
                text: "${context.localizations.totalMembers}: $totalMembers",
              ),
          ],
        ),
      ),
    );
  }
}

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import '../../../../../../core/extensions/color_extensions.dart';
import '../../../../../../core/utils/app_size.dart';
import '../../../../../../widgets/main_widget/app_text.dart';
import '../../../../../policies/data/models/response/active_list_model.dart';

class MemberListItem extends StatelessWidget {
  final Result member;
  final int index;
  final bool isSelected;
  final ValueChanged<int> onSelected;

  const MemberListItem({
    super.key,
    required this.member,
    required this.index,
    required this.isSelected,
    required this.onSelected,
  });

  String _getInitials(String name) {
    if (name.isEmpty) return "";
    final parts = name.trim().split(' ');
    if (parts.length >= 2) {
      return "${parts[0][0]}${parts[1][0]}".toUpperCase();
    }
    return name[0].toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;

    return FadeInLeft(
      duration: Duration(milliseconds: 300 + (index * 50)),
      delay: const Duration(milliseconds: 50),
      from: 20,
      child: InkWell(
        onTap: () => onSelected(index),
        child: Container(
          margin: EdgeInsets.symmetric(
            vertical: SizeConfig.bodyHeight * .01,
            horizontal: SizeConfig.screenWidth * .04,
          ),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: isSelected
                ? colorScheme.primary.withValues(alpha: 0.1)
                : Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: isSelected ? colorScheme.primary : Colors.grey.shade200,
              width: isSelected ? 2 : 1,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.05),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _MemberAvatar(
                initials: _getInitials(member.member ?? ""),
                backgroundColor: colorScheme.primary,
              ),
              SizedBox(width: SizeConfig.screenWidth * .03),
              Expanded(
                child: _MemberInfo(member: member),
              ),
              AbsorbPointer(
                absorbing: true,
                child: Radio<int>(
                  value: index,
                  groupValue: isSelected ? index : null,
                  onChanged: (_) {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _MemberAvatar extends StatelessWidget {
  final String initials;
  final Color backgroundColor;

  const _MemberAvatar({
    required this.initials,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: backgroundColor,
      radius: 25,
      child: AppText(
        textSize: 14,
        fontWeight: FontWeight.w600,
        text: initials,
        color: Colors.white,
      ),
    );
  }
}

class _MemberInfo extends StatelessWidget {
  final Result member;

  const _MemberInfo({required this.member});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          text: member.member ?? "",
          fontWeight: FontWeight.w600,
          textSize: 13,
        ),
        SizedBox(height: SizeConfig.bodyHeight * .01),
        if (member.insuranceID != null)
          AppText(
            text: "Insurance: ${member.insuranceID}",
            textSize: 12,
            color: Colors.grey.shade600,
          ),
        if (member.staff != null) ...[
          SizedBox(height: SizeConfig.bodyHeight * .005),
          AppText(
            text: "Staff: ${member.staff}",
            textSize: 12,
            color: Colors.grey.shade600,
          ),
        ],
      ],
    );
  }
}

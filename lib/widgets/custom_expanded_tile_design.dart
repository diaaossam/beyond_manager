import 'package:bond/gen/assets.gen.dart';
import 'package:bond/widgets/image_picker/app_image.dart';
import 'package:flutter/material.dart';

import 'custom_divider_design.dart';

class CustomExpandedTile extends StatefulWidget {
  final Widget title;
  final Widget body;

  const CustomExpandedTile({
    super.key,
    required this.title,
    required this.body,
  });

  @override
  State<CustomExpandedTile> createState() => CustomExpandedTileState();
}

class CustomExpandedTileState extends State<CustomExpandedTile>
    with SingleTickerProviderStateMixin {
  bool _isExpanded = false;

  void _toggle() => setState(() => _isExpanded = !_isExpanded);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOutCubic,
      decoration: BoxDecoration(
        color: theme.colorScheme.secondary,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.05),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
        border: Border.all(color: theme.colorScheme.outline.withOpacity(.4)),
      ),
      child: Column(
        children: [
          InkWell(
            borderRadius: BorderRadius.circular(16),
            onTap: _toggle,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  Expanded(child: widget.title),
                  const SizedBox(width: 8),
                  AnimatedRotation(
                    turns: _isExpanded ? .5 : 0,
                    duration: const Duration(milliseconds: 250),
                    curve: Curves.easeOut,
                    child: AppImage.asset(Assets.icons.arrowDown),
                  ),
                ],
              ),
            ),
          ),

          /// body animation
          AnimatedSize(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOutCubic,
            child: _isExpanded
                ? Column(
                    children: const [
                      CustomDividerDesign(),
                      SizedBox(height: 8),
                    ],
                  )
                : const SizedBox(),
          ),

          AnimatedSize(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOutCubic,
            child: _isExpanded
                ? Padding(
                    padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
                    child: widget.body,
                  )
                : const SizedBox(),
          ),
        ],
      ),
    );
  }
}

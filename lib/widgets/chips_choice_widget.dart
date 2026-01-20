import 'package:bond/core/extensions/color_extensions.dart';
import 'package:chips_choice/chips_choice.dart';
import 'package:flutter/material.dart';

import '../core/utils/app_size.dart';

/*
class ChipsChoiceWidget<T> extends StatelessWidget {
  final List<T> items;
  final T? selectedItem;
  final EdgeInsetsGeometry? padding;
  final String Function(T item) labelBuilder;
  final ValueChanged<T> onSelected;

  const ChipsChoiceWidget({
    super.key,
    required this.items,
    required this.labelBuilder,
    required this.onSelected,
    this.selectedItem,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          padding ??
          EdgeInsets.symmetric(
            vertical: SizeConfig.bodyHeight * .02,
          ),
      child: ChipsChoice<T>.single(
        onChanged: onSelected,
        value: selectedItem,
        choiceCheckmark: true,

        choiceItems: C2Choice.listFrom<T, T>(
          source: items,
          value: (index, item) => item,
          label: (index, item) => labelBuilder(item),

        ),
      ),
    );
  }
}
*/

class ChipsChoiceWidget<T> extends StatelessWidget {
  final List<T> items;
  final T? selectedItem;
  final EdgeInsetsGeometry? padding;
  final String Function(T item) labelBuilder;
  final ValueChanged<T> onSelected;

  const ChipsChoiceWidget({
    super.key,
    required this.items,
    required this.labelBuilder,
    required this.onSelected,
    this.selectedItem,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          padding ,
      child: ChipsChoice<T>.single(
        value: selectedItem,
        onChanged: onSelected,
        choiceCheckmark: true,
        choiceStyle: C2ChipStyle.filled(
          color: context.colorScheme.surface,
          borderWidth: 2,
          borderStyle: BorderStyle.solid,
          selectedStyle: C2ChipStyle.filled(
            color: context.colorScheme.primary,
            foregroundColor: context.colorScheme.onPrimary,
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            elevation: 2,
            shadowColor: context.colorScheme.primary.withOpacity(.3),
          ),
        ),
        choiceItems: C2Choice.listFrom<T, T>(
          source: items,
          value: (i, e) => e,
          label: (i, e) => labelBuilder(e),
        ),
      ),
    );
  }
}

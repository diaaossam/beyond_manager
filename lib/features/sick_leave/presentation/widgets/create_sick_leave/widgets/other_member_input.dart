import 'package:flutter/material.dart';
import '../../../../../../core/extensions/app_localizations_extension.dart';
import '../../../../../../core/utils/app_size.dart';
import '../../../../../../widgets/custom_search_text_form_field.dart';

class OtherMemberInput extends StatelessWidget {
  final void Function(String? value) onChanged;

  const OtherMemberInput({
    super.key,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: screenPadding(),
      sliver: SliverToBoxAdapter(
        child: CustomSearchTextFormField(
          prefixIcon: Icons.add,
          hintText: context.localizations.other,
          onChange: onChanged,
        ),
      ),
    );
  }
}

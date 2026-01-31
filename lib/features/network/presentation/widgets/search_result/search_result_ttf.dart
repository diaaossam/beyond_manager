import 'package:bond/core/extensions/app_localizations_extension.dart';
import 'package:bond/config/theme/theme_helper.dart';
import 'package:bond/gen/assets.gen.dart';
import 'package:bond/widgets/image_picker/app_image.dart';
import 'package:flutter/material.dart';

class SearchResultTff extends StatelessWidget {
  final Function(String)? onChanged;

  SearchResultTff({super.key,this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: context.localizations.searchByName,
        border: border,
        enabledBorder: border,
        focusedBorder: border,
        errorBorder: border,
        focusedErrorBorder: border,
        filled: true,
        fillColor: const Color(0xffF3F3F3),
        prefixIcon: Padding(
          padding: const EdgeInsets.all(12.0),
          child: AppImage.asset(Assets.icons.search2),
        ),
        hintStyle: ThemeHelper().hintTFFTextStyle(
          color: const Color(0xffCACACA),
        ),
      ),
    );
  }

  final border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: const BorderSide(color: Color(0xffEDEDED)),
  );
}

import 'package:beymanger/core/utils/app_colors.dart';
import 'package:beymanger/core/utils/app_size.dart';
import 'package:beymanger/core/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomSearchTextFormField extends StatefulWidget {
  final TextInputType? type;
  final FormFieldValidator<String>? validate;
  final VoidCallback? onTap;
  final void Function(String?)? onChange;
  final TextEditingController? controller;
  final IconData? suffixIcon;
  final String? labelText;
  final String? hintText;
  final IconData? prefixIcon;
  final TextAlign align;
  final Color? prefixIconColor;
  final bool? isEnable;
  final List<TextInputFormatter>? limits;
  final int? maxLines;
  final double? textSize;

  const CustomSearchTextFormField({
    super.key,
    this.type = TextInputType.text,
    this.validate,
    this.onChange,
    this.limits,
    this.textSize,
    this.align = TextAlign.start,
    this.onTap,
    this.maxLines = 1,
    this.suffixIcon,
    this.controller,
    this.isEnable = true,
    this.labelText,
    this.prefixIconColor,
    this.hintText,
    this.prefixIcon,
  });

  @override
  State<CustomSearchTextFormField> createState() =>
      _CustomSearchTextFormFieldState();
}

class _CustomSearchTextFormFieldState extends State<CustomSearchTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: const Color(0xffF4F4F4),
          borderRadius: BorderRadius.all(Radius.circular(SizeConfig.bodyHeight * .01))),
      child: TextFormField(
        textAlign: widget.align,
        showCursor: true,
        inputFormatters: widget.limits,
        controller: widget.controller,
        keyboardType: widget.type,
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
          fontFamily: AppStrings.englishFont,
          overflow: TextOverflow.ellipsis,
          color: Colors.black,
          fontSize: getProportionateScreenHeight(14.0),
        ),
        enabled: widget.isEnable,
        maxLines: widget.maxLines,
        validator: widget.validate,
        onChanged: widget.onChange,
        onTap: widget.onTap,
        decoration: InputDecoration(
          hintText: widget.hintText,
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xffF9F8F8),width: 1),
            borderRadius: BorderRadius.all(Radius.circular(SizeConfig.bodyHeight * .01)),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color:AppColors.lightGrey,width:1),
            borderRadius: BorderRadius.all(Radius.circular(SizeConfig.bodyHeight * .01)),
          ),
          errorStyle: TextStyle(color: AppColors.red),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.lightGrey, width: 1),
            borderRadius:
            BorderRadius.all(Radius.circular(SizeConfig.bodyHeight * .01)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.lightGrey,width: 1),
            borderRadius: BorderRadius.all(Radius.circular(SizeConfig.bodyHeight * .01)),
          ),
          labelText: widget.labelText,
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.lightGrey,width: 1),
            borderRadius: BorderRadius.all(Radius.circular(SizeConfig.bodyHeight * .01)),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.lightGrey,width: 1),
            borderRadius: BorderRadius.all(Radius.circular(SizeConfig.bodyHeight * .01)),
          ),
          hintStyle: TextStyle(
              fontSize: getProportionateScreenHeight(14.0),
              color: Color(0xff9A9A9A),
              fontFamily: AppStrings.arabicFont
          ),
          prefixIcon: widget.prefixIcon == null ? null : Icon(widget.prefixIcon!,color:Color(0xff9A9A9A)),
          floatingLabelBehavior: FloatingLabelBehavior.auto,
        ),
      ),
    );
  }
}

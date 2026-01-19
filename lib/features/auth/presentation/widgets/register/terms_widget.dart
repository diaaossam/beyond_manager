import 'package:auto_route/auto_route.dart';
import 'package:bond/config/router/app_router.gr.dart';
import 'package:bond/core/extensions/color_extensions.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../../../../core/extensions/app_localizations_extension.dart';
import '../../../../../core/utils/app_size.dart';
import '../../../../../core/utils/app_strings.dart';

class TermsRegisterWidget extends StatefulWidget {
  final Function(bool) onChanged;

  const TermsRegisterWidget({super.key, required this.onChanged});

  @override
  State<TermsRegisterWidget> createState() => _TermsRegisterWidgetState();
}

class _TermsRegisterWidgetState extends State<TermsRegisterWidget> {
  final ValueNotifier<bool> valueListenable = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: valueListenable,
      builder: (context, value, child) => Row(
        children: [
          GestureDetector(
            onTap: () {
              valueListenable.value = !valueListenable.value;
              widget.onChanged(valueListenable.value);
            },
            child: Container(
              height: SizeConfig.bodyHeight * .03,
              width: SizeConfig.bodyHeight * .03,
              decoration: BoxDecoration(
                color: valueListenable.value
                    ? context.colorScheme.primary
                    : null,
                border: Border.all(
                  color: valueListenable.value
                      ? Colors.transparent
                      : context.colorScheme.primary,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Visibility(
                visible: valueListenable.value,
                child:  Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: Icon(Icons.check,color: Colors.white,),
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: context.localizations.iAgreeWith,
                    style: mainTextStyle(context),
                  ),
                  const WidgetSpan(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 2),
                    ),
                  ),
                  TextSpan(
                    text: context.localizations.termsAndConditions,
                    style: termsTextStyle(context),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => context.router.push(TermsRoute()),
                  ),
                  const WidgetSpan(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 2),
                    ),
                  ),
                  TextSpan(
                    text: context.localizations.and,
                    style: mainTextStyle(context),
                  ),
                  const WidgetSpan(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 2),
                    ),
                  ),
                  TextSpan(
                    text: context.localizations.privacyPolicy,
                    style: termsTextStyle(context),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => context.router.push(TermsRoute()),
                  ),

                  const WidgetSpan(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 2),
                    ),
                  ),
                  TextSpan(
                    text: context.localizations.app,
                    style: mainTextStyle(context),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  TextStyle mainTextStyle(BuildContext context) =>
      Theme.of(context).textTheme.bodyMedium!.copyWith(
        fontFamily: AppStrings.arabicFont,
        overflow: TextOverflow.ellipsis,
        color: context.colorScheme.onSurface,
        fontSize: 12,
        fontWeight: FontWeight.w400,
      );

  TextStyle termsTextStyle(BuildContext context) =>
      Theme.of(context).textTheme.bodyMedium!.copyWith(
        fontFamily: AppStrings.arabicFont,
        overflow: TextOverflow.ellipsis,
        fontWeight: FontWeight.w600,
        color: context.colorScheme.primary,
        fontSize: 12,
      );
}

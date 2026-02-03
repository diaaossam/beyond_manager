import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../../../../../core/extensions/app_localizations_extension.dart';
import '../../../../../core/extensions/color_extensions.dart';
import '../../../../../core/utils/app_size.dart';
import '../../../../../widgets/main_widget/app_text.dart';
import '../../../../../widgets/main_widget/custom_button.dart';
import '../../../data/models/manual_entry_params.dart';
import 'member_form_design.dart';

class ManualEntryBody extends StatefulWidget {
  const ManualEntryBody({super.key});

  @override
  State<ManualEntryBody> createState() => _ManualEntryBodyState();
}

class _ManualEntryBodyState extends State<ManualEntryBody> {
  List<MemberFormData> members = [MemberFormData()];
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: _formKey,
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: screenPadding(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: SizeConfig.bodyHeight * .02),
                    AppText(
                      text: context.localizations.fillOutMemberDetails,
                      fontWeight: FontWeight.w400,
                      textSize: 12,
                      color: context.colorScheme.shadow,
                      align: TextAlign.center,
                      maxLines: 2,
                    ),
                    SizedBox(height: SizeConfig.bodyHeight * .03),
                    Container(
                      padding: EdgeInsets.all(SizeConfig.screenWidth * .04),
                      decoration: BoxDecoration(
                        color: context.colorScheme.scrim.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(8),
                        border:  BorderDirectional(
                          start: BorderSide(
                            color: context.colorScheme.scrim,
                            width: 4,
                          ),
                        ),
                      ),
                      child: Row(
                        children: [
                           Icon(
                            Icons.folder_outlined,
                            color: context.colorScheme.scrim,
                            size: 20,
                          ),
                          const SizedBox(width: 12),
                          AppText(
                            text: context.localizations.selectedPolicies,
                            fontWeight: FontWeight.w600,
                            textSize: 12,
                            color: context.colorScheme.shadow,
                          ),
                          const SizedBox(width: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: context.colorScheme.surface,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color:  context.colorScheme.scrim,
                                width: 1,
                              ),
                            ),
                            child: AppText(
                              text: context.localizations.medicalInsurance,
                              fontWeight: FontWeight.w600,
                              textSize: 11,
                              color: context.colorScheme.scrim,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: SizeConfig.bodyHeight * .02),
                    Container(
                      padding: EdgeInsets.all(SizeConfig.screenWidth * .04),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFFBEB),
                        borderRadius: BorderRadius.circular(8),
                        border: const Border(
                          left: BorderSide(
                            color: Color(0xFFF59E0B),
                            width: 4,
                          ),
                        ),
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.lightbulb_outline,
                            color: Color(0xFFF59E0B),
                            size: 20,
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: RichText(
                              text: TextSpan(
                                style: const TextStyle(
                                  fontSize: 13,
                                  color: Color(0xFF78350F),
                                  height: 1.4,
                                ),
                                children: [
                                  TextSpan(
                                    text: context.localizations.tip,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  TextSpan(
                                    text: context
                                        .localizations
                                        .allDataValidatedInstantly,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: SizeConfig.bodyHeight * .03),
                    ...members.asMap().entries.map((entry) {
                      int index = entry.key;
                      MemberFormData member = entry.value;
                      return MemberFormDesign(
                        index: index,
                        member: member,
                        onRemove: members.length > 1
                            ? () {
                                setState(() {
                                  members.removeAt(index);
                                });
                              }
                            : null,
                      );
                    }),
                    Center(
                      child: CustomButton.outline(
                        text: context.localizations.addAnotherMember,
                        press: () {
                          setState(() {
                            members.add(MemberFormData());
                          });
                        },
                        iconData: Icons.add,
                        width: SizeConfig.screenWidth * 0.6,
                        borderColor: context.colorScheme.outline,
                        textColor: context.colorScheme.onSurface,
                      ),
                    ),
                    SizedBox(height: SizeConfig.bodyHeight * .03),
                  ],
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(SizeConfig.screenWidth * .04),
            child: Row(
              children: [
                Expanded(
                  child: CustomButton.outline(
                    text: context.localizations.back,
                    press: () {
                      context.router.back();
                    },
                    borderColor: context.colorScheme.outline,
                    textColor: context.colorScheme.onSurface,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  flex: 2,
                  child: CustomButton(
                    text: context.localizations.submitRequest,
                    iconData: Icons.check,
                    press: () {
                      // TODO: Validate and submit
                      if (_formKey.currentState?.saveAndValidate() ??
                          false) {
                        print(
                          "Submit request with ${members.length} members",
                        );
                        print(_formKey.currentState?.value);
                      } else {
                        print("Validation failed");
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

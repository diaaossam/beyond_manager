import 'package:beymanger/config/helper/locale_helper/app_localizations_extension.dart';
import 'package:beymanger/core/utils/app_assets.dart';
import 'package:beymanger/core/utils/app_colors.dart';
import 'package:beymanger/features/policies/policies_helper.dart';
import 'package:beymanger/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../../../../core/utils/app_size.dart';
import '../../../../../widgets/app_text.dart';
import '../../../../../widgets/custom_button.dart';

class DatePickerDesign extends StatefulWidget {
  final bool isSingle;
  final Function(Map<String, dynamic> map) date;

  const DatePickerDesign(
      {super.key, required this.isSingle, required this.date});

  @override
  State<DatePickerDesign> createState() => _DatePickerDesignState();
}

class _DatePickerDesignState extends State<DatePickerDesign> {
  DateTime? _selectedFirstDate;
  DateTime? _selectedLastDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: screenPadding(),
        child: Column(
          children: [
            SizedBox(
              height: SizeConfig.bodyHeight * .04,
            ),
            HeaderDesign(
              title: context.localizations.chooseFromAndLandDate,
            ),
            SizedBox(
              height: SizeConfig.bodyHeight * .02,
            ),
            Expanded(
              child: Theme(
                data: ThemeData(useMaterial3: true),
                child: SfDateRangePicker(
                  onSelectionChanged: (value) {
                    if (widget.isSingle) {
                      setState(() => _selectedFirstDate = value.value);
                    } else {
                      PickerDateRange range = value.value;
                      setState(() {
                        _selectedFirstDate = range.startDate;
                        _selectedLastDate = range.endDate;
                      });
                    }
                  },
                  backgroundColor: Colors.transparent,
                  navigationMode: DateRangePickerNavigationMode.scroll,
                  enablePastDates: false,
                  allowViewNavigation: true,
                  headerStyle: DateRangePickerHeaderStyle(backgroundColor: AppColors.onPrimary),
                  selectionMode:DateRangePickerSelectionMode.range,
                  enableMultiView: true,
                  showNavigationArrow: true,
                  navigationDirection:
                      DateRangePickerNavigationDirection.vertical,
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: IgnorePointer(
                    ignoring: true,
                    child: CustomTextFormField(
                      controller: TextEditingController(
                          text: _selectedFirstDate != null
                              ? PoliciesHelper()
                                  .formatDate(date: _selectedFirstDate!)
                              : null),
                      suffixIcon: AppAssets.calender,
                      hintText: context.localizations.fromDate,
                    ),
                  ),
                ),
                SizedBox(width: SizeConfig.screenWidth*.02,),
                Expanded(
                  child: IgnorePointer(
                    ignoring: true,
                    child: CustomTextFormField(
                      controller: TextEditingController(
                          text: _selectedLastDate != null
                              ? PoliciesHelper()
                              .formatDate(date: _selectedLastDate!)
                              : null),
                      suffixIcon: AppAssets.calender,
                      hintText: context.localizations.toDate,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: SizeConfig.bodyHeight * .04,
            ),
            CustomButton(
                text: context.localizations.confirm,
                press: () {

                    widget.date({
                      "first": _selectedFirstDate,
                      "last": _selectedLastDate,
                    });
                  Navigator.pop(context);
                }),
            SizedBox(
              height: SizeConfig.bodyHeight * .04,
            ),
          ],
        ),
      ),
    );
  }
}

class HeaderDesign extends StatelessWidget {
  final String title;
  final VoidCallback? onDelete;

  const HeaderDesign({super.key, required this.title, this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: AppText(
          text: title,
          fontWeight: FontWeight.w500,
          textSize: 14,
        )),
        GestureDetector(
          onTap: onDelete ?? () => Navigator.pop(context),
          child: Container(
            padding: const EdgeInsets.all(5),
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: Colors.red),
            child: SvgPicture.asset(
              AppAssets.close,
              height: 10,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:bond/core/extensions/color_extensions.dart';
import 'package:bond/gen/assets.gen.dart';
import 'package:bond/widgets/image_picker/app_image.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import '../../../../../core/extensions/app_localizations_extension.dart';
import '../../../../../core/utils/app_size.dart';
import '../../../../../widgets/main_widget/app_text.dart';
import '../../../../../widgets/main_widget/custom_button.dart';
import '../../../../../widgets/main_widget/custom_text_form_field.dart';
import '../../policies_helper.dart';

class DatePickerDesign extends StatefulWidget {
  final bool isSingle;
  final Function(Map<String, dynamic> map) date;

  const DatePickerDesign({
    super.key,
    required this.isSingle,
    required this.date,
  });

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
            SizedBox(height: SizeConfig.bodyHeight * .04),
            HeaderDesign(title: context.localizations.chooseFromAndLandDate),
            SizedBox(height: SizeConfig.bodyHeight * .02),
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
                  headerStyle: DateRangePickerHeaderStyle(
                    backgroundColor: context.colorScheme.onPrimary,
                  ),
                  selectionMode: DateRangePickerSelectionMode.range,
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
                            ? PoliciesHelper().formatDate(
                                date: _selectedFirstDate!,
                              )
                            : null,
                      ),
                      suffixIcon: AppImage.asset(Assets.icons.calendar3),
                      hintText: context.localizations.fromDate,
                    ),
                  ),
                ),
                SizedBox(width: SizeConfig.screenWidth * .02),
                Expanded(
                  child: IgnorePointer(
                    ignoring: true,
                    child: CustomTextFormField(
                      controller: TextEditingController(
                        text: _selectedLastDate != null
                            ? PoliciesHelper().formatDate(
                                date: _selectedLastDate!,
                              )
                            : null,
                      ),
                      suffixIcon: AppImage.asset(Assets.icons.calendar3),
                      hintText: context.localizations.toDate,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: SizeConfig.bodyHeight * .04),
            CustomButton(
              text: context.localizations.confirm,
              press: () {
                widget.date({
                  "first": _selectedFirstDate,
                  "last": _selectedLastDate,
                });
                Navigator.pop(context);
              },
            ),
            SizedBox(height: SizeConfig.bodyHeight * .04),
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
          ),
        ),
        GestureDetector(
          onTap: onDelete ?? () => Navigator.pop(context),
          child: Container(
            padding: const EdgeInsets.all(5),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.red,
            ),
            child: AppImage.asset(
              Assets.icons.close,
              height: 10,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:bond/core/extensions/app_localizations_extension.dart';
import 'package:bond/core/extensions/color_extensions.dart';
import 'package:bond/core/utils/app_size.dart';
import 'package:bond/features/reservation/presentation/cubit/new_reservation/new_reservation_cubit.dart';
import 'package:bond/widgets/main_widget/app_text.dart';
import 'package:bond/widgets/main_widget/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import '../../../../../gen/assets.gen.dart';
import '../../../../../widgets/image_picker/app_image.dart';

class CustomDateExpandedList extends StatefulWidget {
  final Function(Map<String, dynamic>) onCallBack;

  const CustomDateExpandedList({super.key, required this.onCallBack});

  @override
  State<CustomDateExpandedList> createState() => _CustomDateExpandedListState();
}

class _CustomDateExpandedListState extends State<CustomDateExpandedList> {
  bool isExpanded = false;
  DateTime? _selectedFirstDate;
  DateTime? _selectedLastDate;
  TextEditingController from = TextEditingController();
  TextEditingController to = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewReservationCubit, BaseState<NewReservationData>>(
      builder: (context, state) {
        return ExpansionTile(
          onExpansionChanged: (value) => setState(() => isExpanded = value),
          leading: Container(
            height: SizeConfig.bodyHeight * .1,
            width: SizeConfig.bodyHeight * .1,
            padding: const EdgeInsets.all(12),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xffFDEEE6),
            ),
            child: AppImage.asset(
              Assets.icons.calendar3,
              color: context.colorScheme.primary,
            ),
          ),
          tilePadding: EdgeInsets.zero,
          childrenPadding: EdgeInsets.zero,
          title: AppText(
            text: context.localizations.date,
            fontWeight: FontWeight.w600,
          ),
          subtitle: AppText(text: context.localizations.selectDate),
          trailing: Container(
            margin: EdgeInsetsDirectional.only(
              end: SizeConfig.screenWidth * .02,
            ),
            child: isExpanded
                ? AppImage.asset(Assets.icons.arrowDown)
                : AppImage.asset(Assets.icons.arrowRight1),
          ),
          children: [
            Row(
              children: [
                SizedBox(width: SizeConfig.screenWidth * .04),
                Expanded(
                  child: IgnorePointer(
                    ignoring: true,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        AppText(text: context.localizations.from),
                        const SizedBox(height: 10),
                        CustomTextFormField(
                          controller: from,
                          suffixIcon: AppImage.asset(Assets.icons.calendar3),
                          hintText: formatDate(date: DateTime.now()),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: SizeConfig.screenWidth * .02),
                Expanded(
                  child: IgnorePointer(
                    ignoring: true,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        AppText(text: context.localizations.to),
                        const SizedBox(height: 10),
                        CustomTextFormField(
                          controller: to,
                          suffixIcon: SvgPicture.asset(Assets.icons.calendar3),
                          hintText: formatDate(date: DateTime.now()),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: SizeConfig.screenWidth * .04),
              ],
            ),
            SizedBox(height: SizeConfig.bodyHeight * .02),
            Column(
              children: [
                Theme(
                  data: ThemeData(),
                  child: SfDateRangePicker(
                    view: DateRangePickerView.month,
                    backgroundColor: const Color(0xffFEFAF8),
                    maxDate: DateTime.now().add(const Duration(days: 7)),
                    enableMultiView: false,
                    navigationMode: DateRangePickerNavigationMode.snap,
                    navigationDirection:
                        DateRangePickerNavigationDirection.horizontal,
                    selectionMode: DateRangePickerSelectionMode.range,
                    showNavigationArrow: true,
                    selectionShape: DateRangePickerSelectionShape.circle,
                    extendableRangeSelectionDirection:
                        ExtendableRangeSelectionDirection.both,
                    headerStyle: const DateRangePickerHeaderStyle(
                      backgroundColor: Color(0xffFEFAF8),
                    ),
                    enablePastDates: false,
                    allowViewNavigation: true,
                    onSelectionChanged: (value) {
                      PickerDateRange range = value.value;
                      setState(() {
                        _selectedFirstDate = range.startDate;
                        _selectedLastDate = range.endDate;
                      });

                      from.text = formatDate(
                        date: _selectedFirstDate!,
                        locale: "en",
                      );
                      if (range.endDate != null) {
                        to.text = formatDate(
                          date: _selectedLastDate!,
                          locale: "en",
                        );
                      }
                      if (from.text.isNotEmpty && to.text.isNotEmpty) {
                        widget.onCallBack({'from': from.text, 'to': to.text});
                      }
                    },
                    monthViewSettings: const DateRangePickerMonthViewSettings(
                      firstDayOfWeek: 5,
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}

String formatDate({required DateTime date, String locale = "en"}) {
  String formattedDate = DateFormat('yyyy-MM-dd', locale).format(date);
  return formattedDate;
}

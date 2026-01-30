import 'package:bond/core/extensions/color_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';
import '../../../../../core/global_models/generic_model.dart';
import '../../../../../core/utils/app_size.dart';
import '../../../../../generated/l10n.dart';
import '../../../../../widgets/main_widget/app_drop_down.dart';
import '../../../../../widgets/main_widget/app_text.dart';
import '../../../../../widgets/main_widget/custom_button.dart';
import '../../../../../widgets/main_widget/custom_text_form_field.dart';
import '../../../data/models/request/reimbursement_filter_model.dart';

class ReimbursementFilterSheet extends StatefulWidget {
  final List<GenericModel> list;
  final int policyId;
  final Function(ReimbursementFilterModel) onApplyFilters;
  final VoidCallback onClearFilters;
  final ReimbursementFilterModel? currentFilter;

  const ReimbursementFilterSheet({
    super.key,
    required this.onApplyFilters,
    required this.onClearFilters,
    required this.policyId,
    required this.list,
    this.currentFilter,
  });

  @override
  State<ReimbursementFilterSheet> createState() =>
      _ReimbursementFilterSheetState();
}

class _ReimbursementFilterSheetState extends State<ReimbursementFilterSheet> {
  final _formKey = GlobalKey<FormBuilderState>();
  GenericModel? _selectedClaimStatus;
  GenericModel? _selectedServiceType;
  DateTime? _serviceDateFrom;
  DateTime? _serviceDateTo;
  String sortBy = "newest";

  final List<GenericModel> _serviceTypes = [
    GenericModel(id: 1, name: 'medication' ,label: S.current.medication ),
    GenericModel(id: 2, name: 'lab',label: S.current.lab),
    GenericModel(id: 3, name: 'scan',label: S.current.scan),
    GenericModel(id: 4, name: 'doctor_visit',label: S.current.doctor_visit),
    GenericModel(id: 5, name: 'inpatient',label: S.current.inpatient),
    GenericModel(id: 6, name: 'physical_therapy',label: S.current.physical_therapy),
    GenericModel(id: 7, name: 'maternity',label: S.current.maternity),
    GenericModel(id: 8, name: 'emergency',label: S.current.emergency),
    GenericModel(id: 9, name: 'dental',label: S.current.dental),
    GenericModel(id: 10, name: 'optical',label: S.current.optical),
    GenericModel(id: 11, name: 'other',label: S.current.other),
  ];

  @override
  void initState() {
    super.initState();
    _initializeFromCurrentFilter();
  }

  void _initializeFromCurrentFilter() {
    if (widget.currentFilter != null) {
      final filter = widget.currentFilter!;

      if (filter.claimStatus != null) {
        _selectedClaimStatus = widget.list.firstWhere(
          (item) => item.name == filter.claimStatus,
          orElse: () => widget.list.first,
        );
      }

      // Set service type
      if (filter.serviceType != null) {
        _selectedServiceType = _serviceTypes.firstWhere(
          (item) => item.name == filter.serviceType,
          orElse: () => _serviceTypes.first,
        );
      }

      // Set dates
      _serviceDateFrom = filter.serviceDateFrom;
      _serviceDateTo = filter.serviceDateTo;

      // Set sort by
      sortBy = filter.sortBy ?? "newest";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(child: Container(
      height: SizeConfig.bodyHeight * 0.7,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        children: [
          // Handle bar
          Container(
            width: 40,
            height: 4,
            margin: EdgeInsets.only(top: SizeConfig.bodyHeight * 0.01),
            decoration: BoxDecoration(
              color: context.colorScheme.shadow,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(SizeConfig.screenWidth * 0.04),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const AppText(
                  text: 'Filter',
                  textSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      _selectedClaimStatus = null;
                      _selectedServiceType = null;
                      _serviceDateFrom = null;
                      _serviceDateTo = null;
                    });
                    widget.onClearFilters();
                    Navigator.pop(context);
                  },
                  child: AppText(
                    text: 'Clear',
                    color: context.colorScheme.primary,
                    textSize: 14,
                  ),
                ),
              ],
            ),
          ),

          // Filter Content
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.screenWidth * 0.04,
              ),
              child: FormBuilder(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppDropDown<GenericModel>(
                      name: 'claimStatus',
                      hint: 'Claim Status',
                      items: _buildDropdownItems(widget.list),
                      initialValue: _selectedClaimStatus,
                      onChanged: (value) => setState(() => _selectedClaimStatus = value),
                    ),
                    SizedBox(height: SizeConfig.bodyHeight * 0.02),
                    AppDropDown<GenericModel>(
                      name: 'serviceType',
                      hint: 'Service Type',
                      items: _buildDropdownItems(_serviceTypes),
                      initialValue: _selectedServiceType,
                      onChanged: (value) => setState(() => _selectedServiceType = value),
                    ),
                    SizedBox(height: SizeConfig.bodyHeight * 0.02),
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextFormField(
                            hintText: 'From Date',
                            readOnly: true,
                            onTap: () => _selectDate(context, true),
                            controller: TextEditingController(
                              text: _serviceDateFrom != null
                                  ? DateFormat(
                                'MMM dd, yyyy',
                              ).format(_serviceDateFrom!)
                                  : '',
                            ),
                          ),
                        ),
                        SizedBox(width: SizeConfig.screenWidth * 0.02),
                        Expanded(
                          child: CustomTextFormField(
                            hintText: 'To Date',
                            readOnly: true,
                            onTap: () => _selectDate(context, false),
                            controller: TextEditingController(
                              text: _serviceDateTo != null
                                  ? DateFormat(
                                'MMM dd, yyyy',
                              ).format(_serviceDateTo!)
                                  : '',
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: SizeConfig.bodyHeight * 0.02),
                    Row(
                      children: [
                        SizedBox(
                          width: SizeConfig.screenWidth * 0.2,
                          child: const AppText(
                            text: 'Sort By',
                            textSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(width: SizeConfig.screenWidth * 0.02),
                        Expanded(child: _buildSortByOption('Newest', "newest")),
                        SizedBox(width: SizeConfig.screenWidth * 0.02),
                        Expanded(child: _buildSortByOption('Oldest', "oldest")),
                      ],
                    ),
                    SizedBox(height: SizeConfig.bodyHeight * 0.05),
                  ],
                ),
              ),
            ),
          ),

          // Apply Button
          Container(
            padding: EdgeInsets.all(SizeConfig.screenWidth * 0.04),
            child: CustomButton(
              text: 'Apply',
              press: () {
                final filter = ReimbursementFilterModel(
                  claimStatus: _selectedClaimStatus?.name,
                  serviceType: _selectedServiceType?.name,
                  serviceDateFrom: _serviceDateFrom,
                  serviceDateTo: _serviceDateTo,
                  // isLifeClaim: _isLifeClaim,
                  pageSize: 8,
                  pageKey: 1,
                  sortBy: sortBy == "oldest" ? "oldest" : "newest",
                  policyId: widget.policyId,
                );
                widget.onApplyFilters(filter);
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    ),);
  }

  Widget _buildSortByOption(String label, String value) {
    final isSelected = sortBy == value;
    return GestureDetector(
      onTap: () => setState(() => sortBy = value),
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: SizeConfig.bodyHeight * 0.015,
          horizontal: SizeConfig.screenWidth * 0.02,
        ),
        decoration: BoxDecoration(
          color: isSelected ? context.colorScheme.primary : Colors.white,
          border: Border.all(
            color: isSelected
                ? context.colorScheme.primary
                : context.colorScheme.outline,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: AppText(
          text: label,
          textSize: 14,
          color: isSelected ? Colors.white : context.colorScheme.shadow,
          align: TextAlign.center,
        ),
      ),
    );
  }

  List<DropdownMenuItem<GenericModel>> _buildDropdownItems(List<GenericModel> items) {
    return items.map((item) {
      return DropdownMenuItem<GenericModel>(
        value: item,
        child: AppText(
          text: item.label ?? item.name,
          textSize: 12,
          fontWeight: FontWeight.w500,
        ),
      );
    }).toList();
  }

  Future<void> _selectDate(BuildContext context, bool isFromDate) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: isFromDate
          ? _serviceDateFrom ?? DateTime.now()
          : _serviceDateTo ?? DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime.now().add(const Duration(days: 400)),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            datePickerTheme: DatePickerThemeData(
              backgroundColor: Colors.white,
              dayForegroundColor: MaterialStateProperty.resolveWith<Color?>((
                states,
              ) {
                if (states.contains(WidgetState.selected)) {
                  return Colors.white;
                }
                if (states.contains(WidgetState.disabled)) {
                  return Colors.grey; // الأيام المقفولة
                }
                return Colors.black; // باقي الأيام
              }),
              todayForegroundColor: WidgetStateProperty.all(Colors.orange),
              todayBackgroundColor: WidgetStateProperty.all(
                Colors.orange.withOpacity(0.2),
              ),
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      setState(() {
        if (isFromDate) {
          _serviceDateFrom = picked;
        } else {
          _serviceDateTo = picked;
        }
      });
    }

    /*    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: isFromDate
          ? _serviceDateFrom ?? DateTime.now()
          : _serviceDateTo ?? DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    );

    if (picked != null) {
      setState(() {
        if (isFromDate) {
          _serviceDateFrom = picked;
        } else {
          _serviceDateTo = picked;
        }
      });
    }*/
  }
}

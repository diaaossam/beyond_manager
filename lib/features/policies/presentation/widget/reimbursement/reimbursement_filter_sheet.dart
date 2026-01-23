import 'package:beymanger/core/utils/app_colors.dart';
import 'package:beymanger/core/utils/app_size.dart';
import 'package:beymanger/features/app/generic_model.dart';
import 'package:beymanger/features/emergency/emergency_helper.dart';
import 'package:beymanger/features/reimbursement/data/models/reimbursement_filter_model.dart';
import 'package:beymanger/widgets/app_text.dart';
import 'package:beymanger/widgets/custom_button.dart';
import 'package:beymanger/widgets/custom_text_form_field.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
  GenericModel? _selectedClaimStatus;
  GenericModel? _selectedServiceType;
  DateTime? _serviceDateFrom;
  DateTime? _serviceDateTo;
  bool? _isLifeClaim;
  String sortBy = "newest";

  final List<GenericModel> _serviceTypes = [
    const GenericModel(id: 1, name: 'medication'),
    const GenericModel(id: 2, name: 'lab'),
    const GenericModel(id: 3, name: 'scan'),
    const GenericModel(id: 4, name: 'doctor_visit'),
    const GenericModel(id: 5, name: 'inpatient'),
    const GenericModel(id: 6, name: 'physical_therapy'),
    const GenericModel(id: 7, name: 'maternity'),
    const GenericModel(id: 8, name: 'emergency'),
    const GenericModel(id: 9, name: 'dental'),
    const GenericModel(id: 10, name: 'optical'),
    const GenericModel(id: 11, name: 'other'),
  ];

  @override
  void initState() {
    super.initState();
    _initializeFromCurrentFilter();
  }

  void _initializeFromCurrentFilter() {
    if (widget.currentFilter != null) {
      final filter = widget.currentFilter!;
      
      // Set claim status
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
      
      // Set life claim
      _isLifeClaim = filter.isLifeClaim;
      
      // Set sort by
      sortBy = filter.sortBy ?? "newest";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.bodyHeight * 0.7,
      decoration: const BoxDecoration(
        color: Colors.white,
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
              color: AppColors.iconGrey,
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
                      _isLifeClaim = null;
                    });
                    widget.onClearFilters();
                    Navigator.pop(context);
                  },
                  child: AppText(
                    text: 'Clear',
                    color: AppColors.primary,
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
                  horizontal: SizeConfig.screenWidth * 0.04),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: const Color(0xffFEFAF8),
                          border: Border.all(color: const Color(0xffEDEDED)),
                          borderRadius: BorderRadius.all(
                              Radius.circular(SizeConfig.bodyHeight * .01))),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton2<GenericModel>(
                            alignment: AlignmentDirectional.topStart,
                            style: Theme.of(context).textTheme.bodyMedium,
                            hint: Container(
                              alignment: AlignmentDirectional.centerStart,
                              padding: EdgeInsetsDirectional.only(
                                  start: SizeConfig.screenWidth * .04),
                              child: const AppText(
                                text: "Claim Status",
                                color: Color(0xff292D32),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            isExpanded: true,
                            isDense: true,
                            iconStyleData: const IconStyleData(
                              icon: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Icon(Icons.arrow_drop_down_rounded,
                                    color: Colors.black, size: 35),
                              ),
                            ),
                            buttonStyleData: const ButtonStyleData(height: 50),
                            menuItemStyleData: const MenuItemStyleData(
                              padding: EdgeInsets.zero,
                            ),
                            items: EmergencyHelper()
                                .claimStatusItems(widget.list, context),
                            value: _selectedClaimStatus,
                            onChanged: (value) {
                              setState(() {
                                _isLifeClaim = null;
                                _selectedClaimStatus = value;
                              });
                            }),
                      )),
                  SizedBox(height: SizeConfig.bodyHeight * 0.02),
                  Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: const Color(0xffFEFAF8),
                          border: Border.all(color: const Color(0xffEDEDED)),
                          borderRadius: BorderRadius.all(
                              Radius.circular(SizeConfig.bodyHeight * .01))),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton2<GenericModel>(
                            alignment: AlignmentDirectional.topStart,
                            style: Theme.of(context).textTheme.bodyMedium,
                            hint: Container(
                              alignment: AlignmentDirectional.centerStart,
                              padding: EdgeInsetsDirectional.only(
                                  start: SizeConfig.screenWidth * .04),
                              child: const AppText(
                                text: "Service Type",
                                color: Color(0xff292D32),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            isExpanded: true,
                            isDense: true,
                            iconStyleData: const IconStyleData(
                              icon: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Icon(Icons.arrow_drop_down_rounded,
                                    color: Colors.black, size: 35),
                              ),
                            ),
                            buttonStyleData: const ButtonStyleData(height: 50),
                            menuItemStyleData: const MenuItemStyleData(
                              padding: EdgeInsets.zero,
                            ),
                            items: EmergencyHelper()
                                .claimStatusItems(_serviceTypes, context),
                            value: _selectedServiceType,
                            onChanged: (value) =>
                                setState(() => _selectedServiceType = value)),
                      )),
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
                                ? DateFormat('MMM dd, yyyy')
                                    .format(_serviceDateFrom!)
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
                                ? DateFormat('MMM dd, yyyy')
                                    .format(_serviceDateTo!)
                                : '',
                          ),
                        ),
                      ),
                    ],
                  ),
                /*  SizedBox(height: SizeConfig.bodyHeight * 0.02),
                  Row(
                    children: [
                      SizedBox(
                        width: SizeConfig.screenWidth * 0.2,
                        child: const AppText(
                          text: 'Life Claim',
                          textSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(width: SizeConfig.screenWidth * 0.02),
                      Expanded(
                        child: _buildLifeClaimOption('Yes', true),
                      ),
                      SizedBox(width: SizeConfig.screenWidth * 0.02),
                      Expanded(
                        child: _buildLifeClaimOption('No', false),
                      ),
                    ],
                  ),*/
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
                      Expanded(
                        child: _buildSortByOption('Newest', "newest"),
                      ),
                      SizedBox(width: SizeConfig.screenWidth * 0.02),
                      Expanded(
                        child: _buildSortByOption('Oldest', "oldest"),
                      ),
                    ],
                  ),
                  SizedBox(height: SizeConfig.bodyHeight * 0.05),
                ],
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
                    sortBy: sortBy == "oldest"? "oldest":"newest",
                    policyId: widget.policyId);
                widget.onApplyFilters(filter);
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLifeClaimOption(String label, bool? value) {
    final isSelected = _isLifeClaim == value;
    return GestureDetector(
      onTap: () => setState(() {
          _selectedClaimStatus = null;
        _isLifeClaim = value;
      }),
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: SizeConfig.bodyHeight * 0.015,
          horizontal: SizeConfig.screenWidth * 0.02,
        ),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : Colors.white,
          border: Border.all(
            color: isSelected ? AppColors.primary : AppColors.lightGrey,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: AppText(
          text: label,
          textSize: 14,
          color: isSelected ? Colors.white : AppColors.iconGrey,
          align: TextAlign.center,
        ),
      ),
    );
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
          color: isSelected ? AppColors.primary : Colors.white,
          border: Border.all(
            color: isSelected ? AppColors.primary : AppColors.lightGrey,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: AppText(
          text: label,
          textSize: 14,
          color: isSelected ? Colors.white : AppColors.iconGrey,
          align: TextAlign.center,
        ),
      ),
    );
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
              dayForegroundColor: MaterialStateProperty.resolveWith<Color?>(
                (states) {
                  if (states.contains(WidgetState.selected)) {
                    return Colors.white;
                  }
                  if (states.contains(WidgetState.disabled)) {
                    return Colors.grey; // الأيام المقفولة
                  }
                  return Colors.black; // باقي الأيام
                },
              ),
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

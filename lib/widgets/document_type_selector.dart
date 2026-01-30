import 'package:bond/core/extensions/color_extensions.dart';
import 'package:flutter/material.dart';

import '../core/utils/app_size.dart';
import '../features/sick_leave/data/models/request/document_type.dart';
import 'custom_checkbox.dart';
import 'main_widget/app_text.dart';


class DocumentTypeSelector extends StatefulWidget {
  final List<DocumentType> documentTypes;
  final ValueChanged<List<DocumentType>> onSelectionChanged;
  final bool showSelectAll;
  final String? title;

  const DocumentTypeSelector({
    super.key,
    required this.documentTypes,
    required this.onSelectionChanged,
    this.showSelectAll = true,
    this.title,
  });

  @override
  State<DocumentTypeSelector> createState() => _DocumentTypeSelectorState();
}

class _DocumentTypeSelectorState extends State<DocumentTypeSelector>
    with SingleTickerProviderStateMixin {
  late List<DocumentType> _selectedTypes;
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _selectedTypes = List.from(widget.documentTypes);
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    _slideAnimation =
        Tween<Offset>(begin: const Offset(0, 0.3), end: Offset.zero).animate(
          CurvedAnimation(
            parent: _animationController,
            curve: Curves.easeOutCubic,
          ),
        );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  bool get _isAllSelected => _selectedTypes.every((type) => type.isSelected);

  void _toggleAllSelection() {
    setState(() {
      final newSelectionState = !_isAllSelected;
      _selectedTypes = _selectedTypes
          .map((type) => type.copyWith(isSelected: newSelectionState))
          .toList();
    });
    widget.onSelectionChanged(_selectedTypes);
  }

  void _toggleDocumentType(int index) {
    setState(() {
      _selectedTypes[index] = _selectedTypes[index].copyWith(
        isSelected: !_selectedTypes[index].isSelected,
      );
    });
    widget.onSelectionChanged(_selectedTypes);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return FadeTransition(
          opacity: _fadeAnimation,
          child: SlideTransition(
            position: _slideAnimation,
            child: Container(
              margin: EdgeInsets.symmetric(
                horizontal: SizeConfig.screenWidth * .04,
                vertical: SizeConfig.bodyHeight * .01,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (widget.title != null) ...[
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          if (widget.showSelectAll)
                            GestureDetector(
                              onTap: _toggleAllSelection,
                              child: SquareCheckbox(
                                isSelected: _isAllSelected,
                                onChanged: (_) => _toggleAllSelection(),
                                size: SizeConfig.bodyHeight * .025,
                              ),
                            ),
                          if (widget.showSelectAll)
                            SizedBox(width: SizeConfig.screenWidth * .03),
                          Expanded(
                            child: AppText(
                              text: widget.title!,
                              fontWeight: FontWeight.bold,
                              textSize: 16,
                              color: context.colorScheme.onSurface,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Divider(height: 1, color: Color(0xffF0F0F0)),
                  ],
                  ...List.generate(_selectedTypes.length, (index) {
                    final documentType = _selectedTypes[index];
                    return _buildDocumentTypeItem(documentType, index,context);
                  }),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildDocumentTypeItem(
    DocumentType documentType,
    int index,
    BuildContext context,
  ) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: SizeConfig.screenWidth * .04,
        vertical: SizeConfig.bodyHeight * .005,
      ),
      decoration: BoxDecoration(
        color: const Color(0xffF8F7FF),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: documentType.isSelected
              ? context.colorScheme.primary
              : const Color(0xffE0E0E0),
          width: 1.5,
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => _toggleDocumentType(index),
          borderRadius: BorderRadius.circular(8),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.screenWidth * .04,
              vertical: SizeConfig.bodyHeight * .015,
            ),
            child: Row(
              children: [
                SquareCheckbox(
                  isSelected: documentType.isSelected,
                  onChanged: (_) => _toggleDocumentType(index),
                  size: SizeConfig.bodyHeight * .025,
                  selectedColor: context.colorScheme.primary,
                  checkColor: Colors.white,
                ),
                SizedBox(width: SizeConfig.screenWidth * .03),
                Expanded(
                  child: AppText(
                    text: documentType.name,
                    fontWeight: FontWeight.w600,
                    textSize: 14,
                    color: context.colorScheme.onSurface,
                  ),
                ),
                Container(
                  width: SizeConfig.bodyHeight * .025,
                  height: SizeConfig.bodyHeight * .025,
                  decoration: BoxDecoration(
                    color: const Color(0xffF8F7FF),
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(
                      color: const Color(0xffE0E0E0),
                      width: 1.5,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

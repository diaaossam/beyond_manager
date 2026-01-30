import 'dart:io';
import 'dart:math';
import 'package:bond/core/utils/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../../core/extensions/color_extensions.dart';
import '../../../../../core/utils/app_size.dart';
import '../../../../../widgets/main_widget/app_text.dart';
import '../../../../../widgets/main_widget/custom_button.dart';
import '../../../data/models/request/document_type.dart';

enum UploadOption { uploadDocuments, takePhoto }


class CombinedUploadBottomSheet extends StatefulWidget {
  final Function(List<File>) onSubmitRequest;
  final String name;

  const CombinedUploadBottomSheet({
    super.key,
    required this.onSubmitRequest,
    required this.name,
  });

  @override
  State<CombinedUploadBottomSheet> createState() =>
      _CombinedUploadBottomSheetState();
}

class _CombinedUploadBottomSheetState extends State<CombinedUploadBottomSheet> {
  late List<DocumentType> _selectedTypes;
  bool _showUploadOptions = false;
  final Map<String, List<File>> _filesPerDocumentType = {};
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _selectedTypes = [
      DocumentType(
        id: '1',
        name: 'Prescription',
        nameAr: 'وصفة طبية',
      ),
      DocumentType(
        id: '2',
        name: 'Medical Report',
        nameAr: 'تقرير طبي',
      ),
      DocumentType(
        id: '3',
        name: 'Medical Test Results',
        nameAr: 'نتائج الفحوصات الطبية',
      ),
      DocumentType(
        id: '4',
        name: 'Surgical Report',
        nameAr: 'تقرير جراحي',
      ),
      DocumentType(
        id: '5',
        name: 'Other',
        nameAr: 'أخرى',
      ),
    ];
  }

  bool get _isAllSelected => _selectedTypes.every((type) => type.isSelected);

  Future<void> _pickFilesForDocumentType(DocumentType documentType, UploadOption option) async {
    setState(() => _isLoading = true);
    try {
      List<File> files = [];

      if (option == UploadOption.uploadDocuments) {
        FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.any, allowMultiple: true);
        if (result != null) {
          files = result.paths.map((path) => File(path!)).toList();
        }
      }
      else {
        final ImagePicker picker = ImagePicker();
        final XFile? image = await picker.pickImage(source: ImageSource.camera);
        if (image != null) {
          files.add(File(image.path));
        }
      }

      if (files.isNotEmpty) {
        List<File> renamedFiles = [];
        for (int i = 0; i < files.length; i++) {
          File originalFile = files[i];
          String extension = originalFile.path.split('.').last;
          String randomNumber =
              Random().nextInt(9999).toString().padLeft(4, '0');
          String newFileName =
              '${documentType.name.replaceAll(' ', '_')}_$randomNumber.$extension';

          // Create new file with custom name
          String newPath = '${originalFile.parent.path}/$newFileName';
          File renamedFile = await originalFile.copy(newPath);
          renamedFiles.add(renamedFile);
        }

        setState(() {
          // Add files to existing list instead of replacing
          if (_filesPerDocumentType[documentType.id] == null) {
            _filesPerDocumentType[documentType.id] = renamedFiles;
          } else {
            _filesPerDocumentType[documentType.id]!.addAll(renamedFiles);
          }
        });
      }
    } catch (e) {
      _showErrorSnackBar('Error picking files: $e');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _removeFileFromDocumentType(DocumentType documentType, File file) {
    setState(() {
      _filesPerDocumentType[documentType.id]?.remove(file);
      if (_filesPerDocumentType[documentType.id]?.isEmpty == true) {
        _filesPerDocumentType.remove(documentType.id);
      }
    });
  }

  List<File> get _allFiles {
    List<File> allFiles = [];
    _filesPerDocumentType.values.forEach((files) {
      allFiles.addAll(files);
    });
    return allFiles;
  }

  void _showErrorSnackBar(String message) {
    AppConstant.showCustomSnakeBar(context, message, false);
  }



  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;
    return Container(
      height: SizeConfig.bodyHeight,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius:
        const BorderRadius.vertical(top: Radius.circular(25)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 20,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 15),
            width: 50,
            height: 5,
            decoration: BoxDecoration(
              color: colorScheme.primary.withValues(alpha: 0.3),
              borderRadius: BorderRadius.circular(3),
            ),
          ),
          // Header with member name
          Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: colorScheme.primary.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: colorScheme.primary.withValues(alpha: 0.3),
                      width: 1,
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.person,
                        color: colorScheme.primary,
                        size: SizeConfig.bodyHeight * .02,
                      ),
                      SizedBox(width: SizeConfig.screenWidth * .02),
                      AppText(
                        text: widget.name,
                        textSize: 12,
                        fontWeight: FontWeight.w600,
                        color: colorScheme.primary,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: SizeConfig.bodyHeight * .02),
                AppText(
                  text: _showUploadOptions
                      ? "Choose Upload Method"
                      : "Select Document Types",
                  fontWeight: FontWeight.bold,
                  textSize: 14,
                )
              ],
            ),
          ),

          // Content area
          Expanded(
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              transitionBuilder: (child, animation) {
                return SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(1, 0),
                    end: Offset.zero,
                  ).animate(CurvedAnimation(
                    parent: animation,
                    curve: Curves.easeInOut,
                  )),
                  child: FadeTransition(
                    opacity: animation,
                    child: child,
                  ),
                );
              },
              child: _showUploadOptions
                  ? _buildUploadOptionsContent(colorScheme)
                  : _buildDocumentTypesContent(colorScheme),
            ),
          ),

          // Action buttons
          _buildActionButtons(colorScheme),
        ],
      ),
    );
  }

  Widget _buildDocumentTypesContent(ColorScheme colorScheme) {
    return Column(
      key: const ValueKey('document_types'),
      children: [
        // Select all option
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth * .04),
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xffF8F7FF),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: _isAllSelected
                    ? colorScheme.primary
                    : const Color(0xffE0E0E0),
                width: 1.5,
              ),
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  setState(() {
                    final newSelectionState = !_isAllSelected;
                    _selectedTypes = _selectedTypes
                        .map((type) =>
                            type.copyWith(isSelected: newSelectionState))
                        .toList();
                  });
                },
                borderRadius: BorderRadius.circular(12),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.screenWidth * .04,
                    vertical: SizeConfig.bodyHeight * .015,
                  ),
                  child: Row(
                    children: [
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        width: SizeConfig.bodyHeight * .025,
                        height: SizeConfig.bodyHeight * .025,
                        decoration: BoxDecoration(
                          color:
                              _isAllSelected ? colorScheme.primary : Colors.white,
                          border: Border.all(
                            color: _isAllSelected
                                ? colorScheme.primary
                                : const Color(0xffE0E0E0),
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: _isAllSelected
                            ? Icon(
                                Icons.check,
                                color: Colors.white,
                                size: SizeConfig.bodyHeight * .015,
                              )
                            : null,
                      ),
                      SizedBox(width: SizeConfig.screenWidth * .03),
                      const AppText(
                        text: "Select All",
                        fontWeight: FontWeight.w600,
                        textSize: 12,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),

        SizedBox(height: SizeConfig.bodyHeight * .01),

        // Document types list
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth * .04),
            itemCount: _selectedTypes.length,
            itemBuilder: (context, index) {
              return _buildDocumentTypeItem(_selectedTypes[index], index, colorScheme);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildUploadOptionsContent(ColorScheme colorScheme) {
    return Column(
      key: const ValueKey('upload_options'),
      children: [
        SizedBox(height: SizeConfig.bodyHeight * .02),
        Expanded(
          child: ListView.builder(
            padding:
                EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth * .04),
            itemCount: _selectedTypes.where((type) => type.isSelected).length,
            itemBuilder: (context, index) {
              final selectedTypes =
                  _selectedTypes.where((type) => type.isSelected).toList();
              final documentType = selectedTypes[index];
              final files = _filesPerDocumentType[documentType.id] ?? [];
              return _buildDocumentTypeFilePicker(documentType, files, colorScheme);
            },
          ),
        ),
        SizedBox(height: SizeConfig.bodyHeight * .01),
      ],
    );
  }

  Widget _buildDocumentTypeFilePicker(
      DocumentType documentType, List<File> files, ColorScheme colorScheme) {
    return Container(
      margin: EdgeInsets.only(bottom: SizeConfig.bodyHeight * .015),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: colorScheme.primary.withValues(alpha: 0.3),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.description,
                color: colorScheme.primary,
                size: SizeConfig.bodyHeight * .02,
              ),
              SizedBox(width: SizeConfig.screenWidth * .02),
              Expanded(
                child: AppText(
                  text: documentType.name,
                  fontWeight: FontWeight.w600,
                  textSize: 12  ,
                ),
              ),
              if (files.isNotEmpty) ...[
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: colorScheme.primary.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: AppText(
                    text: "${files.length} files",
                    textSize: 12,
                    color: colorScheme.primary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ],
          ),
          SizedBox(height: SizeConfig.bodyHeight * .01),
          Row(
            children: [
              Expanded(
                child: _buildFilePickerButton(
                  colorScheme: colorScheme,
                  icon: Icons.upload_file,
                  title: "Upload Files",
                  onTap: () => _pickFilesForDocumentType(
                      documentType, UploadOption.uploadDocuments),
                ),
              ),
              SizedBox(width: SizeConfig.screenWidth * .02),
              Expanded(
                child: _buildFilePickerButton(
                  colorScheme: colorScheme,
                  icon: Icons.camera_alt,
                  title: "Take Photo",
                  onTap: () => _pickFilesForDocumentType(
                      documentType, UploadOption.takePhoto),
                ),
              ),
            ],
          ),
          if (files.isNotEmpty) ...[
            SizedBox(height: SizeConfig.bodyHeight * .01),
            ...files.map((file) => _buildFileItem(documentType, file, colorScheme)).toList(),
          ],
        ],
      ),
    );
  }

  Widget _buildFilePickerButton({
    required ColorScheme colorScheme,
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: _isLoading ? null : onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        decoration: BoxDecoration(
          color: _isLoading
              ? Colors.grey.withValues(alpha: 0.1)
              : colorScheme.primary.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: _isLoading
                ? Colors.grey.withValues(alpha: 0.3)
                : colorScheme.primary.withValues(alpha: 0.3),
            width: 1,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: _isLoading ? Colors.grey : colorScheme.primary,
              size: SizeConfig.bodyHeight * .018,
            ),
            SizedBox(width: SizeConfig.screenWidth * .02),
            Expanded(
              child: AppText(
                text: title,
                textSize: 12,
                fontWeight: FontWeight.w600,
                color: _isLoading ? Colors.grey : colorScheme.primary,
                align: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFileItem(DocumentType documentType, File file, ColorScheme colorScheme) {
    return Container(
      margin: EdgeInsets.only(top: SizeConfig.bodyHeight * .005),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xffF8F7FF),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: colorScheme.primary.withValues(alpha: 0.2),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Icon(
            Icons.attach_file,
            color: colorScheme.primary,
            size: SizeConfig.bodyHeight * .015,
          ),
          SizedBox(width: SizeConfig.screenWidth * .02),
          Expanded(
            child: AppText(
              text: file.path.split('/').last,
              textSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
          GestureDetector(
            onTap: () => _removeFileFromDocumentType(documentType, file),
            child: Icon(
              Icons.remove_circle,
              color: Colors.red,
              size: SizeConfig.bodyHeight * .018,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDocumentTypeItem(DocumentType documentType, int index, ColorScheme colorScheme) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200 + (index * 50)),
      margin: EdgeInsets.only(bottom: SizeConfig.bodyHeight * .008),
      decoration: BoxDecoration(
        color: const Color(0xffF8F7FF),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: documentType.isSelected
              ? colorScheme.primary
              : const Color(0xffE0E0E0),
          width: 1.5,
        ),
        boxShadow: documentType.isSelected
            ? [
                BoxShadow(
                  color: colorScheme.primary.withValues(alpha: 0.1),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ]
            : null,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => setState(() {
            _selectedTypes[index] = _selectedTypes[index].copyWith(
              isSelected: !_selectedTypes[index].isSelected,
            );
          }),
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.screenWidth * .04,
              vertical: SizeConfig.bodyHeight * .018,
            ),
            child: Row(
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  width: SizeConfig.bodyHeight * .025,
                  height: SizeConfig.bodyHeight * .025,
                  decoration: BoxDecoration(
                    color: documentType.isSelected
                        ? colorScheme.primary
                        : Colors.white,
                    border: Border.all(
                      color: documentType.isSelected
                          ? colorScheme.primary
                          : const Color(0xffE0E0E0),
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: documentType.isSelected
                      ? Icon(
                          Icons.check,
                          color: Colors.white,
                          size: SizeConfig.bodyHeight * .015,
                        )
                      : null,
                ),
                SizedBox(width: SizeConfig.screenWidth * .03),
                Expanded(
                  child: AppText(
                    text: documentType.name,
                    fontWeight: FontWeight.w600,
                    textSize: 12,
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

  Widget _buildActionButtons(ColorScheme colorScheme) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          Expanded(
            child: CustomButton.outline(
              text: "Cancel",
              height: 50,
              textSize: 12,
              press:() => Navigator.pop(context),
            ),
          ),
          SizedBox(width: SizeConfig.screenWidth * .03),
          Expanded(
            child: CustomButton(
              text: _showUploadOptions ? "Submit Request" : "Continue",
              height: 50,
              textSize: 12,
              press: () {
                      if (!_showUploadOptions) {
                        setState(() => _showUploadOptions = true);
                      } else {
                        widget.onSubmitRequest(_allFiles);
                        Navigator.pop(context);
                      }
                    },
            ),
          ),
        ],
      ),
    );
  }
}

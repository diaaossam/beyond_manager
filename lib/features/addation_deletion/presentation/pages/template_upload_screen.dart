import 'package:auto_route/auto_route.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import '../../../../config/router/app_router.gr.dart';
import '../../../../core/extensions/color_extensions.dart';
import '../../../../core/utils/app_size.dart';
import '../../../../widgets/app_bar/custom_app_bar.dart';
import '../../../../widgets/main_widget/app_text.dart';
import '../../../../widgets/main_widget/custom_button.dart';

@RoutePage()
class TemplateUploadScreen extends StatefulWidget {
  const TemplateUploadScreen({super.key});

  @override
  State<TemplateUploadScreen> createState() => _TemplateUploadScreenState();
}

class _TemplateUploadScreenState extends State<TemplateUploadScreen> {
  String? excelFileName;
  List<String> photoFileNames = [];
  List<String> documentFileNames = [];
  String? acknowledgementFileName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Template Upload"),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: screenPadding(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: SizeConfig.bodyHeight * .03),
                      // Title
                      AppText(
                        text: "Template Upload",
                        fontWeight: FontWeight.w700,
                        textSize: 16,
                        maxLines: 2,
                        color: context.colorScheme.onSurface,
                      ),
                      SizedBox(height: SizeConfig.bodyHeight * .01),
                      AppText(
                        text:
                            "Upload your filled template and supporting documents",
                        fontWeight: FontWeight.w400,
                        textSize: 13,
                        color: context.colorScheme.shadow,
                        align: TextAlign.center,
                      ),
                      SizedBox(height: SizeConfig.bodyHeight * .03),
                      // Guidelines header
                      CustomButton(
                        text:
                            "Guidelines of Addition and Deletion for Insurance Company",
                        iconData: Icons.folder_outlined,
                        press: () {
                          context.router.push(const GuidelinesRoute());
                        },
                        textSize: 11,
                      ),
                      SizedBox(height: SizeConfig.bodyHeight * .03),
                      // Step 1: Download Template
                      _buildStepContainer(
                        context: context,
                        borderColor: context.colorScheme.primary,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Text("📥",
                                    style: TextStyle(fontSize: 32)),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      AppText(
                                        text: "Step 1: Download Template",
                                        fontWeight: FontWeight.w700,
                                        textSize: 16,
                                        color: context.colorScheme.primary,
                                      ),
                                      const SizedBox(height: 4),
                                      AppText(
                                        text:
                                            "Download the Excel template and fill it with member information",
                                        fontWeight: FontWeight.w400,
                                        textSize: 12,
                                        color: context.colorScheme.shadow,
                                        maxLines: 2,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: SizeConfig.bodyHeight * .02),
                            CustomButton(
                              text: "Download Template",
                              iconData: Icons.download,
                              press: () {
                                // TODO: Download template
                                print("Download template");
                              },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: SizeConfig.bodyHeight * .025),
                      // Step 2: Upload Filled Template
                      _buildStepContainer(
                        context: context,
                        borderColor: const Color(0xFF5CB85C),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Text("📥",
                                    style: TextStyle(fontSize: 32)),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const AppText(
                                        text: "Step 2: Upload Filled Template",
                                        fontWeight: FontWeight.w700,
                                        textSize: 16,
                                        color: Color(0xFF5CB85C),
                                      ),
                                      const SizedBox(height: 4),
                                      AppText(
                                        text:
                                            "Upload your completed Excel template",
                                        fontWeight: FontWeight.w400,
                                        textSize: 12,
                                        color: context.colorScheme.shadow,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: SizeConfig.bodyHeight * .02),
                            _buildUploadArea(
                              context: context,
                              icon: Icons.bar_chart,
                              iconColor: const Color(0xFF5CB85C),
                              title: "Upload Excel Template",
                              subtitle: "Click to select your filled template",
                              formats: "Accepted formats: .xlsx, .xls",
                              backgroundColor: const Color(0xFFF0FFF4),
                              borderColor: const Color(0xFF5CB85C),
                              onTap: () async {
                                final result =
                                    await FilePicker.platform.pickFiles(
                                  type: FileType.custom,
                                  allowedExtensions: ['xlsx', 'xls'],
                                );
                                if (result != null) {
                                  setState(() {
                                    excelFileName = result.files.first.name;
                                  });
                                }
                              },
                              fileName: excelFileName,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: SizeConfig.bodyHeight * .025),
                      // Step 3: Upload Member Photos
                      _buildStepContainer(
                        context: context,
                        borderColor: const Color(0xFF4A90E2),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Text("📷",
                                    style: TextStyle(fontSize: 32)),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const AppText(
                                        text: "Step 3: Upload Member Photos",
                                        fontWeight: FontWeight.w700,
                                        textSize: 16,
                                        color: Color(0xFF4A90E2),
                                      ),
                                      const SizedBox(height: 4),
                                      AppText(
                                        text:
                                            "Upload photos for all members in the template",
                                        fontWeight: FontWeight.w400,
                                        textSize: 12,
                                        color: context.colorScheme.shadow,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: SizeConfig.bodyHeight * .02),
                            // Warning box
                            Container(
                              padding:
                                  EdgeInsets.all(SizeConfig.screenWidth * .03),
                              decoration: BoxDecoration(
                                color: const Color(0xFFFFFBEB),
                                border: const Border(
                                  left: BorderSide(
                                    color: Color(0xFFF59E0B),
                                    width: 3,
                                  ),
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Row(
                                    children: [
                                      Icon(Icons.warning_amber,
                                          color: Color(0xFFF59E0B), size: 18),
                                      SizedBox(width: 8),
                                      AppText(
                                        text: "IMPORTANT NAMING CONVENTION:",
                                        fontWeight: FontWeight.w700,
                                        textSize: 12,
                                        color: Color(0xFFF59E0B),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 8),
                                  const AppText(
                                    text:
                                        "• Photos must be named with Staff ID",
                                    fontWeight: FontWeight.w500,
                                    textSize: 11,
                                    color: Color(0xFF78350F),
                                  ),
                                  const SizedBox(height: 4),
                                  RichText(
                                    text: const TextSpan(
                                      style: TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xFF78350F),
                                        height: 1.4,
                                      ),
                                      children: [
                                        TextSpan(text: "• Format:  "),
                                        TextSpan(
                                          text: "[StaffID].jpg",
                                          style: TextStyle(
                                            fontFamily: 'monospace',
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        TextSpan(text: "  or  "),
                                        TextSpan(
                                          text: "[StaffID].png",
                                          style: TextStyle(
                                            fontFamily: 'monospace',
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  RichText(
                                    text: const TextSpan(
                                      style: TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xFF78350F),
                                        height: 1.4,
                                      ),
                                      children: [
                                        TextSpan(text: "• Example:  "),
                                        TextSpan(
                                          text: "123456.jpg",
                                          style: TextStyle(
                                            fontFamily: 'monospace',
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        TextSpan(text: " , "),
                                        TextSpan(
                                          text: "789012.png",
                                          style: TextStyle(
                                            fontFamily: 'monospace',
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: SizeConfig.bodyHeight * .02),
                            _buildUploadArea(
                              context: context,
                              icon: Icons.camera_alt,
                              iconColor: const Color(0xFF4A90E2),
                              title: "Upload Member Photos",
                              subtitle:
                                  "Click to select multiple photos or drag and drop",
                              formats:
                                  "Accepted formats: JPG, PNG | Max size: 5MB per photo",
                              backgroundColor: const Color(0xFFEFF6FF),
                              borderColor: const Color(0xFF4A90E2),
                              onTap: () async {
                                final result =
                                    await FilePicker.platform.pickFiles(
                                  type: FileType.custom,
                                  allowedExtensions: ['jpg', 'jpeg', 'png'],
                                  allowMultiple: true,
                                );
                                if (result != null) {
                                  setState(() {
                                    photoFileNames = result.files
                                        .map((file) => file.name)
                                        .toList();
                                  });
                                }
                              },
                              fileName: photoFileNames.isNotEmpty
                                  ? "${photoFileNames.length} photo(s) selected"
                                  : null,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: SizeConfig.bodyHeight * .025),
                      // Step 4: Upload Supporting Documents
                      _buildStepContainer(
                        context: context,
                        borderColor: const Color(0xFF9333EA),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Text("📄",
                                    style: TextStyle(fontSize: 32)),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const AppText(
                                        text:
                                            "Step 4: Upload Supporting Documents",
                                        fontWeight: FontWeight.w700,
                                        textSize: 16,
                                        color: Color(0xFF9333EA),
                                      ),
                                      const SizedBox(height: 4),
                                      AppText(
                                        text:
                                            "Upload documents for family members (birth certificates, marriage certificates, etc.)",
                                        fontWeight: FontWeight.w400,
                                        textSize: 12,
                                        color: context.colorScheme.shadow,
                                        maxLines: 2,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: SizeConfig.bodyHeight * .02),
                            // Warning box
                            Container(
                              padding:
                                  EdgeInsets.all(SizeConfig.screenWidth * .03),
                              decoration: BoxDecoration(
                                color: const Color(0xFFFFFBEB),
                                border: const Border(
                                  left: BorderSide(
                                    color: Color(0xFFF59E0B),
                                    width: 3,
                                  ),
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Row(
                                    children: [
                                      Icon(Icons.warning_amber,
                                          color: Color(0xFFF59E0B), size: 18),
                                      SizedBox(width: 8),
                                      AppText(
                                        text: "IMPORTANT NAMING CONVENTION:",
                                        fontWeight: FontWeight.w700,
                                        textSize: 12,
                                        color: Color(0xFFF59E0B),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 8),
                                  const AppText(
                                    text:
                                        "• Documents must be named with Staff ID",
                                    fontWeight: FontWeight.w500,
                                    textSize: 11,
                                    color: Color(0xFF78350F),
                                  ),
                                  const SizedBox(height: 4),
                                  RichText(
                                    text: const TextSpan(
                                      style: TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xFF78350F),
                                        height: 1.4,
                                      ),
                                      children: [
                                        TextSpan(text: "• Format:  "),
                                        TextSpan(
                                          text: "[StaffID]_[DocumentType].pdf",
                                          style: TextStyle(
                                            fontFamily: 'monospace',
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  const AppText(
                                    text: "• Examples:",
                                    fontWeight: FontWeight.w500,
                                    textSize: 11,
                                    color: Color(0xFF78350F),
                                  ),
                                  const SizedBox(height: 2),
                                  RichText(
                                    text: const TextSpan(
                                      style: TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xFF78350F),
                                        height: 1.4,
                                      ),
                                      children: [
                                        TextSpan(text: "  - "),
                                        TextSpan(
                                          text: "123456_BirthCertificate.pdf",
                                          style: TextStyle(
                                            fontFamily: 'monospace',
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  RichText(
                                    text: const TextSpan(
                                      style: TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xFF78350F),
                                        height: 1.4,
                                      ),
                                      children: [
                                        TextSpan(text: "  - "),
                                        TextSpan(
                                          text:
                                              "123456_MarriageCertificate.pdf",
                                          style: TextStyle(
                                            fontFamily: 'monospace',
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  RichText(
                                    text: const TextSpan(
                                      style: TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xFF78350F),
                                        height: 1.4,
                                      ),
                                      children: [
                                        TextSpan(text: "  - "),
                                        TextSpan(
                                          text: "789012_NationalID.pdf",
                                          style: TextStyle(
                                            fontFamily: 'monospace',
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: SizeConfig.bodyHeight * .02),
                            _buildUploadArea(
                              context: context,
                              icon: Icons.description,
                              iconColor: const Color(0xFF9333EA),
                              title: "Upload Supporting Documents",
                              subtitle:
                                  "Click to select multiple documents or drag and drop",
                              formats:
                                  "Accepted formats: PDF, JPG, PNG | Max size: 10MB per file",
                              backgroundColor: const Color(0xFFFAF5FF),
                              borderColor: const Color(0xFF9333EA),
                              onTap: () async {
                                final result =
                                    await FilePicker.platform.pickFiles(
                                  type: FileType.custom,
                                  allowedExtensions: [
                                    'pdf',
                                    'jpg',
                                    'jpeg',
                                    'png'
                                  ],
                                  allowMultiple: true,
                                );
                                if (result != null) {
                                  setState(() {
                                    documentFileNames = result.files
                                        .map((file) => file.name)
                                        .toList();
                                  });
                                }
                              },
                              fileName: documentFileNames.isNotEmpty
                                  ? "${documentFileNames.length} document(s) selected"
                                  : null,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: SizeConfig.bodyHeight * .025),
                      // Step 5: Foreign Employee Acknowledgement
                      _buildStepContainer(
                        context: context,
                        borderColor: context.colorScheme.primary,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Text("🌍",
                                    style: TextStyle(fontSize: 32)),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      AppText(
                                        text:
                                            "Step 5: Foreign Employee Acknowledgement",
                                        fontWeight: FontWeight.w700,
                                        textSize: 16,
                                        color: context.colorScheme.primary,
                                      ),
                                      const SizedBox(height: 4),
                                      AppText(
                                        text:
                                            "Required if template includes foreign employees",
                                        fontWeight: FontWeight.w400,
                                        textSize: 12,
                                        color: context.colorScheme.shadow,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: SizeConfig.bodyHeight * .02),
                            // Info box
                            Container(
                              padding:
                                  EdgeInsets.all(SizeConfig.screenWidth * .03),
                              decoration: BoxDecoration(
                                color: const Color(0xFFFFFBEB),
                                border: const Border(
                                  left: BorderSide(
                                    color: Color(0xFFF59E0B),
                                    width: 3,
                                  ),
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Row(
                                    children: [
                                      Icon(Icons.warning_amber,
                                          color: Color(0xFFF59E0B), size: 18),
                                      SizedBox(width: 8),
                                      AppText(
                                        text: "Required for Foreign Employees:",
                                        fontWeight: FontWeight.w700,
                                        textSize: 12,
                                        color: Color(0xFFF59E0B),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 8),
                                  RichText(
                                    text: const TextSpan(
                                      style: TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xFF78350F),
                                        height: 1.4,
                                      ),
                                      children: [
                                        TextSpan(
                                            text:
                                                "If your template includes "),
                                        TextSpan(
                                          text: "foreign employees",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700),
                                        ),
                                        TextSpan(
                                            text:
                                                ", you must upload a signed acknowledgement confirming their current employment status."),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: SizeConfig.bodyHeight * .015),
                            CustomButton.outline(
                              text:
                                  "Download Foreign Employee Acknowledgement Template",
                              iconData: Icons.download,
                              press: () {
                                // TODO: Download acknowledgement template
                                print("Download acknowledgement template");
                              },
                              borderColor: context.colorScheme.outline,
                              textColor: const Color(0xFF4A90E2),
                              textSize: 10,
                            ),
                            SizedBox(height: SizeConfig.bodyHeight * .015),
                            _buildUploadArea(
                              context: context,
                              icon: Icons.upload_file,
                              iconColor: context.colorScheme.primary,
                              title: "Upload Signed Acknowledgement",
                              subtitle:
                                  "Required if adding foreign employees | Click to select or drag and drop",
                              formats:
                                  "Accepted formats: PDF, JPG, PNG | Max size: 10MB",
                              backgroundColor: const Color(0xFFFEF5F1),
                              borderColor: context.colorScheme.primary,
                              onTap: () async {
                                final result =
                                    await FilePicker.platform.pickFiles(
                                  type: FileType.custom,
                                  allowedExtensions: [
                                    'pdf',
                                    'jpg',
                                    'jpeg',
                                    'png'
                                  ],
                                );
                                if (result != null) {
                                  setState(() {
                                    acknowledgementFileName =
                                        result.files.first.name;
                                  });
                                }
                              },
                              fileName: acknowledgementFileName,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: SizeConfig.bodyHeight * .02),
                    ],
                  ),
                ),
              ),
            ),
            // Bottom navigation
            Container(
              padding: EdgeInsets.all(SizeConfig.screenWidth * .04),
              decoration: BoxDecoration(
                color: context.colorScheme.surface,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, -2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: CustomButton.outline(
                      text: "Back",
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
                      text: "Send Request",
                      iconData: Icons.send,
                      press: () {
                        // TODO: Validate and send request
                        if (excelFileName == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                  "Please upload the filled Excel template"),
                            ),
                          );
                          return;
                        }
                        print("Send request");
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStepContainer({
    required BuildContext context,
    required Color borderColor,
    required Widget child,
  }) {
    return Container(
      padding: EdgeInsets.all(SizeConfig.screenWidth * .04),
      decoration: BoxDecoration(
        color: context.colorScheme.surface,
        border: Border.all(color: borderColor, width: 2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: child,
    );
  }

  Widget _buildUploadArea({
    required BuildContext context,
    required IconData icon,
    required Color iconColor,
    required String title,
    required String subtitle,
    required String formats,
    required Color backgroundColor,
    required Color borderColor,
    required VoidCallback onTap,
    String? fileName,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(SizeConfig.screenWidth * .08),
        decoration: BoxDecoration(
          color: backgroundColor,
          border: Border.all(
            color: borderColor,
            width: 2,
            style: BorderStyle.solid,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: iconColor, size: 48),
            SizedBox(height: SizeConfig.bodyHeight * .015),
            AppText(
              text: title,
              fontWeight: FontWeight.w600,
              textSize: 14,
              color: iconColor,
              align: TextAlign.center,
            ),
            SizedBox(height: SizeConfig.bodyHeight * .008),
            AppText(
              text: subtitle,
              fontWeight: FontWeight.w400,
              textSize: 11,
              color: context.colorScheme.shadow,
              align: TextAlign.center,
              maxLines: 2,
            ),
            SizedBox(height: SizeConfig.bodyHeight * .008),
            AppText(
              text: formats,
              fontWeight: FontWeight.w400,
              textSize: 10,
              color: const Color(0xFF9CA3AF),
              align: TextAlign.center,
              maxLines: 2,
            ),
            if (fileName != null) ...[
              SizedBox(height: SizeConfig.bodyHeight * .01),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.screenWidth * .03,
                  vertical: SizeConfig.bodyHeight * .008,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFF10B981).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.check_circle,
                        color: Color(0xFF10B981), size: 16),
                    const SizedBox(width: 6),
                    Flexible(
                      child: AppText(
                        text: fileName,
                        fontWeight: FontWeight.w600,
                        textSize: 11,
                        color: const Color(0xFF10B981),
                        maxLines: 1,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

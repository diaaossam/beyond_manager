import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../core/extensions/color_extensions.dart';
import '../../../../core/utils/app_size.dart';
import '../../../../widgets/main_widget/app_text.dart';
import '../../../../widgets/main_widget/custom_button.dart';

@RoutePage()
class GuidelinesScreen extends StatelessWidget {
  const GuidelinesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Orange Header
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                vertical: SizeConfig.bodyHeight * .04,
                horizontal: SizeConfig.screenWidth * .04,
              ),
              decoration: BoxDecoration(
                color: context.colorScheme.primary,
              ),
              child: Column(
                children: [
                  const Text("📋", style: TextStyle(fontSize: 60)),
                  SizedBox(height: SizeConfig.bodyHeight * .02),
                  const AppText(
                    text: "Template Validation Guidelines",
                    fontWeight: FontWeight.w700,
                    textSize: 24,
                    color: Colors.white,
                    align: TextAlign.center,
                  ),
                  SizedBox(height: SizeConfig.bodyHeight * .01),
                  const AppText(
                    text: "Addition and Deletion for Insurance Company",
                    fontWeight: FontWeight.w400,
                    textSize: 14,
                    color: Colors.white,
                    align: TextAlign.center,
                  ),
                ],
              ),
            ),
            // Content
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: screenPadding(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: SizeConfig.bodyHeight * .03),
                      // Important Notice
                      Container(
                        padding: EdgeInsets.all(SizeConfig.screenWidth * .04),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFFBEB),
                          border: Border(
                            left: BorderSide(
                              color: const Color(0xFFF59E0B),
                              width: 4,
                            ),
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Row(
                              children: [
                                Icon(Icons.warning_amber,
                                    color: Color(0xFFF59E0B), size: 20),
                                SizedBox(width: 8),
                                AppText(
                                  text: "Important Notice",
                                  fontWeight: FontWeight.w700,
                                  textSize: 16,
                                  color: Color(0xFF78350F),
                                ),
                              ],
                            ),
                            SizedBox(height: SizeConfig.bodyHeight * .015),
                            const AppText(
                              text:
                                  "Please ensure all data complies with these guidelines before submitting your template to avoid delays or rejections.",
                              fontWeight: FontWeight.w500,
                              textSize: 13,
                              color: Color(0xFF78350F),
                              maxLines: 3,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: SizeConfig.bodyHeight * .03),
                      // General Requirements
                      _buildSectionHeader(
                        icon: "📝",
                        title: "General Requirements",
                        color: context.colorScheme.primary,
                      ),
                      SizedBox(height: SizeConfig.bodyHeight * .02),
                      _buildBulletPoint(
                        "Template Format:",
                        "Use only the official Excel template provided (.xlsx or .xls)",
                      ),
                      _buildBulletPoint(
                        "Required Fields:",
                        "All fields marked with asterisk (*) must be filled",
                      ),
                      _buildBulletPoint(
                        "Data Accuracy:",
                        "Verify all information for accuracy before submission",
                      ),
                      _buildBulletPoint(
                        "File Size:",
                        "Maximum template size is 10MB",
                      ),
                      _buildBulletPoint(
                        "Character Encoding:",
                        "Use UTF-8 encoding for Arabic text",
                      ),
                      SizedBox(height: SizeConfig.bodyHeight * .03),
                      // Addition Guidelines
                      _buildSectionHeader(
                        icon: "➕",
                        title: "Addition Guidelines",
                        color: const Color(0xFF5CB85C),
                      ),
                      SizedBox(height: SizeConfig.bodyHeight * .02),
                      _buildBulletPoint(
                        "Staff ID:",
                        "Must be unique and not exist in the system",
                      ),
                      _buildBulletPoint(
                        "National ID (CNID):",
                        "Must be 14 digits for Egyptian nationals",
                      ),
                      _buildBulletPoint(
                        "Date of Birth:",
                        "Format must be DD/MM/YYYY",
                      ),
                      _buildBulletPoint(
                        "Phone Numbers:",
                        "Must start with 01 and be 11 digits",
                      ),
                      _buildBulletPoint(
                        "Email Address:",
                        "Must be valid company or personal email",
                      ),
                      _buildBulletPoint(
                        "Photos:",
                        "File naming must match Staff ID (e.g., 123456.jpg)",
                      ),
                      _buildBulletPoint(
                        "Maximum Members:",
                        "Up to 100 members per template submission",
                      ),
                      SizedBox(height: SizeConfig.bodyHeight * .03),
                      // Deletion Guidelines
                      _buildSectionHeader(
                        icon: "➖",
                        title: "Deletion Guidelines",
                        color: const Color(0xFFDC3545),
                      ),
                      SizedBox(height: SizeConfig.bodyHeight * .02),
                      _buildBulletPoint(
                        "Member Verification:",
                        "Members must exist in the Active List",
                      ),
                      _buildBulletPoint(
                        "Deletion Reason:",
                        "Must provide valid reason for deletion",
                      ),
                      _buildBulletPoint(
                        "Effective Date:",
                        "Specify when deletion should take effect",
                      ),
                      _buildBulletPoint(
                        "Dependent Warning:",
                        "Deleting principal automatically removes all dependents",
                      ),
                      SizedBox(height: SizeConfig.bodyHeight * .03),
                      // Photo Requirements
                      _buildSectionHeader(
                        icon: "📷",
                        title: "Photo Requirements",
                        color: const Color(0xFF4A90E2),
                      ),
                      SizedBox(height: SizeConfig.bodyHeight * .02),
                      _buildBulletPoint(
                        "Format:",
                        "JPG or PNG only",
                      ),
                      _buildBulletPoint(
                        "Size:",
                        "Maximum 5MB per photo",
                      ),
                      _buildBulletPoint(
                        "Resolution:",
                        "Minimum 300x300 pixels, recommended 600x600",
                      ),
                      _buildBulletPoint(
                        "Background:",
                        "White or light-colored background preferred",
                      ),
                      _buildBulletPoint(
                        "Naming Convention:",
                        "[StaffID].jpg or [StaffID].png",
                      ),
                      _buildBulletPoint(
                        "Photo Quality:",
                        "Clear, recent photo (not older than 6 months)",
                      ),
                      SizedBox(height: SizeConfig.bodyHeight * .03),
                      // Document Requirements
                      _buildSectionHeader(
                        icon: "📄",
                        title: "Document Requirements",
                        color: const Color(0xFF9333EA),
                      ),
                      SizedBox(height: SizeConfig.bodyHeight * .02),
                      _buildBulletPoint(
                        "Format:",
                        "PDF, JPG, or PNG accepted",
                      ),
                      _buildBulletPoint(
                        "Size:",
                        "Maximum 10MB per document",
                      ),
                      _buildBulletPoint(
                        "Naming:",
                        "[StaffID]_[DocumentType].pdf (e.g., 123456_BirthCertificate.pdf)",
                      ),
                      _buildBulletPoint(
                        "Required Documents:",
                        "Birth certificates for children, marriage certificates for spouse",
                      ),
                      _buildBulletPoint(
                        "Legibility:",
                        "All documents must be clear and readable",
                      ),
                      _buildBulletPoint(
                        "Language:",
                        "Arabic or English documents accepted",
                      ),
                      SizedBox(height: SizeConfig.bodyHeight * .03),
                      // Validation Process
                      Container(
                        padding: EdgeInsets.all(SizeConfig.screenWidth * .04),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF0FFF4),
                          border: Border(
                            left: BorderSide(
                              color: const Color(0xFF5CB85C),
                              width: 4,
                            ),
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Row(
                              children: [
                                Icon(Icons.check_circle,
                                    color: Color(0xFF5CB85C), size: 20),
                                SizedBox(width: 8),
                                AppText(
                                  text: "Validation Process",
                                  fontWeight: FontWeight.w700,
                                  textSize: 16,
                                  color: Color(0xFF166534),
                                ),
                              ],
                            ),
                            SizedBox(height: SizeConfig.bodyHeight * .015),
                            const AppText(
                              text:
                                  "Once submitted, your template will be automatically validated against these guidelines. Any errors or missing information will be flagged, and you will be notified within 24 hours. Properly formatted submissions are processed faster.",
                              fontWeight: FontWeight.w500,
                              textSize: 13,
                              color: Color(0xFF166534),
                              maxLines: 5,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: SizeConfig.bodyHeight * .03),
                    ],
                  ),
                ),
              ),
            ),
            // Close Button
            Container(
              padding: EdgeInsets.all(SizeConfig.screenWidth * .04),
              child: CustomButton(
                text: "Close Guidelines",
                press: () {
                  context.router.back();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader({
    required String icon,
    required String title,
    required Color color,
  }) {
    return Column(
      children: [
        Row(
          children: [
            Text(icon, style: const TextStyle(fontSize: 24)),
            const SizedBox(width: 12),
            AppText(
              text: title,
              fontWeight: FontWeight.w700,
              textSize: 18,
              color: color,
            ),
          ],
        ),
        const SizedBox(height: 8),
        Container(
          height: 3,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
      ],
    );
  }

  Widget _buildBulletPoint(String title, String description) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 6),
            width: 6,
            height: 6,
            decoration: const BoxDecoration(
              color: Color(0xFF374151),
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: RichText(
              text: TextSpan(
                style: const TextStyle(
                  fontSize: 14,
                  color: Color(0xFF374151),
                  height: 1.5,
                ),
                children: [
                  TextSpan(
                    text: "$title ",
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  TextSpan(
                    text: description,
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

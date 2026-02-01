import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../../../../core/extensions/color_extensions.dart';
import '../../../../core/utils/app_size.dart';
import '../../../../widgets/main_widget/app_text.dart';
import '../../../../widgets/main_widget/custom_button.dart';

@RoutePage()
class DeletionGuidelinesScreen extends StatelessWidget {
  const DeletionGuidelinesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                vertical: SizeConfig.bodyHeight * .04,
                horizontal: SizeConfig.screenWidth * .04,
              ),
              decoration: BoxDecoration(color: context.colorScheme.primary),
              child: Column(
                children: [
                  const Text("📋", style: TextStyle(fontSize: 60)),
                  SizedBox(height: SizeConfig.bodyHeight * .02),
                  const AppText(
                    text: "Deletion Guidelines",
                    fontWeight: FontWeight.w700,
                    textSize: 24,
                    color: Colors.white,
                    align: TextAlign.center,
                  ),
                  SizedBox(height: SizeConfig.bodyHeight * .01),
                  const AppText(
                    text: "For Selected Insurance Policies",
                    fontWeight: FontWeight.w400,
                    textSize: 14,
                    color: Colors.white,
                    align: TextAlign.center,
                  ),
                ],
              ),
            ),
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
                                Icon(
                                  Icons.warning_amber,
                                  color: Color(0xFFF59E0B),
                                  size: 20,
                                ),
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
                                  "Deleting a principal member will automatically remove all associated family members. This action cannot be undone.",
                              fontWeight: FontWeight.w500,
                              textSize: 13,
                              color: Color(0xFF78350F),
                              maxLines: 3,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: SizeConfig.bodyHeight * .03),
                      // Deletion Requirements
                      _buildSectionHeader(
                        icon: "➖",
                        title: "Deletion Requirements",
                        color: const Color(0xFFDC3545),
                      ),
                      SizedBox(height: SizeConfig.bodyHeight * .02),
                      _buildBulletPoint(
                        "Member Verification:",
                        "Members must exist in the Active List and have a valid active status",
                      ),
                      _buildBulletPoint(
                        "Deletion Reason:",
                        "Must provide a valid reason for deletion (e.g., termination, retirement, voluntary withdrawal)",
                      ),
                      _buildBulletPoint(
                        "Effective Date:",
                        "Specify when deletion should take effect. Cannot be in the past",
                      ),
                      _buildBulletPoint(
                        "Family Unit Warning:",
                        "Deleting principal automatically removes all dependents (spouse, children)",
                      ),
                      _buildBulletPoint(
                        "Policy Coverage:",
                        "Member must have completed the minimum coverage period as per policy terms",
                      ),
                      SizedBox(height: SizeConfig.bodyHeight * .03),
                      // Process
                      _buildSectionHeader(
                        icon: "🔄",
                        title: "Deletion Process",
                        color: const Color(0xFF4A90E2),
                      ),
                      SizedBox(height: SizeConfig.bodyHeight * .02),
                      _buildBulletPoint(
                        "Step 1:",
                        "Search and select members from Active List",
                      ),
                      _buildBulletPoint(
                        "Step 2:",
                        "System auto-selects all family members for principal",
                      ),
                      _buildBulletPoint(
                        "Step 3:",
                        "Provide deletion reason and effective date",
                      ),
                      _buildBulletPoint(
                        "Step 4:",
                        "Submit deletion request for approval",
                      ),
                      _buildBulletPoint(
                        "Step 5:",
                        "Insurance company processes and confirms deletion",
                      ),
                      SizedBox(height: SizeConfig.bodyHeight * .03),
                      // Important Notes
                      _buildSectionHeader(
                        icon: "📌",
                        title: "Important Notes",
                        color: context.colorScheme.primary,
                      ),
                      SizedBox(height: SizeConfig.bodyHeight * .02),
                      _buildBulletPoint(
                        "Batch Deletion:",
                        "You can select multiple members for deletion in one request",
                      ),
                      _buildBulletPoint(
                        "Coverage End:",
                        "Insurance coverage ends on the specified effective date",
                      ),
                      _buildBulletPoint(
                        "Refunds:",
                        "Refund eligibility depends on policy terms and effective date",
                      ),
                      _buildBulletPoint(
                        "Re-enrollment:",
                        "Deleted members may be re-enrolled following standard addition procedures",
                      ),
                      _buildBulletPoint(
                        "Notification:",
                        "Affected members will be notified of deletion via email/SMS",
                      ),
                      SizedBox(height: SizeConfig.bodyHeight * .03),
                      // Validation
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
                                Icon(
                                  Icons.check_circle,
                                  color: Color(0xFF5CB85C),
                                  size: 20,
                                ),
                                SizedBox(width: 8),
                                AppText(
                                  text: "Validation & Approval",
                                  fontWeight: FontWeight.w700,
                                  textSize: 16,
                                  color: Color(0xFF166534),
                                ),
                              ],
                            ),
                            SizedBox(height: SizeConfig.bodyHeight * .015),
                            const AppText(
                              text:
                                  "All deletion requests are validated against policy rules and require approval from the insurance company. You will be notified of the status within 24-48 hours.",
                              fontWeight: FontWeight.w500,
                              textSize: 13,
                              color: Color(0xFF166534),
                              maxLines: 4,
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
                    style: const TextStyle(fontWeight: FontWeight.w700),
                  ),
                  TextSpan(
                    text: description,
                    style: const TextStyle(fontWeight: FontWeight.w400),
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

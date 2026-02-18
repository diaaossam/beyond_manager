import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../config/router/app_router.gr.dart';
import '../../../../core/extensions/color_extensions.dart';
import '../../../../core/utils/app_size.dart';
import '../../../../widgets/app_bar/custom_app_bar.dart';
import '../../../../widgets/custom_search_text_form_field.dart';
import '../../../../widgets/main_widget/app_text.dart';
import '../../../../widgets/main_widget/custom_button.dart';

@RoutePage()
class ViewTrackRequestsScreen extends StatefulWidget {
  const ViewTrackRequestsScreen({super.key});

  @override
  State<ViewTrackRequestsScreen> createState() =>
      _ViewTrackRequestsScreenState();
}

class _ViewTrackRequestsScreenState extends State<ViewTrackRequestsScreen> {
  TextEditingController requestNumberController = TextEditingController();
  TextEditingController memberNameController = TextEditingController();
  TextEditingController staffIdController = TextEditingController();

  // Mock data - replace with real API data
  int submittedCount = 8;
  int pendingReviewCount = 3;
  int waitingForHRCount = 1;
  int completedCount = 15;

  List<RequestData> requests = [
    RequestData(
      requestNumber: "REQ-2025-10-000789",
      requestType: "Addition Request",
      status: "Waiting HR",
      submissionDate: "October 18, 2025",
      policiesAffected: "Medical Insurance",
      membersCount: "3 Members",
      waitingSince: "October 19, 2025",
      hasActionRequired: true,
      actionReason: "Missing IBAN for bank account reimbursement",
      actionToDo:
          "Please provide IBAN number or contact support for assistance",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "View / Track Requests"),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: screenPadding(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: SizeConfig.bodyHeight * .03),
                AppText(
                  text: "View / Track Requests",
                  fontWeight: FontWeight.w700,
                  textSize: 24,
                  color: context.colorScheme.onSurface,
                ),
                SizedBox(height: SizeConfig.bodyHeight * .01),
                AppText(
                  text:
                      "Monitor and track all your addition and deletion requests",
                  fontWeight: FontWeight.w400,
                  textSize: 14,
                  color: context.colorScheme.shadow,
                  maxLines: 2,
                ),
                SizedBox(height: SizeConfig.bodyHeight * .03),
                Row(
                  children: [
                    Expanded(
                      child: _buildStatCard(
                        title: "SUBMITTED REQUESTS",
                        count: submittedCount.toString(),
                        borderColor: const Color(0xFF4A90E2),
                      ),
                    ),
                    SizedBox(width: SizeConfig.screenWidth * .02),
                    Expanded(
                      child: _buildStatCard(
                        title: "PENDING REVIEW",
                        count: pendingReviewCount.toString(),
                        borderColor: const Color(0xFFF59E0B),
                      ),
                    ),
                    SizedBox(width: SizeConfig.screenWidth * .02),
                    Expanded(
                      child: _buildStatCard(
                        title: "WAITING FOR HR",
                        count: waitingForHRCount.toString(),
                        borderColor: const Color(0xFFDC3545),
                        hasWarning: true,
                      ),
                    ),
                    SizedBox(width: SizeConfig.screenWidth * .02),
                    Expanded(
                      child: _buildStatCard(
                        title: "COMPLETED",
                        count: completedCount.toString(),
                        borderColor: const Color(0xFF5CB85C),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: SizeConfig.bodyHeight * .04),
                Row(
                  children: [
                    const Icon(Icons.search, size: 20),
                    const SizedBox(width: 8),
                    AppText(
                      text: "Search Requests",
                      fontWeight: FontWeight.w700,
                      textSize: 16,
                      color: context.colorScheme.onSurface,
                    ),
                  ],
                ),
                SizedBox(height: SizeConfig.bodyHeight * .015),
                Row(
                  children: [
                    Expanded(
                      child: CustomSearchTextFormField(
                        controller: requestNumberController,
                        hintText: "Request Number",
                      ),
                    ),
                    SizedBox(width: SizeConfig.screenWidth * .02),
                    Expanded(
                      child: CustomSearchTextFormField(
                        controller: memberNameController,
                        hintText: "Member Name",
                      ),
                    ),
                    SizedBox(width: SizeConfig.screenWidth * .02),
                    Expanded(
                      child: CustomSearchTextFormField(
                        controller: staffIdController,
                        hintText: "Staff ID",
                      ),
                    ),
                    SizedBox(width: SizeConfig.screenWidth * .02),
                    CustomButton(
                      text: "Search",
                      press: () {
                        // TODO: Perform search
                        print("Search requests");
                      },
                      width: 100,
                      height: 48,
                    ),
                  ],
                ),
                SizedBox(height: SizeConfig.bodyHeight * .03),
                // Showing info
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                      text: TextSpan(
                        style: TextStyle(
                          fontSize: 14,
                          color: context.colorScheme.onSurface,
                        ),
                        children: [
                          const TextSpan(
                            text: "Showing: ",
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                          TextSpan(
                            text: "$submittedCount Submitted Requests",
                            style: const TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF4A90E2),
                            ),
                          ),
                        ],
                      ),
                    ),
                    AppText(
                      text: "Last Updated: October 23, 2025 - 03:15 PM",
                      fontWeight: FontWeight.w400,
                      textSize: 12,
                      color: context.colorScheme.shadow,
                    ),
                  ],
                ),
                SizedBox(height: SizeConfig.bodyHeight * .03),
                // Request History Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppText(
                      text: "Request History",
                      fontWeight: FontWeight.w700,
                      textSize: 18,
                      color: context.colorScheme.onSurface,
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            child: CustomButton.outline(
                              text: "Back to Dashboard",
                              press: () {
                                context.router.back();
                              },
                              borderColor: context.colorScheme.outline,
                              textColor: context.colorScheme.onSurface,
                              height: 36,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: CustomButton(
                              text: "Create New Request",
                              iconData: Icons.add,
                              press: () {
                                context.router.push(const SelectPoliciesRoute());
                              },
                              height: 36,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: SizeConfig.bodyHeight * .02),
                // Request Cards
                ...requests.map((request) => _buildRequestCard(request)),
                SizedBox(height: SizeConfig.bodyHeight * .02),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildStatCard({
    required String title,
    required String count,
    required Color borderColor,
    bool hasWarning = false,
  }) {
    return Container(
      height: SizeConfig.bodyHeight * .15,
      padding: EdgeInsets.all(SizeConfig.screenWidth * .025),
      decoration: BoxDecoration(
        color: context.colorScheme.surface,
        border: Border(
          left: BorderSide(color: borderColor, width: 4),
          top: BorderSide(color: context.colorScheme.outline, width: 1),
          right: BorderSide(color: context.colorScheme.outline, width: 1),
          bottom: BorderSide(color: context.colorScheme.outline, width: 1),
        ),
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              if (hasWarning) ...[
                const Icon(Icons.warning, color: Color(0xFFDC3545), size: 14),
                const SizedBox(width: 4),
              ],
              Expanded(
                child: AppText(
                  text: title,
                  fontWeight: FontWeight.w600,
                  textSize: 10,
                  color: context.colorScheme.shadow,
                  maxLines: 2,
                ),
              ),
            ],
          ),
          AppText(
            text: count,
            fontWeight: FontWeight.w700,
            textSize: 28,
            color: context.colorScheme.onSurface,
          ),
        ],
      ),
    );
  }

  Widget _buildRequestCard(RequestData request) {
    return Container(
      margin: EdgeInsets.only(bottom: SizeConfig.bodyHeight * .02),
      padding: EdgeInsets.all(SizeConfig.screenWidth * .04),
      decoration: BoxDecoration(
        color: context.colorScheme.surface,
        border: Border.all(color: const Color(0xFFDC3545), width: 2),
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
          // Header with badges
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFF2D3748),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: AppText(
                      text: request.requestNumber,
                      fontWeight: FontWeight.w700,
                      textSize: 12,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFD1FAE5),
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(
                        color: const Color(0xFF10B981),
                        width: 1,
                      ),
                    ),
                    child: const AppText(
                      text: "Addition Request",
                      fontWeight: FontWeight.w600,
                      textSize: 12,
                      color: Color(0xFF047857),
                    ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 7,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFDC3545),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.notifications, color: Colors.white, size: 14),
                    SizedBox(width: 6),
                    AppText(
                      text: "Waiting HR",
                      fontWeight: FontWeight.w700,
                      textSize: 12,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ],
          ),
          if (request.hasActionRequired) ...[
            SizedBox(height: SizeConfig.bodyHeight * .02),
            // Action Required Box
            Container(
              padding: EdgeInsets.all(SizeConfig.screenWidth * .03),
              decoration: BoxDecoration(
                color: const Color(0xFFFFFBEB),
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
                        size: 18,
                      ),
                      SizedBox(width: 8),
                      AppText(
                        text: "Action Required",
                        fontWeight: FontWeight.w700,
                        textSize: 14,
                        color: Color(0xFF78350F),
                      ),
                    ],
                  ),
                  SizedBox(height: SizeConfig.bodyHeight * .01),
                  RichText(
                    text: TextSpan(
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xFF78350F),
                        height: 1.4,
                      ),
                      children: [
                        const TextSpan(
                          text: "Reason: ",
                          style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                        TextSpan(
                          text: request.actionReason,
                          style: const TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 4),
                  RichText(
                    text: TextSpan(
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xFF78350F),
                        height: 1.4,
                      ),
                      children: [
                        const TextSpan(
                          text: "What to do: ",
                          style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                        TextSpan(
                          text: request.actionToDo,
                          style: const TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
          SizedBox(height: SizeConfig.bodyHeight * .02),
          // Request Details
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildDetailColumn("SUBMISSION D...", request.submissionDate),
              _buildDetailColumn("POLICIES AFFE...", request.policiesAffected),
              _buildDetailColumn("MEMBERS COU...", request.membersCount),
              _buildDetailColumn("WAITING SINCE", request.waitingSince),
            ],
          ),
          SizedBox(height: SizeConfig.bodyHeight * .02),
          // Action Buttons
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              CustomButton.outline(
                text: "View Details",
                press: () {
                  // TODO: View details
                  print("View details");
                },
                borderColor: context.colorScheme.outline,
                textColor: context.colorScheme.onSurface,
                height: 36,
                width: 120,
              ),
              CustomButton.outline(
                text: "Download Excel Report",
                iconData: Icons.bar_chart,
                press: () {
                  // TODO: Download Excel
                  print("Download Excel");
                },
                borderColor: context.colorScheme.outline,
                textColor: context.colorScheme.onSurface,
                height: 36,
                width: 180,
              ),
              CustomButton(
                text: "Contact Support",
                iconData: Icons.headset_mic,
                press: () {
                  // TODO: Contact support
                  print("Contact support");
                },
                height: 36,
                width: 140,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDetailColumn(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          text: label,
          fontWeight: FontWeight.w600,
          textSize: 9,
          color: const Color(0xFF9CA3AF),
          maxLines: 1,
        ),
        const SizedBox(height: 4),
        AppText(
          text: value,
          fontWeight: FontWeight.w700,
          textSize: 12,
          color: context.colorScheme.onSurface,
          maxLines: 2,
        ),
      ],
    );
  }
}

class RequestData {
  final String requestNumber;
  final String requestType;
  final String status;
  final String submissionDate;
  final String policiesAffected;
  final String membersCount;
  final String waitingSince;
  final bool hasActionRequired;
  final String? actionReason;
  final String? actionToDo;

  RequestData({
    required this.requestNumber,
    required this.requestType,
    required this.status,
    required this.submissionDate,
    required this.policiesAffected,
    required this.membersCount,
    required this.waitingSince,
    this.hasActionRequired = false,
    this.actionReason,
    this.actionToDo,
  });
}

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
class SelectMembersToDeleteScreen extends StatefulWidget {
  final List<String> selectedPolicyIds;

  const SelectMembersToDeleteScreen({
    super.key,
    required this.selectedPolicyIds,
  });

  @override
  State<SelectMembersToDeleteScreen> createState() =>
      _SelectMembersToDeleteScreenState();
}

class _SelectMembersToDeleteScreenState
    extends State<SelectMembersToDeleteScreen> {
  Set<String> selectedMemberIds = {};
  TextEditingController memberNameController = TextEditingController();
  TextEditingController nationalIdController = TextEditingController();
  TextEditingController staffIdController = TextEditingController();

  // Mock data - replace with real API data
  List<MemberData> members = [
    MemberData(
      id: "1",
      name: "Ahmed Hassan Ibrahim",
      isPrincipal: true,
      staffId: "EMP-2024-001",
      nationalId: "28901234567890",
      nationality: "Egyptian",
      cardNumber: "123-456-789",
      familyMembersCount: 3,
    ),
    MemberData(
      id: "2",
      name: "Sarah Ahmed Mohamed",
      isPrincipal: true,
      staffId: "EMP-2024-002",
      nationalId: "29801234567890",
      nationality: "Egyptian",
      cardNumber: "",
      familyMembersCount: 0,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    List<MemberData> selectedMembers =
        members.where((m) => selectedMemberIds.contains(m.id)).toList();

    return Scaffold(
      appBar: const CustomAppBar(title: "Select Members to Delete"),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: screenPadding(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: SizeConfig.bodyHeight * .03),
                      // Title
                      AppText(
                        text: "Select Members to Delete",
                        fontWeight: FontWeight.w700,
                        textSize: 22,
                        color: context.colorScheme.onSurface,
                        align: TextAlign.center,
                      ),
                      SizedBox(height: SizeConfig.bodyHeight * .01),
                      AppText(
                        text:
                            "Search and select members - families will be auto-selected",
                        fontWeight: FontWeight.w400,
                        textSize: 13,
                        color: context.colorScheme.shadow,
                        align: TextAlign.center,
                        maxLines: 2,
                      ),
                      SizedBox(height: SizeConfig.bodyHeight * .03),
                      // Guidelines Button
                      CustomButton(
                        text: "View Deletion Guidelines for Selected Insurance",
                        iconData: Icons.folder_outlined,
                        press: () {
                          context.router.push(const DeletionGuidelinesRoute());
                        },
                      ),
                      SizedBox(height: SizeConfig.bodyHeight * .02),
                      // Selected Policies
                      Container(
                        padding: EdgeInsets.all(SizeConfig.screenWidth * .04),
                        decoration: BoxDecoration(
                          color: const Color(0xFFE8F4FD),
                          borderRadius: BorderRadius.circular(8),
                          border: const Border(
                            left: BorderSide(
                              color: Color(0xFF4A90E2),
                              width: 4,
                            ),
                          ),
                        ),
                        child: Row(
                          children: [
                            const Icon(Icons.folder_outlined,
                                color: Color(0xFF4A90E2), size: 20),
                            const SizedBox(width: 12),
                            const AppText(
                              text: "Selected Policies:",
                              fontWeight: FontWeight.w600,
                              textSize: 14,
                              color: Color(0xFF2C3E50),
                            ),
                            const SizedBox(width: 8),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 6),
                              decoration: BoxDecoration(
                                color: context.colorScheme.surface,
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                    color: const Color(0xFF4A90E2), width: 1),
                              ),
                              child: const AppText(
                                text: "Medical Insurance",
                                fontWeight: FontWeight.w600,
                                textSize: 12,
                                color: Color(0xFF4A90E2),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: SizeConfig.bodyHeight * .02),
                      // Important Warning
                      Container(
                        padding: EdgeInsets.all(SizeConfig.screenWidth * .04),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFFBEB),
                          borderRadius: BorderRadius.circular(8),
                          border: const Border(
                            left: BorderSide(
                              color: Color(0xFFF59E0B),
                              width: 4,
                            ),
                          ),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Icon(Icons.warning_amber,
                                color: Color(0xFFF59E0B), size: 20),
                            const SizedBox(width: 12),
                            Expanded(
                              child: RichText(
                                text: const TextSpan(
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Color(0xFF78350F),
                                    height: 1.4,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: "Important: ",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700),
                                    ),
                                    TextSpan(
                                      text:
                                          "Selecting a principal member will automatically select all their family members. They must be deleted together as a family unit.",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: SizeConfig.bodyHeight * .03),
                      // Search Section
                      Row(
                        children: [
                          const Icon(Icons.search, size: 20),
                          const SizedBox(width: 8),
                          AppText(
                            text: "Search Active Members",
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
                              controller: memberNameController,
                              hintText: "Member Name",
                            ),
                          ),
                          SizedBox(width: SizeConfig.screenWidth * .02),
                          Expanded(
                            child: CustomSearchTextFormField(
                              controller: nationalIdController,
                              hintText: "National ID (CNID)",
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
                              print("Search");
                            },
                            width: 100,
                            height: 48,
                          ),
                        ],
                      ),
                      SizedBox(height: SizeConfig.bodyHeight * .03),
                      // Selected Count
                      AppText(
                        text: "Selected: ${selectedMemberIds.length} Members",
                        fontWeight: FontWeight.w600,
                        textSize: 15,
                        color: selectedMemberIds.isEmpty
                            ? context.colorScheme.shadow
                            : Colors.red,
                      ),
                      SizedBox(height: SizeConfig.bodyHeight * .02),
                      // Member Cards
                      ...members.map((member) => _buildMemberCard(member)),
                      SizedBox(height: SizeConfig.bodyHeight * .02),
                    ],
                  ),
                ),
              ),
            ),
            // Bottom navigation
            if (selectedMembers.isNotEmpty)
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
                        text: "Continue",
                        press: () {
                          // TODO: Continue to next step
                          print(
                              "Continue with ${selectedMembers.length} members");
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

  Widget _buildMemberCard(MemberData member) {
    bool isSelected = selectedMemberIds.contains(member.id);

    return Container(
      margin: EdgeInsets.only(bottom: SizeConfig.bodyHeight * .015),
      padding: EdgeInsets.all(SizeConfig.screenWidth * .04),
      decoration: BoxDecoration(
        color: const Color(0xFFFEFAF8),
        border: Border.all(
          color: isSelected
              ? context.colorScheme.primary
              : const Color(0xFFEAEAEA),
          width: isSelected ? 2 : 1,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              // Checkbox
              InkWell(
                onTap: () {
                  setState(() {
                    if (isSelected) {
                      selectedMemberIds.remove(member.id);
                    } else {
                      selectedMemberIds.add(member.id);
                    }
                  });
                },
                child: Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    color: isSelected
                        ? context.colorScheme.primary
                        : context.colorScheme.surface,
                    border: Border.all(
                      color: isSelected
                          ? context.colorScheme.primary
                          : context.colorScheme.shadow,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: isSelected
                      ? const Icon(
                          Icons.check,
                          size: 14,
                          color: Colors.white,
                        )
                      : null,
                ),
              ),
              const SizedBox(width: 12),
              // Member Name
              Expanded(
                child: AppText(
                  text: member.name,
                  fontWeight: FontWeight.w700,
                  textSize: 15,
                  color: context.colorScheme.onSurface,
                ),
              ),
            ],
          ),
          SizedBox(height: SizeConfig.bodyHeight * .015),
          // Principal Badge
          if (member.isPrincipal)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: const Color(0xFF4A90E2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const AppText(
                text: "Principal",
                fontWeight: FontWeight.w600,
                textSize: 11,
                color: Colors.white,
              ),
            ),
          SizedBox(height: SizeConfig.bodyHeight * .01),
          // Member Details
          Row(
            children: [
              Expanded(
                child: _buildDetailRow("Staff ID:", member.staffId),
              ),
              Expanded(
                child: _buildDetailRow("National ID:", member.nationalId),
              ),
            ],
          ),
          SizedBox(height: SizeConfig.bodyHeight * .008),
          Row(
            children: [
              Expanded(
                child: _buildDetailRow("Nationality:", member.nationality),
              ),
              if (member.cardNumber.isNotEmpty)
                Expanded(
                  child: Row(
                    children: [
                      Icon(Icons.credit_card,
                          size: 14, color: context.colorScheme.shadow),
                      const SizedBox(width: 4),
                      AppText(
                        text: "Card Number: ${member.cardNumber}",
                        fontWeight: FontWeight.w500,
                        textSize: 12,
                        color: const Color(0xFF4A90E2),
                      ),
                    ],
                  ),
                ),
            ],
          ),
          // Family Members Info
          if (member.familyMembersCount > 0) ...[
            SizedBox(height: SizeConfig.bodyHeight * .015),
            Container(
              padding: EdgeInsets.all(SizeConfig.screenWidth * .03),
              decoration: BoxDecoration(
                color: const Color(0xFFE8F4FD),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Row(
                children: [
                  const Icon(Icons.family_restroom,
                      size: 16, color: Color(0xFF4A90E2)),
                  const SizedBox(width: 8),
                  const Expanded(
                    child: AppText(
                      text:
                          "Has 3 family members - will be auto-selected",
                      fontWeight: FontWeight.w600,
                      textSize: 12,
                      color: Color(0xFF4A90E2),
                      maxLines: 2,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Row(
      children: [
        AppText(
          text: label,
          fontWeight: FontWeight.w600,
          textSize: 12,
          color: context.colorScheme.shadow,
        ),
        const SizedBox(width: 4),
        Expanded(
          child: AppText(
            text: value,
            fontWeight: FontWeight.w500,
            textSize: 12,
            color: context.colorScheme.onSurface,
          ),
        ),
      ],
    );
  }
}

class MemberData {
  final String id;
  final String name;
  final bool isPrincipal;
  final String staffId;
  final String nationalId;
  final String nationality;
  final String cardNumber;
  final int familyMembersCount;

  MemberData({
    required this.id,
    required this.name,
    required this.isPrincipal,
    required this.staffId,
    required this.nationalId,
    required this.nationality,
    required this.cardNumber,
    required this.familyMembersCount,
  });
}

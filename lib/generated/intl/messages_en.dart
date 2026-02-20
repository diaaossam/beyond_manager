// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m1(count) => "Add ${count}th Child";

  static String m2(number) => "Card Number: ${number}";

  static String m3(total, threshold) =>
      "Total consumption (${total} EGP) has exceeded the threshold of ${threshold} EGP";

  static String m0(count) => "${count} Members";

  static String m4(count) => "${count} document(s) selected";

  static String m5(name, count) =>
      "${name} have exceeded transaction count threshold (${count} transactions).";

  static String m6(employeeCount, threshold, examples) =>
      "${employeeCount} employees have exceeded transaction count threshold (${threshold} transactions). Examples: ${examples}";

  static String m7(employeeCount, threshold, examples) =>
      "${employeeCount} employees have exceeded consumption threshold (${threshold} EGP). Examples: ${examples}";

  static String m8(count) =>
      "Has ${count} family members - will be auto-selected";

  static String m9(month, total, threshold) =>
      "Monthly consumption for ${month} (${total} EGP) has exceeded the threshold of ${threshold} EGP";

  static String m10(count) => "${count} photo(s) selected";

  static String m11(count) => "Selected: ${count} Members";

  static String m12(count) => "${count} Submitted Requests";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "acceptedFormatsJpgPng": MessageLookupByLibrary.simpleMessage(
      "Accepted formats: JPG, PNG | Max size: 5MB per photo",
    ),
    "acceptedFormatsPdfJpgPng": MessageLookupByLibrary.simpleMessage(
      "Accepted formats: PDF, JPG, PNG | Max size: 10MB per file",
    ),
    "acceptedFormatsPdfJpgPngMaxSize": MessageLookupByLibrary.simpleMessage(
      "Accepted formats: PDF, JPG, PNG | Max size: 10MB",
    ),
    "acceptedFormatsXlsx": MessageLookupByLibrary.simpleMessage(
      "Accepted formats: .xlsx, .xls",
    ),
    "accessActiveList": MessageLookupByLibrary.simpleMessage(
      "Access Active List",
    ),
    "accessAdditionAndDeletions": MessageLookupByLibrary.simpleMessage(
      "Access Addition and Deletions",
    ),
    "accessDenied": MessageLookupByLibrary.simpleMessage("Access Denied"),
    "accessDeniedBody": MessageLookupByLibrary.simpleMessage(
      "You do not have permission to access this page. Please contact your administrator if you believe this is an error.",
    ),
    "accessPayment": MessageLookupByLibrary.simpleMessage("Access Payment"),
    "accessPermissions": MessageLookupByLibrary.simpleMessage(
      "Access Permissions",
    ),
    "accessPolicyDetails": MessageLookupByLibrary.simpleMessage(
      "Access Policy Details",
    ),
    "accessUtilization": MessageLookupByLibrary.simpleMessage(
      "Access Utilization",
    ),
    "account": MessageLookupByLibrary.simpleMessage("Account"),
    "acknowledgmentStatement": MessageLookupByLibrary.simpleMessage(
      "Acknowledgment Statement",
    ),
    "actionRequired": MessageLookupByLibrary.simpleMessage("Action Required"),
    "active": MessageLookupByLibrary.simpleMessage("Active"),
    "activeList": MessageLookupByLibrary.simpleMessage("Active list"),
    "activeMember": MessageLookupByLibrary.simpleMessage("Active Member"),
    "activeMembers": MessageLookupByLibrary.simpleMessage("Active Members"),
    "activePolicies": MessageLookupByLibrary.simpleMessage("Active Policies"),
    "activePolicy": MessageLookupByLibrary.simpleMessage("Active Policy"),
    "activeVsAdditions": MessageLookupByLibrary.simpleMessage(
      "Active vs Additions",
    ),
    "activeVsDeletions": MessageLookupByLibrary.simpleMessage(
      "Active vs Deletions",
    ),
    "add": MessageLookupByLibrary.simpleMessage("Add"),
    "add1stChild": MessageLookupByLibrary.simpleMessage("Add 1st Child"),
    "add2ndChild": MessageLookupByLibrary.simpleMessage("Add 2nd Child"),
    "add3rdChild": MessageLookupByLibrary.simpleMessage("Add 3rd Child"),
    "add4thChild": MessageLookupByLibrary.simpleMessage("Add 4th Child"),
    "add5thChild": MessageLookupByLibrary.simpleMessage("Add 5th Child"),
    "addAnotherManager": MessageLookupByLibrary.simpleMessage(
      "Add Another Manager",
    ),
    "addAnotherMember": MessageLookupByLibrary.simpleMessage(
      "Add Another Member",
    ),
    "addEmergency": MessageLookupByLibrary.simpleMessage("Add Emergency case"),
    "addHusband": MessageLookupByLibrary.simpleMessage("Add Husband"),
    "addMembersManually": MessageLookupByLibrary.simpleMessage(
      "Add Members Manually",
    ),
    "addNewPolicy": MessageLookupByLibrary.simpleMessage("+ Add New Policy"),
    "addNewRequest": MessageLookupByLibrary.simpleMessage("Add new Request"),
    "addNthChild": m1,
    "addWife": MessageLookupByLibrary.simpleMessage("Add Wife"),
    "added": MessageLookupByLibrary.simpleMessage("Added"),
    "addition": MessageLookupByLibrary.simpleMessage("Addition"),
    "additionAndDeletionForInsuranceCompany":
        MessageLookupByLibrary.simpleMessage(
          "Addition and Deletion for Insurance Company",
        ),
    "additionAndDeletions": MessageLookupByLibrary.simpleMessage(
      "Additions & Deletions",
    ),
    "additionDate": MessageLookupByLibrary.simpleMessage("Addition Date"),
    "additionGuidelines": MessageLookupByLibrary.simpleMessage(
      "Addition Guidelines",
    ),
    "additionOnly": MessageLookupByLibrary.simpleMessage("Addition Only"),
    "additionOnlyDesc": MessageLookupByLibrary.simpleMessage(
      "Add new members to the selected insurance policies. Perfect for onboarding new employees or adding family members.",
    ),
    "additionRequest": MessageLookupByLibrary.simpleMessage("Addition Request"),
    "additions": MessageLookupByLibrary.simpleMessage("Additions"),
    "address": MessageLookupByLibrary.simpleMessage("Address"),
    "affectedMembersWillBeNotified": MessageLookupByLibrary.simpleMessage(
      "Affected members will be notified of deletion via email/SMS",
    ),
    "afternoon": MessageLookupByLibrary.simpleMessage("Afternoon"),
    "age": MessageLookupByLibrary.simpleMessage("Age"),
    "age18To59": MessageLookupByLibrary.simpleMessage(
      "Age (18 to 59 years old)",
    ),
    "alertConfiguration": MessageLookupByLibrary.simpleMessage(
      "Alert Configuration",
    ),
    "all": MessageLookupByLibrary.simpleMessage("all"),
    "allDataValidatedInstantly": MessageLookupByLibrary.simpleMessage(
      "All data is validated instantly. You\'ll see real-time feedback if there are any errors in your entries.",
    ),
    "allDeletionRequestsAreValidated": MessageLookupByLibrary.simpleMessage(
      "All deletion requests are validated against policy rules and require approval from the insurance company. You will be notified of the status within 24-48 hours.",
    ),
    "allDoctors": MessageLookupByLibrary.simpleMessage("All Doctors"),
    "allDocumentsMustBeClear": MessageLookupByLibrary.simpleMessage(
      "All documents must be clear and readable",
    ),
    "allFieldsMarkedWithAsterisk": MessageLookupByLibrary.simpleMessage(
      "All fields marked with asterisk (*) must be filled",
    ),
    "allMembers": MessageLookupByLibrary.simpleMessage("All members"),
    "allProducts": MessageLookupByLibrary.simpleMessage("All Products"),
    "allStatus": MessageLookupByLibrary.simpleMessage("All Status"),
    "alreadyHaveAccount": MessageLookupByLibrary.simpleMessage(
      "Already have account?",
    ),
    "amount": MessageLookupByLibrary.simpleMessage("Amount"),
    "analytics": MessageLookupByLibrary.simpleMessage("Analytics"),
    "and": MessageLookupByLibrary.simpleMessage("and"),
    "any": MessageLookupByLibrary.simpleMessage("Any"),
    "app": MessageLookupByLibrary.simpleMessage("For App"),
    "appVersion": MessageLookupByLibrary.simpleMessage("App Version"),
    "appointmentTime": MessageLookupByLibrary.simpleMessage("Appointment Time"),
    "appointmentValidation": MessageLookupByLibrary.simpleMessage(
      "Appointment Time is required",
    ),
    "approvalCase": MessageLookupByLibrary.simpleMessage("Approval case"),
    "approved": MessageLookupByLibrary.simpleMessage("Approved"),
    "april": MessageLookupByLibrary.simpleMessage("April"),
    "arabic": MessageLookupByLibrary.simpleMessage("Arabic"),
    "arabicOrEnglishDocuments": MessageLookupByLibrary.simpleMessage(
      "Arabic or English documents accepted",
    ),
    "areYouSureYouWantToCloseApp": MessageLookupByLibrary.simpleMessage(
      "Are you sure you want to close Beyond Manager?",
    ),
    "area": MessageLookupByLibrary.simpleMessage("Area"),
    "areaBody": MessageLookupByLibrary.simpleMessage(
      "Please select the category",
    ),
    "attachmentsValidation": MessageLookupByLibrary.simpleMessage(
      "Attachments is required",
    ),
    "august": MessageLookupByLibrary.simpleMessage("August"),
    "automaticallyRenamedWithStaffNumber": MessageLookupByLibrary.simpleMessage(
      "Automatically renamed with Staff Number",
    ),
    "availableDoctors": MessageLookupByLibrary.simpleMessage(
      "Available Doctors",
    ),
    "availableLines": MessageLookupByLibrary.simpleMessage(
      "Available insurance lines!",
    ),
    "averageAgeComparison": MessageLookupByLibrary.simpleMessage(
      "Average Age Comparison",
    ),
    "avgAge": MessageLookupByLibrary.simpleMessage("Avg Age"),
    "back": MessageLookupByLibrary.simpleMessage("Back"),
    "backToDashboard": MessageLookupByLibrary.simpleMessage(
      "Back to Dashboard",
    ),
    "background": MessageLookupByLibrary.simpleMessage("Background:"),
    "bankAccount": MessageLookupByLibrary.simpleMessage("Bank Account"),
    "batchDeletion": MessageLookupByLibrary.simpleMessage("Batch Deletion:"),
    "beyondAccountManager": MessageLookupByLibrary.simpleMessage(
      "Beyond Account Manager",
    ),
    "beyondDeletionDate": MessageLookupByLibrary.simpleMessage(
      "Beyond deletion date",
    ),
    "beyondPolicyNumber": MessageLookupByLibrary.simpleMessage(
      "Beyond Policy Number",
    ),
    "beyondSalesAgent": MessageLookupByLibrary.simpleMessage(
      "Beyond Sales Agent",
    ),
    "beyondService": MessageLookupByLibrary.simpleMessage("Beyond Services"),
    "beyondUtilizationDashboard": MessageLookupByLibrary.simpleMessage(
      "Beyond Utilization Dashboard",
    ),
    "birthCertificatesForChildren": MessageLookupByLibrary.simpleMessage(
      "Birth certificates for children, marriage certificates for spouse",
    ),
    "boardingDescription1": MessageLookupByLibrary.simpleMessage(
      "Discover thousands of products and choose what suits you quickly and easily from anywhere.",
    ),
    "boardingDescription2": MessageLookupByLibrary.simpleMessage(
      "Don’t miss the strongest discounts and exclusive offers that get updated every day.",
    ),
    "boardingDescription3": MessageLookupByLibrary.simpleMessage(
      "Pay safely and enjoy fast delivery right to your doorstep without any hassle.",
    ),
    "boardingTitle1": MessageLookupByLibrary.simpleMessage("Easier Shopping"),
    "boardingTitle2": MessageLookupByLibrary.simpleMessage("Daily Deals"),
    "boardingTitle3": MessageLookupByLibrary.simpleMessage(
      "Secure Payment & Fast Delivery",
    ),
    "bookNow": MessageLookupByLibrary.simpleMessage("Book now"),
    "both": MessageLookupByLibrary.simpleMessage("Both"),
    "bothDesc": MessageLookupByLibrary.simpleMessage(
      "Perform both additions and deletions in a single request. Efficient for bulk policy updates.",
    ),
    "branch": MessageLookupByLibrary.simpleMessage("Branch"),
    "branchValidation": MessageLookupByLibrary.simpleMessage(
      "Branch is required",
    ),
    "byReimbursement": MessageLookupByLibrary.simpleMessage("By Reimbursement"),
    "call": MessageLookupByLibrary.simpleMessage("Call"),
    "call1": MessageLookupByLibrary.simpleMessage(
      "Contact your account manager for\nmore details!",
    ),
    "cancel": MessageLookupByLibrary.simpleMessage("Cancel"),
    "cannotOpenFile": MessageLookupByLibrary.simpleMessage("Cannot open file"),
    "cardNumber": m2,
    "cash": MessageLookupByLibrary.simpleMessage("Cash"),
    "category": MessageLookupByLibrary.simpleMessage("Category"),
    "categoryBody": MessageLookupByLibrary.simpleMessage(
      "Please select the category",
    ),
    "centerType": MessageLookupByLibrary.simpleMessage("Center Type"),
    "characterEncoding": MessageLookupByLibrary.simpleMessage(
      "Character Encoding:",
    ),
    "check": MessageLookupByLibrary.simpleMessage("Check"),
    "child": MessageLookupByLibrary.simpleMessage("Child"),
    "childrenAges": MessageLookupByLibrary.simpleMessage("Children Ages"),
    "chooseFile": MessageLookupByLibrary.simpleMessage("Choose File"),
    "chooseFromAndLandDate": MessageLookupByLibrary.simpleMessage(
      "Choose Date",
    ),
    "chooseFromGallery": MessageLookupByLibrary.simpleMessage(
      "Choose From Gallery",
    ),
    "chooseFromGallery1": MessageLookupByLibrary.simpleMessage("Choose Image"),
    "chooseFromGallery2": MessageLookupByLibrary.simpleMessage("Choose video"),
    "chooseMember": MessageLookupByLibrary.simpleMessage("Choose Member"),
    "chooseRequestType": MessageLookupByLibrary.simpleMessage(
      "Choose Request Type",
    ),
    "chooseTypeOfAction": MessageLookupByLibrary.simpleMessage(
      "Choose the type of action you want to perform",
    ),
    "chooseWhichInsurancePolicies": MessageLookupByLibrary.simpleMessage(
      "Choose which insurance policies you want to apply this action to",
    ),
    "chronic": MessageLookupByLibrary.simpleMessage("Chronic"),
    "chronicDiseasesDescription": MessageLookupByLibrary.simpleMessage(
      "What chronic diseases do you or your family members suffer from? (for better understanding of the situation):",
    ),
    "chronicDiseasesQuestion": MessageLookupByLibrary.simpleMessage(
      "Does any of your family members need monthly treatment or suffer from chronic diseases?",
    ),
    "chronicMedications": MessageLookupByLibrary.simpleMessage(
      "Chronic Medications",
    ),
    "city": MessageLookupByLibrary.simpleMessage("City"),
    "cityBody": MessageLookupByLibrary.simpleMessage(
      "Please select the category",
    ),
    "cityValidation": MessageLookupByLibrary.simpleMessage(
      "Please Select city",
    ),
    "claimDate": MessageLookupByLibrary.simpleMessage("Claim Date"),
    "claimId": MessageLookupByLibrary.simpleMessage("Claim Id"),
    "claimStatus": MessageLookupByLibrary.simpleMessage("Claim Status"),
    "clearOtherFirst": MessageLookupByLibrary.simpleMessage(
      "please clear other first",
    ),
    "clearRecentPhoto": MessageLookupByLibrary.simpleMessage(
      "Clear, recent photo (not older than 6 months)",
    ),
    "clickToSelectMultipleDocuments": MessageLookupByLibrary.simpleMessage(
      "Click to select multiple documents or drag and drop",
    ),
    "clickToSelectMultiplePhotos": MessageLookupByLibrary.simpleMessage(
      "Click to select multiple photos or drag and drop",
    ),
    "clickToSelectYourFilledTemplate": MessageLookupByLibrary.simpleMessage(
      "Click to select your filled template",
    ),
    "close": MessageLookupByLibrary.simpleMessage("Close"),
    "closeGuidelines": MessageLookupByLibrary.simpleMessage("Close Guidelines"),
    "commingSoon": MessageLookupByLibrary.simpleMessage("Coming Soon"),
    "companyName": MessageLookupByLibrary.simpleMessage("Company Name"),
    "companySickLeaveAna": MessageLookupByLibrary.simpleMessage(
      "Company\'s Sick Leave Analytics",
    ),
    "companySize": MessageLookupByLibrary.simpleMessage("Company Size"),
    "comparePlans": MessageLookupByLibrary.simpleMessage("Compare Plans"),
    "comparingPlans": MessageLookupByLibrary.simpleMessage(
      "Comparing plans...",
    ),
    "complaint": MessageLookupByLibrary.simpleMessage("Complaint"),
    "complaint1": MessageLookupByLibrary.simpleMessage(
      "in case there is a complaint please follow the following processes:Send us an email to",
    ),
    "complaint2": MessageLookupByLibrary.simpleMessage(" Or call"),
    "complaint3": MessageLookupByLibrary.simpleMessage(
      "Upon receipt of the complaint, we will contact you to discuss the complaint and indicate the time to investigate the complaint then inform you of the outcome.",
    ),
    "complaint4": MessageLookupByLibrary.simpleMessage(
      "Customers have the right to contact the FRA directly on info@fra.gov.eg. This is as long as the members have all the policy documents stating their rights, and after following the rules and regulations of the insurer.",
    ),
    "complaint5": MessageLookupByLibrary.simpleMessage(
      " To view the Customer Protection Guide issued by the Financial Regulatory Authority, follow the link below",
    ),
    "completed": MessageLookupByLibrary.simpleMessage("Completed"),
    "completionDate": MessageLookupByLibrary.simpleMessage("COMPLETION DATE"),
    "comprehensiveErrorReporting": MessageLookupByLibrary.simpleMessage(
      "Comprehensive error reporting",
    ),
    "configureUtilizationNotification": MessageLookupByLibrary.simpleMessage(
      "Configure Utilization Notifications",
    ),
    "configureUtilizationNotificationBody":
        MessageLookupByLibrary.simpleMessage(
          "Set thresholds for automatic alerts and reminders.",
        ),
    "confirm": MessageLookupByLibrary.simpleMessage("Confirm"),
    "consumptionExceeded": m3,
    "contactSupport": MessageLookupByLibrary.simpleMessage("Contact Support"),
    "continueButton": MessageLookupByLibrary.simpleMessage("Continue"),
    "continueToMethodSelection": MessageLookupByLibrary.simpleMessage(
      "Continue to Method Selection",
    ),
    "count": MessageLookupByLibrary.simpleMessage("Count"),
    "countMembers": m0,
    "coverageEnd": MessageLookupByLibrary.simpleMessage("Coverage End:"),
    "createHrAccess": MessageLookupByLibrary.simpleMessage("Create HR Access"),
    "createNewAccount": MessageLookupByLibrary.simpleMessage("Create account"),
    "createNewManager": MessageLookupByLibrary.simpleMessage(
      "Create New Manager",
    ),
    "createNewRequest": MessageLookupByLibrary.simpleMessage(
      "Create New Request",
    ),
    "createNewRequestDesc": MessageLookupByLibrary.simpleMessage(
      "Submit a new addition or deletion request for your members. Choose between manual entry or bulk template upload.",
    ),
    "createNewRequestSickLeave": MessageLookupByLibrary.simpleMessage(
      "Create New Sick Leave Request",
    ),
    "creationDate": MessageLookupByLibrary.simpleMessage("Creation Date: "),
    "currency": MessageLookupByLibrary.simpleMessage("Currency"),
    "darkMode": MessageLookupByLibrary.simpleMessage("Dark Mode"),
    "dataAccuracy": MessageLookupByLibrary.simpleMessage("Data Accuracy:"),
    "date": MessageLookupByLibrary.simpleMessage("Date"),
    "dateOfBirth": MessageLookupByLibrary.simpleMessage("Date of Birth"),
    "dateOfBirthFormatDDMMYYYY": MessageLookupByLibrary.simpleMessage(
      "Format must be DD/MM/YYYY",
    ),
    "dateOfBirthValidation": MessageLookupByLibrary.simpleMessage(
      "Date of Birth is required",
    ),
    "daughter": MessageLookupByLibrary.simpleMessage("Daughter"),
    "day": MessageLookupByLibrary.simpleMessage("Day"),
    "ddMmYyyy": MessageLookupByLibrary.simpleMessage("DD/MM/YYYY"),
    "december": MessageLookupByLibrary.simpleMessage("December"),
    "deepDiveStudy": MessageLookupByLibrary.simpleMessage("Deep Dive Study"),
    "delete": MessageLookupByLibrary.simpleMessage("Delete"),
    "deleteAccount": MessageLookupByLibrary.simpleMessage("Delete My Account"),
    "deleteAccountBody": MessageLookupByLibrary.simpleMessage(
      "Are you sure you want to delete your account? If you delete your account, you will permanently lose your profile,",
    ),
    "deleteConfirmation": MessageLookupByLibrary.simpleMessage(
      "Are you sure you want to delete this attachment ?",
    ),
    "deleted": MessageLookupByLibrary.simpleMessage("Deleted"),
    "deletedMembersMayBeReEnrolled": MessageLookupByLibrary.simpleMessage(
      "Deleted members may be re-enrolled following standard addition procedures",
    ),
    "deletingPrincipalAutomaticallyRemoves":
        MessageLookupByLibrary.simpleMessage(
          "Deleting principal automatically removes all dependents",
        ),
    "deletingPrincipalAutomaticallyRemovesDesc":
        MessageLookupByLibrary.simpleMessage(
          "Deleting principal automatically removes all dependents (spouse, children)",
        ),
    "deletingPrincipalMemberWillAutomatically":
        MessageLookupByLibrary.simpleMessage(
          "Deleting a principal member will automatically remove all associated family members. This action cannot be undone.",
        ),
    "deletion": MessageLookupByLibrary.simpleMessage("Deletion"),
    "deletionDate": MessageLookupByLibrary.simpleMessage("Deletion date"),
    "deletionGuidelines": MessageLookupByLibrary.simpleMessage(
      "Deletion Guidelines",
    ),
    "deletionGuidelinesTitle": MessageLookupByLibrary.simpleMessage(
      "Deletion Guidelines",
    ),
    "deletionOnly": MessageLookupByLibrary.simpleMessage("Deletion Only"),
    "deletionOnlyDesc": MessageLookupByLibrary.simpleMessage(
      "Remove existing members from the selected insurance policies. Used for terminations or coverage changes.",
    ),
    "deletionProcess": MessageLookupByLibrary.simpleMessage("Deletion Process"),
    "deletionReason": MessageLookupByLibrary.simpleMessage("Deletion Reason:"),
    "deletionRequest": MessageLookupByLibrary.simpleMessage("Deletion Request"),
    "deletionRequirements": MessageLookupByLibrary.simpleMessage(
      "Deletion Requirements",
    ),
    "deletions": MessageLookupByLibrary.simpleMessage("Deletions"),
    "demographicsOverview": MessageLookupByLibrary.simpleMessage(
      "Demographics Overview",
    ),
    "dental": MessageLookupByLibrary.simpleMessage("Dental"),
    "dentalInsurancePlan": MessageLookupByLibrary.simpleMessage(
      "Dental Insurance Plan",
    ),
    "dependentWarning": MessageLookupByLibrary.simpleMessage(
      "Dependent Warning:",
    ),
    "description": MessageLookupByLibrary.simpleMessage("Description"),
    "description1": MessageLookupByLibrary.simpleMessage(
      "responsible for developing and implementing HR strategies and initiatives aligned with the overall business strategy, bridging management and employee relations, managing the recruitment and selection process, and reporting directly to the CEO.",
    ),
    "diaganosisCode": MessageLookupByLibrary.simpleMessage("Diaganosis Code"),
    "diagnosis": MessageLookupByLibrary.simpleMessage("Diagnosis"),
    "disease": MessageLookupByLibrary.simpleMessage("Disease"),
    "diseaseCategory": MessageLookupByLibrary.simpleMessage("Disease Category"),
    "doctorGender": MessageLookupByLibrary.simpleMessage("Doctor\'s Gender"),
    "doctorReservations": MessageLookupByLibrary.simpleMessage(
      "Doctor Reservations",
    ),
    "doctorValidation": MessageLookupByLibrary.simpleMessage(
      "Doctor Gender is required",
    ),
    "doctor_visit": MessageLookupByLibrary.simpleMessage("Doctor Visit"),
    "documentRequirements": MessageLookupByLibrary.simpleMessage(
      "Document Requirements",
    ),
    "documentsMustBeNamedWithStaffId": MessageLookupByLibrary.simpleMessage(
      "• Documents must be named with Staff ID",
    ),
    "documentsSelected": m4,
    "done": MessageLookupByLibrary.simpleMessage("Done"),
    "dontHaveAccount": MessageLookupByLibrary.simpleMessage(
      "Dont have account?",
    ),
    "dontReceiveCode": MessageLookupByLibrary.simpleMessage(
      "You can request a new code within ",
    ),
    "downloadExcelReport": MessageLookupByLibrary.simpleMessage(
      "Download Excel Report",
    ),
    "downloadExcelTemplate": MessageLookupByLibrary.simpleMessage(
      "Download the Excel template and fill it with member information",
    ),
    "downloadForeignEmployeeAcknowledgementTemplate":
        MessageLookupByLibrary.simpleMessage(
          "Download Foreign Employee Acknowledgement Template",
        ),
    "downloadReport": MessageLookupByLibrary.simpleMessage("Download Report"),
    "downloadTemp": MessageLookupByLibrary.simpleMessage("Download Template"),
    "downloadTemplate": MessageLookupByLibrary.simpleMessage(
      "Download Template",
    ),
    "dueDate": MessageLookupByLibrary.simpleMessage("Due date"),
    "eCard": MessageLookupByLibrary.simpleMessage("E-Card"),
    "effectiveDate": MessageLookupByLibrary.simpleMessage("Effective Date:"),
    "efficientBulkProcessing": MessageLookupByLibrary.simpleMessage(
      "Efficient bulk processing",
    ),
    "egp": MessageLookupByLibrary.simpleMessage("EGP"),
    "egyptian": MessageLookupByLibrary.simpleMessage("Egyptian"),
    "emailAddress": MessageLookupByLibrary.simpleMessage("Email Address"),
    "emailAddressHint": MessageLookupByLibrary.simpleMessage(
      "Enter your email address",
    ),
    "emailAddressValidation": MessageLookupByLibrary.simpleMessage(
      "Email address is required",
    ),
    "emailHint": MessageLookupByLibrary.simpleMessage("member@example.com"),
    "emailMustBeValid": MessageLookupByLibrary.simpleMessage(
      "Must be valid company or personal email",
    ),
    "emergency": MessageLookupByLibrary.simpleMessage("Emergency"),
    "emergencyCase": MessageLookupByLibrary.simpleMessage("Emergency case"),
    "emergencyNoItem": MessageLookupByLibrary.simpleMessage(
      "There are no pending or old requests, please create a new request below",
    ),
    "emergencySupport": MessageLookupByLibrary.simpleMessage(
      "Emergency Support",
    ),
    "emergencySupport1": MessageLookupByLibrary.simpleMessage(
      "Emergency Support",
    ),
    "emergencySupport2": MessageLookupByLibrary.simpleMessage(
      "Emergency\nSupport",
    ),
    "emergencySupport3": MessageLookupByLibrary.simpleMessage(
      "Our team is here for you!",
    ),
    "emergencySupport4": MessageLookupByLibrary.simpleMessage(
      "Expect a call back from our team in 10 minutes.",
    ),
    "employeeAmountThreshold": MessageLookupByLibrary.simpleMessage(
      "Employee Amount Threshold",
    ),
    "employeeAmountThresholdDescription": MessageLookupByLibrary.simpleMessage(
      "Alert when any employee\'s total consumption reaches this amount.",
    ),
    "employeeStaffNumber": MessageLookupByLibrary.simpleMessage(
      "Employee Staff Number",
    ),
    "employeeTransactionCountThreshold": MessageLookupByLibrary.simpleMessage(
      "Employee Transaction Count Threshold",
    ),
    "employeeTransactionCountThresholdDescription":
        MessageLookupByLibrary.simpleMessage(
          "Alert when any employee\'s number of transactions reaches this count.",
        ),
    "employees": MessageLookupByLibrary.simpleMessage("Employees"),
    "employeesExceededAmountExamples": MessageLookupByLibrary.simpleMessage(
      "Examples: ",
    ),
    "employeesExceededTransactionThreshold": m5,
    "endDate": MessageLookupByLibrary.simpleMessage("End Date"),
    "english": MessageLookupByLibrary.simpleMessage("English"),
    "ensureAllDataComplies": MessageLookupByLibrary.simpleMessage(
      "Please ensure all data complies with these guidelines before submitting your template to avoid delays or rejections.",
    ),
    "enterDisease": MessageLookupByLibrary.simpleMessage("Enter the disease"),
    "enterInput": MessageLookupByLibrary.simpleMessage("Enter Input"),
    "enterOtp": MessageLookupByLibrary.simpleMessage(
      "Enter your otp that sent to number",
    ),
    "enterPhoneNumber": MessageLookupByLibrary.simpleMessage(
      "Enter your mobile number",
    ),
    "enterPrimaryMemberData": MessageLookupByLibrary.simpleMessage(
      "Enter Primary Member\'s Data",
    ),
    "errorBody": MessageLookupByLibrary.simpleMessage(
      "A problem occurred while loading the data. Please try again later.",
    ),
    "errorLoadingData": MessageLookupByLibrary.simpleMessage(
      "Error loading data",
    ),
    "errorTitle": MessageLookupByLibrary.simpleMessage(
      "An unexpected error occurred",
    ),
    "error_bad_request": MessageLookupByLibrary.simpleMessage("Bad Request"),
    "error_bad_response": MessageLookupByLibrary.simpleMessage(
      "Bad response from server",
    ),
    "error_conflict": MessageLookupByLibrary.simpleMessage("Conflict occurred"),
    "error_fetch_data": MessageLookupByLibrary.simpleMessage(
      "Error during communication",
    ),
    "error_internal_server": MessageLookupByLibrary.simpleMessage(
      "Internal server error",
    ),
    "error_no_internet": MessageLookupByLibrary.simpleMessage(
      "No internet connection",
    ),
    "error_not_found": MessageLookupByLibrary.simpleMessage("Not Found"),
    "error_unauthorized": MessageLookupByLibrary.simpleMessage(
      "Unauthorized access",
    ),
    "evening": MessageLookupByLibrary.simpleMessage("Evening"),
    "exampleLabel": MessageLookupByLibrary.simpleMessage("• Example:  "),
    "examples": MessageLookupByLibrary.simpleMessage("• Examples:"),
    "exceededEmployeesListTitle": MessageLookupByLibrary.simpleMessage(
      "Employees who exceeded threshold",
    ),
    "exceededMembersCountThresholdSummary": m6,
    "exceededMembersEmployeeAmountSummary": m7,
    "expired": MessageLookupByLibrary.simpleMessage("Expired"),
    "expiredPolicy": MessageLookupByLibrary.simpleMessage("Expired Policy"),
    "exploreNow": MessageLookupByLibrary.simpleMessage("Explore now"),
    "familyMembers": MessageLookupByLibrary.simpleMessage("Family Members"),
    "familyUnitWarning": MessageLookupByLibrary.simpleMessage(
      "Family Unit Warning:",
    ),
    "fatherName": MessageLookupByLibrary.simpleMessage("Second Name"),
    "february": MessageLookupByLibrary.simpleMessage("February"),
    "feedback": MessageLookupByLibrary.simpleMessage("Feedback"),
    "female": MessageLookupByLibrary.simpleMessage("Female"),
    "fileSize": MessageLookupByLibrary.simpleMessage("File Size:"),
    "fillOutMemberDetails": MessageLookupByLibrary.simpleMessage(
      "Fill out member details below. You can add multiple members in one request.",
    ),
    "firstDateValidation": MessageLookupByLibrary.simpleMessage(
      "Start Date is required",
    ),
    "firstName": MessageLookupByLibrary.simpleMessage("First Name"),
    "firstNameValidation": MessageLookupByLibrary.simpleMessage(
      "First Name is required",
    ),
    "forSelectedInsurancePolicies": MessageLookupByLibrary.simpleMessage(
      "For Selected Insurance Policies",
    ),
    "foreignEmployees": MessageLookupByLibrary.simpleMessage(
      "foreign employees",
    ),
    "format": MessageLookupByLibrary.simpleMessage("Format:"),
    "formatStaffIdDocumentType": MessageLookupByLibrary.simpleMessage(
      "[StaffID]_[DocumentType].pdf",
    ),
    "formatStaffIdJpg": MessageLookupByLibrary.simpleMessage("• Format:  "),
    "from": MessageLookupByLibrary.simpleMessage("From"),
    "fromDate": MessageLookupByLibrary.simpleMessage("From date"),
    "fullAddress": MessageLookupByLibrary.simpleMessage("Full Address"),
    "fullName": MessageLookupByLibrary.simpleMessage("Full Name"),
    "fullNameArabic": MessageLookupByLibrary.simpleMessage(
      "Full Name (Arabic)",
    ),
    "fullNameEnglish": MessageLookupByLibrary.simpleMessage(
      "Full Name (English)",
    ),
    "fullNameHint": MessageLookupByLibrary.simpleMessage(
      "Enter your full name",
    ),
    "gender": MessageLookupByLibrary.simpleMessage("Gender"),
    "genderDistribution": MessageLookupByLibrary.simpleMessage(
      "Gender Distribution",
    ),
    "generalRequirements": MessageLookupByLibrary.simpleMessage(
      "General Requirements",
    ),
    "getAQuote": MessageLookupByLibrary.simpleMessage("Get A Quote"),
    "getCovered": MessageLookupByLibrary.simpleMessage("Get 100%\nCovered"),
    "getPersonalizedQuote": MessageLookupByLibrary.simpleMessage(
      "Get Personalized Quote",
    ),
    "getStarted": MessageLookupByLibrary.simpleMessage("Get Started"),
    "globalAccessRights": MessageLookupByLibrary.simpleMessage(
      "Global Access Rights",
    ),
    "gold": MessageLookupByLibrary.simpleMessage("Gold"),
    "grandFatherName": MessageLookupByLibrary.simpleMessage("Third Name"),
    "guidedStepByStep": MessageLookupByLibrary.simpleMessage(
      "Guided step-by-step process",
    ),
    "guidelinesOfAdditionAndDeletion": MessageLookupByLibrary.simpleMessage(
      "Guidelines of Addition and Deletion for Insurance Company",
    ),
    "hasFamilyMembersAutoSelected": m8,
    "hideDetails": MessageLookupByLibrary.simpleMessage("Hide Details"),
    "highMatch": MessageLookupByLibrary.simpleMessage("High Match"),
    "highMatch70": MessageLookupByLibrary.simpleMessage("High Match (70%+)"),
    "hiringDate": MessageLookupByLibrary.simpleMessage("Hiring Date"),
    "home": MessageLookupByLibrary.simpleMessage("Home"),
    "home1": MessageLookupByLibrary.simpleMessage(
      "Beyond Insurance Brokerage is authorized and\nregulated by The Financial Regulatory Authority\n(FRA) Registration No. 103 for the year 2021 ",
    ),
    "home2": MessageLookupByLibrary.simpleMessage(
      "© 2023 Beyond Insurance Brokerage,\nALL RIGHTS RESERVED.",
    ),
    "hospital": MessageLookupByLibrary.simpleMessage("Hospital"),
    "hospitalValidation": MessageLookupByLibrary.simpleMessage(
      "Hospital is required",
    ),
    "hrAccessTip": MessageLookupByLibrary.simpleMessage(
      "All data is validated before submission. Make sure to select a policy and fill in all required fields.",
    ),
    "husbandAdded": MessageLookupByLibrary.simpleMessage("Husband Added"),
    "iAgreeWith": MessageLookupByLibrary.simpleMessage(
      "By clicking \"Create Account\", you agree to",
    ),
    "ibanConditional": MessageLookupByLibrary.simpleMessage(
      "IBAN (Conditional)",
    ),
    "ibanHint": MessageLookupByLibrary.simpleMessage("EG38..."),
    "icdCode": MessageLookupByLibrary.simpleMessage("Icd Code"),
    "ifYourTemplateIncludesForeignEmployees":
        MessageLookupByLibrary.simpleMessage("If your template includes "),
    "important": MessageLookupByLibrary.simpleMessage("Important: "),
    "importantBody": MessageLookupByLibrary.simpleMessage(
      "Selecting a principal member will automatically select all their family members. They must be deleted together as a family unit.",
    ),
    "importantLabel": MessageLookupByLibrary.simpleMessage("Important: "),
    "importantNamingConvention": MessageLookupByLibrary.simpleMessage(
      "IMPORTANT NAMING CONVENTION:",
    ),
    "importantNotes": MessageLookupByLibrary.simpleMessage("Important Notes"),
    "importantNotice": MessageLookupByLibrary.simpleMessage("Important Notice"),
    "individualMedicalInsurance": MessageLookupByLibrary.simpleMessage(
      "Individual Medical Insurance",
    ),
    "information": MessageLookupByLibrary.simpleMessage("Information"),
    "inpatient": MessageLookupByLibrary.simpleMessage("Inpatient"),
    "inquiry": MessageLookupByLibrary.simpleMessage("Inquiry"),
    "instantFieldValidation": MessageLookupByLibrary.simpleMessage(
      "Instant field validation",
    ),
    "insuranceCompany": MessageLookupByLibrary.simpleMessage(
      "Insurance Company",
    ),
    "insuranceCoverageEndsOnSpecifiedDate":
        MessageLookupByLibrary.simpleMessage(
          "Insurance coverage ends on the specified effective date",
        ),
    "insuranceFinancing": MessageLookupByLibrary.simpleMessage(
      "Insurance financing",
    ),
    "insuranceFund": MessageLookupByLibrary.simpleMessage("Insurance Fund"),
    "insuranceID": MessageLookupByLibrary.simpleMessage("Insurance ID"),
    "insuranceLine": MessageLookupByLibrary.simpleMessage("Insurance Line"),
    "insuranceNetwork": MessageLookupByLibrary.simpleMessage(
      "Insurance Network",
    ),
    "insuranceNetworks": MessageLookupByLibrary.simpleMessage(
      "Insurance Networks",
    ),
    "insuranceOptions": MessageLookupByLibrary.simpleMessage(
      "Insurance Options",
    ),
    "insuranceOptionsText1": MessageLookupByLibrary.simpleMessage(
      "Beyond will help you feel completely secure,as we offer you the best insurance offers along with our exceptional services",
    ),
    "insurancePlanType": MessageLookupByLibrary.simpleMessage(
      "Insurance Plan Type",
    ),
    "insurancePlans": MessageLookupByLibrary.simpleMessage("Insurance Plans"),
    "insurancePolicies": MessageLookupByLibrary.simpleMessage(
      "Insurance Policies",
    ),
    "insurancePolicies1": MessageLookupByLibrary.simpleMessage(
      "Insurance Policies",
    ),
    "insurancePolicies2": MessageLookupByLibrary.simpleMessage(
      "Insurance\n Policies",
    ),
    "insurancePolicyNumber": MessageLookupByLibrary.simpleMessage(
      "Insurance Policy Number",
    ),
    "insuranceProducts": MessageLookupByLibrary.simpleMessage(
      "Insurance Products",
    ),
    "insuranceState": MessageLookupByLibrary.simpleMessage("Insurance State"),
    "insured": MessageLookupByLibrary.simpleMessage("Insured"),
    "invalidEmail": MessageLookupByLibrary.simpleMessage(
      "Please enter a valid email",
    ),
    "invalidOtp": MessageLookupByLibrary.simpleMessage(
      "Invalid verification code, please check the required number",
    ),
    "invalidPhone": MessageLookupByLibrary.simpleMessage(
      "Invalid Phone number",
    ),
    "invoiceFile": MessageLookupByLibrary.simpleMessage("Invoice file"),
    "invoiced": MessageLookupByLibrary.simpleMessage("Invoiced"),
    "isDeleted": MessageLookupByLibrary.simpleMessage("is Deleted"),
    "issuingType": MessageLookupByLibrary.simpleMessage("Issuing Type"),
    "item": MessageLookupByLibrary.simpleMessage("Item"),
    "january": MessageLookupByLibrary.simpleMessage("January"),
    "jobDesciprtion": MessageLookupByLibrary.simpleMessage("job Description"),
    "jobTitle": MessageLookupByLibrary.simpleMessage("Job Title"),
    "jpgOrPngOnly": MessageLookupByLibrary.simpleMessage("JPG or PNG only"),
    "july": MessageLookupByLibrary.simpleMessage("July"),
    "june": MessageLookupByLibrary.simpleMessage("June"),
    "lab": MessageLookupByLibrary.simpleMessage("Laboratory"),
    "language": MessageLookupByLibrary.simpleMessage("Language"),
    "languageHint": MessageLookupByLibrary.simpleMessage(
      "Choose your preferred app language",
    ),
    "lastName": MessageLookupByLibrary.simpleMessage("Last Name"),
    "lastNameValidation": MessageLookupByLibrary.simpleMessage(
      "Last Name is required",
    ),
    "lastUpdated": MessageLookupByLibrary.simpleMessage("Last Updated : "),
    "lastUpdatedLabel": MessageLookupByLibrary.simpleMessage("Last Updated: "),
    "leadReference": MessageLookupByLibrary.simpleMessage("Lead Reference"),
    "legibility": MessageLookupByLibrary.simpleMessage("Legibility:"),
    "lifeInsurancePlan": MessageLookupByLibrary.simpleMessage(
      "Life Insurance Plan",
    ),
    "lightMode": MessageLookupByLibrary.simpleMessage("Light Mode"),
    "lineOfBusiness": MessageLookupByLibrary.simpleMessage(
      "Line of Business: ",
    ),
    "loadingText": MessageLookupByLibrary.simpleMessage("Loading..."),
    "location": MessageLookupByLibrary.simpleMessage("Location"),
    "logOut": MessageLookupByLibrary.simpleMessage("Log out"),
    "login": MessageLookupByLibrary.simpleMessage("Log in"),
    "loginBody": MessageLookupByLibrary.simpleMessage(
      "Enter your phone number to log in",
    ),
    "loginTitle": MessageLookupByLibrary.simpleMessage(
      "Happy to have you back!",
    ),
    "logout": MessageLookupByLibrary.simpleMessage("Log Out"),
    "logoutBody": MessageLookupByLibrary.simpleMessage(
      "Are you sure you want to log out?",
    ),
    "lowMatch": MessageLookupByLibrary.simpleMessage("Low Match"),
    "lowMatchBelow40": MessageLookupByLibrary.simpleMessage(
      "Low Match (Below 40%)",
    ),
    "male": MessageLookupByLibrary.simpleMessage("Male"),
    "manageMemberAdditionsDeletions": MessageLookupByLibrary.simpleMessage(
      "Manage member additions and deletions for your insurance policies",
    ),
    "managerFullName": MessageLookupByLibrary.simpleMessage(
      "Manager Full Name",
    ),
    "manualEntry": MessageLookupByLibrary.simpleMessage("Manual Entry"),
    "manualEntryDesc": MessageLookupByLibrary.simpleMessage(
      "Fill out forms on the platform to add members one by one. Best for small numbers of members.",
    ),
    "march": MessageLookupByLibrary.simpleMessage("March"),
    "maritalStatus": MessageLookupByLibrary.simpleMessage("Marital Status"),
    "married": MessageLookupByLibrary.simpleMessage("Married"),
    "matchLevel": MessageLookupByLibrary.simpleMessage("Match Level"),
    "maternity": MessageLookupByLibrary.simpleMessage("Maternity"),
    "maximum10MBPerDocument": MessageLookupByLibrary.simpleMessage(
      "Maximum 10MB per document",
    ),
    "maximum5MBPerPhoto": MessageLookupByLibrary.simpleMessage(
      "Maximum 5MB per photo",
    ),
    "maximumMembers": MessageLookupByLibrary.simpleMessage("Maximum Members:"),
    "maximumTemplateSizeIs10MB": MessageLookupByLibrary.simpleMessage(
      "Maximum template size is 10MB",
    ),
    "may": MessageLookupByLibrary.simpleMessage("May"),
    "medical": MessageLookupByLibrary.simpleMessage("Medical"),
    "medicalInsurance": MessageLookupByLibrary.simpleMessage(
      "Medical Insurance",
    ),
    "medicalInsurancePlan": MessageLookupByLibrary.simpleMessage(
      "Medical Insurance Plan",
    ),
    "medicalNetwork": MessageLookupByLibrary.simpleMessage("Medical Network"),
    "medication": MessageLookupByLibrary.simpleMessage("Medication"),
    "mediumMatch": MessageLookupByLibrary.simpleMessage("Medium Match"),
    "mediumMatch40": MessageLookupByLibrary.simpleMessage(
      "Medium Match (40-69%)",
    ),
    "member": MessageLookupByLibrary.simpleMessage("Member #"),
    "memberFullName": MessageLookupByLibrary.simpleMessage("Member Full Name"),
    "memberFullNameArabic": MessageLookupByLibrary.simpleMessage(
      "Member Full Name",
    ),
    "memberId": MessageLookupByLibrary.simpleMessage("Member Id"),
    "memberMustHaveCompletedMinimumCoverage": MessageLookupByLibrary.simpleMessage(
      "Member must have completed the minimum coverage period as per policy terms",
    ),
    "memberName": MessageLookupByLibrary.simpleMessage("Member Name"),
    "memberStatistics": MessageLookupByLibrary.simpleMessage(
      "Member Statistics",
    ),
    "memberValidation": MessageLookupByLibrary.simpleMessage(
      "please choose member or enter his name ",
    ),
    "memberVerification": MessageLookupByLibrary.simpleMessage(
      "Member Verification:",
    ),
    "membersCount": MessageLookupByLibrary.simpleMessage("MEMBERS COUNT"),
    "membersCountLabel": MessageLookupByLibrary.simpleMessage("MEMBERS COU..."),
    "membersInThisRequest": MessageLookupByLibrary.simpleMessage(
      "Members in this Request",
    ),
    "membersMustExistInActiveList": MessageLookupByLibrary.simpleMessage(
      "Members must exist in the Active List",
    ),
    "membersMustExistInActiveListAndValid": MessageLookupByLibrary.simpleMessage(
      "Members must exist in the Active List and have a valid active status",
    ),
    "membersOnly": MessageLookupByLibrary.simpleMessage("Members Only"),
    "minimum300x300Pixels": MessageLookupByLibrary.simpleMessage(
      "Minimum 300x300 pixels, recommended 600x600",
    ),
    "missingIbanReason": MessageLookupByLibrary.simpleMessage(
      "Missing IBAN for bank account reimbursement",
    ),
    "missingIbanWhatToDo": MessageLookupByLibrary.simpleMessage(
      "Please provide IBAN number or contact support for assistance",
    ),
    "mode": MessageLookupByLibrary.simpleMessage("Mode"),
    "monitorAllYourAdditionDeletionRequests":
        MessageLookupByLibrary.simpleMessage(
          "Monitor and track all your addition and deletion requests",
        ),
    "month": MessageLookupByLibrary.simpleMessage("Month"),
    "monthlyConsumptionThreshold": MessageLookupByLibrary.simpleMessage(
      "Monthly Consumption Threshold",
    ),
    "monthlyConsumptionThresholdDescription":
        MessageLookupByLibrary.simpleMessage(
          "Alert when consumption in a specific month reaches this amount.",
        ),
    "monthlyExceeded": m9,
    "monthlySalary": MessageLookupByLibrary.simpleMessage("Monthly Salary"),
    "monthlyTrend": MessageLookupByLibrary.simpleMessage("Monthly Trend"),
    "morning": MessageLookupByLibrary.simpleMessage("Morning"),
    "mustProvideValidReasonForDeletion": MessageLookupByLibrary.simpleMessage(
      "Must provide valid reason for deletion",
    ),
    "mustProvideValidReasonForDeletionDesc": MessageLookupByLibrary.simpleMessage(
      "Must provide a valid reason for deletion (e.g., termination, retirement, voluntary withdrawal)",
    ),
    "myAttachment": MessageLookupByLibrary.simpleMessage("My Attachments"),
    "myRequests": MessageLookupByLibrary.simpleMessage("My Requests"),
    "myReservation": MessageLookupByLibrary.simpleMessage("My Reservations"),
    "name": MessageLookupByLibrary.simpleMessage("Name"),
    "nameOnInsuranceCard": MessageLookupByLibrary.simpleMessage(
      "Name On Insurance Card: ",
    ),
    "naming": MessageLookupByLibrary.simpleMessage("Naming:"),
    "namingConvention": MessageLookupByLibrary.simpleMessage(
      "Naming Convention:",
    ),
    "nationalIdCNID": MessageLookupByLibrary.simpleMessage(
      "National ID (CNID)",
    ),
    "nationalIdCnid": MessageLookupByLibrary.simpleMessage(
      "National ID (CNID)",
    ),
    "nationalIdHint": MessageLookupByLibrary.simpleMessage(
      "14-digit National ID",
    ),
    "nationalIdLabel": MessageLookupByLibrary.simpleMessage("National ID:"),
    "nationalIdMustBe14Digits": MessageLookupByLibrary.simpleMessage(
      "Must be 14 digits for Egyptian nationals",
    ),
    "nationality": MessageLookupByLibrary.simpleMessage("Nationality"),
    "nationalityLabel": MessageLookupByLibrary.simpleMessage("Nationality:"),
    "neededPaper": MessageLookupByLibrary.simpleMessage("Needed Papers"),
    "newKeyword": MessageLookupByLibrary.simpleMessage("New"),
    "newReservation": MessageLookupByLibrary.simpleMessage("New Reservation"),
    "nextPayment": MessageLookupByLibrary.simpleMessage("Next Payment"),
    "nextPaymentDate": MessageLookupByLibrary.simpleMessage(
      "Next Payment Date",
    ),
    "no": MessageLookupByLibrary.simpleMessage("No"),
    "noArticals": MessageLookupByLibrary.simpleMessage("No articles found"),
    "noBeyondUtilizationDashboard": MessageLookupByLibrary.simpleMessage(
      "There is no utilization please ask Beyond to add",
    ),
    "noData": MessageLookupByLibrary.simpleMessage(
      "No Data Found , please try again later",
    ),
    "noDataBody": MessageLookupByLibrary.simpleMessage(
      "Your data will appear here when received",
    ),
    "noDataTitle": MessageLookupByLibrary.simpleMessage("No data"),
    "noDoctors": MessageLookupByLibrary.simpleMessage(
      "No doctors with this name",
    ),
    "noEmergenciesFound": MessageLookupByLibrary.simpleMessage(
      "No emergency requests found",
    ),
    "noFileChosen": MessageLookupByLibrary.simpleMessage("No file chosen"),
    "noInternet": MessageLookupByLibrary.simpleMessage(
      "No internet connection",
    ),
    "noInternetBody": MessageLookupByLibrary.simpleMessage(
      "It seems your device is not connected to the internet.\nCheck the connection and try again.",
    ),
    "noPolicyDetailsFound": MessageLookupByLibrary.simpleMessage(
      "No policy details available",
    ),
    "noRequestsFound": MessageLookupByLibrary.simpleMessage(
      "No requests found",
    ),
    "noReservationFound": MessageLookupByLibrary.simpleMessage(
      "No Reservation Date Found",
    ),
    "noServiceCenterFound": MessageLookupByLibrary.simpleMessage(
      "No Service Center Found",
    ),
    "nonEgyptian": MessageLookupByLibrary.simpleMessage("Non-Egyptian"),
    "noteLabel": MessageLookupByLibrary.simpleMessage("Note:"),
    "noteSameMembersProcessed": MessageLookupByLibrary.simpleMessage(
      "The same members will be processed for all selected policies. Select all policies you want to include in this request.",
    ),
    "notes": MessageLookupByLibrary.simpleMessage("Notes"),
    "notes1": MessageLookupByLibrary.simpleMessage("Your Notes"),
    "notes2": MessageLookupByLibrary.simpleMessage("Notes is required"),
    "notesDesc": MessageLookupByLibrary.simpleMessage(
      "Kindly download the Excel sheet template, complete the required date fields, and proceed to upload the file once more.",
    ),
    "notification": MessageLookupByLibrary.simpleMessage("Notification:"),
    "november": MessageLookupByLibrary.simpleMessage("November"),
    "october": MessageLookupByLibrary.simpleMessage("October"),
    "offers1": MessageLookupByLibrary.simpleMessage(
      "Insurance offers at an affordable price from reputable insurance companies",
    ),
    "offline": MessageLookupByLibrary.simpleMessage("Offline"),
    "ok": MessageLookupByLibrary.simpleMessage("Ok"),
    "onceSubmittedYourTemplate": MessageLookupByLibrary.simpleMessage(
      "Once submitted, your template will be automatically validated against these guidelines. Any errors or missing information will be flagged, and you will be notified within 24 hours. Properly formatted submissions are processed faster.",
    ),
    "online": MessageLookupByLibrary.simpleMessage("Online"),
    "optical": MessageLookupByLibrary.simpleMessage("Optical"),
    "optional": MessageLookupByLibrary.simpleMessage("Optional"),
    "orLabel": MessageLookupByLibrary.simpleMessage("  or  "),
    "other": MessageLookupByLibrary.simpleMessage("Other"),
    "otherLine1": MessageLookupByLibrary.simpleMessage(
      "Medical insurance\nfor individuals and\nfamilies",
    ),
    "otherLine11": MessageLookupByLibrary.simpleMessage(
      "Individuals Medical Insurance",
    ),
    "otherLine2": MessageLookupByLibrary.simpleMessage("Motor\ninsurance"),
    "otherLine22": MessageLookupByLibrary.simpleMessage("Motor Insurance"),
    "otherLine3": MessageLookupByLibrary.simpleMessage("Property\ninsurance"),
    "otherLine33": MessageLookupByLibrary.simpleMessage("Property Insurance"),
    "otherLine4": MessageLookupByLibrary.simpleMessage("Life\ninsurance"),
    "otherLine44": MessageLookupByLibrary.simpleMessage("Life Insurance"),
    "paid": MessageLookupByLibrary.simpleMessage("Paid"),
    "partOfDay": MessageLookupByLibrary.simpleMessage("Part Of Day"),
    "patientInformation": MessageLookupByLibrary.simpleMessage(
      "Patient Information",
    ),
    "patientInformationBody": MessageLookupByLibrary.simpleMessage(
      "Please fill in your information",
    ),
    "paymentConfirmationFile": MessageLookupByLibrary.simpleMessage(
      "Payment confirmation file",
    ),
    "paymentDate": MessageLookupByLibrary.simpleMessage("Payment date"),
    "paymentDetails": MessageLookupByLibrary.simpleMessage("Payment Details"),
    "paymentFile": MessageLookupByLibrary.simpleMessage("Payment File"),
    "paymentMethod": MessageLookupByLibrary.simpleMessage("Payment method"),
    "paymentPlan": MessageLookupByLibrary.simpleMessage("Payment Plan"),
    "pdfJpgPngAccepted": MessageLookupByLibrary.simpleMessage(
      "PDF, JPG, or PNG accepted",
    ),
    "pending": MessageLookupByLibrary.simpleMessage("Pending"),
    "pendingReview": MessageLookupByLibrary.simpleMessage("PENDING REVIEW"),
    "perfectFor10PlusMembers": MessageLookupByLibrary.simpleMessage(
      "Perfect for 10+ members",
    ),
    "perfectFor1To10Members": MessageLookupByLibrary.simpleMessage(
      "Perfect for 1-10 members",
    ),
    "periodQuantityHint": MessageLookupByLibrary.simpleMessage(
      "Enter the period quantity",
    ),
    "phoneNumber": MessageLookupByLibrary.simpleMessage("Phone Number"),
    "phoneNumberHint": MessageLookupByLibrary.simpleMessage(
      "Enter your Phone Number",
    ),
    "phoneNumbersMustStart01": MessageLookupByLibrary.simpleMessage(
      "Must start with 01 and be 11 digits",
    ),
    "phoneValidation": MessageLookupByLibrary.simpleMessage(
      "Please enter valid phone number",
    ),
    "phoneValidation1": MessageLookupByLibrary.simpleMessage(
      "Please enter valid phone number",
    ),
    "photoQuality": MessageLookupByLibrary.simpleMessage("Photo Quality:"),
    "photoRequirements": MessageLookupByLibrary.simpleMessage(
      "Photo Requirements",
    ),
    "photoUpload": MessageLookupByLibrary.simpleMessage("Photo Upload"),
    "photosFileNaming": MessageLookupByLibrary.simpleMessage(
      "File naming must match Staff ID (e.g., 123456.jpg)",
    ),
    "photosMustBeNamedWithStaffId": MessageLookupByLibrary.simpleMessage(
      "• Photos must be named with Staff ID",
    ),
    "photosSelected": m10,
    "physicalCard": MessageLookupByLibrary.simpleMessage("Physical Card"),
    "physical_therapy": MessageLookupByLibrary.simpleMessage(
      "Physical Therapy",
    ),
    "pickImage": MessageLookupByLibrary.simpleMessage("Pick Image"),
    "pickVideo": MessageLookupByLibrary.simpleMessage("Pick video"),
    "plan": MessageLookupByLibrary.simpleMessage("Plan: "),
    "plan1": MessageLookupByLibrary.simpleMessage("Plan"),
    "pleaseChooseOneMember": MessageLookupByLibrary.simpleMessage(
      "Please Choose Member",
    ),
    "pleaseEnterMemberName": MessageLookupByLibrary.simpleMessage(
      "Please Enter Member Name",
    ),
    "pleaseEnterMixedName": MessageLookupByLibrary.simpleMessage(
      "Please Choose or enter member name",
    ),
    "pleaseSelectTheInsuranceCompany": MessageLookupByLibrary.simpleMessage(
      "Please select the Insurance Company",
    ),
    "pleaseSelectTpa": MessageLookupByLibrary.simpleMessage(
      "Please select tpa first",
    ),
    "pleaseUploadAttachments": MessageLookupByLibrary.simpleMessage(
      "Please Upload at least one Attachments",
    ),
    "pleaseUploadTheFilledExcelTemplate": MessageLookupByLibrary.simpleMessage(
      "Please upload the filled Excel template",
    ),
    "policies": MessageLookupByLibrary.simpleMessage("Policies"),
    "policiesAffected": MessageLookupByLibrary.simpleMessage(
      "POLICIES AFFECTED",
    ),
    "policiesAffectedLabel": MessageLookupByLibrary.simpleMessage(
      "POLICIES AFFE...",
    ),
    "policiesAndAccessPermissions": MessageLookupByLibrary.simpleMessage(
      "Policies & Access Permissions",
    ),
    "policy": MessageLookupByLibrary.simpleMessage("Policy"),
    "policyCoverage": MessageLookupByLibrary.simpleMessage("Policy Coverage:"),
    "policyDetails": MessageLookupByLibrary.simpleMessage("Policy Details"),
    "policyFile": MessageLookupByLibrary.simpleMessage("Policy File"),
    "policyInformation": MessageLookupByLibrary.simpleMessage(
      "Policy Information",
    ),
    "policyNumber": MessageLookupByLibrary.simpleMessage("Policy Number: "),
    "policyPayment": MessageLookupByLibrary.simpleMessage("Policy Payment"),
    "policy_status_active": MessageLookupByLibrary.simpleMessage("Active"),
    "policy_status_all": MessageLookupByLibrary.simpleMessage("All"),
    "policy_status_cancel": MessageLookupByLibrary.simpleMessage("Cancel"),
    "policy_status_draft": MessageLookupByLibrary.simpleMessage("Draft"),
    "policy_status_expired": MessageLookupByLibrary.simpleMessage("Expired"),
    "policy_status_lapsed_bupa": MessageLookupByLibrary.simpleMessage(
      "Lapsed Bupa",
    ),
    "policy_status_suspended": MessageLookupByLibrary.simpleMessage(
      "Suspended",
    ),
    "policy_status_terminated_with_beyond":
        MessageLookupByLibrary.simpleMessage("Terminated With Beyond"),
    "policy_status_terminated_with_insurance_company":
        MessageLookupByLibrary.simpleMessage(
          "Terminated with Insurance Company",
        ),
    "policy_status_under_issuance": MessageLookupByLibrary.simpleMessage(
      "Under Issuance",
    ),
    "premiumPlan": MessageLookupByLibrary.simpleMessage("Premium Plan"),
    "press_back_again_to_exit": MessageLookupByLibrary.simpleMessage(
      "Press back again to exit",
    ),
    "principal": MessageLookupByLibrary.simpleMessage("Principal"),
    "principalInsuranceID": MessageLookupByLibrary.simpleMessage(
      "Principal Insurance ID: ",
    ),
    "privacyPolicy": MessageLookupByLibrary.simpleMessage("privacy policy"),
    "proceedWithManualEntry": MessageLookupByLibrary.simpleMessage(
      "Proceed with Manual Entry",
    ),
    "proceedWithTemplate": MessageLookupByLibrary.simpleMessage(
      "Proceed with Template",
    ),
    "processing": MessageLookupByLibrary.simpleMessage("Processing"),
    "productsAvailable": MessageLookupByLibrary.simpleMessage(
      "Products Available",
    ),
    "profile": MessageLookupByLibrary.simpleMessage("Profile"),
    "property": MessageLookupByLibrary.simpleMessage("Property All Risk"),
    "provider": MessageLookupByLibrary.simpleMessage("Provider"),
    "providerName": MessageLookupByLibrary.simpleMessage("Provider name"),
    "providerType": MessageLookupByLibrary.simpleMessage("Provider Type"),
    "providerTypeBody": MessageLookupByLibrary.simpleMessage(
      "Please select the provider Type",
    ),
    "providersSupport": MessageLookupByLibrary.simpleMessage(
      "Providers Support",
    ),
    "quarterly": MessageLookupByLibrary.simpleMessage("Quarterly"),
    "reEnrollment": MessageLookupByLibrary.simpleMessage("Re-enrollment:"),
    "reasonLabel": MessageLookupByLibrary.simpleMessage("Reason: "),
    "recommendedForYou": MessageLookupByLibrary.simpleMessage(
      "Recommended for You by Beyond Team",
    ),
    "recommendedForYouBody": MessageLookupByLibrary.simpleMessage(
      "Based on your industry profile, this is your most relevant and recommended insurance line for your company",
    ),
    "refundEligibilityDependsOnPolicyTerms":
        MessageLookupByLibrary.simpleMessage(
          "Refund eligibility depends on policy terms and effective date",
        ),
    "refunds": MessageLookupByLibrary.simpleMessage("Refunds:"),
    "register": MessageLookupByLibrary.simpleMessage("Register"),
    "registerBody": MessageLookupByLibrary.simpleMessage(
      "Just a few quick steps… to start your journey with us",
    ),
    "registerBody1": MessageLookupByLibrary.simpleMessage(
      "Enter your account details to create a new account",
    ),
    "registerTitle": MessageLookupByLibrary.simpleMessage(
      "Happy to have you join us!",
    ),
    "reimbrursement": MessageLookupByLibrary.simpleMessage("Reimbrursement"),
    "reimbursementRequests": MessageLookupByLibrary.simpleMessage(
      "Reimbursement Management",
    ),
    "rejected": MessageLookupByLibrary.simpleMessage("Rejected"),
    "relation": MessageLookupByLibrary.simpleMessage("Relation: "),
    "relationship": MessageLookupByLibrary.simpleMessage("Relationship"),
    "reload": MessageLookupByLibrary.simpleMessage("Reload"),
    "requestCall": MessageLookupByLibrary.simpleMessage("Request Call"),
    "requestDate": MessageLookupByLibrary.simpleMessage("Request Date"),
    "requestDeepDiveSubtitle": MessageLookupByLibrary.simpleMessage(
      "Request deep dive study → Receive actionable recommendations.",
    ),
    "requestDemo": MessageLookupByLibrary.simpleMessage("Request Demo"),
    "requestDialog1Body": MessageLookupByLibrary.simpleMessage(
      "attachments have been uploaded \nsuccessfully",
    ),
    "requestDialog1Title": MessageLookupByLibrary.simpleMessage("Submitted"),
    "requestDialog2Body": MessageLookupByLibrary.simpleMessage(
      "Your request has been received.\nWe will contact you soon!",
    ),
    "requestDialog2Title": MessageLookupByLibrary.simpleMessage("Thank You"),
    "requestHistory": MessageLookupByLibrary.simpleMessage("Request History"),
    "requestNewDeepDiveStudy": MessageLookupByLibrary.simpleMessage(
      "Request new deep dive study",
    ),
    "requestNumber": MessageLookupByLibrary.simpleMessage("Request Number"),
    "requests": MessageLookupByLibrary.simpleMessage("Requests"),
    "requestsValidation": MessageLookupByLibrary.simpleMessage(
      "please choose request type",
    ),
    "requiredDocuments": MessageLookupByLibrary.simpleMessage(
      "Required Documents:",
    ),
    "requiredFields": MessageLookupByLibrary.simpleMessage("Required Fields:"),
    "requiredForForeignEmployees": MessageLookupByLibrary.simpleMessage(
      "Required for Foreign Employees:",
    ),
    "requiredIfAddingForeignEmployees": MessageLookupByLibrary.simpleMessage(
      "Required if adding foreign employees | Click to select or drag and drop",
    ),
    "requiredIfTemplateIncludesForeignEmployees":
        MessageLookupByLibrary.simpleMessage(
          "Required if template includes foreign employees",
        ),
    "resendCode": MessageLookupByLibrary.simpleMessage("Resend code"),
    "reservationBody": MessageLookupByLibrary.simpleMessage(
      "Are you sure you want to book?",
    ),
    "reservationCheck": MessageLookupByLibrary.simpleMessage(
      "I understand that this is only an appointment request and will be scheduled only after a confirmation call or SMS",
    ),
    "reset": MessageLookupByLibrary.simpleMessage("Reset"),
    "resetDetails": MessageLookupByLibrary.simpleMessage("Reset Details"),
    "resolution": MessageLookupByLibrary.simpleMessage("Resolution:"),
    "retry": MessageLookupByLibrary.simpleMessage("Retry"),
    "riskCarrier": MessageLookupByLibrary.simpleMessage("Risk Carrier"),
    "salaryConditional": MessageLookupByLibrary.simpleMessage(
      "Salary (Conditional)",
    ),
    "scan": MessageLookupByLibrary.simpleMessage("Scan"),
    "search": MessageLookupByLibrary.simpleMessage("Search"),
    "searchActiveMembers": MessageLookupByLibrary.simpleMessage(
      "Search Active Members",
    ),
    "searchAndSelectMembers": MessageLookupByLibrary.simpleMessage(
      "Search and select members - families will be auto-selected",
    ),
    "searchByName": MessageLookupByLibrary.simpleMessage("Search by name"),
    "searchForDoctor": MessageLookupByLibrary.simpleMessage(
      "Search for a Doctor",
    ),
    "searchHint": MessageLookupByLibrary.simpleMessage("Search ... "),
    "searchMembers": MessageLookupByLibrary.simpleMessage("Search members"),
    "searchRequests": MessageLookupByLibrary.simpleMessage("Search Requests"),
    "searchResults": MessageLookupByLibrary.simpleMessage("Search Results"),
    "secondDateValidation": MessageLookupByLibrary.simpleMessage(
      "End Date is required",
    ),
    "secondNameValidation": MessageLookupByLibrary.simpleMessage(
      "Second Name is required",
    ),
    "seeMore": MessageLookupByLibrary.simpleMessage("see more"),
    "selectAManager": MessageLookupByLibrary.simpleMessage("Select a Manager"),
    "selectAddition": MessageLookupByLibrary.simpleMessage("Select Addition"),
    "selectAppointmentTime": MessageLookupByLibrary.simpleMessage(
      "Select Time",
    ),
    "selectArea": MessageLookupByLibrary.simpleMessage("Select Area"),
    "selectBoth": MessageLookupByLibrary.simpleMessage("Select Both"),
    "selectBranch": MessageLookupByLibrary.simpleMessage("Select Branch"),
    "selectBrand": MessageLookupByLibrary.simpleMessage("Select Brand"),
    "selectCity": MessageLookupByLibrary.simpleMessage("Select City"),
    "selectCompany": MessageLookupByLibrary.simpleMessage("Select Company"),
    "selectDate": MessageLookupByLibrary.simpleMessage("Select Date"),
    "selectDeletion": MessageLookupByLibrary.simpleMessage("Select Deletion"),
    "selectDoctor": MessageLookupByLibrary.simpleMessage("Select Doctor"),
    "selectGender": MessageLookupByLibrary.simpleMessage("Select Gender"),
    "selectHospital": MessageLookupByLibrary.simpleMessage("Select Hospital"),
    "selectInsurancePolicies": MessageLookupByLibrary.simpleMessage(
      "Select Insurance Policies",
    ),
    "selectManager": MessageLookupByLibrary.simpleMessage("Select Manager"),
    "selectMemberToDelete": MessageLookupByLibrary.simpleMessage(
      "Select Members to Delete",
    ),
    "selectMemberToDeleteBody": MessageLookupByLibrary.simpleMessage(
      "Search and select members - families will be auto-selected",
    ),
    "selectMembersToDelete": MessageLookupByLibrary.simpleMessage(
      "Select Members to Delete",
    ),
    "selectMethod": MessageLookupByLibrary.simpleMessage("Select Method"),
    "selectOneOrMorePolicies": MessageLookupByLibrary.simpleMessage(
      "Select one or more policies to apply this action",
    ),
    "selectPlan": MessageLookupByLibrary.simpleMessage(
      "Select Medical Insurance Plan",
    ),
    "selectPolicy": MessageLookupByLibrary.simpleMessage("Select Policy"),
    "selectRelationship": MessageLookupByLibrary.simpleMessage(
      "Select Relationship",
    ),
    "selectRequestType": MessageLookupByLibrary.simpleMessage(
      "Select Request Type",
    ),
    "selectSpecialty": MessageLookupByLibrary.simpleMessage("Select Specialty"),
    "selectStatus": MessageLookupByLibrary.simpleMessage("Select Status"),
    "selectType": MessageLookupByLibrary.simpleMessage("Select Type"),
    "selected": MessageLookupByLibrary.simpleMessage("Selected:"),
    "selectedMembers": m11,
    "selectedPolicies": MessageLookupByLibrary.simpleMessage(
      "Selected Policies:",
    ),
    "selectingPrincipalMemberAutoSelects": MessageLookupByLibrary.simpleMessage(
      "Selecting a principal member will automatically select all their family members. They must be deleted together as a family unit.",
    ),
    "selfFund": MessageLookupByLibrary.simpleMessage("Self Fund"),
    "sendRequest": MessageLookupByLibrary.simpleMessage("Send Request"),
    "sendSmsViaWhatsApp": MessageLookupByLibrary.simpleMessage(
      "Send sms code on Whats app",
    ),
    "sendSmsViaWhatsAppBody": MessageLookupByLibrary.simpleMessage(
      "You can request new sms code after: ",
    ),
    "sentRequestSuccessBody": MessageLookupByLibrary.simpleMessage(
      "Your Request sent successfully",
    ),
    "sentRequestSuccessTitle": MessageLookupByLibrary.simpleMessage(
      "Successful",
    ),
    "sentSuccess": MessageLookupByLibrary.simpleMessage(
      "Emergency sent successfully",
    ),
    "september": MessageLookupByLibrary.simpleMessage("September"),
    "service": MessageLookupByLibrary.simpleMessage("Service"),
    "service1": MessageLookupByLibrary.simpleMessage(
      "Exceptional after-sales services",
    ),
    "serviceCenters": MessageLookupByLibrary.simpleMessage("Service Centers"),
    "serviceDate": MessageLookupByLibrary.simpleMessage("Service Date"),
    "servicesGroup": MessageLookupByLibrary.simpleMessage("Services Group"),
    "sessionExpired": MessageLookupByLibrary.simpleMessage(
      "Your session is over!\nPlease log in again or email Beyond Support\n",
    ),
    "settings": MessageLookupByLibrary.simpleMessage("Settings"),
    "showAllRecommendations": MessageLookupByLibrary.simpleMessage(
      "Show all recommendations",
    ),
    "showAllResult": MessageLookupByLibrary.simpleMessage("Show All Result"),
    "showDetails": MessageLookupByLibrary.simpleMessage("Show details"),
    "showProductBenefits": MessageLookupByLibrary.simpleMessage(
      "Show Product benefits >",
    ),
    "showResult": MessageLookupByLibrary.simpleMessage("Show Result"),
    "showingLabel": MessageLookupByLibrary.simpleMessage("Showing: "),
    "sickLeaveCreatedSuccessfully": MessageLookupByLibrary.simpleMessage(
      "Sick Leave Created Successfully",
    ),
    "sickLeaveService": MessageLookupByLibrary.simpleMessage(
      "Sick Leave\nService",
    ),
    "sickLeaveService1": MessageLookupByLibrary.simpleMessage(
      "Sick Leave Service",
    ),
    "single": MessageLookupByLibrary.simpleMessage("Single"),
    "size": MessageLookupByLibrary.simpleMessage("Size:"),
    "skip": MessageLookupByLibrary.simpleMessage("Skip"),
    "someThingWentWrong": MessageLookupByLibrary.simpleMessage(
      "Something went wrong",
    ),
    "son": MessageLookupByLibrary.simpleMessage("Son"),
    "specialty": MessageLookupByLibrary.simpleMessage("Specialty"),
    "specialtyBody": MessageLookupByLibrary.simpleMessage(
      "Please select the specialty",
    ),
    "specialtyValidation": MessageLookupByLibrary.simpleMessage(
      "Specialty is required",
    ),
    "specifyWhenDeletionShouldTakeEffect": MessageLookupByLibrary.simpleMessage(
      "Specify when deletion should take effect",
    ),
    "specifyWhenDeletionShouldTakeEffectDesc":
        MessageLookupByLibrary.simpleMessage(
          "Specify when deletion should take effect. Cannot be in the past",
        ),
    "spouse": MessageLookupByLibrary.simpleMessage("Spouse"),
    "staffId": MessageLookupByLibrary.simpleMessage("Staff id"),
    "staffIdDocumentTypePdf": MessageLookupByLibrary.simpleMessage(
      "[StaffID]_[DocumentType].pdf (e.g., 123456_BirthCertificate.pdf)",
    ),
    "staffIdJpgFormat": MessageLookupByLibrary.simpleMessage("[StaffID].jpg"),
    "staffIdJpgOrStaffIdPng": MessageLookupByLibrary.simpleMessage(
      "[StaffID].jpg or [StaffID].png",
    ),
    "staffIdLabel": MessageLookupByLibrary.simpleMessage("Staff ID:"),
    "staffIdMustBeUnique": MessageLookupByLibrary.simpleMessage(
      "Must be unique and not exist in the system",
    ),
    "staffIdPngFormat": MessageLookupByLibrary.simpleMessage("[StaffID].png"),
    "staffNumberId": MessageLookupByLibrary.simpleMessage("Staff Number (ID)"),
    "stage": MessageLookupByLibrary.simpleMessage("Stage"),
    "standardPlan": MessageLookupByLibrary.simpleMessage("Standard Plan"),
    "stars1": MessageLookupByLibrary.simpleMessage("Various benefits"),
    "startDate": MessageLookupByLibrary.simpleMessage("Start Date"),
    "startNow": MessageLookupByLibrary.simpleMessage("Start Now"),
    "status": MessageLookupByLibrary.simpleMessage("Status"),
    "statusCompleted": MessageLookupByLibrary.simpleMessage("Completed"),
    "statusPending": MessageLookupByLibrary.simpleMessage("Pending"),
    "statusSubmitted": MessageLookupByLibrary.simpleMessage("Submitted"),
    "statusUnknown": MessageLookupByLibrary.simpleMessage("Unknown"),
    "statusWaitingHR": MessageLookupByLibrary.simpleMessage("Waiting HR"),
    "stay": MessageLookupByLibrary.simpleMessage("Stay"),
    "step1DownloadTemplate": MessageLookupByLibrary.simpleMessage(
      "Step 1: Download Template",
    ),
    "step1SearchAndSelectMembers": MessageLookupByLibrary.simpleMessage(
      "Search and select members from Active List",
    ),
    "step2SystemAutoSelectsFamilyMembers": MessageLookupByLibrary.simpleMessage(
      "System auto-selects all family members for principal",
    ),
    "step2UploadFilledTemplate": MessageLookupByLibrary.simpleMessage(
      "Step 2: Upload Filled Template",
    ),
    "step3ProvideDeletionReason": MessageLookupByLibrary.simpleMessage(
      "Provide deletion reason and effective date",
    ),
    "step3UploadMemberPhotos": MessageLookupByLibrary.simpleMessage(
      "Step 3: Upload Member Photos",
    ),
    "step4SubmitDeletionRequest": MessageLookupByLibrary.simpleMessage(
      "Submit deletion request for approval",
    ),
    "step4UploadSupportingDocuments": MessageLookupByLibrary.simpleMessage(
      "Step 4: Upload Supporting Documents",
    ),
    "step5ForeignEmployeeAcknowledgement": MessageLookupByLibrary.simpleMessage(
      "Step 5: Foreign Employee Acknowledgement",
    ),
    "step5InsuranceCompanyProcesses": MessageLookupByLibrary.simpleMessage(
      "Insurance company processes and confirms deletion",
    ),
    "studyResultsInfo": MessageLookupByLibrary.simpleMessage(
      "Study Results: Once the deep dive study is completed, recommendations will appear in the \"Recommendations Based on Deep Dive\" tab.",
    ),
    "subCompany": MessageLookupByLibrary.simpleMessage("Sub Company: "),
    "submissionDate": MessageLookupByLibrary.simpleMessage("SUBMISSION DATE"),
    "submissionDateLabel": MessageLookupByLibrary.simpleMessage(
      "SUBMISSION D...",
    ),
    "submit": MessageLookupByLibrary.simpleMessage("Submit"),
    "submitChanges": MessageLookupByLibrary.simpleMessage("Submit Changes"),
    "submitRequest": MessageLookupByLibrary.simpleMessage("Submit Request"),
    "submittedRequests": MessageLookupByLibrary.simpleMessage(
      "SUBMITTED REQUESTS",
    ),
    "submittedRequestsCount": m12,
    "success": MessageLookupByLibrary.simpleMessage(
      "Your Request Sent Successfully",
    ),
    "successEmergency": MessageLookupByLibrary.simpleMessage(
      "Your emergency support sent successfully",
    ),
    "successfulBooking": MessageLookupByLibrary.simpleMessage(
      "Successful Booking",
    ),
    "successfulBookingBody": MessageLookupByLibrary.simpleMessage(
      "You can check your reservation details in My Reservations page",
    ),
    "summary": MessageLookupByLibrary.simpleMessage("Summary"),
    "support1": MessageLookupByLibrary.simpleMessage("24/7 support\nservice"),
    "tPA": MessageLookupByLibrary.simpleMessage("TPA"),
    "tailorMade": MessageLookupByLibrary.simpleMessage("Tailor Made"),
    "templateFormat": MessageLookupByLibrary.simpleMessage("Template Format:"),
    "templateUpload": MessageLookupByLibrary.simpleMessage("Template Upload"),
    "templateUploadDesc": MessageLookupByLibrary.simpleMessage(
      "Download our Excel template, fill it offline, and upload for bulk processing. Best for large numbers.",
    ),
    "templateValidationGuidelines": MessageLookupByLibrary.simpleMessage(
      "Template Validation Guidelines",
    ),
    "termsAndConditions": MessageLookupByLibrary.simpleMessage(
      "Terms and Conditions",
    ),
    "thereIsError": MessageLookupByLibrary.simpleMessage("There is An Error"),
    "thereIsNoCategory": MessageLookupByLibrary.simpleMessage(
      "There is no category",
    ),
    "thereIsNoFile": MessageLookupByLibrary.simpleMessage("There is no Files"),
    "thereIsNoReservation": MessageLookupByLibrary.simpleMessage(
      "There is no reservations",
    ),
    "thirdNameValidation": MessageLookupByLibrary.simpleMessage(
      "Third Name is required",
    ),
    "tiersValidation": MessageLookupByLibrary.simpleMessage(
      "Please select category",
    ),
    "tip": MessageLookupByLibrary.simpleMessage("Tip: "),
    "to": MessageLookupByLibrary.simpleMessage("To"),
    "toDate": MessageLookupByLibrary.simpleMessage("To date"),
    "totalConsumptionThreshold": MessageLookupByLibrary.simpleMessage(
      "Total Consumption Threshold",
    ),
    "totalConsumptionThresholdDescription":
        MessageLookupByLibrary.simpleMessage(
          "Alert when total company consumption reaches this amount.",
        ),
    "totalMembers": MessageLookupByLibrary.simpleMessage("Total Members"),
    "totalPayment": MessageLookupByLibrary.simpleMessage("Total Payment"),
    "tpa": MessageLookupByLibrary.simpleMessage("TPA"),
    "trackNewRequestSickLeave": MessageLookupByLibrary.simpleMessage(
      "Track Sick Leave Requests",
    ),
    "transformedCompany": MessageLookupByLibrary.simpleMessage(
      "The company has been successfully transformed",
    ),
    "tryAgain": MessageLookupByLibrary.simpleMessage("Try Again"),
    "underAddition": MessageLookupByLibrary.simpleMessage("Under Addition"),
    "underDeletion": MessageLookupByLibrary.simpleMessage("Under Deletions"),
    "uniqueService": MessageLookupByLibrary.simpleMessage("Unique services"),
    "unitCount": MessageLookupByLibrary.simpleMessage("Count"),
    "unitEg": MessageLookupByLibrary.simpleMessage("EG"),
    "unpaid": MessageLookupByLibrary.simpleMessage("Unpaid"),
    "upTo100MembersPerTemplate": MessageLookupByLibrary.simpleMessage(
      "Up to 100 members per template submission",
    ),
    "updateApp": MessageLookupByLibrary.simpleMessage(
      "Please update app to newest version",
    ),
    "updateBody": MessageLookupByLibrary.simpleMessage(
      "A new version of the app has been released with important improvements and fixes.",
    ),
    "updateBody1": MessageLookupByLibrary.simpleMessage(
      "Faster performance and UI enhancements.",
    ),
    "updateBody2": MessageLookupByLibrary.simpleMessage("Bug fixes."),
    "updateBody3": MessageLookupByLibrary.simpleMessage("Update Now"),
    "updateExistingManager": MessageLookupByLibrary.simpleMessage(
      "Update Existing Manager",
    ),
    "updateExistingManagerSubtitle": MessageLookupByLibrary.simpleMessage(
      "Select a manager to update their information and access rights.",
    ),
    "updateManagerTip": MessageLookupByLibrary.simpleMessage(
      "Select a manager from the dropdown to view and edit their current policies and access permissions. You can add more policies if they are not assigned all available policies.",
    ),
    "updateTitle": MessageLookupByLibrary.simpleMessage("Update Available"),
    "uploadAttachments": MessageLookupByLibrary.simpleMessage(
      "Upload Attachments",
    ),
    "uploadDocumentsForFamilyMembers": MessageLookupByLibrary.simpleMessage(
      "Upload documents for family members (birth certificates, marriage certificates, etc.)",
    ),
    "uploadExcelFile": MessageLookupByLibrary.simpleMessage(
      "Upload Excel File",
    ),
    "uploadExcelTemplate": MessageLookupByLibrary.simpleMessage(
      "Upload Excel Template",
    ),
    "uploadMemberPhotos": MessageLookupByLibrary.simpleMessage(
      "Upload Member Photos",
    ),
    "uploadPhotosForAllMembers": MessageLookupByLibrary.simpleMessage(
      "Upload photos for all members in the template",
    ),
    "uploadSignedAcknowledgement": MessageLookupByLibrary.simpleMessage(
      "Upload Signed Acknowledgement",
    ),
    "uploadSignedAcknowledgment": MessageLookupByLibrary.simpleMessage(
      "Upload signed acknowledgment document (PDF, Image, or Word)",
    ),
    "uploadSupportingDocuments": MessageLookupByLibrary.simpleMessage(
      "Upload Supporting Documents",
    ),
    "uploadYourCompletedExcelTemplate": MessageLookupByLibrary.simpleMessage(
      "Upload your completed Excel template",
    ),
    "uploadYourFilledTemplate": MessageLookupByLibrary.simpleMessage(
      "Upload your filled template and supporting documents",
    ),
    "useOnlyOfficialExcelTemplate": MessageLookupByLibrary.simpleMessage(
      "Use only the official Excel template provided (.xlsx or .xls)",
    ),
    "useUTF8EncodingForArabicText": MessageLookupByLibrary.simpleMessage(
      "Use UTF-8 encoding for Arabic text",
    ),
    "userName": MessageLookupByLibrary.simpleMessage("User name"),
    "userName1": MessageLookupByLibrary.simpleMessage("Your User Name"),
    "userName2": MessageLookupByLibrary.simpleMessage("Username is required"),
    "utilization": MessageLookupByLibrary.simpleMessage("Utilization"),
    "utilizationClaimHistory": MessageLookupByLibrary.simpleMessage(
      "Utilization/Claim History",
    ),
    "utilizationNotifications": MessageLookupByLibrary.simpleMessage(
      "Utilization Notifications",
    ),
    "validated": MessageLookupByLibrary.simpleMessage("Validated"),
    "validation": MessageLookupByLibrary.simpleMessage(
      "This field is required",
    ),
    "validationAndApproval": MessageLookupByLibrary.simpleMessage(
      "Validation & Approval",
    ),
    "validationProcess": MessageLookupByLibrary.simpleMessage(
      "Validation Process",
    ),
    "value": MessageLookupByLibrary.simpleMessage("Value"),
    "vehicleBrand": MessageLookupByLibrary.simpleMessage("Vehicle Brand"),
    "verifyAllInformationForAccuracy": MessageLookupByLibrary.simpleMessage(
      "Verify all information for accuracy before submission",
    ),
    "viewAll": MessageLookupByLibrary.simpleMessage("View All"),
    "viewDeletionGuide": MessageLookupByLibrary.simpleMessage(
      "View Deletion Guidelines for Selected Insurance",
    ),
    "viewDeletionGuidelines": MessageLookupByLibrary.simpleMessage(
      "View Deletion Guidelines for Selected Insurance",
    ),
    "viewDetails": MessageLookupByLibrary.simpleMessage("View Details"),
    "viewFeedback": MessageLookupByLibrary.simpleMessage("View Feedback"),
    "viewRequests": MessageLookupByLibrary.simpleMessage("View Requests"),
    "viewRequestsBody": MessageLookupByLibrary.simpleMessage(
      "Monitor and track all your addition and deletion requests",
    ),
    "viewTrackRequests": MessageLookupByLibrary.simpleMessage(
      "View / Track Requests",
    ),
    "viewTrackRequestsDesc": MessageLookupByLibrary.simpleMessage(
      "Monitor the status of your submitted requests and view the complete history of all additions and deletions.",
    ),
    "visionCarePlan": MessageLookupByLibrary.simpleMessage("Vision Care Plan"),
    "waitingForHR": MessageLookupByLibrary.simpleMessage("WAITING FOR HR"),
    "waitingHR": MessageLookupByLibrary.simpleMessage("Waiting HR"),
    "waitingSince": MessageLookupByLibrary.simpleMessage("WAITING SINCE"),
    "website": MessageLookupByLibrary.simpleMessage("Website"),
    "welcome1": MessageLookupByLibrary.simpleMessage(
      "Welcome to Beyond Manger",
    ),
    "welcome2": MessageLookupByLibrary.simpleMessage("Login into your account"),
    "wellnessPrograms": MessageLookupByLibrary.simpleMessage(
      "Wellness Programs",
    ),
    "whatToDo": MessageLookupByLibrary.simpleMessage("What to do: "),
    "whatWouldYouLikeToAnalyze": MessageLookupByLibrary.simpleMessage(
      "What would you like to analyze?",
    ),
    "whatWouldYouLikeToAnalyzePlaceholder": MessageLookupByLibrary.simpleMessage(
      "Example: \"Why are our dental service costs 30% higher than average?\"",
    ),
    "whats1": MessageLookupByLibrary.simpleMessage(
      "Or reach out to us on WhatsApp at ",
    ),
    "whiteOrLightColoredBackground": MessageLookupByLibrary.simpleMessage(
      "White or light-colored background preferred",
    ),
    "wifeAdded": MessageLookupByLibrary.simpleMessage("Wife Added"),
    "workEmail": MessageLookupByLibrary.simpleMessage("Work Email"),
    "wrongOtp": MessageLookupByLibrary.simpleMessage(
      "Invalid Otp entered please try again",
    ),
    "year": MessageLookupByLibrary.simpleMessage("Year"),
    "years": MessageLookupByLibrary.simpleMessage("years"),
    "yes": MessageLookupByLibrary.simpleMessage("Yes"),
    "youCanSelectMultipleMembers": MessageLookupByLibrary.simpleMessage(
      "You can select multiple members for deletion in one request",
    ),
    "youMustAddValidEmail": MessageLookupByLibrary.simpleMessage(
      "Please enter valid email",
    ),
    "youMustUploadSignedAcknowledgement": MessageLookupByLibrary.simpleMessage(
      ", you must upload a signed acknowledgement confirming their current employment status.",
    ),
    "yourIndustry": MessageLookupByLibrary.simpleMessage("Your Industry"),
  };
}

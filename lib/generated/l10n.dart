// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Arabic`
  String get arabic {
    return Intl.message('Arabic', name: 'arabic', desc: '', args: []);
  }

  /// `English`
  String get english {
    return Intl.message('English', name: 'english', desc: '', args: []);
  }

  /// `Error during communication`
  String get error_fetch_data {
    return Intl.message(
      'Error during communication',
      name: 'error_fetch_data',
      desc: '',
      args: [],
    );
  }

  /// `Bad Request`
  String get error_bad_request {
    return Intl.message(
      'Bad Request',
      name: 'error_bad_request',
      desc: '',
      args: [],
    );
  }

  /// `Bad response from server`
  String get error_bad_response {
    return Intl.message(
      'Bad response from server',
      name: 'error_bad_response',
      desc: '',
      args: [],
    );
  }

  /// `Unauthorized access`
  String get error_unauthorized {
    return Intl.message(
      'Unauthorized access',
      name: 'error_unauthorized',
      desc: '',
      args: [],
    );
  }

  /// `Not Found`
  String get error_not_found {
    return Intl.message(
      'Not Found',
      name: 'error_not_found',
      desc: '',
      args: [],
    );
  }

  /// `Conflict occurred`
  String get error_conflict {
    return Intl.message(
      'Conflict occurred',
      name: 'error_conflict',
      desc: '',
      args: [],
    );
  }

  /// `Internal server error`
  String get error_internal_server {
    return Intl.message(
      'Internal server error',
      name: 'error_internal_server',
      desc: '',
      args: [],
    );
  }

  /// `No internet connection`
  String get error_no_internet {
    return Intl.message(
      'No internet connection',
      name: 'error_no_internet',
      desc: '',
      args: [],
    );
  }

  /// `No Data Found , please try again later`
  String get noData {
    return Intl.message(
      'No Data Found , please try again later',
      name: 'noData',
      desc: '',
      args: [],
    );
  }

  /// `Pick video`
  String get pickVideo {
    return Intl.message('Pick video', name: 'pickVideo', desc: '', args: []);
  }

  /// `Pick Image`
  String get pickImage {
    return Intl.message('Pick Image', name: 'pickImage', desc: '', args: []);
  }

  /// `Choose Image`
  String get chooseFromGallery1 {
    return Intl.message(
      'Choose Image',
      name: 'chooseFromGallery1',
      desc: '',
      args: [],
    );
  }

  /// `Choose video`
  String get chooseFromGallery2 {
    return Intl.message(
      'Choose video',
      name: 'chooseFromGallery2',
      desc: '',
      args: [],
    );
  }

  /// `Choose From Gallery`
  String get chooseFromGallery {
    return Intl.message(
      'Choose From Gallery',
      name: 'chooseFromGallery',
      desc: '',
      args: [],
    );
  }

  /// `There is An Error`
  String get thereIsError {
    return Intl.message(
      'There is An Error',
      name: 'thereIsError',
      desc: '',
      args: [],
    );
  }

  /// `Back`
  String get back {
    return Intl.message('Back', name: 'back', desc: '', args: []);
  }

  /// `Search ... `
  String get searchHint {
    return Intl.message('Search ... ', name: 'searchHint', desc: '', args: []);
  }

  /// `Update Available`
  String get updateTitle {
    return Intl.message(
      'Update Available',
      name: 'updateTitle',
      desc: '',
      args: [],
    );
  }

  /// `A new version of the app has been released with important improvements and fixes.`
  String get updateBody {
    return Intl.message(
      'A new version of the app has been released with important improvements and fixes.',
      name: 'updateBody',
      desc: '',
      args: [],
    );
  }

  /// `Faster performance and UI enhancements.`
  String get updateBody1 {
    return Intl.message(
      'Faster performance and UI enhancements.',
      name: 'updateBody1',
      desc: '',
      args: [],
    );
  }

  /// `Bug fixes.`
  String get updateBody2 {
    return Intl.message('Bug fixes.', name: 'updateBody2', desc: '', args: []);
  }

  /// `Update Now`
  String get updateBody3 {
    return Intl.message('Update Now', name: 'updateBody3', desc: '', args: []);
  }

  /// `Easier Shopping`
  String get boardingTitle1 {
    return Intl.message(
      'Easier Shopping',
      name: 'boardingTitle1',
      desc: '',
      args: [],
    );
  }

  /// `Discover thousands of products and choose what suits you quickly and easily from anywhere.`
  String get boardingDescription1 {
    return Intl.message(
      'Discover thousands of products and choose what suits you quickly and easily from anywhere.',
      name: 'boardingDescription1',
      desc: '',
      args: [],
    );
  }

  /// `Daily Deals`
  String get boardingTitle2 {
    return Intl.message(
      'Daily Deals',
      name: 'boardingTitle2',
      desc: '',
      args: [],
    );
  }

  /// `Don’t miss the strongest discounts and exclusive offers that get updated every day.`
  String get boardingDescription2 {
    return Intl.message(
      'Don’t miss the strongest discounts and exclusive offers that get updated every day.',
      name: 'boardingDescription2',
      desc: '',
      args: [],
    );
  }

  /// `Secure Payment & Fast Delivery`
  String get boardingTitle3 {
    return Intl.message(
      'Secure Payment & Fast Delivery',
      name: 'boardingTitle3',
      desc: '',
      args: [],
    );
  }

  /// `Pay safely and enjoy fast delivery right to your doorstep without any hassle.`
  String get boardingDescription3 {
    return Intl.message(
      'Pay safely and enjoy fast delivery right to your doorstep without any hassle.',
      name: 'boardingDescription3',
      desc: '',
      args: [],
    );
  }

  /// `Start Now`
  String get startNow {
    return Intl.message('Start Now', name: 'startNow', desc: '', args: []);
  }

  /// `Phone Number`
  String get phoneNumber {
    return Intl.message(
      'Phone Number',
      name: 'phoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `This field is required`
  String get validation {
    return Intl.message(
      'This field is required',
      name: 'validation',
      desc: '',
      args: [],
    );
  }

  /// `سعداء بانضمامك!`
  String get registerTitle {
    return Intl.message(
      'سعداء بانضمامك!',
      name: 'registerTitle',
      desc: '',
      args: [],
    );
  }

  /// `خطوات سريعة فقط… لتبدأ رحلتك معنا`
  String get registerBody {
    return Intl.message(
      'خطوات سريعة فقط… لتبدأ رحلتك معنا',
      name: 'registerBody',
      desc: '',
      args: [],
    );
  }

  /// `سعداء بعودتك من جديد !`
  String get loginTitle {
    return Intl.message(
      'سعداء بعودتك من جديد !',
      name: 'loginTitle',
      desc: '',
      args: [],
    );
  }

  /// `أدخل رقم هاتفك لتسجيل الدخول`
  String get loginBody {
    return Intl.message(
      'أدخل رقم هاتفك لتسجيل الدخول',
      name: 'loginBody',
      desc: '',
      args: [],
    );
  }

  /// `تسجيل الدخول`
  String get login {
    return Intl.message('تسجيل الدخول', name: 'login', desc: '', args: []);
  }

  /// `تسجيل`
  String get register {
    return Intl.message('تسجيل', name: 'register', desc: '', args: []);
  }

  /// `لا يوجد اتصال بالإنترنت`
  String get noInternet {
    return Intl.message(
      'لا يوجد اتصال بالإنترنت',
      name: 'noInternet',
      desc: '',
      args: [],
    );
  }

  /// `يبدو أن جهازك غير متصل بالإنترنت\nتحقق من الاتصال وحاول مرة أخرى`
  String get noInternetBody {
    return Intl.message(
      'يبدو أن جهازك غير متصل بالإنترنت\nتحقق من الاتصال وحاول مرة أخرى',
      name: 'noInternetBody',
      desc: '',
      args: [],
    );
  }

  /// `جاري التحميل...`
  String get loadingText {
    return Intl.message(
      'جاري التحميل...',
      name: 'loadingText',
      desc: '',
      args: [],
    );
  }

  /// `إعادة المحاولة`
  String get retry {
    return Intl.message('إعادة المحاولة', name: 'retry', desc: '', args: []);
  }

  /// `Welcome to Beyond Manger`
  String get welcome1 {
    return Intl.message(
      'Welcome to Beyond Manger',
      name: 'welcome1',
      desc: '',
      args: [],
    );
  }

  /// `Login into your account`
  String get welcome2 {
    return Intl.message(
      'Login into your account',
      name: 'welcome2',
      desc: '',
      args: [],
    );
  }

  /// `Enter your mobile number`
  String get enterPhoneNumber {
    return Intl.message(
      'Enter your mobile number',
      name: 'enterPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Already have account?`
  String get alreadyHaveAccount {
    return Intl.message(
      'Already have account?',
      name: 'alreadyHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Request Demo`
  String get requestDemo {
    return Intl.message(
      'Request Demo',
      name: 'requestDemo',
      desc: '',
      args: [],
    );
  }

  /// `By clicking "Create Account", you agree to`
  String get iAgreeWith {
    return Intl.message(
      'By clicking "Create Account", you agree to',
      name: 'iAgreeWith',
      desc: '',
      args: [],
    );
  }

  /// `Terms and Conditions`
  String get termsAndConditions {
    return Intl.message(
      'Terms and Conditions',
      name: 'termsAndConditions',
      desc: '',
      args: [],
    );
  }

  /// `and`
  String get and {
    return Intl.message('and', name: 'and', desc: '', args: []);
  }

  /// `privacy policy`
  String get privacyPolicy {
    return Intl.message(
      'privacy policy',
      name: 'privacyPolicy',
      desc: '',
      args: [],
    );
  }

  /// `For App`
  String get app {
    return Intl.message('For App', name: 'app', desc: '', args: []);
  }

  /// `Full Name`
  String get fullName {
    return Intl.message('Full Name', name: 'fullName', desc: '', args: []);
  }

  /// `Email Address`
  String get emailAddress {
    return Intl.message(
      'Email Address',
      name: 'emailAddress',
      desc: '',
      args: [],
    );
  }

  /// `Job Title`
  String get jobTitle {
    return Intl.message('Job Title', name: 'jobTitle', desc: '', args: []);
  }

  /// `Company Name`
  String get companyName {
    return Intl.message(
      'Company Name',
      name: 'companyName',
      desc: '',
      args: [],
    );
  }

  /// `Company Size`
  String get companySize {
    return Intl.message(
      'Company Size',
      name: 'companySize',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid email`
  String get invalidEmail {
    return Intl.message(
      'Please enter a valid email',
      name: 'invalidEmail',
      desc: '',
      args: [],
    );
  }

  /// `Send sms code on Whats app`
  String get sendSmsViaWhatsApp {
    return Intl.message(
      'Send sms code on Whats app',
      name: 'sendSmsViaWhatsApp',
      desc: '',
      args: [],
    );
  }

  /// `You can request new sms code after: `
  String get sendSmsViaWhatsAppBody {
    return Intl.message(
      'You can request new sms code after: ',
      name: 'sendSmsViaWhatsAppBody',
      desc: '',
      args: [],
    );
  }

  /// `Enter your otp that sent to number`
  String get enterOtp {
    return Intl.message(
      'Enter your otp that sent to number',
      name: 'enterOtp',
      desc: '',
      args: [],
    );
  }

  /// `Please enter valid phone number`
  String get phoneValidation {
    return Intl.message(
      'Please enter valid phone number',
      name: 'phoneValidation',
      desc: '',
      args: [],
    );
  }

  /// `كود تحقق خاطئ من فضلك تحقق من الرقم المطلوب`
  String get invalidOtp {
    return Intl.message(
      'كود تحقق خاطئ من فضلك تحقق من الرقم المطلوب',
      name: 'invalidOtp',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to close Beyond Manager?`
  String get areYouSureYouWantToCloseApp {
    return Intl.message(
      'Are you sure you want to close Beyond Manager?',
      name: 'areYouSureYouWantToCloseApp',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message('Home', name: 'home', desc: '', args: []);
  }

  /// `الدعم الفورى`
  String get emergencySupport {
    return Intl.message(
      'الدعم الفورى',
      name: 'emergencySupport',
      desc: '',
      args: [],
    );
  }

  /// `وثائق التأمين`
  String get insurancePolicies {
    return Intl.message(
      'وثائق التأمين',
      name: 'insurancePolicies',
      desc: '',
      args: [],
    );
  }

  /// `الملف الشخصي`
  String get profile {
    return Intl.message('الملف الشخصي', name: 'profile', desc: '', args: []);
  }

  /// `Beyond Services`
  String get beyondService {
    return Intl.message(
      'Beyond Services',
      name: 'beyondService',
      desc: '',
      args: [],
    );
  }

  /// `Invalid Otp entered please try again`
  String get wrongOtp {
    return Intl.message(
      'Invalid Otp entered please try again',
      name: 'wrongOtp',
      desc: '',
      args: [],
    );
  }

  /// `Invalid Phone number`
  String get invalidPhone {
    return Intl.message(
      'Invalid Phone number',
      name: 'invalidPhone',
      desc: '',
      args: [],
    );
  }

  /// `Insurance Options`
  String get insuranceOptions {
    return Intl.message(
      'Insurance Options',
      name: 'insuranceOptions',
      desc: '',
      args: [],
    );
  }

  /// `Insurance Policies`
  String get insurancePolicies1 {
    return Intl.message(
      'Insurance Policies',
      name: 'insurancePolicies1',
      desc: '',
      args: [],
    );
  }

  /// `Insurance\n Policies`
  String get insurancePolicies2 {
    return Intl.message(
      'Insurance\n Policies',
      name: 'insurancePolicies2',
      desc: '',
      args: [],
    );
  }

  /// `Sick Leave\nService`
  String get sickLeaveService {
    return Intl.message(
      'Sick Leave\nService',
      name: 'sickLeaveService',
      desc: '',
      args: [],
    );
  }

  /// `Sick Leave Service`
  String get sickLeaveService1 {
    return Intl.message(
      'Sick Leave Service',
      name: 'sickLeaveService1',
      desc: '',
      args: [],
    );
  }

  /// `Get 100%\nCovered`
  String get getCovered {
    return Intl.message(
      'Get 100%\nCovered',
      name: 'getCovered',
      desc: '',
      args: [],
    );
  }

  /// `Beyond Insurance Brokerage is authorized and\nregulated by The Financial Regulatory Authority\n(FRA) Registration No. 103 for the year 2021 `
  String get home1 {
    return Intl.message(
      'Beyond Insurance Brokerage is authorized and\nregulated by The Financial Regulatory Authority\n(FRA) Registration No. 103 for the year 2021 ',
      name: 'home1',
      desc: '',
      args: [],
    );
  }

  /// `© 2023 Beyond Insurance Brokerage,\nALL RIGHTS RESERVED.`
  String get home2 {
    return Intl.message(
      '© 2023 Beyond Insurance Brokerage,\nALL RIGHTS RESERVED.',
      name: 'home2',
      desc: '',
      args: [],
    );
  }

  /// `Service Date`
  String get serviceDate {
    return Intl.message(
      'Service Date',
      name: 'serviceDate',
      desc: '',
      args: [],
    );
  }

  /// `Stay`
  String get stay {
    return Intl.message('Stay', name: 'stay', desc: '', args: []);
  }

  /// `Insured`
  String get insured {
    return Intl.message('Insured', name: 'insured', desc: '', args: []);
  }

  /// `Beyond will help you feel completely secure,as we offer you the best insurance offers along with our exceptional services`
  String get insuranceOptionsText1 {
    return Intl.message(
      'Beyond will help you feel completely secure,as we offer you the best insurance offers along with our exceptional services',
      name: 'insuranceOptionsText1',
      desc: '',
      args: [],
    );
  }

  /// `Insurance offers at an affordable price from reputable insurance companies`
  String get offers1 {
    return Intl.message(
      'Insurance offers at an affordable price from reputable insurance companies',
      name: 'offers1',
      desc: '',
      args: [],
    );
  }

  /// `Exceptional after-sales services`
  String get service1 {
    return Intl.message(
      'Exceptional after-sales services',
      name: 'service1',
      desc: '',
      args: [],
    );
  }

  /// `24/7 support\nservice`
  String get support1 {
    return Intl.message(
      '24/7 support\nservice',
      name: 'support1',
      desc: '',
      args: [],
    );
  }

  /// `Various benefits`
  String get stars1 {
    return Intl.message('Various benefits', name: 'stars1', desc: '', args: []);
  }

  /// `Available insurance lines!`
  String get availableLines {
    return Intl.message(
      'Available insurance lines!',
      name: 'availableLines',
      desc: '',
      args: [],
    );
  }

  /// `Medical insurance\nfor individuals and\nfamilies`
  String get otherLine1 {
    return Intl.message(
      'Medical insurance\nfor individuals and\nfamilies',
      name: 'otherLine1',
      desc: '',
      args: [],
    );
  }

  /// `Motor\ninsurance`
  String get otherLine2 {
    return Intl.message(
      'Motor\ninsurance',
      name: 'otherLine2',
      desc: '',
      args: [],
    );
  }

  /// `Property\ninsurance`
  String get otherLine3 {
    return Intl.message(
      'Property\ninsurance',
      name: 'otherLine3',
      desc: '',
      args: [],
    );
  }

  /// `Life\ninsurance`
  String get otherLine4 {
    return Intl.message(
      'Life\ninsurance',
      name: 'otherLine4',
      desc: '',
      args: [],
    );
  }

  /// `Get A Quote`
  String get getAQuote {
    return Intl.message('Get A Quote', name: 'getAQuote', desc: '', args: []);
  }

  /// `Contact your account manager for\nmore details!`
  String get call1 {
    return Intl.message(
      'Contact your account manager for\nmore details!',
      name: 'call1',
      desc: '',
      args: [],
    );
  }

  /// `Or reach out to us on WhatsApp at `
  String get whats1 {
    return Intl.message(
      'Or reach out to us on WhatsApp at ',
      name: 'whats1',
      desc: '',
      args: [],
    );
  }

  /// `User name`
  String get userName {
    return Intl.message('User name', name: 'userName', desc: '', args: []);
  }

  /// `Amount`
  String get amount {
    return Intl.message('Amount', name: 'amount', desc: '', args: []);
  }

  /// `Optional`
  String get optional {
    return Intl.message('Optional', name: 'optional', desc: '', args: []);
  }

  /// `EGP`
  String get egp {
    return Intl.message('EGP', name: 'egp', desc: '', args: []);
  }

  /// `Your User Name`
  String get userName1 {
    return Intl.message(
      'Your User Name',
      name: 'userName1',
      desc: '',
      args: [],
    );
  }

  /// `Username is required`
  String get userName2 {
    return Intl.message(
      'Username is required',
      name: 'userName2',
      desc: '',
      args: [],
    );
  }

  /// `Notes`
  String get notes {
    return Intl.message('Notes', name: 'notes', desc: '', args: []);
  }

  /// `Your Notes`
  String get notes1 {
    return Intl.message('Your Notes', name: 'notes1', desc: '', args: []);
  }

  /// `Notes is required`
  String get notes2 {
    return Intl.message(
      'Notes is required',
      name: 'notes2',
      desc: '',
      args: [],
    );
  }

  /// `Kindly download the Excel sheet template, complete the required date fields, and proceed to upload the file once more.`
  String get notesDesc {
    return Intl.message(
      'Kindly download the Excel sheet template, complete the required date fields, and proceed to upload the file once more.',
      name: 'notesDesc',
      desc: '',
      args: [],
    );
  }

  /// `Download Template`
  String get downloadTemp {
    return Intl.message(
      'Download Template',
      name: 'downloadTemp',
      desc: '',
      args: [],
    );
  }

  /// `Upload Excel File`
  String get uploadExcelFile {
    return Intl.message(
      'Upload Excel File',
      name: 'uploadExcelFile',
      desc: '',
      args: [],
    );
  }

  /// `Emergency Support`
  String get emergencySupport1 {
    return Intl.message(
      'Emergency Support',
      name: 'emergencySupport1',
      desc: '',
      args: [],
    );
  }

  /// `Emergency\nSupport`
  String get emergencySupport2 {
    return Intl.message(
      'Emergency\nSupport',
      name: 'emergencySupport2',
      desc: '',
      args: [],
    );
  }

  /// `Our team is here for you!`
  String get emergencySupport3 {
    return Intl.message(
      'Our team is here for you!',
      name: 'emergencySupport3',
      desc: '',
      args: [],
    );
  }

  /// `Expect a call back from our team in 10 minutes.`
  String get emergencySupport4 {
    return Intl.message(
      'Expect a call back from our team in 10 minutes.',
      name: 'emergencySupport4',
      desc: '',
      args: [],
    );
  }

  /// `Requests`
  String get requests {
    return Intl.message('Requests', name: 'requests', desc: '', args: []);
  }

  /// `please choose request type`
  String get requestsValidation {
    return Intl.message(
      'please choose request type',
      name: 'requestsValidation',
      desc: '',
      args: [],
    );
  }

  /// `Choose Request Type`
  String get chooseRequestType {
    return Intl.message(
      'Choose Request Type',
      name: 'chooseRequestType',
      desc: '',
      args: [],
    );
  }

  /// `Emergency case`
  String get emergencyCase {
    return Intl.message(
      'Emergency case',
      name: 'emergencyCase',
      desc: '',
      args: [],
    );
  }

  /// `Approval case`
  String get approvalCase {
    return Intl.message(
      'Approval case',
      name: 'approvalCase',
      desc: '',
      args: [],
    );
  }

  /// `Reimbrursement`
  String get reimbrursement {
    return Intl.message(
      'Reimbrursement',
      name: 'reimbrursement',
      desc: '',
      args: [],
    );
  }

  /// `Inquiry`
  String get inquiry {
    return Intl.message('Inquiry', name: 'inquiry', desc: '', args: []);
  }

  /// `Other`
  String get other {
    return Intl.message('Other', name: 'other', desc: '', args: []);
  }

  /// `Submit`
  String get submit {
    return Intl.message('Submit', name: 'submit', desc: '', args: []);
  }

  /// `Summary`
  String get summary {
    return Intl.message('Summary', name: 'summary', desc: '', args: []);
  }

  /// `Feedback`
  String get feedback {
    return Intl.message('Feedback', name: 'feedback', desc: '', args: []);
  }

  /// `Information`
  String get information {
    return Intl.message('Information', name: 'information', desc: '', args: []);
  }

  /// `Staff id`
  String get staffId {
    return Intl.message('Staff id', name: 'staffId', desc: '', args: []);
  }

  /// `Work Email`
  String get workEmail {
    return Intl.message('Work Email', name: 'workEmail', desc: '', args: []);
  }

  /// `Description`
  String get description {
    return Intl.message('Description', name: 'description', desc: '', args: []);
  }

  /// `Start Date`
  String get startDate {
    return Intl.message('Start Date', name: 'startDate', desc: '', args: []);
  }

  /// `End Date`
  String get endDate {
    return Intl.message('End Date', name: 'endDate', desc: '', args: []);
  }

  /// `responsible for developing and implementing HR strategies and initiatives aligned with the overall business strategy, bridging management and employee relations, managing the recruitment and selection process, and reporting directly to the CEO.`
  String get description1 {
    return Intl.message(
      'responsible for developing and implementing HR strategies and initiatives aligned with the overall business strategy, bridging management and employee relations, managing the recruitment and selection process, and reporting directly to the CEO.',
      name: 'description1',
      desc: '',
      args: [],
    );
  }

  /// `Request Call`
  String get requestCall {
    return Intl.message(
      'Request Call',
      name: 'requestCall',
      desc: '',
      args: [],
    );
  }

  /// `Select Policy`
  String get selectPolicy {
    return Intl.message(
      'Select Policy',
      name: 'selectPolicy',
      desc: '',
      args: [],
    );
  }

  /// `Policy Details`
  String get policyDetails {
    return Intl.message(
      'Policy Details',
      name: 'policyDetails',
      desc: '',
      args: [],
    );
  }

  /// `Active list`
  String get activeList {
    return Intl.message('Active list', name: 'activeList', desc: '', args: []);
  }

  /// `Utilization`
  String get utilization {
    return Intl.message('Utilization', name: 'utilization', desc: '', args: []);
  }

  /// `Policy Information`
  String get policyInformation {
    return Intl.message(
      'Policy Information',
      name: 'policyInformation',
      desc: '',
      args: [],
    );
  }

  /// `Policy Payment`
  String get policyPayment {
    return Intl.message(
      'Policy Payment',
      name: 'policyPayment',
      desc: '',
      args: [],
    );
  }

  /// `Your emergency support sent successfully`
  String get successEmergency {
    return Intl.message(
      'Your emergency support sent successfully',
      name: 'successEmergency',
      desc: '',
      args: [],
    );
  }

  /// `Your Request Sent Successfully`
  String get success {
    return Intl.message(
      'Your Request Sent Successfully',
      name: 'success',
      desc: '',
      args: [],
    );
  }

  /// `Policy Number: `
  String get policyNumber {
    return Intl.message(
      'Policy Number: ',
      name: 'policyNumber',
      desc: '',
      args: [],
    );
  }

  /// `Line of Business: `
  String get lineOfBusiness {
    return Intl.message(
      'Line of Business: ',
      name: 'lineOfBusiness',
      desc: '',
      args: [],
    );
  }

  /// `Show details`
  String get showDetails {
    return Intl.message(
      'Show details',
      name: 'showDetails',
      desc: '',
      args: [],
    );
  }

  /// `Active Policy`
  String get activePolicy {
    return Intl.message(
      'Active Policy',
      name: 'activePolicy',
      desc: '',
      args: [],
    );
  }

  /// `Medical`
  String get medical {
    return Intl.message('Medical', name: 'medical', desc: '', args: []);
  }

  /// `Expired Policy`
  String get expiredPolicy {
    return Intl.message(
      'Expired Policy',
      name: 'expiredPolicy',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message('Name', name: 'name', desc: '', args: []);
  }

  /// `Search`
  String get search {
    return Intl.message('Search', name: 'search', desc: '', args: []);
  }

  /// `Insurance ID`
  String get insuranceID {
    return Intl.message(
      'Insurance ID',
      name: 'insuranceID',
      desc: '',
      args: [],
    );
  }

  /// `Sub Company: `
  String get subCompany {
    return Intl.message(
      'Sub Company: ',
      name: 'subCompany',
      desc: '',
      args: [],
    );
  }

  /// `Relation: `
  String get relation {
    return Intl.message('Relation: ', name: 'relation', desc: '', args: []);
  }

  /// `Principal Insurance ID: `
  String get principalInsuranceID {
    return Intl.message(
      'Principal Insurance ID: ',
      name: 'principalInsuranceID',
      desc: '',
      args: [],
    );
  }

  /// `Name On Insurance Card: `
  String get nameOnInsuranceCard {
    return Intl.message(
      'Name On Insurance Card: ',
      name: 'nameOnInsuranceCard',
      desc: '',
      args: [],
    );
  }

  /// `Category`
  String get category {
    return Intl.message('Category', name: 'category', desc: '', args: []);
  }

  /// `Plan: `
  String get plan {
    return Intl.message('Plan: ', name: 'plan', desc: '', args: []);
  }

  /// `Gold`
  String get gold {
    return Intl.message('Gold', name: 'gold', desc: '', args: []);
  }

  /// `Create New Request`
  String get createNewRequest {
    return Intl.message(
      'Create New Request',
      name: 'createNewRequest',
      desc: '',
      args: [],
    );
  }

  /// `Creation Date: `
  String get creationDate {
    return Intl.message(
      'Creation Date: ',
      name: 'creationDate',
      desc: '',
      args: [],
    );
  }

  /// `Diaganosis Code`
  String get diaganosisCode {
    return Intl.message(
      'Diaganosis Code',
      name: 'diaganosisCode',
      desc: '',
      args: [],
    );
  }

  /// `Diagnosis`
  String get diagnosis {
    return Intl.message('Diagnosis', name: 'diagnosis', desc: '', args: []);
  }

  /// `Provider name`
  String get providerName {
    return Intl.message(
      'Provider name',
      name: 'providerName',
      desc: '',
      args: [],
    );
  }

  /// `Provider Type`
  String get providerType {
    return Intl.message(
      'Provider Type',
      name: 'providerType',
      desc: '',
      args: [],
    );
  }

  /// `Service`
  String get service {
    return Intl.message('Service', name: 'service', desc: '', args: []);
  }

  /// `My Requests`
  String get myRequests {
    return Intl.message('My Requests', name: 'myRequests', desc: '', args: []);
  }

  /// `By Reimbursement`
  String get byReimbursement {
    return Intl.message(
      'By Reimbursement',
      name: 'byReimbursement',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get yes {
    return Intl.message('Yes', name: 'yes', desc: '', args: []);
  }

  /// `Validated`
  String get validated {
    return Intl.message('Validated', name: 'validated', desc: '', args: []);
  }

  /// `Chronic`
  String get chronic {
    return Intl.message('Chronic', name: 'chronic', desc: '', args: []);
  }

  /// `Approved`
  String get approved {
    return Intl.message('Approved', name: 'approved', desc: '', args: []);
  }

  /// `Rejected`
  String get rejected {
    return Intl.message('Rejected', name: 'rejected', desc: '', args: []);
  }

  /// `Choose Member`
  String get chooseMember {
    return Intl.message(
      'Choose Member',
      name: 'chooseMember',
      desc: '',
      args: [],
    );
  }

  /// `All members`
  String get allMembers {
    return Intl.message('All members', name: 'allMembers', desc: '', args: []);
  }

  /// `Search members`
  String get searchMembers {
    return Intl.message(
      'Search members',
      name: 'searchMembers',
      desc: '',
      args: [],
    );
  }

  /// `Submitted`
  String get requestDialog1Title {
    return Intl.message(
      'Submitted',
      name: 'requestDialog1Title',
      desc: '',
      args: [],
    );
  }

  /// `attachments have been uploaded \nsuccessfully`
  String get requestDialog1Body {
    return Intl.message(
      'attachments have been uploaded \nsuccessfully',
      name: 'requestDialog1Body',
      desc: '',
      args: [],
    );
  }

  /// `Thank You`
  String get requestDialog2Title {
    return Intl.message(
      'Thank You',
      name: 'requestDialog2Title',
      desc: '',
      args: [],
    );
  }

  /// `Your request has been received.\nWe will contact you soon!`
  String get requestDialog2Body {
    return Intl.message(
      'Your request has been received.\nWe will contact you soon!',
      name: 'requestDialog2Body',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message('Language', name: 'language', desc: '', args: []);
  }

  /// `Insurance Policy Number`
  String get insurancePolicyNumber {
    return Intl.message(
      'Insurance Policy Number',
      name: 'insurancePolicyNumber',
      desc: '',
      args: [],
    );
  }

  /// `Insurance Company`
  String get insuranceCompany {
    return Intl.message(
      'Insurance Company',
      name: 'insuranceCompany',
      desc: '',
      args: [],
    );
  }

  /// `Insurance State`
  String get insuranceState {
    return Intl.message(
      'Insurance State',
      name: 'insuranceState',
      desc: '',
      args: [],
    );
  }

  /// `Total Payment`
  String get totalPayment {
    return Intl.message(
      'Total Payment',
      name: 'totalPayment',
      desc: '',
      args: [],
    );
  }

  /// `Members Only`
  String get membersOnly {
    return Intl.message(
      'Members Only',
      name: 'membersOnly',
      desc: '',
      args: [],
    );
  }

  /// `Issuing Type`
  String get issuingType {
    return Intl.message(
      'Issuing Type',
      name: 'issuingType',
      desc: '',
      args: [],
    );
  }

  /// `New`
  String get newKeyword {
    return Intl.message('New', name: 'newKeyword', desc: '', args: []);
  }

  /// `Paid`
  String get paid {
    return Intl.message('Paid', name: 'paid', desc: '', args: []);
  }

  /// `Unpaid`
  String get unpaid {
    return Intl.message('Unpaid', name: 'unpaid', desc: '', args: []);
  }

  /// `Payment date`
  String get paymentDate {
    return Intl.message(
      'Payment date',
      name: 'paymentDate',
      desc: '',
      args: [],
    );
  }

  /// `Next Payment`
  String get nextPayment {
    return Intl.message(
      'Next Payment',
      name: 'nextPayment',
      desc: '',
      args: [],
    );
  }

  /// `Next Payment Date`
  String get nextPaymentDate {
    return Intl.message(
      'Next Payment Date',
      name: 'nextPaymentDate',
      desc: '',
      args: [],
    );
  }

  /// `Beyond Policy Number`
  String get beyondPolicyNumber {
    return Intl.message(
      'Beyond Policy Number',
      name: 'beyondPolicyNumber',
      desc: '',
      args: [],
    );
  }

  /// `Payment Plan`
  String get paymentPlan {
    return Intl.message(
      'Payment Plan',
      name: 'paymentPlan',
      desc: '',
      args: [],
    );
  }

  /// `Quarterly`
  String get quarterly {
    return Intl.message('Quarterly', name: 'quarterly', desc: '', args: []);
  }

  /// `Beyond Account Manager`
  String get beyondAccountManager {
    return Intl.message(
      'Beyond Account Manager',
      name: 'beyondAccountManager',
      desc: '',
      args: [],
    );
  }

  /// `Beyond Sales Agent`
  String get beyondSalesAgent {
    return Intl.message(
      'Beyond Sales Agent',
      name: 'beyondSalesAgent',
      desc: '',
      args: [],
    );
  }

  /// `Insurance Plan Type`
  String get insurancePlanType {
    return Intl.message(
      'Insurance Plan Type',
      name: 'insurancePlanType',
      desc: '',
      args: [],
    );
  }

  /// `Tailor Made`
  String get tailorMade {
    return Intl.message('Tailor Made', name: 'tailorMade', desc: '', args: []);
  }

  /// `Insurance financing`
  String get insuranceFinancing {
    return Intl.message(
      'Insurance financing',
      name: 'insuranceFinancing',
      desc: '',
      args: [],
    );
  }

  /// `Insurance Fund`
  String get insuranceFund {
    return Intl.message(
      'Insurance Fund',
      name: 'insuranceFund',
      desc: '',
      args: [],
    );
  }

  /// `Self Fund`
  String get selfFund {
    return Intl.message('Self Fund', name: 'selfFund', desc: '', args: []);
  }

  /// `TPA`
  String get tPA {
    return Intl.message('TPA', name: 'tPA', desc: '', args: []);
  }

  /// `Status`
  String get status {
    return Intl.message('Status', name: 'status', desc: '', args: []);
  }

  /// `Done`
  String get done {
    return Intl.message('Done', name: 'done', desc: '', args: []);
  }

  /// `Pending`
  String get pending {
    return Intl.message('Pending', name: 'pending', desc: '', args: []);
  }

  /// `View Feedback`
  String get viewFeedback {
    return Intl.message(
      'View Feedback',
      name: 'viewFeedback',
      desc: '',
      args: [],
    );
  }

  /// `Request Date`
  String get requestDate {
    return Intl.message(
      'Request Date',
      name: 'requestDate',
      desc: '',
      args: [],
    );
  }

  /// `Individuals Medical Insurance`
  String get otherLine11 {
    return Intl.message(
      'Individuals Medical Insurance',
      name: 'otherLine11',
      desc: '',
      args: [],
    );
  }

  /// `Motor Insurance`
  String get otherLine22 {
    return Intl.message(
      'Motor Insurance',
      name: 'otherLine22',
      desc: '',
      args: [],
    );
  }

  /// `Property Insurance`
  String get otherLine33 {
    return Intl.message(
      'Property Insurance',
      name: 'otherLine33',
      desc: '',
      args: [],
    );
  }

  /// `Life Insurance`
  String get otherLine44 {
    return Intl.message(
      'Life Insurance',
      name: 'otherLine44',
      desc: '',
      args: [],
    );
  }

  /// `Payment Details`
  String get paymentDetails {
    return Intl.message(
      'Payment Details',
      name: 'paymentDetails',
      desc: '',
      args: [],
    );
  }

  /// `Currency`
  String get currency {
    return Intl.message('Currency', name: 'currency', desc: '', args: []);
  }

  /// `Invoice file`
  String get invoiceFile {
    return Intl.message(
      'Invoice file',
      name: 'invoiceFile',
      desc: '',
      args: [],
    );
  }

  /// `Payment method`
  String get paymentMethod {
    return Intl.message(
      'Payment method',
      name: 'paymentMethod',
      desc: '',
      args: [],
    );
  }

  /// `Payment confirmation file`
  String get paymentConfirmationFile {
    return Intl.message(
      'Payment confirmation file',
      name: 'paymentConfirmationFile',
      desc: '',
      args: [],
    );
  }

  /// `Cash`
  String get cash {
    return Intl.message('Cash', name: 'cash', desc: '', args: []);
  }

  /// `Due date`
  String get dueDate {
    return Intl.message('Due date', name: 'dueDate', desc: '', args: []);
  }

  /// `Invoiced`
  String get invoiced {
    return Intl.message('Invoiced', name: 'invoiced', desc: '', args: []);
  }

  /// `Download Report`
  String get downloadReport {
    return Intl.message(
      'Download Report',
      name: 'downloadReport',
      desc: '',
      args: [],
    );
  }

  /// `Please Choose Member`
  String get pleaseChooseOneMember {
    return Intl.message(
      'Please Choose Member',
      name: 'pleaseChooseOneMember',
      desc: '',
      args: [],
    );
  }

  /// `Please Enter Member Name`
  String get pleaseEnterMemberName {
    return Intl.message(
      'Please Enter Member Name',
      name: 'pleaseEnterMemberName',
      desc: '',
      args: [],
    );
  }

  /// `Please Choose or enter member name`
  String get pleaseEnterMixedName {
    return Intl.message(
      'Please Choose or enter member name',
      name: 'pleaseEnterMixedName',
      desc: '',
      args: [],
    );
  }

  /// `Please Upload at least one Attachments`
  String get pleaseUploadAttachments {
    return Intl.message(
      'Please Upload at least one Attachments',
      name: 'pleaseUploadAttachments',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message('Settings', name: 'settings', desc: '', args: []);
  }

  /// `Log out`
  String get logOut {
    return Intl.message('Log out', name: 'logOut', desc: '', args: []);
  }

  /// `Complaint`
  String get complaint {
    return Intl.message('Complaint', name: 'complaint', desc: '', args: []);
  }

  /// `in case there is a complaint please follow the following processes:Send us an email to`
  String get complaint1 {
    return Intl.message(
      'in case there is a complaint please follow the following processes:Send us an email to',
      name: 'complaint1',
      desc: '',
      args: [],
    );
  }

  /// ` Or call`
  String get complaint2 {
    return Intl.message(' Or call', name: 'complaint2', desc: '', args: []);
  }

  /// `Upon receipt of the complaint, we will contact you to discuss the complaint and indicate the time to investigate the complaint then inform you of the outcome.`
  String get complaint3 {
    return Intl.message(
      'Upon receipt of the complaint, we will contact you to discuss the complaint and indicate the time to investigate the complaint then inform you of the outcome.',
      name: 'complaint3',
      desc: '',
      args: [],
    );
  }

  /// `Customers have the right to contact the FRA directly on info@fra.gov.eg. This is as long as the members have all the policy documents stating their rights, and after following the rules and regulations of the insurer.`
  String get complaint4 {
    return Intl.message(
      'Customers have the right to contact the FRA directly on info@fra.gov.eg. This is as long as the members have all the policy documents stating their rights, and after following the rules and regulations of the insurer.',
      name: 'complaint4',
      desc: '',
      args: [],
    );
  }

  /// ` To view the Customer Protection Guide issued by the Financial Regulatory Authority, follow the link below`
  String get complaint5 {
    return Intl.message(
      ' To view the Customer Protection Guide issued by the Financial Regulatory Authority, follow the link below',
      name: 'complaint5',
      desc: '',
      args: [],
    );
  }

  /// `Last Updated : `
  String get lastUpdated {
    return Intl.message(
      'Last Updated : ',
      name: 'lastUpdated',
      desc: '',
      args: [],
    );
  }

  /// `No`
  String get no {
    return Intl.message('No', name: 'no', desc: '', args: []);
  }

  /// `Something went wrong`
  String get someThingWentWrong {
    return Intl.message(
      'Something went wrong',
      name: 'someThingWentWrong',
      desc: '',
      args: [],
    );
  }

  /// `Try Again`
  String get tryAgain {
    return Intl.message('Try Again', name: 'tryAgain', desc: '', args: []);
  }

  /// `Please update app to newest version`
  String get updateApp {
    return Intl.message(
      'Please update app to newest version',
      name: 'updateApp',
      desc: '',
      args: [],
    );
  }

  /// `Ok`
  String get ok {
    return Intl.message('Ok', name: 'ok', desc: '', args: []);
  }

  /// `Reimbursement`
  String get reimbursement {
    return Intl.message(
      'Reimbursement',
      name: 'reimbursement',
      desc: '',
      args: [],
    );
  }

  /// `Medical Network`
  String get medicalNetwork {
    return Intl.message(
      'Medical Network',
      name: 'medicalNetwork',
      desc: '',
      args: [],
    );
  }

  /// `Explore now`
  String get exploreNow {
    return Intl.message('Explore now', name: 'exploreNow', desc: '', args: []);
  }

  /// `TPA`
  String get tpa {
    return Intl.message('TPA', name: 'tpa', desc: '', args: []);
  }

  /// `City`
  String get city {
    return Intl.message('City', name: 'city', desc: '', args: []);
  }

  /// `Area`
  String get area {
    return Intl.message('Area', name: 'area', desc: '', args: []);
  }

  /// `Specialty`
  String get specialty {
    return Intl.message('Specialty', name: 'specialty', desc: '', args: []);
  }

  /// `Please select category`
  String get tiersValidation {
    return Intl.message(
      'Please select category',
      name: 'tiersValidation',
      desc: '',
      args: [],
    );
  }

  /// `Search by name`
  String get searchByName {
    return Intl.message(
      'Search by name',
      name: 'searchByName',
      desc: '',
      args: [],
    );
  }

  /// `Call`
  String get call {
    return Intl.message('Call', name: 'call', desc: '', args: []);
  }

  /// `Website`
  String get website {
    return Intl.message('Website', name: 'website', desc: '', args: []);
  }

  /// `Location`
  String get location {
    return Intl.message('Location', name: 'location', desc: '', args: []);
  }

  /// `Chronic Medications`
  String get chronicMedications {
    return Intl.message(
      'Chronic Medications',
      name: 'chronicMedications',
      desc: '',
      args: [],
    );
  }

  /// `Online`
  String get online {
    return Intl.message('Online', name: 'online', desc: '', args: []);
  }

  /// `Offline`
  String get offline {
    return Intl.message('Offline', name: 'offline', desc: '', args: []);
  }

  /// `Search Results`
  String get searchResults {
    return Intl.message(
      'Search Results',
      name: 'searchResults',
      desc: '',
      args: [],
    );
  }

  /// `Please Select city`
  String get cityValidation {
    return Intl.message(
      'Please Select city',
      name: 'cityValidation',
      desc: '',
      args: [],
    );
  }

  /// `Branch`
  String get branch {
    return Intl.message('Branch', name: 'branch', desc: '', args: []);
  }

  /// `Bank Account`
  String get bankAccount {
    return Intl.message(
      'Bank Account',
      name: 'bankAccount',
      desc: '',
      args: [],
    );
  }

  /// `Deletion date`
  String get deletionDate {
    return Intl.message(
      'Deletion date',
      name: 'deletionDate',
      desc: '',
      args: [],
    );
  }

  /// `Beyond deletion date`
  String get beyondDeletionDate {
    return Intl.message(
      'Beyond deletion date',
      name: 'beyondDeletionDate',
      desc: '',
      args: [],
    );
  }

  /// `is Deleted`
  String get isDeleted {
    return Intl.message('is Deleted', name: 'isDeleted', desc: '', args: []);
  }

  /// `Member Id`
  String get memberId {
    return Intl.message('Member Id', name: 'memberId', desc: '', args: []);
  }

  /// `Gender`
  String get gender {
    return Intl.message('Gender', name: 'gender', desc: '', args: []);
  }

  /// `Age`
  String get age {
    return Intl.message('Age', name: 'age', desc: '', args: []);
  }

  /// `Account`
  String get account {
    return Intl.message('Account', name: 'account', desc: '', args: []);
  }

  /// `Claim Date`
  String get claimDate {
    return Intl.message('Claim Date', name: 'claimDate', desc: '', args: []);
  }

  /// `Claim Id`
  String get claimId {
    return Intl.message('Claim Id', name: 'claimId', desc: '', args: []);
  }

  /// `Disease`
  String get disease {
    return Intl.message('Disease', name: 'disease', desc: '', args: []);
  }

  /// `Disease Category`
  String get diseaseCategory {
    return Intl.message(
      'Disease Category',
      name: 'diseaseCategory',
      desc: '',
      args: [],
    );
  }

  /// `Icd Code`
  String get icdCode {
    return Intl.message('Icd Code', name: 'icdCode', desc: '', args: []);
  }

  /// `Month`
  String get month {
    return Intl.message('Month', name: 'month', desc: '', args: []);
  }

  /// `Provider`
  String get provider {
    return Intl.message('Provider', name: 'provider', desc: '', args: []);
  }

  /// `Risk Carrier`
  String get riskCarrier {
    return Intl.message(
      'Risk Carrier',
      name: 'riskCarrier',
      desc: '',
      args: [],
    );
  }

  /// `Services Group`
  String get servicesGroup {
    return Intl.message(
      'Services Group',
      name: 'servicesGroup',
      desc: '',
      args: [],
    );
  }

  /// `Policy File`
  String get policyFile {
    return Intl.message('Policy File', name: 'policyFile', desc: '', args: []);
  }

  /// `Add new Request`
  String get addNewRequest {
    return Intl.message(
      'Add new Request',
      name: 'addNewRequest',
      desc: '',
      args: [],
    );
  }

  /// `Add Emergency case`
  String get addEmergency {
    return Intl.message(
      'Add Emergency case',
      name: 'addEmergency',
      desc: '',
      args: [],
    );
  }

  /// `Emergency sent successfully`
  String get sentSuccess {
    return Intl.message(
      'Emergency sent successfully',
      name: 'sentSuccess',
      desc: '',
      args: [],
    );
  }

  /// `please clear other first`
  String get clearOtherFirst {
    return Intl.message(
      'please clear other first',
      name: 'clearOtherFirst',
      desc: '',
      args: [],
    );
  }

  /// `Upload Attachments`
  String get uploadAttachments {
    return Intl.message(
      'Upload Attachments',
      name: 'uploadAttachments',
      desc: '',
      args: [],
    );
  }

  /// `Attachments is required`
  String get attachmentsValidation {
    return Intl.message(
      'Attachments is required',
      name: 'attachmentsValidation',
      desc: '',
      args: [],
    );
  }

  /// `please choose member or enter his name `
  String get memberValidation {
    return Intl.message(
      'please choose member or enter his name ',
      name: 'memberValidation',
      desc: '',
      args: [],
    );
  }

  /// `The company has been successfully transformed`
  String get transformedCompany {
    return Intl.message(
      'The company has been successfully transformed',
      name: 'transformedCompany',
      desc: '',
      args: [],
    );
  }

  /// `There are no pending or old requests, please create a new request below`
  String get emergencyNoItem {
    return Intl.message(
      'There are no pending or old requests, please create a new request below',
      name: 'emergencyNoItem',
      desc: '',
      args: [],
    );
  }

  /// `My Attachments`
  String get myAttachment {
    return Intl.message(
      'My Attachments',
      name: 'myAttachment',
      desc: '',
      args: [],
    );
  }

  /// `all`
  String get all {
    return Intl.message('all', name: 'all', desc: '', args: []);
  }

  /// `Please select the category`
  String get categoryBody {
    return Intl.message(
      'Please select the category',
      name: 'categoryBody',
      desc: '',
      args: [],
    );
  }

  /// `Please select the category`
  String get cityBody {
    return Intl.message(
      'Please select the category',
      name: 'cityBody',
      desc: '',
      args: [],
    );
  }

  /// `Please select the category`
  String get areaBody {
    return Intl.message(
      'Please select the category',
      name: 'areaBody',
      desc: '',
      args: [],
    );
  }

  /// `Please select the provider Type`
  String get providerTypeBody {
    return Intl.message(
      'Please select the provider Type',
      name: 'providerTypeBody',
      desc: '',
      args: [],
    );
  }

  /// `Please select the specialty`
  String get specialtyBody {
    return Intl.message(
      'Please select the specialty',
      name: 'specialtyBody',
      desc: '',
      args: [],
    );
  }

  /// `Add`
  String get add {
    return Intl.message('Add', name: 'add', desc: '', args: []);
  }

  /// `Are you sure you want to delete this attachment ?`
  String get deleteConfirmation {
    return Intl.message(
      'Are you sure you want to delete this attachment ?',
      name: 'deleteConfirmation',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get delete {
    return Intl.message('Delete', name: 'delete', desc: '', args: []);
  }

  /// `Address`
  String get address {
    return Intl.message('Address', name: 'address', desc: '', args: []);
  }

  /// `There is no category`
  String get thereIsNoCategory {
    return Intl.message(
      'There is no category',
      name: 'thereIsNoCategory',
      desc: '',
      args: [],
    );
  }

  /// `Log Out`
  String get logout {
    return Intl.message('Log Out', name: 'logout', desc: '', args: []);
  }

  /// `Your session is over!\nPlease log in again or email Beyond Support\n`
  String get sessionExpired {
    return Intl.message(
      'Your session is over!\nPlease log in again or email Beyond Support\n',
      name: 'sessionExpired',
      desc: '',
      args: [],
    );
  }

  /// `Delete My Account`
  String get deleteAccount {
    return Intl.message(
      'Delete My Account',
      name: 'deleteAccount',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to delete your account? If you delete your account, you will permanently lose your profile,`
  String get deleteAccountBody {
    return Intl.message(
      'Are you sure you want to delete your account? If you delete your account, you will permanently lose your profile,',
      name: 'deleteAccountBody',
      desc: '',
      args: [],
    );
  }

  /// `Dont have account?`
  String get dontHaveAccount {
    return Intl.message(
      'Dont have account?',
      name: 'dontHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Create account`
  String get createNewAccount {
    return Intl.message(
      'Create account',
      name: 'createNewAccount',
      desc: '',
      args: [],
    );
  }

  /// `Enter your account details to create a new account`
  String get registerBody1 {
    return Intl.message(
      'Enter your account details to create a new account',
      name: 'registerBody1',
      desc: '',
      args: [],
    );
  }

  /// `Enter your full name`
  String get fullNameHint {
    return Intl.message(
      'Enter your full name',
      name: 'fullNameHint',
      desc: '',
      args: [],
    );
  }

  /// `Enter your email address`
  String get emailAddressHint {
    return Intl.message(
      'Enter your email address',
      name: 'emailAddressHint',
      desc: '',
      args: [],
    );
  }

  /// `Enter your Phone Number`
  String get phoneNumberHint {
    return Intl.message(
      'Enter your Phone Number',
      name: 'phoneNumberHint',
      desc: '',
      args: [],
    );
  }

  /// `job Description`
  String get jobDesciprtion {
    return Intl.message(
      'job Description',
      name: 'jobDesciprtion',
      desc: '',
      args: [],
    );
  }

  /// `Doctor Reservations`
  String get doctorReservations {
    return Intl.message(
      'Doctor Reservations',
      name: 'doctorReservations',
      desc: '',
      args: [],
    );
  }

  /// `Book now`
  String get bookNow {
    return Intl.message('Book now', name: 'bookNow', desc: '', args: []);
  }

  /// `New Reservation`
  String get newReservation {
    return Intl.message(
      'New Reservation',
      name: 'newReservation',
      desc: '',
      args: [],
    );
  }

  /// `My Reservations`
  String get myReservation {
    return Intl.message(
      'My Reservations',
      name: 'myReservation',
      desc: '',
      args: [],
    );
  }

  /// `Hospital`
  String get hospital {
    return Intl.message('Hospital', name: 'hospital', desc: '', args: []);
  }

  /// `Select Hospital`
  String get selectHospital {
    return Intl.message(
      'Select Hospital',
      name: 'selectHospital',
      desc: '',
      args: [],
    );
  }

  /// `Select Branch`
  String get selectBranch {
    return Intl.message(
      'Select Branch',
      name: 'selectBranch',
      desc: '',
      args: [],
    );
  }

  /// `Select Specialty`
  String get selectSpecialty {
    return Intl.message(
      'Select Specialty',
      name: 'selectSpecialty',
      desc: '',
      args: [],
    );
  }

  /// `Doctor's Gender`
  String get doctorGender {
    return Intl.message(
      'Doctor\'s Gender',
      name: 'doctorGender',
      desc: '',
      args: [],
    );
  }

  /// `Male`
  String get male {
    return Intl.message('Male', name: 'male', desc: '', args: []);
  }

  /// `Female`
  String get female {
    return Intl.message('Female', name: 'female', desc: '', args: []);
  }

  /// `Any`
  String get any {
    return Intl.message('Any', name: 'any', desc: '', args: []);
  }

  /// `Date`
  String get date {
    return Intl.message('Date', name: 'date', desc: '', args: []);
  }

  /// `Select Date`
  String get selectDate {
    return Intl.message('Select Date', name: 'selectDate', desc: '', args: []);
  }

  /// `From`
  String get from {
    return Intl.message('From', name: 'from', desc: '', args: []);
  }

  /// `To`
  String get to {
    return Intl.message('To', name: 'to', desc: '', args: []);
  }

  /// `Appointment Time`
  String get appointmentTime {
    return Intl.message(
      'Appointment Time',
      name: 'appointmentTime',
      desc: '',
      args: [],
    );
  }

  /// `Select Time`
  String get selectAppointmentTime {
    return Intl.message(
      'Select Time',
      name: 'selectAppointmentTime',
      desc: '',
      args: [],
    );
  }

  /// `Available Doctors`
  String get availableDoctors {
    return Intl.message(
      'Available Doctors',
      name: 'availableDoctors',
      desc: '',
      args: [],
    );
  }

  /// `Search for a Doctor`
  String get searchForDoctor {
    return Intl.message(
      'Search for a Doctor',
      name: 'searchForDoctor',
      desc: '',
      args: [],
    );
  }

  /// `Patient Information`
  String get patientInformation {
    return Intl.message(
      'Patient Information',
      name: 'patientInformation',
      desc: '',
      args: [],
    );
  }

  /// `Please fill in your information`
  String get patientInformationBody {
    return Intl.message(
      'Please fill in your information',
      name: 'patientInformationBody',
      desc: '',
      args: [],
    );
  }

  /// `First Name`
  String get firstName {
    return Intl.message('First Name', name: 'firstName', desc: '', args: []);
  }

  /// `Second Name`
  String get fatherName {
    return Intl.message('Second Name', name: 'fatherName', desc: '', args: []);
  }

  /// `Third Name`
  String get grandFatherName {
    return Intl.message(
      'Third Name',
      name: 'grandFatherName',
      desc: '',
      args: [],
    );
  }

  /// `Last Name`
  String get lastName {
    return Intl.message('Last Name', name: 'lastName', desc: '', args: []);
  }

  /// `First Name is required`
  String get firstNameValidation {
    return Intl.message(
      'First Name is required',
      name: 'firstNameValidation',
      desc: '',
      args: [],
    );
  }

  /// `Second Name is required`
  String get secondNameValidation {
    return Intl.message(
      'Second Name is required',
      name: 'secondNameValidation',
      desc: '',
      args: [],
    );
  }

  /// `Third Name is required`
  String get thirdNameValidation {
    return Intl.message(
      'Third Name is required',
      name: 'thirdNameValidation',
      desc: '',
      args: [],
    );
  }

  /// `Last Name is required`
  String get lastNameValidation {
    return Intl.message(
      'Last Name is required',
      name: 'lastNameValidation',
      desc: '',
      args: [],
    );
  }

  /// `Email address is required`
  String get emailAddressValidation {
    return Intl.message(
      'Email address is required',
      name: 'emailAddressValidation',
      desc: '',
      args: [],
    );
  }

  /// `Date of Birth`
  String get dateOfBirth {
    return Intl.message(
      'Date of Birth',
      name: 'dateOfBirth',
      desc: '',
      args: [],
    );
  }

  /// `Date of Birth is required`
  String get dateOfBirthValidation {
    return Intl.message(
      'Date of Birth is required',
      name: 'dateOfBirthValidation',
      desc: '',
      args: [],
    );
  }

  /// `Year`
  String get year {
    return Intl.message('Year', name: 'year', desc: '', args: []);
  }

  /// `Day`
  String get day {
    return Intl.message('Day', name: 'day', desc: '', args: []);
  }

  /// `Cancel`
  String get cancel {
    return Intl.message('Cancel', name: 'cancel', desc: '', args: []);
  }

  /// `Are you sure you want to book?`
  String get reservationBody {
    return Intl.message(
      'Are you sure you want to book?',
      name: 'reservationBody',
      desc: '',
      args: [],
    );
  }

  /// `I understand that this is only an appointment request and will be scheduled only after a confirmation call or SMS`
  String get reservationCheck {
    return Intl.message(
      'I understand that this is only an appointment request and will be scheduled only after a confirmation call or SMS',
      name: 'reservationCheck',
      desc: '',
      args: [],
    );
  }

  /// `Successful Booking`
  String get successfulBooking {
    return Intl.message(
      'Successful Booking',
      name: 'successfulBooking',
      desc: '',
      args: [],
    );
  }

  /// `You can check your reservation details in My Reservations page`
  String get successfulBookingBody {
    return Intl.message(
      'You can check your reservation details in My Reservations page',
      name: 'successfulBookingBody',
      desc: '',
      args: [],
    );
  }

  /// `Evening`
  String get evening {
    return Intl.message('Evening', name: 'evening', desc: '', args: []);
  }

  /// `Morning`
  String get morning {
    return Intl.message('Morning', name: 'morning', desc: '', args: []);
  }

  /// `Afternoon`
  String get afternoon {
    return Intl.message('Afternoon', name: 'afternoon', desc: '', args: []);
  }

  /// `Part Of Day`
  String get partOfDay {
    return Intl.message('Part Of Day', name: 'partOfDay', desc: '', args: []);
  }

  /// `Start Date is required`
  String get firstDateValidation {
    return Intl.message(
      'Start Date is required',
      name: 'firstDateValidation',
      desc: '',
      args: [],
    );
  }

  /// `End Date is required`
  String get secondDateValidation {
    return Intl.message(
      'End Date is required',
      name: 'secondDateValidation',
      desc: '',
      args: [],
    );
  }

  /// `Hospital is required`
  String get hospitalValidation {
    return Intl.message(
      'Hospital is required',
      name: 'hospitalValidation',
      desc: '',
      args: [],
    );
  }

  /// `Branch is required`
  String get branchValidation {
    return Intl.message(
      'Branch is required',
      name: 'branchValidation',
      desc: '',
      args: [],
    );
  }

  /// `Specialty is required`
  String get specialtyValidation {
    return Intl.message(
      'Specialty is required',
      name: 'specialtyValidation',
      desc: '',
      args: [],
    );
  }

  /// `Doctor Gender is required`
  String get doctorValidation {
    return Intl.message(
      'Doctor Gender is required',
      name: 'doctorValidation',
      desc: '',
      args: [],
    );
  }

  /// `Appointment Time is required`
  String get appointmentValidation {
    return Intl.message(
      'Appointment Time is required',
      name: 'appointmentValidation',
      desc: '',
      args: [],
    );
  }

  /// `No Reservation Date Found`
  String get noReservationFound {
    return Intl.message(
      'No Reservation Date Found',
      name: 'noReservationFound',
      desc: '',
      args: [],
    );
  }

  /// `Insurance Network`
  String get insuranceNetwork {
    return Intl.message(
      'Insurance Network',
      name: 'insuranceNetwork',
      desc: '',
      args: [],
    );
  }

  /// `Coming Soon`
  String get commingSoon {
    return Intl.message('Coming Soon', name: 'commingSoon', desc: '', args: []);
  }

  /// `Service Centers`
  String get serviceCenters {
    return Intl.message(
      'Service Centers',
      name: 'serviceCenters',
      desc: '',
      args: [],
    );
  }

  /// `Please enter valid email`
  String get youMustAddValidEmail {
    return Intl.message(
      'Please enter valid email',
      name: 'youMustAddValidEmail',
      desc: '',
      args: [],
    );
  }

  /// `Providers Support`
  String get providersSupport {
    return Intl.message(
      'Providers Support',
      name: 'providersSupport',
      desc: '',
      args: [],
    );
  }

  /// `All Doctors`
  String get allDoctors {
    return Intl.message('All Doctors', name: 'allDoctors', desc: '', args: []);
  }

  /// `Show All Result`
  String get showAllResult {
    return Intl.message(
      'Show All Result',
      name: 'showAllResult',
      desc: '',
      args: [],
    );
  }

  /// `Reset`
  String get reset {
    return Intl.message('Reset', name: 'reset', desc: '', args: []);
  }

  /// `There is no reservations`
  String get thereIsNoReservation {
    return Intl.message(
      'There is no reservations',
      name: 'thereIsNoReservation',
      desc: '',
      args: [],
    );
  }

  /// `No doctors with this name`
  String get noDoctors {
    return Intl.message(
      'No doctors with this name',
      name: 'noDoctors',
      desc: '',
      args: [],
    );
  }

  /// `Active Member`
  String get activeMember {
    return Intl.message(
      'Active Member',
      name: 'activeMember',
      desc: '',
      args: [],
    );
  }

  /// `Addition`
  String get addition {
    return Intl.message('Addition', name: 'addition', desc: '', args: []);
  }

  /// `Deletion`
  String get deletion {
    return Intl.message('Deletion', name: 'deletion', desc: '', args: []);
  }

  /// `Analytics`
  String get analytics {
    return Intl.message('Analytics', name: 'analytics', desc: '', args: []);
  }

  /// `Under Addition`
  String get underAddition {
    return Intl.message(
      'Under Addition',
      name: 'underAddition',
      desc: '',
      args: [],
    );
  }

  /// `Added`
  String get added {
    return Intl.message('Added', name: 'added', desc: '', args: []);
  }

  /// `Active Members`
  String get activeMembers {
    return Intl.message(
      'Active Members',
      name: 'activeMembers',
      desc: '',
      args: [],
    );
  }

  /// `All Status`
  String get allStatus {
    return Intl.message('All Status', name: 'allStatus', desc: '', args: []);
  }

  /// `Enter the period quantity`
  String get periodQuantityHint {
    return Intl.message(
      'Enter the period quantity',
      name: 'periodQuantityHint',
      desc: '',
      args: [],
    );
  }

  /// `Choose Date`
  String get chooseFromAndLandDate {
    return Intl.message(
      'Choose Date',
      name: 'chooseFromAndLandDate',
      desc: '',
      args: [],
    );
  }

  /// `From date`
  String get fromDate {
    return Intl.message('From date', name: 'fromDate', desc: '', args: []);
  }

  /// `To date`
  String get toDate {
    return Intl.message('To date', name: 'toDate', desc: '', args: []);
  }

  /// `Confirm`
  String get confirm {
    return Intl.message('Confirm', name: 'confirm', desc: '', args: []);
  }

  /// `Under Deletions`
  String get underDeletion {
    return Intl.message(
      'Under Deletions',
      name: 'underDeletion',
      desc: '',
      args: [],
    );
  }

  /// `Deleted`
  String get deleted {
    return Intl.message('Deleted', name: 'deleted', desc: '', args: []);
  }

  /// `Demographics Overview`
  String get demographicsOverview {
    return Intl.message(
      'Demographics Overview',
      name: 'demographicsOverview',
      desc: '',
      args: [],
    );
  }

  /// `Avg Age`
  String get avgAge {
    return Intl.message('Avg Age', name: 'avgAge', desc: '', args: []);
  }

  /// `Employees`
  String get employees {
    return Intl.message('Employees', name: 'employees', desc: '', args: []);
  }

  /// `Family Members`
  String get familyMembers {
    return Intl.message(
      'Family Members',
      name: 'familyMembers',
      desc: '',
      args: [],
    );
  }

  /// `Gender Distribution`
  String get genderDistribution {
    return Intl.message(
      'Gender Distribution',
      name: 'genderDistribution',
      desc: '',
      args: [],
    );
  }

  /// `Average Age Comparison`
  String get averageAgeComparison {
    return Intl.message(
      'Average Age Comparison',
      name: 'averageAgeComparison',
      desc: '',
      args: [],
    );
  }

  /// `Monthly Trend`
  String get monthlyTrend {
    return Intl.message(
      'Monthly Trend',
      name: 'monthlyTrend',
      desc: '',
      args: [],
    );
  }

  /// `Active vs Additions`
  String get activeVsAdditions {
    return Intl.message(
      'Active vs Additions',
      name: 'activeVsAdditions',
      desc: '',
      args: [],
    );
  }

  /// `Active vs Deletions`
  String get activeVsDeletions {
    return Intl.message(
      'Active vs Deletions',
      name: 'activeVsDeletions',
      desc: '',
      args: [],
    );
  }

  /// `Additions`
  String get additions {
    return Intl.message('Additions', name: 'additions', desc: '', args: []);
  }

  /// `Deletions`
  String get deletions {
    return Intl.message('Deletions', name: 'deletions', desc: '', args: []);
  }

  /// `years`
  String get years {
    return Intl.message('years', name: 'years', desc: '', args: []);
  }

  /// `Total Members`
  String get totalMembers {
    return Intl.message(
      'Total Members',
      name: 'totalMembers',
      desc: '',
      args: [],
    );
  }

  /// `Show Result`
  String get showResult {
    return Intl.message('Show Result', name: 'showResult', desc: '', args: []);
  }

  /// `Insurance Networks`
  String get insuranceNetworks {
    return Intl.message(
      'Insurance Networks',
      name: 'insuranceNetworks',
      desc: '',
      args: [],
    );
  }

  /// `No articles found`
  String get noArticals {
    return Intl.message(
      'No articles found',
      name: 'noArticals',
      desc: '',
      args: [],
    );
  }

  /// `Wellness Programs`
  String get wellnessPrograms {
    return Intl.message(
      'Wellness Programs',
      name: 'wellnessPrograms',
      desc: '',
      args: [],
    );
  }

  /// `Vehicle Brand`
  String get vehicleBrand {
    return Intl.message(
      'Vehicle Brand',
      name: 'vehicleBrand',
      desc: '',
      args: [],
    );
  }

  /// `Select Brand`
  String get selectBrand {
    return Intl.message(
      'Select Brand',
      name: 'selectBrand',
      desc: '',
      args: [],
    );
  }

  /// `Select Company`
  String get selectCompany {
    return Intl.message(
      'Select Company',
      name: 'selectCompany',
      desc: '',
      args: [],
    );
  }

  /// `Please select the Insurance Company`
  String get pleaseSelectTheInsuranceCompany {
    return Intl.message(
      'Please select the Insurance Company',
      name: 'pleaseSelectTheInsuranceCompany',
      desc: '',
      args: [],
    );
  }

  /// `Select Area`
  String get selectArea {
    return Intl.message('Select Area', name: 'selectArea', desc: '', args: []);
  }

  /// `Select Type`
  String get selectType {
    return Intl.message('Select Type', name: 'selectType', desc: '', args: []);
  }

  /// `Center Type`
  String get centerType {
    return Intl.message('Center Type', name: 'centerType', desc: '', args: []);
  }

  /// `Reset Details`
  String get resetDetails {
    return Intl.message(
      'Reset Details',
      name: 'resetDetails',
      desc: '',
      args: [],
    );
  }

  /// `No Service Center Found`
  String get noServiceCenterFound {
    return Intl.message(
      'No Service Center Found',
      name: 'noServiceCenterFound',
      desc: '',
      args: [],
    );
  }

  /// `Needed Papers`
  String get neededPaper {
    return Intl.message(
      'Needed Papers',
      name: 'neededPaper',
      desc: '',
      args: [],
    );
  }

  /// `Please enter valid phone number`
  String get phoneValidation1 {
    return Intl.message(
      'Please enter valid phone number',
      name: 'phoneValidation1',
      desc: '',
      args: [],
    );
  }

  /// `Select City`
  String get selectCity {
    return Intl.message('Select City', name: 'selectCity', desc: '', args: []);
  }

  /// `Check`
  String get check {
    return Intl.message('Check', name: 'check', desc: '', args: []);
  }

  /// `Reimbursement Management`
  String get reimbursementRequests {
    return Intl.message(
      'Reimbursement Management',
      name: 'reimbursementRequests',
      desc: '',
      args: [],
    );
  }

  /// `Claim Status`
  String get claimStatus {
    return Intl.message(
      'Claim Status',
      name: 'claimStatus',
      desc: '',
      args: [],
    );
  }

  /// `Member Statistics`
  String get memberStatistics {
    return Intl.message(
      'Member Statistics',
      name: 'memberStatistics',
      desc: '',
      args: [],
    );
  }

  /// `Individual Medical Insurance`
  String get individualMedicalInsurance {
    return Intl.message(
      'Individual Medical Insurance',
      name: 'individualMedicalInsurance',
      desc: '',
      args: [],
    );
  }

  /// `Enter Primary Member's Data`
  String get enterPrimaryMemberData {
    return Intl.message(
      'Enter Primary Member\'s Data',
      name: 'enterPrimaryMemberData',
      desc: '',
      args: [],
    );
  }

  /// `Age (18 to 59 years old)`
  String get age18To59 {
    return Intl.message(
      'Age (18 to 59 years old)',
      name: 'age18To59',
      desc: '',
      args: [],
    );
  }

  /// `Enter Input`
  String get enterInput {
    return Intl.message('Enter Input', name: 'enterInput', desc: '', args: []);
  }

  /// `Add Wife`
  String get addWife {
    return Intl.message('Add Wife', name: 'addWife', desc: '', args: []);
  }

  /// `Add Husband`
  String get addHusband {
    return Intl.message('Add Husband', name: 'addHusband', desc: '', args: []);
  }

  /// `Wife Added`
  String get wifeAdded {
    return Intl.message('Wife Added', name: 'wifeAdded', desc: '', args: []);
  }

  /// `Husband Added`
  String get husbandAdded {
    return Intl.message(
      'Husband Added',
      name: 'husbandAdded',
      desc: '',
      args: [],
    );
  }

  /// `Children Ages`
  String get childrenAges {
    return Intl.message(
      'Children Ages',
      name: 'childrenAges',
      desc: '',
      args: [],
    );
  }

  /// `Add 1st Child`
  String get add1stChild {
    return Intl.message(
      'Add 1st Child',
      name: 'add1stChild',
      desc: '',
      args: [],
    );
  }

  /// `Add 2nd Child`
  String get add2ndChild {
    return Intl.message(
      'Add 2nd Child',
      name: 'add2ndChild',
      desc: '',
      args: [],
    );
  }

  /// `Add 3rd Child`
  String get add3rdChild {
    return Intl.message(
      'Add 3rd Child',
      name: 'add3rdChild',
      desc: '',
      args: [],
    );
  }

  /// `Add 4th Child`
  String get add4thChild {
    return Intl.message(
      'Add 4th Child',
      name: 'add4thChild',
      desc: '',
      args: [],
    );
  }

  /// `Add 5th Child`
  String get add5thChild {
    return Intl.message(
      'Add 5th Child',
      name: 'add5thChild',
      desc: '',
      args: [],
    );
  }

  /// `Add {count}th Child`
  String addNthChild(Object count) {
    return Intl.message(
      'Add ${count}th Child',
      name: 'addNthChild',
      desc: '',
      args: [count],
    );
  }

  /// `Does any of your family members need monthly treatment or suffer from chronic diseases?`
  String get chronicDiseasesQuestion {
    return Intl.message(
      'Does any of your family members need monthly treatment or suffer from chronic diseases?',
      name: 'chronicDiseasesQuestion',
      desc: '',
      args: [],
    );
  }

  /// `What chronic diseases do you or your family members suffer from? (for better understanding of the situation):`
  String get chronicDiseasesDescription {
    return Intl.message(
      'What chronic diseases do you or your family members suffer from? (for better understanding of the situation):',
      name: 'chronicDiseasesDescription',
      desc: '',
      args: [],
    );
  }

  /// `Enter the disease`
  String get enterDisease {
    return Intl.message(
      'Enter the disease',
      name: 'enterDisease',
      desc: '',
      args: [],
    );
  }

  /// `Compare Plans`
  String get comparePlans {
    return Intl.message(
      'Compare Plans',
      name: 'comparePlans',
      desc: '',
      args: [],
    );
  }

  /// `Comparing plans...`
  String get comparingPlans {
    return Intl.message(
      'Comparing plans...',
      name: 'comparingPlans',
      desc: '',
      args: [],
    );
  }

  /// `Create New Sick Leave Request`
  String get createNewRequestSickLeave {
    return Intl.message(
      'Create New Sick Leave Request',
      name: 'createNewRequestSickLeave',
      desc: '',
      args: [],
    );
  }

  /// `Track Sick Leave Requests`
  String get trackNewRequestSickLeave {
    return Intl.message(
      'Track Sick Leave Requests',
      name: 'trackNewRequestSickLeave',
      desc: '',
      args: [],
    );
  }

  /// `Company's Sick Leave Analytics`
  String get companySickLeaveAna {
    return Intl.message(
      'Company\'s Sick Leave Analytics',
      name: 'companySickLeaveAna',
      desc: '',
      args: [],
    );
  }

  /// `Processing`
  String get processing {
    return Intl.message('Processing', name: 'processing', desc: '', args: []);
  }

  /// `Completed`
  String get completed {
    return Intl.message('Completed', name: 'completed', desc: '', args: []);
  }

  /// `Count`
  String get count {
    return Intl.message('Count', name: 'count', desc: '', args: []);
  }

  /// `يمكنك طلب رمز جديد خلال `
  String get dontReceiveCode {
    return Intl.message(
      'يمكنك طلب رمز جديد خلال ',
      name: 'dontReceiveCode',
      desc: '',
      args: [],
    );
  }

  /// `Resend code`
  String get resendCode {
    return Intl.message('Resend code', name: 'resendCode', desc: '', args: []);
  }

  /// `Active`
  String get active {
    return Intl.message('Active', name: 'active', desc: '', args: []);
  }

  /// `Expired`
  String get expired {
    return Intl.message('Expired', name: 'expired', desc: '', args: []);
  }

  /// `No emergency requests found`
  String get noEmergenciesFound {
    return Intl.message(
      'No emergency requests found',
      name: 'noEmergenciesFound',
      desc: '',
      args: [],
    );
  }

  /// `Error loading data`
  String get errorLoadingData {
    return Intl.message(
      'Error loading data',
      name: 'errorLoadingData',
      desc: '',
      args: [],
    );
  }

  /// `لا توجد بيانات`
  String get noDataTitle {
    return Intl.message(
      'لا توجد بيانات',
      name: 'noDataTitle',
      desc: '',
      args: [],
    );
  }

  /// `ستظهر بياناتك هنا عند استلامها`
  String get noDataBody {
    return Intl.message(
      'ستظهر بياناتك هنا عند استلامها',
      name: 'noDataBody',
      desc: '',
      args: [],
    );
  }

  /// `حدث خطأ غير متوقع`
  String get errorTitle {
    return Intl.message(
      'حدث خطأ غير متوقع',
      name: 'errorTitle',
      desc: '',
      args: [],
    );
  }

  /// `حدثت مشكلة أثناء تحميل البيانات، حاول مرة أخرى بعد قليل.`
  String get errorBody {
    return Intl.message(
      'حدثت مشكلة أثناء تحميل البيانات، حاول مرة أخرى بعد قليل.',
      name: 'errorBody',
      desc: '',
      args: [],
    );
  }

  /// `App Version`
  String get appVersion {
    return Intl.message('App Version', name: 'appVersion', desc: '', args: []);
  }

  /// `Choose your preferred app language`
  String get languageHint {
    return Intl.message(
      'Choose your preferred app language',
      name: 'languageHint',
      desc: '',
      args: [],
    );
  }

  /// `Dark Mode`
  String get darkMode {
    return Intl.message('Dark Mode', name: 'darkMode', desc: '', args: []);
  }

  /// `Light Mode`
  String get lightMode {
    return Intl.message('Light Mode', name: 'lightMode', desc: '', args: []);
  }

  /// `Mode`
  String get mode {
    return Intl.message('Mode', name: 'mode', desc: '', args: []);
  }

  /// `Are you sure you want to log out?`
  String get logoutBody {
    return Intl.message(
      'Are you sure you want to log out?',
      name: 'logoutBody',
      desc: '',
      args: [],
    );
  }

  /// `Beyond Utilization Dashboard`
  String get beyondUtilizationDashboard {
    return Intl.message(
      'Beyond Utilization Dashboard',
      name: 'beyondUtilizationDashboard',
      desc: '',
      args: [],
    );
  }

  /// `There is no utilization please ask Beyond to add`
  String get noBeyondUtilizationDashboard {
    return Intl.message(
      'There is no utilization please ask Beyond to add',
      name: 'noBeyondUtilizationDashboard',
      desc: '',
      args: [],
    );
  }

  /// `All`
  String get policy_status_all {
    return Intl.message('All', name: 'policy_status_all', desc: '', args: []);
  }

  /// `Active`
  String get policy_status_active {
    return Intl.message(
      'Active',
      name: 'policy_status_active',
      desc: '',
      args: [],
    );
  }

  /// `Expired`
  String get policy_status_expired {
    return Intl.message(
      'Expired',
      name: 'policy_status_expired',
      desc: '',
      args: [],
    );
  }

  /// `Suspended`
  String get policy_status_suspended {
    return Intl.message(
      'Suspended',
      name: 'policy_status_suspended',
      desc: '',
      args: [],
    );
  }

  /// `Terminated with Insurance Company`
  String get policy_status_terminated_with_insurance_company {
    return Intl.message(
      'Terminated with Insurance Company',
      name: 'policy_status_terminated_with_insurance_company',
      desc: '',
      args: [],
    );
  }

  /// `Under Issuance`
  String get policy_status_under_issuance {
    return Intl.message(
      'Under Issuance',
      name: 'policy_status_under_issuance',
      desc: '',
      args: [],
    );
  }

  /// `Draft`
  String get policy_status_draft {
    return Intl.message(
      'Draft',
      name: 'policy_status_draft',
      desc: '',
      args: [],
    );
  }

  /// `Terminated With Beyond`
  String get policy_status_terminated_with_beyond {
    return Intl.message(
      'Terminated With Beyond',
      name: 'policy_status_terminated_with_beyond',
      desc: '',
      args: [],
    );
  }

  /// `Lapsed Bupa`
  String get policy_status_lapsed_bupa {
    return Intl.message(
      'Lapsed Bupa',
      name: 'policy_status_lapsed_bupa',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get policy_status_cancel {
    return Intl.message(
      'Cancel',
      name: 'policy_status_cancel',
      desc: '',
      args: [],
    );
  }

  /// `Payment File`
  String get paymentFile {
    return Intl.message(
      'Payment File',
      name: 'paymentFile',
      desc: '',
      args: [],
    );
  }

  /// `There is no Files`
  String get thereIsNoFile {
    return Intl.message(
      'There is no Files',
      name: 'thereIsNoFile',
      desc: '',
      args: [],
    );
  }

  /// `Cannot open file`
  String get cannotOpenFile {
    return Intl.message(
      'Cannot open file',
      name: 'cannotOpenFile',
      desc: '',
      args: [],
    );
  }

  /// `No policy details available`
  String get noPolicyDetailsFound {
    return Intl.message(
      'No policy details available',
      name: 'noPolicyDetailsFound',
      desc: '',
      args: [],
    );
  }

  /// `Item`
  String get item {
    return Intl.message('Item', name: 'item', desc: '', args: []);
  }

  /// `Utilization/Claim History`
  String get utilizationClaimHistory {
    return Intl.message(
      'Utilization/Claim History',
      name: 'utilizationClaimHistory',
      desc: '',
      args: [],
    );
  }

  /// `Value`
  String get value {
    return Intl.message('Value', name: 'value', desc: '', args: []);
  }

  /// `Medication`
  String get medication {
    return Intl.message('Medication', name: 'medication', desc: '', args: []);
  }

  /// `Laboratory`
  String get lab {
    return Intl.message('Laboratory', name: 'lab', desc: '', args: []);
  }

  /// `Scan`
  String get scan {
    return Intl.message('Scan', name: 'scan', desc: '', args: []);
  }

  /// `Doctor Visit`
  String get doctor_visit {
    return Intl.message(
      'Doctor Visit',
      name: 'doctor_visit',
      desc: '',
      args: [],
    );
  }

  /// `Inpatient`
  String get inpatient {
    return Intl.message('Inpatient', name: 'inpatient', desc: '', args: []);
  }

  /// `Physical Therapy`
  String get physical_therapy {
    return Intl.message(
      'Physical Therapy',
      name: 'physical_therapy',
      desc: '',
      args: [],
    );
  }

  /// `Maternity`
  String get maternity {
    return Intl.message('Maternity', name: 'maternity', desc: '', args: []);
  }

  /// `Emergency`
  String get emergency {
    return Intl.message('Emergency', name: 'emergency', desc: '', args: []);
  }

  /// `Dental`
  String get dental {
    return Intl.message('Dental', name: 'dental', desc: '', args: []);
  }

  /// `Optical`
  String get optical {
    return Intl.message('Optical', name: 'optical', desc: '', args: []);
  }

  /// `Sick Leave Created Successfully`
  String get sickLeaveCreatedSuccessfully {
    return Intl.message(
      'Sick Leave Created Successfully',
      name: 'sickLeaveCreatedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Unique services`
  String get uniqueService {
    return Intl.message(
      'Unique services',
      name: 'uniqueService',
      desc: '',
      args: [],
    );
  }

  /// `Please select tpa first`
  String get pleaseSelectTpa {
    return Intl.message(
      'Please select tpa first',
      name: 'pleaseSelectTpa',
      desc: '',
      args: [],
    );
  }

  /// `Select Doctor`
  String get selectDoctor {
    return Intl.message(
      'Select Doctor',
      name: 'selectDoctor',
      desc: '',
      args: [],
    );
  }

  /// `Press back again to exit`
  String get press_back_again_to_exit {
    return Intl.message(
      'Press back again to exit',
      name: 'press_back_again_to_exit',
      desc: '',
      args: [],
    );
  }

  /// `Additions & Deletions`
  String get additionAndDeletions {
    return Intl.message(
      'Additions & Deletions',
      name: 'additionAndDeletions',
      desc: '',
      args: [],
    );
  }

  /// `Manage member additions and deletions for your insurance policies`
  String get manageMemberAdditionsDeletions {
    return Intl.message(
      'Manage member additions and deletions for your insurance policies',
      name: 'manageMemberAdditionsDeletions',
      desc: '',
      args: [],
    );
  }

  /// `Submit a new addition or deletion request for your members. Choose between manual entry or bulk template upload.`
  String get createNewRequestDesc {
    return Intl.message(
      'Submit a new addition or deletion request for your members. Choose between manual entry or bulk template upload.',
      name: 'createNewRequestDesc',
      desc: '',
      args: [],
    );
  }

  /// `Get Started`
  String get getStarted {
    return Intl.message('Get Started', name: 'getStarted', desc: '', args: []);
  }

  /// `View / Track Requests`
  String get viewTrackRequests {
    return Intl.message(
      'View / Track Requests',
      name: 'viewTrackRequests',
      desc: '',
      args: [],
    );
  }

  /// `View Requests`
  String get viewRequests {
    return Intl.message(
      'View Requests',
      name: 'viewRequests',
      desc: '',
      args: [],
    );
  }

  /// `Monitor the status of your submitted requests and view the complete history of all additions and deletions.`
  String get viewTrackRequestsDesc {
    return Intl.message(
      'Monitor the status of your submitted requests and view the complete history of all additions and deletions.',
      name: 'viewTrackRequestsDesc',
      desc: '',
      args: [],
    );
  }

  /// `Select Insurance Policies`
  String get selectInsurancePolicies {
    return Intl.message(
      'Select Insurance Policies',
      name: 'selectInsurancePolicies',
      desc: '',
      args: [],
    );
  }

  /// `Choose which insurance policies you want to apply this action to`
  String get chooseWhichInsurancePolicies {
    return Intl.message(
      'Choose which insurance policies you want to apply this action to',
      name: 'chooseWhichInsurancePolicies',
      desc: '',
      args: [],
    );
  }

  /// `Note:`
  String get noteLabel {
    return Intl.message('Note:', name: 'noteLabel', desc: '', args: []);
  }

  /// `The same members will be processed for all selected policies. Select all policies you want to include in this request.`
  String get noteSameMembersProcessed {
    return Intl.message(
      'The same members will be processed for all selected policies. Select all policies you want to include in this request.',
      name: 'noteSameMembersProcessed',
      desc: '',
      args: [],
    );
  }

  /// `Active Policies`
  String get activePolicies {
    return Intl.message(
      'Active Policies',
      name: 'activePolicies',
      desc: '',
      args: [],
    );
  }

  /// `Select one or more policies to apply this action`
  String get selectOneOrMorePolicies {
    return Intl.message(
      'Select one or more policies to apply this action',
      name: 'selectOneOrMorePolicies',
      desc: '',
      args: [],
    );
  }

  /// `Selected:`
  String get selected {
    return Intl.message('Selected:', name: 'selected', desc: '', args: []);
  }

  /// `Continue to Method Selection`
  String get continueToMethodSelection {
    return Intl.message(
      'Continue to Method Selection',
      name: 'continueToMethodSelection',
      desc: '',
      args: [],
    );
  }

  /// `Select Request Type`
  String get selectRequestType {
    return Intl.message(
      'Select Request Type',
      name: 'selectRequestType',
      desc: '',
      args: [],
    );
  }

  /// `Choose the type of action you want to perform`
  String get chooseTypeOfAction {
    return Intl.message(
      'Choose the type of action you want to perform',
      name: 'chooseTypeOfAction',
      desc: '',
      args: [],
    );
  }

  /// `Addition Only`
  String get additionOnly {
    return Intl.message(
      'Addition Only',
      name: 'additionOnly',
      desc: '',
      args: [],
    );
  }

  /// `Add new members to the selected insurance policies. Perfect for onboarding new employees or adding family members.`
  String get additionOnlyDesc {
    return Intl.message(
      'Add new members to the selected insurance policies. Perfect for onboarding new employees or adding family members.',
      name: 'additionOnlyDesc',
      desc: '',
      args: [],
    );
  }

  /// `Select Addition`
  String get selectAddition {
    return Intl.message(
      'Select Addition',
      name: 'selectAddition',
      desc: '',
      args: [],
    );
  }

  /// `Deletion Only`
  String get deletionOnly {
    return Intl.message(
      'Deletion Only',
      name: 'deletionOnly',
      desc: '',
      args: [],
    );
  }

  /// `Remove existing members from the selected insurance policies. Used for terminations or coverage changes.`
  String get deletionOnlyDesc {
    return Intl.message(
      'Remove existing members from the selected insurance policies. Used for terminations or coverage changes.',
      name: 'deletionOnlyDesc',
      desc: '',
      args: [],
    );
  }

  /// `Select Deletion`
  String get selectDeletion {
    return Intl.message(
      'Select Deletion',
      name: 'selectDeletion',
      desc: '',
      args: [],
    );
  }

  /// `Both`
  String get both {
    return Intl.message('Both', name: 'both', desc: '', args: []);
  }

  /// `Perform both additions and deletions in a single request. Efficient for bulk policy updates.`
  String get bothDesc {
    return Intl.message(
      'Perform both additions and deletions in a single request. Efficient for bulk policy updates.',
      name: 'bothDesc',
      desc: '',
      args: [],
    );
  }

  /// `Select Both`
  String get selectBoth {
    return Intl.message('Select Both', name: 'selectBoth', desc: '', args: []);
  }

  /// `Continue`
  String get continueButton {
    return Intl.message('Continue', name: 'continueButton', desc: '', args: []);
  }

  /// `Select Method`
  String get selectMethod {
    return Intl.message(
      'Select Method',
      name: 'selectMethod',
      desc: '',
      args: [],
    );
  }

  /// `Manual Entry`
  String get manualEntry {
    return Intl.message(
      'Manual Entry',
      name: 'manualEntry',
      desc: '',
      args: [],
    );
  }

  /// `Fill out forms on the platform to add members one by one. Best for small numbers of members.`
  String get manualEntryDesc {
    return Intl.message(
      'Fill out forms on the platform to add members one by one. Best for small numbers of members.',
      name: 'manualEntryDesc',
      desc: '',
      args: [],
    );
  }

  /// `Guided step-by-step process`
  String get guidedStepByStep {
    return Intl.message(
      'Guided step-by-step process',
      name: 'guidedStepByStep',
      desc: '',
      args: [],
    );
  }

  /// `Instant field validation`
  String get instantFieldValidation {
    return Intl.message(
      'Instant field validation',
      name: 'instantFieldValidation',
      desc: '',
      args: [],
    );
  }

  /// `Perfect for 1-10 members`
  String get perfectFor1To10Members {
    return Intl.message(
      'Perfect for 1-10 members',
      name: 'perfectFor1To10Members',
      desc: '',
      args: [],
    );
  }

  /// `Proceed with Manual Entry`
  String get proceedWithManualEntry {
    return Intl.message(
      'Proceed with Manual Entry',
      name: 'proceedWithManualEntry',
      desc: '',
      args: [],
    );
  }

  /// `Template Upload`
  String get templateUpload {
    return Intl.message(
      'Template Upload',
      name: 'templateUpload',
      desc: '',
      args: [],
    );
  }

  /// `Download our Excel template, fill it offline, and upload for bulk processing. Best for large numbers.`
  String get templateUploadDesc {
    return Intl.message(
      'Download our Excel template, fill it offline, and upload for bulk processing. Best for large numbers.',
      name: 'templateUploadDesc',
      desc: '',
      args: [],
    );
  }

  /// `Efficient bulk processing`
  String get efficientBulkProcessing {
    return Intl.message(
      'Efficient bulk processing',
      name: 'efficientBulkProcessing',
      desc: '',
      args: [],
    );
  }

  /// `Comprehensive error reporting`
  String get comprehensiveErrorReporting {
    return Intl.message(
      'Comprehensive error reporting',
      name: 'comprehensiveErrorReporting',
      desc: '',
      args: [],
    );
  }

  /// `Perfect for 10+ members`
  String get perfectFor10PlusMembers {
    return Intl.message(
      'Perfect for 10+ members',
      name: 'perfectFor10PlusMembers',
      desc: '',
      args: [],
    );
  }

  /// `Proceed with Template`
  String get proceedWithTemplate {
    return Intl.message(
      'Proceed with Template',
      name: 'proceedWithTemplate',
      desc: '',
      args: [],
    );
  }

  /// `Add Members Manually`
  String get addMembersManually {
    return Intl.message(
      'Add Members Manually',
      name: 'addMembersManually',
      desc: '',
      args: [],
    );
  }

  /// `Fill out member details below. You can add multiple members in one request.`
  String get fillOutMemberDetails {
    return Intl.message(
      'Fill out member details below. You can add multiple members in one request.',
      name: 'fillOutMemberDetails',
      desc: '',
      args: [],
    );
  }

  /// `Selected Policies:`
  String get selectedPolicies {
    return Intl.message(
      'Selected Policies:',
      name: 'selectedPolicies',
      desc: '',
      args: [],
    );
  }

  /// `Medical Insurance`
  String get medicalInsurance {
    return Intl.message(
      'Medical Insurance',
      name: 'medicalInsurance',
      desc: '',
      args: [],
    );
  }

  /// `Tip: `
  String get tip {
    return Intl.message('Tip: ', name: 'tip', desc: '', args: []);
  }

  /// `All data is validated instantly. You'll see real-time feedback if there are any errors in your entries.`
  String get allDataValidatedInstantly {
    return Intl.message(
      'All data is validated instantly. You\'ll see real-time feedback if there are any errors in your entries.',
      name: 'allDataValidatedInstantly',
      desc: '',
      args: [],
    );
  }

  /// `Add Another Member`
  String get addAnotherMember {
    return Intl.message(
      'Add Another Member',
      name: 'addAnotherMember',
      desc: '',
      args: [],
    );
  }

  /// `Create HR Access`
  String get createHrAccess {
    return Intl.message(
      'Create HR Access',
      name: 'createHrAccess',
      desc: '',
      args: [],
    );
  }

  /// `Manager Full Name`
  String get managerFullName {
    return Intl.message(
      'Manager Full Name',
      name: 'managerFullName',
      desc: '',
      args: [],
    );
  }

  /// `Access Permissions`
  String get accessPermissions {
    return Intl.message(
      'Access Permissions',
      name: 'accessPermissions',
      desc: '',
      args: [],
    );
  }

  /// `Access Payment`
  String get accessPayment {
    return Intl.message(
      'Access Payment',
      name: 'accessPayment',
      desc: '',
      args: [],
    );
  }

  /// `Access Policy Details`
  String get accessPolicyDetails {
    return Intl.message(
      'Access Policy Details',
      name: 'accessPolicyDetails',
      desc: '',
      args: [],
    );
  }

  /// `Access Utilization`
  String get accessUtilization {
    return Intl.message(
      'Access Utilization',
      name: 'accessUtilization',
      desc: '',
      args: [],
    );
  }

  /// `Access Active List`
  String get accessActiveList {
    return Intl.message(
      'Access Active List',
      name: 'accessActiveList',
      desc: '',
      args: [],
    );
  }

  /// `Access Addition and Deletions`
  String get accessAdditionAndDeletions {
    return Intl.message(
      'Access Addition and Deletions',
      name: 'accessAdditionAndDeletions',
      desc: '',
      args: [],
    );
  }

  /// `Add Another Manager`
  String get addAnotherManager {
    return Intl.message(
      'Add Another Manager',
      name: 'addAnotherManager',
      desc: '',
      args: [],
    );
  }

  /// `All data is validated before submission. Make sure to select a policy and fill in all required fields.`
  String get hrAccessTip {
    return Intl.message(
      'All data is validated before submission. Make sure to select a policy and fill in all required fields.',
      name: 'hrAccessTip',
      desc: '',
      args: [],
    );
  }

  /// `Submit Request`
  String get submitRequest {
    return Intl.message(
      'Submit Request',
      name: 'submitRequest',
      desc: '',
      args: [],
    );
  }

  /// `Member #`
  String get member {
    return Intl.message('Member #', name: 'member', desc: '', args: []);
  }

  /// `Relationship`
  String get relationship {
    return Intl.message(
      'Relationship',
      name: 'relationship',
      desc: '',
      args: [],
    );
  }

  /// `Select Relationship`
  String get selectRelationship {
    return Intl.message(
      'Select Relationship',
      name: 'selectRelationship',
      desc: '',
      args: [],
    );
  }

  /// `Spouse`
  String get spouse {
    return Intl.message('Spouse', name: 'spouse', desc: '', args: []);
  }

  /// `Child`
  String get child {
    return Intl.message('Child', name: 'child', desc: '', args: []);
  }

  /// `Full Name (Arabic)`
  String get fullNameArabic {
    return Intl.message(
      'Full Name (Arabic)',
      name: 'fullNameArabic',
      desc: '',
      args: [],
    );
  }

  /// `اسم العضو الكامل`
  String get memberFullNameArabic {
    return Intl.message(
      'اسم العضو الكامل',
      name: 'memberFullNameArabic',
      desc: '',
      args: [],
    );
  }

  /// `Full Name (English)`
  String get fullNameEnglish {
    return Intl.message(
      'Full Name (English)',
      name: 'fullNameEnglish',
      desc: '',
      args: [],
    );
  }

  /// `Member Full Name`
  String get memberFullName {
    return Intl.message(
      'Member Full Name',
      name: 'memberFullName',
      desc: '',
      args: [],
    );
  }

  /// `Nationality`
  String get nationality {
    return Intl.message('Nationality', name: 'nationality', desc: '', args: []);
  }

  /// `Egyptian`
  String get egyptian {
    return Intl.message('Egyptian', name: 'egyptian', desc: '', args: []);
  }

  /// `Non-Egyptian`
  String get nonEgyptian {
    return Intl.message(
      'Non-Egyptian',
      name: 'nonEgyptian',
      desc: '',
      args: [],
    );
  }

  /// `National ID (CNID)`
  String get nationalIdCNID {
    return Intl.message(
      'National ID (CNID)',
      name: 'nationalIdCNID',
      desc: '',
      args: [],
    );
  }

  /// `14-digit National ID`
  String get nationalIdHint {
    return Intl.message(
      '14-digit National ID',
      name: 'nationalIdHint',
      desc: '',
      args: [],
    );
  }

  /// `DD/MM/YYYY`
  String get ddMmYyyy {
    return Intl.message('DD/MM/YYYY', name: 'ddMmYyyy', desc: '', args: []);
  }

  /// `Hiring Date`
  String get hiringDate {
    return Intl.message('Hiring Date', name: 'hiringDate', desc: '', args: []);
  }

  /// `Addition Date`
  String get additionDate {
    return Intl.message(
      'Addition Date',
      name: 'additionDate',
      desc: '',
      args: [],
    );
  }

  /// `Marital Status`
  String get maritalStatus {
    return Intl.message(
      'Marital Status',
      name: 'maritalStatus',
      desc: '',
      args: [],
    );
  }

  /// `Select Status`
  String get selectStatus {
    return Intl.message(
      'Select Status',
      name: 'selectStatus',
      desc: '',
      args: [],
    );
  }

  /// `Single`
  String get single {
    return Intl.message('Single', name: 'single', desc: '', args: []);
  }

  /// `Married`
  String get married {
    return Intl.message('Married', name: 'married', desc: '', args: []);
  }

  /// `Select Gender`
  String get selectGender {
    return Intl.message(
      'Select Gender',
      name: 'selectGender',
      desc: '',
      args: [],
    );
  }

  /// `member@example.com`
  String get emailHint {
    return Intl.message(
      'member@example.com',
      name: 'emailHint',
      desc: '',
      args: [],
    );
  }

  /// `Insurance Plans`
  String get insurancePlans {
    return Intl.message(
      'Insurance Plans',
      name: 'insurancePlans',
      desc: '',
      args: [],
    );
  }

  /// `Medical Insurance Plan`
  String get medicalInsurancePlan {
    return Intl.message(
      'Medical Insurance Plan',
      name: 'medicalInsurancePlan',
      desc: '',
      args: [],
    );
  }

  /// `Life Insurance Plan`
  String get lifeInsurancePlan {
    return Intl.message(
      'Life Insurance Plan',
      name: 'lifeInsurancePlan',
      desc: '',
      args: [],
    );
  }

  /// `Dental Insurance Plan`
  String get dentalInsurancePlan {
    return Intl.message(
      'Dental Insurance Plan',
      name: 'dentalInsurancePlan',
      desc: '',
      args: [],
    );
  }

  /// `Vision Care Plan`
  String get visionCarePlan {
    return Intl.message(
      'Vision Care Plan',
      name: 'visionCarePlan',
      desc: '',
      args: [],
    );
  }

  /// `Select Medical Insurance Plan`
  String get selectPlan {
    return Intl.message(
      'Select Medical Insurance Plan',
      name: 'selectPlan',
      desc: '',
      args: [],
    );
  }

  /// `Premium Plan`
  String get premiumPlan {
    return Intl.message(
      'Premium Plan',
      name: 'premiumPlan',
      desc: '',
      args: [],
    );
  }

  /// `Standard Plan`
  String get standardPlan {
    return Intl.message(
      'Standard Plan',
      name: 'standardPlan',
      desc: '',
      args: [],
    );
  }

  /// `Salary (Conditional)`
  String get salaryConditional {
    return Intl.message(
      'Salary (Conditional)',
      name: 'salaryConditional',
      desc: '',
      args: [],
    );
  }

  /// `Monthly Salary`
  String get monthlySalary {
    return Intl.message(
      'Monthly Salary',
      name: 'monthlySalary',
      desc: '',
      args: [],
    );
  }

  /// `IBAN (Conditional)`
  String get ibanConditional {
    return Intl.message(
      'IBAN (Conditional)',
      name: 'ibanConditional',
      desc: '',
      args: [],
    );
  }

  /// `EG38...`
  String get ibanHint {
    return Intl.message('EG38...', name: 'ibanHint', desc: '', args: []);
  }

  /// `Full Address`
  String get fullAddress {
    return Intl.message(
      'Full Address',
      name: 'fullAddress',
      desc: '',
      args: [],
    );
  }

  /// `Photo Upload`
  String get photoUpload {
    return Intl.message(
      'Photo Upload',
      name: 'photoUpload',
      desc: '',
      args: [],
    );
  }

  /// `Automatically renamed with Staff Number`
  String get automaticallyRenamedWithStaffNumber {
    return Intl.message(
      'Automatically renamed with Staff Number',
      name: 'automaticallyRenamedWithStaffNumber',
      desc: '',
      args: [],
    );
  }

  /// `Acknowledgment Statement`
  String get acknowledgmentStatement {
    return Intl.message(
      'Acknowledgment Statement',
      name: 'acknowledgmentStatement',
      desc: '',
      args: [],
    );
  }

  /// `Upload signed acknowledgment document (PDF, Image, or Word)`
  String get uploadSignedAcknowledgment {
    return Intl.message(
      'Upload signed acknowledgment document (PDF, Image, or Word)',
      name: 'uploadSignedAcknowledgment',
      desc: '',
      args: [],
    );
  }

  /// `Staff Number (ID)`
  String get staffNumberId {
    return Intl.message(
      'Staff Number (ID)',
      name: 'staffNumberId',
      desc: '',
      args: [],
    );
  }

  /// `Employee Staff Number`
  String get employeeStaffNumber {
    return Intl.message(
      'Employee Staff Number',
      name: 'employeeStaffNumber',
      desc: '',
      args: [],
    );
  }

  /// `Choose File`
  String get chooseFile {
    return Intl.message('Choose File', name: 'chooseFile', desc: '', args: []);
  }

  /// `No file chosen`
  String get noFileChosen {
    return Intl.message(
      'No file chosen',
      name: 'noFileChosen',
      desc: '',
      args: [],
    );
  }

  /// `Upload your filled template and supporting documents`
  String get uploadYourFilledTemplate {
    return Intl.message(
      'Upload your filled template and supporting documents',
      name: 'uploadYourFilledTemplate',
      desc: '',
      args: [],
    );
  }

  /// `Guidelines of Addition and Deletion for Insurance Company`
  String get guidelinesOfAdditionAndDeletion {
    return Intl.message(
      'Guidelines of Addition and Deletion for Insurance Company',
      name: 'guidelinesOfAdditionAndDeletion',
      desc: '',
      args: [],
    );
  }

  /// `Step 1: Download Template`
  String get step1DownloadTemplate {
    return Intl.message(
      'Step 1: Download Template',
      name: 'step1DownloadTemplate',
      desc: '',
      args: [],
    );
  }

  /// `Download the Excel template and fill it with member information`
  String get downloadExcelTemplate {
    return Intl.message(
      'Download the Excel template and fill it with member information',
      name: 'downloadExcelTemplate',
      desc: '',
      args: [],
    );
  }

  /// `Download Template`
  String get downloadTemplate {
    return Intl.message(
      'Download Template',
      name: 'downloadTemplate',
      desc: '',
      args: [],
    );
  }

  /// `Step 2: Upload Filled Template`
  String get step2UploadFilledTemplate {
    return Intl.message(
      'Step 2: Upload Filled Template',
      name: 'step2UploadFilledTemplate',
      desc: '',
      args: [],
    );
  }

  /// `Upload your completed Excel template`
  String get uploadYourCompletedExcelTemplate {
    return Intl.message(
      'Upload your completed Excel template',
      name: 'uploadYourCompletedExcelTemplate',
      desc: '',
      args: [],
    );
  }

  /// `Upload Excel Template`
  String get uploadExcelTemplate {
    return Intl.message(
      'Upload Excel Template',
      name: 'uploadExcelTemplate',
      desc: '',
      args: [],
    );
  }

  /// `Click to select your filled template`
  String get clickToSelectYourFilledTemplate {
    return Intl.message(
      'Click to select your filled template',
      name: 'clickToSelectYourFilledTemplate',
      desc: '',
      args: [],
    );
  }

  /// `Accepted formats: .xlsx, .xls`
  String get acceptedFormatsXlsx {
    return Intl.message(
      'Accepted formats: .xlsx, .xls',
      name: 'acceptedFormatsXlsx',
      desc: '',
      args: [],
    );
  }

  /// `Step 3: Upload Member Photos`
  String get step3UploadMemberPhotos {
    return Intl.message(
      'Step 3: Upload Member Photos',
      name: 'step3UploadMemberPhotos',
      desc: '',
      args: [],
    );
  }

  /// `Upload photos for all members in the template`
  String get uploadPhotosForAllMembers {
    return Intl.message(
      'Upload photos for all members in the template',
      name: 'uploadPhotosForAllMembers',
      desc: '',
      args: [],
    );
  }

  /// `IMPORTANT NAMING CONVENTION:`
  String get importantNamingConvention {
    return Intl.message(
      'IMPORTANT NAMING CONVENTION:',
      name: 'importantNamingConvention',
      desc: '',
      args: [],
    );
  }

  /// `• Photos must be named with Staff ID`
  String get photosMustBeNamedWithStaffId {
    return Intl.message(
      '• Photos must be named with Staff ID',
      name: 'photosMustBeNamedWithStaffId',
      desc: '',
      args: [],
    );
  }

  /// `• Format:  `
  String get formatStaffIdJpg {
    return Intl.message(
      '• Format:  ',
      name: 'formatStaffIdJpg',
      desc: '',
      args: [],
    );
  }

  /// `[StaffID].jpg`
  String get staffIdJpgFormat {
    return Intl.message(
      '[StaffID].jpg',
      name: 'staffIdJpgFormat',
      desc: '',
      args: [],
    );
  }

  /// `  or  `
  String get orLabel {
    return Intl.message('  or  ', name: 'orLabel', desc: '', args: []);
  }

  /// `[StaffID].png`
  String get staffIdPngFormat {
    return Intl.message(
      '[StaffID].png',
      name: 'staffIdPngFormat',
      desc: '',
      args: [],
    );
  }

  /// `• Example:  `
  String get exampleLabel {
    return Intl.message(
      '• Example:  ',
      name: 'exampleLabel',
      desc: '',
      args: [],
    );
  }

  /// `Upload Member Photos`
  String get uploadMemberPhotos {
    return Intl.message(
      'Upload Member Photos',
      name: 'uploadMemberPhotos',
      desc: '',
      args: [],
    );
  }

  /// `Click to select multiple photos or drag and drop`
  String get clickToSelectMultiplePhotos {
    return Intl.message(
      'Click to select multiple photos or drag and drop',
      name: 'clickToSelectMultiplePhotos',
      desc: '',
      args: [],
    );
  }

  /// `Accepted formats: JPG, PNG | Max size: 5MB per photo`
  String get acceptedFormatsJpgPng {
    return Intl.message(
      'Accepted formats: JPG, PNG | Max size: 5MB per photo',
      name: 'acceptedFormatsJpgPng',
      desc: '',
      args: [],
    );
  }

  /// `{count} photo(s) selected`
  String photosSelected(Object count) {
    return Intl.message(
      '$count photo(s) selected',
      name: 'photosSelected',
      desc: '',
      args: [count],
    );
  }

  /// `Step 4: Upload Supporting Documents`
  String get step4UploadSupportingDocuments {
    return Intl.message(
      'Step 4: Upload Supporting Documents',
      name: 'step4UploadSupportingDocuments',
      desc: '',
      args: [],
    );
  }

  /// `Upload documents for family members (birth certificates, marriage certificates, etc.)`
  String get uploadDocumentsForFamilyMembers {
    return Intl.message(
      'Upload documents for family members (birth certificates, marriage certificates, etc.)',
      name: 'uploadDocumentsForFamilyMembers',
      desc: '',
      args: [],
    );
  }

  /// `• Documents must be named with Staff ID`
  String get documentsMustBeNamedWithStaffId {
    return Intl.message(
      '• Documents must be named with Staff ID',
      name: 'documentsMustBeNamedWithStaffId',
      desc: '',
      args: [],
    );
  }

  /// `[StaffID]_[DocumentType].pdf`
  String get formatStaffIdDocumentType {
    return Intl.message(
      '[StaffID]_[DocumentType].pdf',
      name: 'formatStaffIdDocumentType',
      desc: '',
      args: [],
    );
  }

  /// `• Examples:`
  String get examples {
    return Intl.message('• Examples:', name: 'examples', desc: '', args: []);
  }

  /// `Upload Supporting Documents`
  String get uploadSupportingDocuments {
    return Intl.message(
      'Upload Supporting Documents',
      name: 'uploadSupportingDocuments',
      desc: '',
      args: [],
    );
  }

  /// `Click to select multiple documents or drag and drop`
  String get clickToSelectMultipleDocuments {
    return Intl.message(
      'Click to select multiple documents or drag and drop',
      name: 'clickToSelectMultipleDocuments',
      desc: '',
      args: [],
    );
  }

  /// `Accepted formats: PDF, JPG, PNG | Max size: 10MB per file`
  String get acceptedFormatsPdfJpgPng {
    return Intl.message(
      'Accepted formats: PDF, JPG, PNG | Max size: 10MB per file',
      name: 'acceptedFormatsPdfJpgPng',
      desc: '',
      args: [],
    );
  }

  /// `{count} document(s) selected`
  String documentsSelected(Object count) {
    return Intl.message(
      '$count document(s) selected',
      name: 'documentsSelected',
      desc: '',
      args: [count],
    );
  }

  /// `Step 5: Foreign Employee Acknowledgement`
  String get step5ForeignEmployeeAcknowledgement {
    return Intl.message(
      'Step 5: Foreign Employee Acknowledgement',
      name: 'step5ForeignEmployeeAcknowledgement',
      desc: '',
      args: [],
    );
  }

  /// `Required if template includes foreign employees`
  String get requiredIfTemplateIncludesForeignEmployees {
    return Intl.message(
      'Required if template includes foreign employees',
      name: 'requiredIfTemplateIncludesForeignEmployees',
      desc: '',
      args: [],
    );
  }

  /// `Required for Foreign Employees:`
  String get requiredForForeignEmployees {
    return Intl.message(
      'Required for Foreign Employees:',
      name: 'requiredForForeignEmployees',
      desc: '',
      args: [],
    );
  }

  /// `If your template includes `
  String get ifYourTemplateIncludesForeignEmployees {
    return Intl.message(
      'If your template includes ',
      name: 'ifYourTemplateIncludesForeignEmployees',
      desc: '',
      args: [],
    );
  }

  /// `foreign employees`
  String get foreignEmployees {
    return Intl.message(
      'foreign employees',
      name: 'foreignEmployees',
      desc: '',
      args: [],
    );
  }

  /// `, you must upload a signed acknowledgement confirming their current employment status.`
  String get youMustUploadSignedAcknowledgement {
    return Intl.message(
      ', you must upload a signed acknowledgement confirming their current employment status.',
      name: 'youMustUploadSignedAcknowledgement',
      desc: '',
      args: [],
    );
  }

  /// `Download Foreign Employee Acknowledgement Template`
  String get downloadForeignEmployeeAcknowledgementTemplate {
    return Intl.message(
      'Download Foreign Employee Acknowledgement Template',
      name: 'downloadForeignEmployeeAcknowledgementTemplate',
      desc: '',
      args: [],
    );
  }

  /// `Upload Signed Acknowledgement`
  String get uploadSignedAcknowledgement {
    return Intl.message(
      'Upload Signed Acknowledgement',
      name: 'uploadSignedAcknowledgement',
      desc: '',
      args: [],
    );
  }

  /// `Required if adding foreign employees | Click to select or drag and drop`
  String get requiredIfAddingForeignEmployees {
    return Intl.message(
      'Required if adding foreign employees | Click to select or drag and drop',
      name: 'requiredIfAddingForeignEmployees',
      desc: '',
      args: [],
    );
  }

  /// `Accepted formats: PDF, JPG, PNG | Max size: 10MB`
  String get acceptedFormatsPdfJpgPngMaxSize {
    return Intl.message(
      'Accepted formats: PDF, JPG, PNG | Max size: 10MB',
      name: 'acceptedFormatsPdfJpgPngMaxSize',
      desc: '',
      args: [],
    );
  }

  /// `Send Request`
  String get sendRequest {
    return Intl.message(
      'Send Request',
      name: 'sendRequest',
      desc: '',
      args: [],
    );
  }

  /// `Please upload the filled Excel template`
  String get pleaseUploadTheFilledExcelTemplate {
    return Intl.message(
      'Please upload the filled Excel template',
      name: 'pleaseUploadTheFilledExcelTemplate',
      desc: '',
      args: [],
    );
  }

  /// `Monitor and track all your addition and deletion requests`
  String get monitorAllYourAdditionDeletionRequests {
    return Intl.message(
      'Monitor and track all your addition and deletion requests',
      name: 'monitorAllYourAdditionDeletionRequests',
      desc: '',
      args: [],
    );
  }

  /// `SUBMITTED REQUESTS`
  String get submittedRequests {
    return Intl.message(
      'SUBMITTED REQUESTS',
      name: 'submittedRequests',
      desc: '',
      args: [],
    );
  }

  /// `PENDING REVIEW`
  String get pendingReview {
    return Intl.message(
      'PENDING REVIEW',
      name: 'pendingReview',
      desc: '',
      args: [],
    );
  }

  /// `WAITING FOR HR`
  String get waitingForHR {
    return Intl.message(
      'WAITING FOR HR',
      name: 'waitingForHR',
      desc: '',
      args: [],
    );
  }

  /// `Search Requests`
  String get searchRequests {
    return Intl.message(
      'Search Requests',
      name: 'searchRequests',
      desc: '',
      args: [],
    );
  }

  /// `Request Number`
  String get requestNumber {
    return Intl.message(
      'Request Number',
      name: 'requestNumber',
      desc: '',
      args: [],
    );
  }

  /// `Member Name`
  String get memberName {
    return Intl.message('Member Name', name: 'memberName', desc: '', args: []);
  }

  /// `Showing: `
  String get showingLabel {
    return Intl.message('Showing: ', name: 'showingLabel', desc: '', args: []);
  }

  /// `{count} Submitted Requests`
  String submittedRequestsCount(Object count) {
    return Intl.message(
      '$count Submitted Requests',
      name: 'submittedRequestsCount',
      desc: '',
      args: [count],
    );
  }

  /// `Last Updated: `
  String get lastUpdatedLabel {
    return Intl.message(
      'Last Updated: ',
      name: 'lastUpdatedLabel',
      desc: '',
      args: [],
    );
  }

  /// `Request History`
  String get requestHistory {
    return Intl.message(
      'Request History',
      name: 'requestHistory',
      desc: '',
      args: [],
    );
  }

  /// `Back to Dashboard`
  String get backToDashboard {
    return Intl.message(
      'Back to Dashboard',
      name: 'backToDashboard',
      desc: '',
      args: [],
    );
  }

  /// `Addition Request`
  String get additionRequest {
    return Intl.message(
      'Addition Request',
      name: 'additionRequest',
      desc: '',
      args: [],
    );
  }

  /// `Waiting HR`
  String get waitingHR {
    return Intl.message('Waiting HR', name: 'waitingHR', desc: '', args: []);
  }

  /// `Action Required`
  String get actionRequired {
    return Intl.message(
      'Action Required',
      name: 'actionRequired',
      desc: '',
      args: [],
    );
  }

  /// `Reason: `
  String get reasonLabel {
    return Intl.message('Reason: ', name: 'reasonLabel', desc: '', args: []);
  }

  /// `What to do: `
  String get whatToDo {
    return Intl.message('What to do: ', name: 'whatToDo', desc: '', args: []);
  }

  /// `SUBMISSION D...`
  String get submissionDateLabel {
    return Intl.message(
      'SUBMISSION D...',
      name: 'submissionDateLabel',
      desc: '',
      args: [],
    );
  }

  /// `POLICIES AFFE...`
  String get policiesAffectedLabel {
    return Intl.message(
      'POLICIES AFFE...',
      name: 'policiesAffectedLabel',
      desc: '',
      args: [],
    );
  }

  /// `MEMBERS COU...`
  String get membersCountLabel {
    return Intl.message(
      'MEMBERS COU...',
      name: 'membersCountLabel',
      desc: '',
      args: [],
    );
  }

  /// `WAITING SINCE`
  String get waitingSince {
    return Intl.message(
      'WAITING SINCE',
      name: 'waitingSince',
      desc: '',
      args: [],
    );
  }

  /// `View Details`
  String get viewDetails {
    return Intl.message(
      'View Details',
      name: 'viewDetails',
      desc: '',
      args: [],
    );
  }

  /// `Download Excel Report`
  String get downloadExcelReport {
    return Intl.message(
      'Download Excel Report',
      name: 'downloadExcelReport',
      desc: '',
      args: [],
    );
  }

  /// `Contact Support`
  String get contactSupport {
    return Intl.message(
      'Contact Support',
      name: 'contactSupport',
      desc: '',
      args: [],
    );
  }

  /// `Select Members to Delete`
  String get selectMembersToDelete {
    return Intl.message(
      'Select Members to Delete',
      name: 'selectMembersToDelete',
      desc: '',
      args: [],
    );
  }

  /// `Search and select members - families will be auto-selected`
  String get searchAndSelectMembers {
    return Intl.message(
      'Search and select members - families will be auto-selected',
      name: 'searchAndSelectMembers',
      desc: '',
      args: [],
    );
  }

  /// `View Deletion Guidelines for Selected Insurance`
  String get viewDeletionGuidelines {
    return Intl.message(
      'View Deletion Guidelines for Selected Insurance',
      name: 'viewDeletionGuidelines',
      desc: '',
      args: [],
    );
  }

  /// `Important: `
  String get importantLabel {
    return Intl.message(
      'Important: ',
      name: 'importantLabel',
      desc: '',
      args: [],
    );
  }

  /// `Selecting a principal member will automatically select all their family members. They must be deleted together as a family unit.`
  String get selectingPrincipalMemberAutoSelects {
    return Intl.message(
      'Selecting a principal member will automatically select all their family members. They must be deleted together as a family unit.',
      name: 'selectingPrincipalMemberAutoSelects',
      desc: '',
      args: [],
    );
  }

  /// `Search Active Members`
  String get searchActiveMembers {
    return Intl.message(
      'Search Active Members',
      name: 'searchActiveMembers',
      desc: '',
      args: [],
    );
  }

  /// `National ID (CNID)`
  String get nationalIdCnid {
    return Intl.message(
      'National ID (CNID)',
      name: 'nationalIdCnid',
      desc: '',
      args: [],
    );
  }

  /// `Selected: {count} Members`
  String selectedMembers(Object count) {
    return Intl.message(
      'Selected: $count Members',
      name: 'selectedMembers',
      desc: '',
      args: [count],
    );
  }

  /// `Principal`
  String get principal {
    return Intl.message('Principal', name: 'principal', desc: '', args: []);
  }

  /// `Staff ID:`
  String get staffIdLabel {
    return Intl.message('Staff ID:', name: 'staffIdLabel', desc: '', args: []);
  }

  /// `National ID:`
  String get nationalIdLabel {
    return Intl.message(
      'National ID:',
      name: 'nationalIdLabel',
      desc: '',
      args: [],
    );
  }

  /// `Nationality:`
  String get nationalityLabel {
    return Intl.message(
      'Nationality:',
      name: 'nationalityLabel',
      desc: '',
      args: [],
    );
  }

  /// `Card Number: {number}`
  String cardNumber(Object number) {
    return Intl.message(
      'Card Number: $number',
      name: 'cardNumber',
      desc: '',
      args: [number],
    );
  }

  /// `Has {count} family members - will be auto-selected`
  String hasFamilyMembersAutoSelected(Object count) {
    return Intl.message(
      'Has $count family members - will be auto-selected',
      name: 'hasFamilyMembersAutoSelected',
      desc: '',
      args: [count],
    );
  }

  /// `Template Validation Guidelines`
  String get templateValidationGuidelines {
    return Intl.message(
      'Template Validation Guidelines',
      name: 'templateValidationGuidelines',
      desc: '',
      args: [],
    );
  }

  /// `Addition and Deletion for Insurance Company`
  String get additionAndDeletionForInsuranceCompany {
    return Intl.message(
      'Addition and Deletion for Insurance Company',
      name: 'additionAndDeletionForInsuranceCompany',
      desc: '',
      args: [],
    );
  }

  /// `Important Notice`
  String get importantNotice {
    return Intl.message(
      'Important Notice',
      name: 'importantNotice',
      desc: '',
      args: [],
    );
  }

  /// `Please ensure all data complies with these guidelines before submitting your template to avoid delays or rejections.`
  String get ensureAllDataComplies {
    return Intl.message(
      'Please ensure all data complies with these guidelines before submitting your template to avoid delays or rejections.',
      name: 'ensureAllDataComplies',
      desc: '',
      args: [],
    );
  }

  /// `General Requirements`
  String get generalRequirements {
    return Intl.message(
      'General Requirements',
      name: 'generalRequirements',
      desc: '',
      args: [],
    );
  }

  /// `Template Format:`
  String get templateFormat {
    return Intl.message(
      'Template Format:',
      name: 'templateFormat',
      desc: '',
      args: [],
    );
  }

  /// `Use only the official Excel template provided (.xlsx or .xls)`
  String get useOnlyOfficialExcelTemplate {
    return Intl.message(
      'Use only the official Excel template provided (.xlsx or .xls)',
      name: 'useOnlyOfficialExcelTemplate',
      desc: '',
      args: [],
    );
  }

  /// `Required Fields:`
  String get requiredFields {
    return Intl.message(
      'Required Fields:',
      name: 'requiredFields',
      desc: '',
      args: [],
    );
  }

  /// `All fields marked with asterisk (*) must be filled`
  String get allFieldsMarkedWithAsterisk {
    return Intl.message(
      'All fields marked with asterisk (*) must be filled',
      name: 'allFieldsMarkedWithAsterisk',
      desc: '',
      args: [],
    );
  }

  /// `Data Accuracy:`
  String get dataAccuracy {
    return Intl.message(
      'Data Accuracy:',
      name: 'dataAccuracy',
      desc: '',
      args: [],
    );
  }

  /// `Verify all information for accuracy before submission`
  String get verifyAllInformationForAccuracy {
    return Intl.message(
      'Verify all information for accuracy before submission',
      name: 'verifyAllInformationForAccuracy',
      desc: '',
      args: [],
    );
  }

  /// `File Size:`
  String get fileSize {
    return Intl.message('File Size:', name: 'fileSize', desc: '', args: []);
  }

  /// `Maximum template size is 10MB`
  String get maximumTemplateSizeIs10MB {
    return Intl.message(
      'Maximum template size is 10MB',
      name: 'maximumTemplateSizeIs10MB',
      desc: '',
      args: [],
    );
  }

  /// `Character Encoding:`
  String get characterEncoding {
    return Intl.message(
      'Character Encoding:',
      name: 'characterEncoding',
      desc: '',
      args: [],
    );
  }

  /// `Use UTF-8 encoding for Arabic text`
  String get useUTF8EncodingForArabicText {
    return Intl.message(
      'Use UTF-8 encoding for Arabic text',
      name: 'useUTF8EncodingForArabicText',
      desc: '',
      args: [],
    );
  }

  /// `Addition Guidelines`
  String get additionGuidelines {
    return Intl.message(
      'Addition Guidelines',
      name: 'additionGuidelines',
      desc: '',
      args: [],
    );
  }

  /// `Must be unique and not exist in the system`
  String get staffIdMustBeUnique {
    return Intl.message(
      'Must be unique and not exist in the system',
      name: 'staffIdMustBeUnique',
      desc: '',
      args: [],
    );
  }

  /// `Must be 14 digits for Egyptian nationals`
  String get nationalIdMustBe14Digits {
    return Intl.message(
      'Must be 14 digits for Egyptian nationals',
      name: 'nationalIdMustBe14Digits',
      desc: '',
      args: [],
    );
  }

  /// `Format must be DD/MM/YYYY`
  String get dateOfBirthFormatDDMMYYYY {
    return Intl.message(
      'Format must be DD/MM/YYYY',
      name: 'dateOfBirthFormatDDMMYYYY',
      desc: '',
      args: [],
    );
  }

  /// `Must start with 01 and be 11 digits`
  String get phoneNumbersMustStart01 {
    return Intl.message(
      'Must start with 01 and be 11 digits',
      name: 'phoneNumbersMustStart01',
      desc: '',
      args: [],
    );
  }

  /// `Must be valid company or personal email`
  String get emailMustBeValid {
    return Intl.message(
      'Must be valid company or personal email',
      name: 'emailMustBeValid',
      desc: '',
      args: [],
    );
  }

  /// `File naming must match Staff ID (e.g., 123456.jpg)`
  String get photosFileNaming {
    return Intl.message(
      'File naming must match Staff ID (e.g., 123456.jpg)',
      name: 'photosFileNaming',
      desc: '',
      args: [],
    );
  }

  /// `Maximum Members:`
  String get maximumMembers {
    return Intl.message(
      'Maximum Members:',
      name: 'maximumMembers',
      desc: '',
      args: [],
    );
  }

  /// `Up to 100 members per template submission`
  String get upTo100MembersPerTemplate {
    return Intl.message(
      'Up to 100 members per template submission',
      name: 'upTo100MembersPerTemplate',
      desc: '',
      args: [],
    );
  }

  /// `Deletion Guidelines`
  String get deletionGuidelines {
    return Intl.message(
      'Deletion Guidelines',
      name: 'deletionGuidelines',
      desc: '',
      args: [],
    );
  }

  /// `Member Verification:`
  String get memberVerification {
    return Intl.message(
      'Member Verification:',
      name: 'memberVerification',
      desc: '',
      args: [],
    );
  }

  /// `Members must exist in the Active List`
  String get membersMustExistInActiveList {
    return Intl.message(
      'Members must exist in the Active List',
      name: 'membersMustExistInActiveList',
      desc: '',
      args: [],
    );
  }

  /// `Deletion Reason:`
  String get deletionReason {
    return Intl.message(
      'Deletion Reason:',
      name: 'deletionReason',
      desc: '',
      args: [],
    );
  }

  /// `Must provide valid reason for deletion`
  String get mustProvideValidReasonForDeletion {
    return Intl.message(
      'Must provide valid reason for deletion',
      name: 'mustProvideValidReasonForDeletion',
      desc: '',
      args: [],
    );
  }

  /// `Effective Date:`
  String get effectiveDate {
    return Intl.message(
      'Effective Date:',
      name: 'effectiveDate',
      desc: '',
      args: [],
    );
  }

  /// `Specify when deletion should take effect`
  String get specifyWhenDeletionShouldTakeEffect {
    return Intl.message(
      'Specify when deletion should take effect',
      name: 'specifyWhenDeletionShouldTakeEffect',
      desc: '',
      args: [],
    );
  }

  /// `Dependent Warning:`
  String get dependentWarning {
    return Intl.message(
      'Dependent Warning:',
      name: 'dependentWarning',
      desc: '',
      args: [],
    );
  }

  /// `Deleting principal automatically removes all dependents`
  String get deletingPrincipalAutomaticallyRemoves {
    return Intl.message(
      'Deleting principal automatically removes all dependents',
      name: 'deletingPrincipalAutomaticallyRemoves',
      desc: '',
      args: [],
    );
  }

  /// `Photo Requirements`
  String get photoRequirements {
    return Intl.message(
      'Photo Requirements',
      name: 'photoRequirements',
      desc: '',
      args: [],
    );
  }

  /// `Format:`
  String get format {
    return Intl.message('Format:', name: 'format', desc: '', args: []);
  }

  /// `JPG or PNG only`
  String get jpgOrPngOnly {
    return Intl.message(
      'JPG or PNG only',
      name: 'jpgOrPngOnly',
      desc: '',
      args: [],
    );
  }

  /// `Size:`
  String get size {
    return Intl.message('Size:', name: 'size', desc: '', args: []);
  }

  /// `Maximum 5MB per photo`
  String get maximum5MBPerPhoto {
    return Intl.message(
      'Maximum 5MB per photo',
      name: 'maximum5MBPerPhoto',
      desc: '',
      args: [],
    );
  }

  /// `Resolution:`
  String get resolution {
    return Intl.message('Resolution:', name: 'resolution', desc: '', args: []);
  }

  /// `Minimum 300x300 pixels, recommended 600x600`
  String get minimum300x300Pixels {
    return Intl.message(
      'Minimum 300x300 pixels, recommended 600x600',
      name: 'minimum300x300Pixels',
      desc: '',
      args: [],
    );
  }

  /// `Background:`
  String get background {
    return Intl.message('Background:', name: 'background', desc: '', args: []);
  }

  /// `White or light-colored background preferred`
  String get whiteOrLightColoredBackground {
    return Intl.message(
      'White or light-colored background preferred',
      name: 'whiteOrLightColoredBackground',
      desc: '',
      args: [],
    );
  }

  /// `Naming Convention:`
  String get namingConvention {
    return Intl.message(
      'Naming Convention:',
      name: 'namingConvention',
      desc: '',
      args: [],
    );
  }

  /// `[StaffID].jpg or [StaffID].png`
  String get staffIdJpgOrStaffIdPng {
    return Intl.message(
      '[StaffID].jpg or [StaffID].png',
      name: 'staffIdJpgOrStaffIdPng',
      desc: '',
      args: [],
    );
  }

  /// `Photo Quality:`
  String get photoQuality {
    return Intl.message(
      'Photo Quality:',
      name: 'photoQuality',
      desc: '',
      args: [],
    );
  }

  /// `Clear, recent photo (not older than 6 months)`
  String get clearRecentPhoto {
    return Intl.message(
      'Clear, recent photo (not older than 6 months)',
      name: 'clearRecentPhoto',
      desc: '',
      args: [],
    );
  }

  /// `Document Requirements`
  String get documentRequirements {
    return Intl.message(
      'Document Requirements',
      name: 'documentRequirements',
      desc: '',
      args: [],
    );
  }

  /// `PDF, JPG, or PNG accepted`
  String get pdfJpgPngAccepted {
    return Intl.message(
      'PDF, JPG, or PNG accepted',
      name: 'pdfJpgPngAccepted',
      desc: '',
      args: [],
    );
  }

  /// `Maximum 10MB per document`
  String get maximum10MBPerDocument {
    return Intl.message(
      'Maximum 10MB per document',
      name: 'maximum10MBPerDocument',
      desc: '',
      args: [],
    );
  }

  /// `Naming:`
  String get naming {
    return Intl.message('Naming:', name: 'naming', desc: '', args: []);
  }

  /// `[StaffID]_[DocumentType].pdf (e.g., 123456_BirthCertificate.pdf)`
  String get staffIdDocumentTypePdf {
    return Intl.message(
      '[StaffID]_[DocumentType].pdf (e.g., 123456_BirthCertificate.pdf)',
      name: 'staffIdDocumentTypePdf',
      desc: '',
      args: [],
    );
  }

  /// `Required Documents:`
  String get requiredDocuments {
    return Intl.message(
      'Required Documents:',
      name: 'requiredDocuments',
      desc: '',
      args: [],
    );
  }

  /// `Birth certificates for children, marriage certificates for spouse`
  String get birthCertificatesForChildren {
    return Intl.message(
      'Birth certificates for children, marriage certificates for spouse',
      name: 'birthCertificatesForChildren',
      desc: '',
      args: [],
    );
  }

  /// `Legibility:`
  String get legibility {
    return Intl.message('Legibility:', name: 'legibility', desc: '', args: []);
  }

  /// `All documents must be clear and readable`
  String get allDocumentsMustBeClear {
    return Intl.message(
      'All documents must be clear and readable',
      name: 'allDocumentsMustBeClear',
      desc: '',
      args: [],
    );
  }

  /// `Arabic or English documents accepted`
  String get arabicOrEnglishDocuments {
    return Intl.message(
      'Arabic or English documents accepted',
      name: 'arabicOrEnglishDocuments',
      desc: '',
      args: [],
    );
  }

  /// `Validation Process`
  String get validationProcess {
    return Intl.message(
      'Validation Process',
      name: 'validationProcess',
      desc: '',
      args: [],
    );
  }

  /// `Once submitted, your template will be automatically validated against these guidelines. Any errors or missing information will be flagged, and you will be notified within 24 hours. Properly formatted submissions are processed faster.`
  String get onceSubmittedYourTemplate {
    return Intl.message(
      'Once submitted, your template will be automatically validated against these guidelines. Any errors or missing information will be flagged, and you will be notified within 24 hours. Properly formatted submissions are processed faster.',
      name: 'onceSubmittedYourTemplate',
      desc: '',
      args: [],
    );
  }

  /// `Close Guidelines`
  String get closeGuidelines {
    return Intl.message(
      'Close Guidelines',
      name: 'closeGuidelines',
      desc: '',
      args: [],
    );
  }

  /// `Deletion Guidelines`
  String get deletionGuidelinesTitle {
    return Intl.message(
      'Deletion Guidelines',
      name: 'deletionGuidelinesTitle',
      desc: '',
      args: [],
    );
  }

  /// `For Selected Insurance Policies`
  String get forSelectedInsurancePolicies {
    return Intl.message(
      'For Selected Insurance Policies',
      name: 'forSelectedInsurancePolicies',
      desc: '',
      args: [],
    );
  }

  /// `Deleting a principal member will automatically remove all associated family members. This action cannot be undone.`
  String get deletingPrincipalMemberWillAutomatically {
    return Intl.message(
      'Deleting a principal member will automatically remove all associated family members. This action cannot be undone.',
      name: 'deletingPrincipalMemberWillAutomatically',
      desc: '',
      args: [],
    );
  }

  /// `Deletion Requirements`
  String get deletionRequirements {
    return Intl.message(
      'Deletion Requirements',
      name: 'deletionRequirements',
      desc: '',
      args: [],
    );
  }

  /// `Members must exist in the Active List and have a valid active status`
  String get membersMustExistInActiveListAndValid {
    return Intl.message(
      'Members must exist in the Active List and have a valid active status',
      name: 'membersMustExistInActiveListAndValid',
      desc: '',
      args: [],
    );
  }

  /// `Must provide a valid reason for deletion (e.g., termination, retirement, voluntary withdrawal)`
  String get mustProvideValidReasonForDeletionDesc {
    return Intl.message(
      'Must provide a valid reason for deletion (e.g., termination, retirement, voluntary withdrawal)',
      name: 'mustProvideValidReasonForDeletionDesc',
      desc: '',
      args: [],
    );
  }

  /// `Specify when deletion should take effect. Cannot be in the past`
  String get specifyWhenDeletionShouldTakeEffectDesc {
    return Intl.message(
      'Specify when deletion should take effect. Cannot be in the past',
      name: 'specifyWhenDeletionShouldTakeEffectDesc',
      desc: '',
      args: [],
    );
  }

  /// `Family Unit Warning:`
  String get familyUnitWarning {
    return Intl.message(
      'Family Unit Warning:',
      name: 'familyUnitWarning',
      desc: '',
      args: [],
    );
  }

  /// `Deleting principal automatically removes all dependents (spouse, children)`
  String get deletingPrincipalAutomaticallyRemovesDesc {
    return Intl.message(
      'Deleting principal automatically removes all dependents (spouse, children)',
      name: 'deletingPrincipalAutomaticallyRemovesDesc',
      desc: '',
      args: [],
    );
  }

  /// `Policy Coverage:`
  String get policyCoverage {
    return Intl.message(
      'Policy Coverage:',
      name: 'policyCoverage',
      desc: '',
      args: [],
    );
  }

  /// `Member must have completed the minimum coverage period as per policy terms`
  String get memberMustHaveCompletedMinimumCoverage {
    return Intl.message(
      'Member must have completed the minimum coverage period as per policy terms',
      name: 'memberMustHaveCompletedMinimumCoverage',
      desc: '',
      args: [],
    );
  }

  /// `Deletion Process`
  String get deletionProcess {
    return Intl.message(
      'Deletion Process',
      name: 'deletionProcess',
      desc: '',
      args: [],
    );
  }

  /// `Search and select members from Active List`
  String get step1SearchAndSelectMembers {
    return Intl.message(
      'Search and select members from Active List',
      name: 'step1SearchAndSelectMembers',
      desc: '',
      args: [],
    );
  }

  /// `System auto-selects all family members for principal`
  String get step2SystemAutoSelectsFamilyMembers {
    return Intl.message(
      'System auto-selects all family members for principal',
      name: 'step2SystemAutoSelectsFamilyMembers',
      desc: '',
      args: [],
    );
  }

  /// `Provide deletion reason and effective date`
  String get step3ProvideDeletionReason {
    return Intl.message(
      'Provide deletion reason and effective date',
      name: 'step3ProvideDeletionReason',
      desc: '',
      args: [],
    );
  }

  /// `Submit deletion request for approval`
  String get step4SubmitDeletionRequest {
    return Intl.message(
      'Submit deletion request for approval',
      name: 'step4SubmitDeletionRequest',
      desc: '',
      args: [],
    );
  }

  /// `Insurance company processes and confirms deletion`
  String get step5InsuranceCompanyProcesses {
    return Intl.message(
      'Insurance company processes and confirms deletion',
      name: 'step5InsuranceCompanyProcesses',
      desc: '',
      args: [],
    );
  }

  /// `Important Notes`
  String get importantNotes {
    return Intl.message(
      'Important Notes',
      name: 'importantNotes',
      desc: '',
      args: [],
    );
  }

  /// `Batch Deletion:`
  String get batchDeletion {
    return Intl.message(
      'Batch Deletion:',
      name: 'batchDeletion',
      desc: '',
      args: [],
    );
  }

  /// `You can select multiple members for deletion in one request`
  String get youCanSelectMultipleMembers {
    return Intl.message(
      'You can select multiple members for deletion in one request',
      name: 'youCanSelectMultipleMembers',
      desc: '',
      args: [],
    );
  }

  /// `Coverage End:`
  String get coverageEnd {
    return Intl.message(
      'Coverage End:',
      name: 'coverageEnd',
      desc: '',
      args: [],
    );
  }

  /// `Insurance coverage ends on the specified effective date`
  String get insuranceCoverageEndsOnSpecifiedDate {
    return Intl.message(
      'Insurance coverage ends on the specified effective date',
      name: 'insuranceCoverageEndsOnSpecifiedDate',
      desc: '',
      args: [],
    );
  }

  /// `Refunds:`
  String get refunds {
    return Intl.message('Refunds:', name: 'refunds', desc: '', args: []);
  }

  /// `Refund eligibility depends on policy terms and effective date`
  String get refundEligibilityDependsOnPolicyTerms {
    return Intl.message(
      'Refund eligibility depends on policy terms and effective date',
      name: 'refundEligibilityDependsOnPolicyTerms',
      desc: '',
      args: [],
    );
  }

  /// `Re-enrollment:`
  String get reEnrollment {
    return Intl.message(
      'Re-enrollment:',
      name: 'reEnrollment',
      desc: '',
      args: [],
    );
  }

  /// `Deleted members may be re-enrolled following standard addition procedures`
  String get deletedMembersMayBeReEnrolled {
    return Intl.message(
      'Deleted members may be re-enrolled following standard addition procedures',
      name: 'deletedMembersMayBeReEnrolled',
      desc: '',
      args: [],
    );
  }

  /// `Notification:`
  String get notification {
    return Intl.message(
      'Notification:',
      name: 'notification',
      desc: '',
      args: [],
    );
  }

  /// `Affected members will be notified of deletion via email/SMS`
  String get affectedMembersWillBeNotified {
    return Intl.message(
      'Affected members will be notified of deletion via email/SMS',
      name: 'affectedMembersWillBeNotified',
      desc: '',
      args: [],
    );
  }

  /// `Validation & Approval`
  String get validationAndApproval {
    return Intl.message(
      'Validation & Approval',
      name: 'validationAndApproval',
      desc: '',
      args: [],
    );
  }

  /// `All deletion requests are validated against policy rules and require approval from the insurance company. You will be notified of the status within 24-48 hours.`
  String get allDeletionRequestsAreValidated {
    return Intl.message(
      'All deletion requests are validated against policy rules and require approval from the insurance company. You will be notified of the status within 24-48 hours.',
      name: 'allDeletionRequestsAreValidated',
      desc: '',
      args: [],
    );
  }

  /// `E-Card`
  String get eCard {
    return Intl.message('E-Card', name: 'eCard', desc: '', args: []);
  }

  /// `Physical Card`
  String get physicalCard {
    return Intl.message(
      'Physical Card',
      name: 'physicalCard',
      desc: '',
      args: [],
    );
  }

  /// `Successful`
  String get sentRequestSuccessTitle {
    return Intl.message(
      'Successful',
      name: 'sentRequestSuccessTitle',
      desc: '',
      args: [],
    );
  }

  /// `Your Request sent successfully`
  String get sentRequestSuccessBody {
    return Intl.message(
      'Your Request sent successfully',
      name: 'sentRequestSuccessBody',
      desc: '',
      args: [],
    );
  }

  /// `Select Members to Delete`
  String get selectMemberToDelete {
    return Intl.message(
      'Select Members to Delete',
      name: 'selectMemberToDelete',
      desc: '',
      args: [],
    );
  }

  /// `Search and select members - families will be auto-selected`
  String get selectMemberToDeleteBody {
    return Intl.message(
      'Search and select members - families will be auto-selected',
      name: 'selectMemberToDeleteBody',
      desc: '',
      args: [],
    );
  }

  /// `View Deletion Guidelines for Selected Insurance`
  String get viewDeletionGuide {
    return Intl.message(
      'View Deletion Guidelines for Selected Insurance',
      name: 'viewDeletionGuide',
      desc: '',
      args: [],
    );
  }

  /// `Important: `
  String get important {
    return Intl.message('Important: ', name: 'important', desc: '', args: []);
  }

  /// `Selecting a principal member will automatically select all their family members. They must be deleted together as a family unit.`
  String get importantBody {
    return Intl.message(
      'Selecting a principal member will automatically select all their family members. They must be deleted together as a family unit.',
      name: 'importantBody',
      desc: '',
      args: [],
    );
  }

  /// `Skip`
  String get skip {
    return Intl.message('Skip', name: 'skip', desc: '', args: []);
  }

  /// `Configure Utilization Notifications`
  String get configureUtilizationNotification {
    return Intl.message(
      'Configure Utilization Notifications',
      name: 'configureUtilizationNotification',
      desc: '',
      args: [],
    );
  }

  /// `Set thresholds for automatic alerts and reminders.`
  String get configureUtilizationNotificationBody {
    return Intl.message(
      'Set thresholds for automatic alerts and reminders.',
      name: 'configureUtilizationNotificationBody',
      desc: '',
      args: [],
    );
  }

  /// `Alert Configuration`
  String get alertConfiguration {
    return Intl.message(
      'Alert Configuration',
      name: 'alertConfiguration',
      desc: '',
      args: [],
    );
  }

  /// `Total Consumption Threshold`
  String get totalConsumptionThreshold {
    return Intl.message(
      'Total Consumption Threshold',
      name: 'totalConsumptionThreshold',
      desc: '',
      args: [],
    );
  }

  /// `Alert when total company consumption reaches this amount.`
  String get totalConsumptionThresholdDescription {
    return Intl.message(
      'Alert when total company consumption reaches this amount.',
      name: 'totalConsumptionThresholdDescription',
      desc: '',
      args: [],
    );
  }

  /// `Monthly Consumption Threshold`
  String get monthlyConsumptionThreshold {
    return Intl.message(
      'Monthly Consumption Threshold',
      name: 'monthlyConsumptionThreshold',
      desc: '',
      args: [],
    );
  }

  /// `Alert when consumption in a specific month reaches this amount.`
  String get monthlyConsumptionThresholdDescription {
    return Intl.message(
      'Alert when consumption in a specific month reaches this amount.',
      name: 'monthlyConsumptionThresholdDescription',
      desc: '',
      args: [],
    );
  }

  /// `Employee Amount Threshold`
  String get employeeAmountThreshold {
    return Intl.message(
      'Employee Amount Threshold',
      name: 'employeeAmountThreshold',
      desc: '',
      args: [],
    );
  }

  /// `Alert when any employee's total consumption reaches this amount.`
  String get employeeAmountThresholdDescription {
    return Intl.message(
      'Alert when any employee\'s total consumption reaches this amount.',
      name: 'employeeAmountThresholdDescription',
      desc: '',
      args: [],
    );
  }

  /// `Employee Transaction Count Threshold`
  String get employeeTransactionCountThreshold {
    return Intl.message(
      'Employee Transaction Count Threshold',
      name: 'employeeTransactionCountThreshold',
      desc: '',
      args: [],
    );
  }

  /// `Alert when any employee's number of transactions reaches this count.`
  String get employeeTransactionCountThresholdDescription {
    return Intl.message(
      'Alert when any employee\'s number of transactions reaches this count.',
      name: 'employeeTransactionCountThresholdDescription',
      desc: '',
      args: [],
    );
  }

  /// `EG`
  String get unitEg {
    return Intl.message('EG', name: 'unitEg', desc: '', args: []);
  }

  /// `Count`
  String get unitCount {
    return Intl.message('Count', name: 'unitCount', desc: '', args: []);
  }

  /// `Utilization Notifications`
  String get utilizationNotifications {
    return Intl.message(
      'Utilization Notifications',
      name: 'utilizationNotifications',
      desc: '',
      args: [],
    );
  }

  /// `Deep Dive Study`
  String get deepDiveStudy {
    return Intl.message(
      'Deep Dive Study',
      name: 'deepDiveStudy',
      desc: '',
      args: [],
    );
  }

  /// `Request new deep dive study`
  String get requestNewDeepDiveStudy {
    return Intl.message(
      'Request new deep dive study',
      name: 'requestNewDeepDiveStudy',
      desc: '',
      args: [],
    );
  }

  /// `Request deep dive study → Receive actionable recommendations.`
  String get requestDeepDiveSubtitle {
    return Intl.message(
      'Request deep dive study → Receive actionable recommendations.',
      name: 'requestDeepDiveSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `What would you like to analyze?`
  String get whatWouldYouLikeToAnalyze {
    return Intl.message(
      'What would you like to analyze?',
      name: 'whatWouldYouLikeToAnalyze',
      desc: '',
      args: [],
    );
  }

  /// `Example: "Why are our dental service costs 30% higher than average?"`
  String get whatWouldYouLikeToAnalyzePlaceholder {
    return Intl.message(
      'Example: "Why are our dental service costs 30% higher than average?"',
      name: 'whatWouldYouLikeToAnalyzePlaceholder',
      desc: '',
      args: [],
    );
  }

  /// `Study Results: Once the deep dive study is completed, recommendations will appear in the "Recommendations Based on Deep Dive" tab.`
  String get studyResultsInfo {
    return Intl.message(
      'Study Results: Once the deep dive study is completed, recommendations will appear in the "Recommendations Based on Deep Dive" tab.',
      name: 'studyResultsInfo',
      desc: '',
      args: [],
    );
  }

  /// `Create New Manager`
  String get createNewManager {
    return Intl.message(
      'Create New Manager',
      name: 'createNewManager',
      desc: '',
      args: [],
    );
  }

  /// `Update Existing Manager`
  String get updateExistingManager {
    return Intl.message(
      'Update Existing Manager',
      name: 'updateExistingManager',
      desc: '',
      args: [],
    );
  }

  /// `Select a manager to update their information and access rights.`
  String get updateExistingManagerSubtitle {
    return Intl.message(
      'Select a manager to update their information and access rights.',
      name: 'updateExistingManagerSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Select a manager from the dropdown to view and edit their current policies and access permissions. You can add more policies if they are not assigned all available policies.`
  String get updateManagerTip {
    return Intl.message(
      'Select a manager from the dropdown to view and edit their current policies and access permissions. You can add more policies if they are not assigned all available policies.',
      name: 'updateManagerTip',
      desc: '',
      args: [],
    );
  }

  /// `Select Manager`
  String get selectManager {
    return Intl.message(
      'Select Manager',
      name: 'selectManager',
      desc: '',
      args: [],
    );
  }

  /// `Select a Manager`
  String get selectAManager {
    return Intl.message(
      'Select a Manager',
      name: 'selectAManager',
      desc: '',
      args: [],
    );
  }

  /// `Global Access Rights`
  String get globalAccessRights {
    return Intl.message(
      'Global Access Rights',
      name: 'globalAccessRights',
      desc: '',
      args: [],
    );
  }

  /// `Policies & Access Permissions`
  String get policiesAndAccessPermissions {
    return Intl.message(
      'Policies & Access Permissions',
      name: 'policiesAndAccessPermissions',
      desc: '',
      args: [],
    );
  }

  /// `+ Add New Policy`
  String get addNewPolicy {
    return Intl.message(
      '+ Add New Policy',
      name: 'addNewPolicy',
      desc: '',
      args: [],
    );
  }

  /// `Submit Changes`
  String get submitChanges {
    return Intl.message(
      'Submit Changes',
      name: 'submitChanges',
      desc: '',
      args: [],
    );
  }

  /// `Recommended for You by Beyond Team`
  String get recommendedForYou {
    return Intl.message(
      'Recommended for You by Beyond Team',
      name: 'recommendedForYou',
      desc: '',
      args: [],
    );
  }

  /// `Based on your industry profile, this is your most relevant and recommended insurance line for your company`
  String get recommendedForYouBody {
    return Intl.message(
      'Based on your industry profile, this is your most relevant and recommended insurance line for your company',
      name: 'recommendedForYouBody',
      desc: '',
      args: [],
    );
  }

  /// `Property All Risk`
  String get property {
    return Intl.message(
      'Property All Risk',
      name: 'property',
      desc: '',
      args: [],
    );
  }

  /// `Show all recommendations`
  String get showAllRecommendations {
    return Intl.message(
      'Show all recommendations',
      name: 'showAllRecommendations',
      desc: '',
      args: [],
    );
  }

  /// `High Match`
  String get highMatch {
    return Intl.message('High Match', name: 'highMatch', desc: '', args: []);
  }

  /// `Your Industry`
  String get yourIndustry {
    return Intl.message(
      'Your Industry',
      name: 'yourIndustry',
      desc: '',
      args: [],
    );
  }

  /// `Products Available`
  String get productsAvailable {
    return Intl.message(
      'Products Available',
      name: 'productsAvailable',
      desc: '',
      args: [],
    );
  }

  /// `High Match (70%+)`
  String get highMatch70 {
    return Intl.message(
      'High Match (70%+)',
      name: 'highMatch70',
      desc: '',
      args: [],
    );
  }

  /// `Medium Match (40-69%)`
  String get mediumMatch40 {
    return Intl.message(
      'Medium Match (40-69%)',
      name: 'mediumMatch40',
      desc: '',
      args: [],
    );
  }

  /// `Low Match (Below 40%)`
  String get lowMatchBelow40 {
    return Intl.message(
      'Low Match (Below 40%)',
      name: 'lowMatchBelow40',
      desc: '',
      args: [],
    );
  }

  /// `All Products`
  String get allProducts {
    return Intl.message(
      'All Products',
      name: 'allProducts',
      desc: '',
      args: [],
    );
  }

  /// `Medium Match`
  String get mediumMatch {
    return Intl.message(
      'Medium Match',
      name: 'mediumMatch',
      desc: '',
      args: [],
    );
  }

  /// `Low Match`
  String get lowMatch {
    return Intl.message('Low Match', name: 'lowMatch', desc: '', args: []);
  }

  /// `Insurance Products`
  String get insuranceProducts {
    return Intl.message(
      'Insurance Products',
      name: 'insuranceProducts',
      desc: '',
      args: [],
    );
  }

  /// `Show Product benefits >`
  String get showProductBenefits {
    return Intl.message(
      'Show Product benefits >',
      name: 'showProductBenefits',
      desc: '',
      args: [],
    );
  }

  /// `Get Personalized Quote`
  String get getPersonalizedQuote {
    return Intl.message(
      'Get Personalized Quote',
      name: 'getPersonalizedQuote',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}

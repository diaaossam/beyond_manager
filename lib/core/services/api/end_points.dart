class EndPoints {
  static String requestDemo = "/Request/Demo/Access";
  static String register = "/create/user/manager";
  static String login = "/Get/Manager/Login/Data";
  static String profile = "/Get/Profile/Data";
  static String deleteAccount = "/Put/User/Manager/Left_The_Company/Data";
  static String updateProfileData = "/PUT/USER/Manager/DATA";
  static String userData = "/customer/company?mobile=0";
  static String companyPolicies = "/get/policy";
  static String activeSickLeavePolicy = "/get/sick_leave/policy";
  static String createSickLeave = "/post/Sick/Leave";
  static String getMySickLeave = "/get/All/Sick/leave";
  static String updateMySickLeave = "/PUT/Sick/Leave/DATA";
  static String activePolicy = "/get/policy/active_list";
  static String utilitzationPolicy = "/get/policy/utilization";
  static String policyPayment = "/get/policy/payment";
  static String policyDetails = "/get/policy/details";
  static String policyAccess = "/get/policy/access";
  static String emergency = "/get/Emergency/Request_Type_Value";
  static String myEmergency = "/get/All/Emergency";
  static String postEmergency = "/post/Manager/Emergency";
  static String createOtherLine = "/post/Other/Lines";
  static String getOtherLine = "/get/All/Other/Lines/Templates";
  static String terms = "/get/terms/and/conditions";
  static String getSettings = "/get/Beyond/manager/configuration/data/endpoint";

  static String getHospitalsName = "/get/beyond/hospitals";
  static String getHospitalsBranches = "/get/cleopatra/hospitals";
  static String getSpecialities = "/get/cleopatra/specialities";
  static String searchForDoctors = "/search/cleopatra/doctors";
  static String getTimeslot = "/get/cleopatra/doctors/time/slot";
  static String timeslot = "/get/cleopatra/doctors/time/slot";
  static String postReservation = "/post/cleopatra/appointments";
  static String appointment = "/post/cleopatra/appointments";
  static String getReservation = "/get/cleopatra/manager/reservations";
  static String getMyAppointment = "/get/cleopatra/manager/reservations";

  static const String tpa = "/Get/All/Tpa";
  static const String tires = "/Get/Tiers";
  static const String search = "/Search";

  static const String insuranceCompany = "/get/options/insurance/companies";
  static const String vehicleBrand = "/get/options/vehicle/brand";
  static const String area = "/get/options/city";
  static const String centerType = "/get/options/center/type";
  static const String serviceCenters = "/search/car/service";

  static const String reimbursemtStatus = "/get/claim/status";
  static const String reimbursemt = "/get/policy/reimbursement/lines";
  static const String sickLeaveAnalytics = "/get/All/Sick/leave/analytics";
  static const String sendWhatsApp = "/Send/WhatsApp/Message/To/User";
  static const String sendOtp = "/beyond/plus/send/otp";

  static const String getRelation = "/get/active/list/member/relation";
  static const String submitMembers = "/post/ticket/create/addition";
  static const String deletionMember = "/get/members/deletion";

  static const String getPoliciesTicketData = "/get/ticket/policy/for/addition/data";
  static const String getPoliciesBranches = "/get/ticket/policy/branches";
  static const String getPoliciesPlans = "/get/policies/plans";


  static const String setNotificationUtilization = "/post/utilization/notification/values";
  static const String getUtilizationNotifications = "/get/utilization/notifications";
  static const String sendDeepDive = "/post/deep/dive/study";
  static const String getDeepDive = "/get/all/deep/dive/studies";
}

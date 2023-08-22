// ignore_for_file: constant_identifier_names
class ApiConstants {
  static const int CONNECT_TIMEOUT = 30000;
  static const int RECIEVE_TIMEOUT = 30000;

  // dev
  static const String baseUrl = "http://103.147.34.73:8085/api/";
  static const String baseUrlImage = "http://103.147.34.73:8086/api/";
  // product
  // static const String baseUrl = "http://103.147.34.73:8085/api/";
  // static const String baseUrlImage = "http://103.147.34.73:8086/api/";

  static const String apiCustomerLogin = "${baseUrl}customers/login";
  static const String apiCustomerLogout = "${baseUrl}customers/logout";
  static const String apiCustomerRegister = "${baseUrl}customers/register";
  static const String apiCustomerRegisterVerifyCode = "${baseUrl}customers/verify-register";
  static const String apiResendCodeToEmail = "${baseUrl}customers/send-mail-verify-register";
  static const String apiChangePassword = "${baseUrl}customers/change-pass";
  static const String apiSendEmailForgetPass = "${baseUrl}customers/send-mail-forget-pass";
  static const String apiChangePassWhenForgetPass = "${baseUrl}customers/forget-pass";
  static const String apiVerifyWhenForgetPass = "${baseUrl}customers/verify-forget-pass";
  static const String apiFaq = "${baseUrl}faq";
  static const String apiPolicyTerms = "${baseUrl}policy-terms/active";

  //profile
  static const String apiGetCity = "${baseUrl}provinces";
  static const String apiGetDistrict = "${baseUrl}districts";
  static const String apiGetWard = "${baseUrl}wards";
  static const String apiPutUpdateMyInfo = "${baseUrl}customers";
  static const String apiGetProfile = "${baseUrl}customers/this-profile";

  // upload file
  static const String apiUploadImage = "${baseUrlImage}file/upload";
}

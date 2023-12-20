class Urls {
  static const String baseUrl = "http://52.51.249.84:8080";

  static const String signUp = "$baseUrl/api/auth/merchantsignup";
  static const String validateOTP = "$baseUrl/api/auth/validateOtp";
  static const String signIn = "$baseUrl/api/auth/merchantsignin";
  static const String sendOTP = "$baseUrl/api/auth/generateOtp";
  static const String chooseSubscription = "$baseUrl/api/app/subscription";
  static const String userProfile = "$baseUrl/api/app/userProfile";
  static const String createReward = "$baseUrl/api/app/reward";
  static const String getRewardPoints = "$baseUrl/api/app/listreward";
  static const String deleteReward = "$baseUrl/api/app/reward/";
  static const String refreshToken = "$baseUrl/api/auth/refreshToken";
  static const String updateLipaNamba = "$baseUrl/api/app/updatemerchantlipa";
  static const String pendingPointList = "$baseUrl/api/app/rewardList/2";
  static const String approvedPointList = "$baseUrl/api/app/rewardList/1";
  static const String changeEmail = "$baseUrl/api/app/userProfile/changeEmail";
  static const String uploadMenu = "$baseUrl/api/app/userProfile/upload-menu";
  static const String uploadProfileImage =
      "$baseUrl/api/app/userProfile/upload-image";
  static const String approvePendingPoints = "$baseUrl/api/app/approveReward";
  static const String cancelPoint = "$baseUrl/api/app/rewardpoint";
  static const String uploadBusinessImage =
      "$baseUrl/api/app/userProfile/uploadbusinessimage";
  static const String changeBusinessDetails =
      "$baseUrl/api/app/changebusinessdetails";
  static const String customerissuePoints =
      "$baseUrl/api/app/getapprovedrewardbyuser";
  static const String customerSummary =
      "$baseUrl/api/app/getsummaryrewardformerchant";
  static const String transaction = "$baseUrl/api/app/gettransactions";
  static const String issuedPoints = "$baseUrl/api/app/getpendingrewardbyuser";
  static const String approvedPoints =
      "$baseUrl/api/app/getapprovedrewardbyuser";
  static const String fetchProfileImage = "$baseUrl/api/app/downloaduserimage";
  static const String fetchBusinessImage =
      "$baseUrl/api/app/downloadbusinessimage";
  static const String notification = "$baseUrl/api/app/notifications";
  static const String readNotification =
      "$baseUrl/api/app/notifications/mark-as-read";
  static const String reviewStates = "$baseUrl/api/app/review-stats";
  static const String reviewList = "$baseUrl/api/app/reviews";
  static const String generateForgetOTP =
      "$baseUrl/api/auth/generateOtpforuser";
  static const String validateOtpFoget =
      "$baseUrl/api/auth/validateOtpforToken";
  static const String resetPIN = "$baseUrl/api/app/resetnewpin";
  static const String invoicePayment =
      "$baseUrl/api/app/initiateSubscriptionPayment";
}

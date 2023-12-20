import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tiger_loyalty/const/Url.dart';
import 'package:tiger_loyalty/const/constant.dart';
import 'package:tiger_loyalty/screens/customer/model/customer_summary_model.dart';
import 'package:tiger_loyalty/screens/profile/component/profile.dart';
import 'package:tiger_loyalty/screens/profile/model/profile_model.dart';
import 'package:http/http.dart' as http;
import 'package:tiger_loyalty/src/pages/setting.dart';

class ProfileController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isImageSelected = false.obs;
  XFile profileImage = XFile("null");
  Rx<ProfileModel> profileModel = ProfileModel().obs;
  RxList<SettingData> settingData = [
    SettingData(text: 'change_login_details', image: 'assets/setting_3.png'),
    SettingData(text: 'manage_brands', image: 'assets/setting_4.png'),
    SettingData(text: 'terms_condition', image: 'assets/setting_5.png'),
    SettingData(text: 'privacy_policy', image: 'assets/setting_6.png'),
    SettingData(text: 'about_tl', image: 'assets/setting_7.png'),
  ].obs;
  TextEditingController oldPINController = TextEditingController();
  TextEditingController newPINController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController payPhoneNumberController = TextEditingController();
  SubscriptionData? selectedSubscription;
  late PackageInfo packageInfo;
  RxString appVersion = "".obs;
  late http.Response profileImageURL;
  late http.Response businessImageURL;
  ValueNotifier<bool> notifieImage = ValueNotifier(true);
  Rx<CustomerSummaryModel> pointsSummary = CustomerSummaryModel().obs;

  @override
  void onInit() {
    String formattedFirstDate =
        DateFormat('MM/dd/yyyy').format(DateTime(DateTime.now().year, 1, 1));
    String formattedLastDate =
        DateFormat('MM/dd/yyyy').format(DateTime(DateTime.now().year, 12, 31));
    userProfile();
    initPackageInfo();
    fetchSummary("?startDate=$formattedFirstDate&endDate=$formattedLastDate");
    super.onInit();
  }

  initPackageInfo() async {
    packageInfo = await PackageInfo.fromPlatform();
    appVersion.value = packageInfo.buildNumber;
  }

  Future userProfile() async {
    profileModel = ProfileModel().obs;
    try {
      isLoading(true);

      var request = http.Request('GET', Uri.parse(Urls.userProfile));

      request.headers.addAll({
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${Params.userToken}'
      });

      http.StreamedResponse response = await request.send();
      var decodeData = await http.Response.fromStream(response);
      final result = jsonDecode(decodeData.body);
      print("profile response11 ==> $result");

      if (response.statusCode == 200) {
        profileModel.value = ProfileModel.fromJson(result);
        fetchProfileImage();
        fetchBusinessImage();
        update();
        isLoading(false);
      } else {
        isLoading(false);
      }
    } catch (e) {
      isLoading(false);
      rethrow;
    }
  }

  Future fetchProfileImage() async {
    try {
      isLoading(true);
      final Uri uri =
          Uri.parse("${Urls.fetchProfileImage}/${profileModel.value.image}");
      final Map<String, String> headers = {
        'Authorization': 'Bearer ${Params.userToken}',
      };

      profileImageURL = await http.get(uri, headers: headers);
      notifieImage.notifyListeners();
      isLoading(false);
    } catch (e) {
      isLoading(false);
      rethrow;
    }
  }

  Future fetchBusinessImage() async {
    try {
      isLoading(true);
      final Uri uri = Uri.parse(
          "${Urls.fetchBusinessImage}/${profileModel.value.businessimage}");
      final Map<String, String> headers = {
        'Authorization': 'Bearer ${Params.userToken}',
      };

      businessImageURL = await http.get(uri, headers: headers);
      notifieImage.notifyListeners();
      isLoading(false);
    } catch (e) {
      isLoading(false);
      rethrow;
    }
  }

  Future refreshToken() async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    if (Params.userToken != "null") {
      try {
        isLoading(true);
        var headers = {'Content-Type': 'application/json'};
        var request = http.Request('POST', Uri.parse(Urls.refreshToken));
        request.body = json.encode({"refreshToken": Params.refreshToken});
        request.headers.addAll(headers);

        http.StreamedResponse response = await request.send();
        var decodeData = await http.Response.fromStream(response);
        print("refresh token response ==> ${decodeData.body}");
        final result = jsonDecode(decodeData.body);

        if (response.statusCode == 200) {
          isLoading(false);
          pref.setString("token", result["token"]);
          pref.setString("refreshToken", result["refreshToken"]);
          Params.userToken = result["token"];
          Params.refreshToken = result["refreshToken"];
        } else {
          isLoading(false);
        }
      } catch (e) {
        isLoading(false);
      }
    }
  }

  Future changeEmail() async {
    try {
      isLoading(true);

      var request = http.Request('PUT', Uri.parse(Urls.changeEmail));

      request.headers.addAll({
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${Params.userToken}'
      });

      request.body = json.encode({"email": emailController.text.trim()});

      http.StreamedResponse response = await request.send();
      var decodeData = await http.Response.fromStream(response);
      final result = jsonDecode(decodeData.body);
      print("changeEmail response ==> $result");

      if (response.statusCode == 200) {
        // refreshToken().then((value) => userProfile());
        isLoading(false);
      } else {
        Fluttertoast.showToast(msg: result["message"]);
        isLoading(false);
      }
    } catch (e) {
      isLoading(false);
      rethrow;
    }
  }

  Future choosePlan() async {
    print("choose ==> ${selectedSubscription!.title}");
    String plan = selectedSubscription!.title == "Free" ||
            selectedSubscription!.title == "Bure"
        ? "1"
        : selectedSubscription!.title == "TZS. 25,000"
            ? "2"
            : selectedSubscription!.title == "TZS. 50,000"
                ? "3"
                : "4";

    try {
      isLoading(true);

      var request = http.Request('POST', Uri.parse(Urls.chooseSubscription));
      request.body = json.encode(
          {"plan": plan, "phoneNumber": profileModel.value.phoneNumber});
      request.headers.addAll({
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${Params.userToken}'
      });

      http.StreamedResponse response = await request.send();
      var decodeData = await http.Response.fromStream(response);
      final result = jsonDecode(decodeData.body);
      print("change plan ==> $result");

      if (response.statusCode == 200) {
        userProfile();
        isLoading(false);
      } else {
        isLoading(false);
      }
    } catch (e) {
      isLoading(false);
      rethrow;
    }
  }

  Future verifyOTP() async {
    try {
      isLoading(true);

      var request = http.Request('POST', Uri.parse(Urls.validateOTP));
      request.body = json.encode({
        "otp": int.parse(otpController.text),
        "userName": emailController.text.trim(),
      });
      request.headers.addAll({'Content-Type': 'application/json'});

      http.StreamedResponse response = await request.send();
      // var decodeData = await http.Response.fromStream(response);
      // final result = jsonDecode(decodeData.body);

      if (response.statusCode == 200) {
        changeEmail();
        isLoading(false);
      } else {
        // Fluttertoast.showToast(msg: result["message"]);
        isLoading(false);
      }
    } catch (e) {
      isLoading(false);
      rethrow;
    }
  }

  Future sendOTP() async {
    try {
      var request = http.Request('POST', Uri.parse(Urls.sendOTP));
      request.body = json.encode({
        "userName": emailController.text.trim(),
        "phoneNumber": profileModel.value.phoneNumber
      });
      request.headers.addAll({'Content-Type': 'application/json'});

      http.StreamedResponse response = await request.send();
      var decodeData = await http.Response.fromStream(response);
      // final result = jsonDecode(decodeData.body);
      print("result ==> ${decodeData.body}");

      if (response.statusCode == 200) {
      } else {}
    } catch (e) {
      isLoading(false);
      rethrow;
    }
  }

  Future uploadProfileImage() async {
    try {
      isLoading(true);
      var request =
          http.MultipartRequest('POST', Uri.parse(Urls.uploadProfileImage));
      request.files
          .add(await http.MultipartFile.fromPath('image', profileImage.path));
      request.headers.addAll({'Authorization': 'Bearer ${Params.userToken}'});

      http.StreamedResponse response = await request.send();
      var decodeData = await http.Response.fromStream(response);
      final result = jsonDecode(decodeData.body);
      print("upload profile image response ==> $result");

      if (response.statusCode == 200) {
        isLoading(false);
        Fluttertoast.showToast(msg: result["message"]);
        userProfile();
      } else {
        isLoading(false);
        Fluttertoast.showToast(msg: result["message"]);
      }
    } catch (e) {
      isLoading(false);
      rethrow;
    }
  }

  Future fetchSummary(String url) async {
    try {
      var request = http.Request('GET', Uri.parse(Urls.customerSummary + url));

      request.headers.addAll({
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${Params.userToken}'
      });

      http.StreamedResponse response = await request.send();
      var decodeData = await http.Response.fromStream(response);
      final result = jsonDecode(decodeData.body);

      if (response.statusCode == 200) {
        pointsSummary.value = CustomerSummaryModel.fromJson(result);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future invoicePayment() async {
    try {
      isLoading(true);
      var request = http.Request('POST', Uri.parse(Urls.invoicePayment));

      request.headers.addAll({
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${Params.userToken}'
      });

      request.body = json.encode({
        "plan": profileModel.value.subscriptionPlan,
        "phoneNumber": payPhoneNumberController.text.trim()
      });

      http.StreamedResponse response = await request.send();
      var decodeData = await http.Response.fromStream(response);
      final result = jsonDecode(decodeData.body);
      print("payment status ==> $result");

      if (response.statusCode == 200) {
        payPhoneNumberController.clear();
        userProfile();
        isLoading(false);
      } else {
        isLoading(false);
      }
    } catch (e) {
      isLoading(false);
      rethrow;
    }
  }
}

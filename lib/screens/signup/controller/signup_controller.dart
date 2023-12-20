import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:tiger_loyalty/const/Url.dart';
import 'package:tiger_loyalty/const/constant.dart';
import 'package:tiger_loyalty/initial_binding.dart';
import 'package:tiger_loyalty/screens/profile/model/profile_model.dart';
import 'package:tiger_loyalty/screens/signin/component/signin.dart';
import 'package:tiger_loyalty/screens/signup/component/pin_setup.dart';
import 'package:tiger_loyalty/screens/signup/model/foget_pin_model.dart';
import 'package:tiger_loyalty/screens/signup/model/signup_model.dart';
import 'package:tiger_loyalty/src/pages/authentication.dart';
import 'package:tiger_loyalty/screens/signup/component/reg_business.dart';
import 'package:http/http.dart' as http;
import 'package:tiger_loyalty/screens/signup/component/choose_subscription.dart';
import 'package:tiger_loyalty/screens/createReward/component/create_reward.dart';

class SignupController extends GetxController {
  RxBool isLoading = false.obs;
  RxString gender = 'Female'.obs;
  RxBool isTermChecked = false.obs;
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lasttNameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController businessNameController = TextEditingController();
  TextEditingController tinController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  TextEditingController pin1Controller = TextEditingController();
  TextEditingController pin2Controller = TextEditingController();
  RxBool pinMatch = false.obs;
  RxBool isLocationSelected = false.obs;
  RxString locationName = "".obs;
  RxList<String> businessCategories = [
    'business_category'.tr,
    "bakery".tr,
    "bar".tr,
    "beauty".tr,
    "bookstore".tr,
    "butcheries".tr,
    "coffee_shops".tr,
    "cosmetics".tr,
    "decor".tr,
    "electronics".tr,
    "fashion".tr,
    "fast_food".tr,
    "florists".tr,
    "groceries".tr,
    "gym".tr,
    "hotel".tr,
    "laundry".tr,
    "liquor_stores".tr,
    "pets".tr,
    "pharmacies".tr,
    "resort".tr,
    "restaurant".tr,
    "saloon".tr,
    "shopping".tr,
    "spa".tr,
    "supermarkets".tr,
    "travel".tr,
    "yoga".tr,
  ].obs;
  RxString selectedCategory = 'business_category'.tr.obs;
  RxList<SubscriptionData> subscriptionData = [
    SubscriptionData(
      title: 'free'.tr,
      titleColor: Colors.black,
      desc: 'free_desc'.tr,
      descColor: Colors.black,
      backgroundColor: const Color(0xFF000000).withOpacity(0.2),
    ),
    SubscriptionData(
      title: 'plan_2'.tr,
      titleColor: Colors.black,
      desc: 'plan_2_desc'.tr,
      descColor: Colors.black,
      backgroundColor: const Color(0xFF1BB46A).withOpacity(0.5),
    ),
    SubscriptionData(
      title: 'plan_3'.tr,
      titleColor: Colors.white,
      desc: 'plan_3_desc'.tr,
      descColor: Colors.white,
      backgroundColor: const Color(0xFF000000).withOpacity(0.7),
    ),
    SubscriptionData(
      title: 'plan_4'.tr,
      titleColor: Colors.white,
      desc: 'plan_4_desc'.tr,
      descColor: Colors.white,
      backgroundColor: const Color(0xFF000000).withOpacity(1.0),
    ),
  ].obs;
  SubscriptionData? selectedSubscription;
  Rx<SignupModel> signupModel = SignupModel().obs;
  Rx<ProfileModel> profileModel = ProfileModel().obs;
  Rx<ForgetPINModel> forgetPinModel = ForgetPINModel().obs;

  nextFuncation() {
    if (firstNameController.text.isEmpty) {
      Fluttertoast.showToast(msg: "enter_first_name_msg".tr);
    } else if (lasttNameController.text.isEmpty) {
      Fluttertoast.showToast(msg: "enter_last_name_msg".tr);
    } else if (numberController.text.isEmpty) {
      Fluttertoast.showToast(msg: "enter_number_msg".tr);
    } else if (numberController.text.length < 9) {
      Fluttertoast.showToast(msg: "enter_valid_number_msg".tr);
    } else if (emailController.text.isEmpty) {
      Fluttertoast.showToast(msg: "enter_email_msg".tr);
    } else if (!emailController.text.isEmail) {
      Fluttertoast.showToast(msg: "enter_valid_email_msg".tr);
    } else if (isTermChecked.value == false) {
      Fluttertoast.showToast(msg: "read_condition_msg".tr);
    } else {
      Get.to(() => const RegisterBusiness(), binding: InitialBinding());
    }
  }

  registerBusiness() {
    if (businessNameController.text.isEmpty) {
      Fluttertoast.showToast(msg: "enter_business_name_msg".tr);
    } else if (tinController.text.isEmpty) {
      Fluttertoast.showToast(msg: "enter_tin_msg".tr);
    } else if (tinController.text.length < 11) {
      Fluttertoast.showToast(msg: "enter_valid_tin_msg".tr);
    } else if (selectedCategory.value == "Business category") {
      Fluttertoast.showToast(msg: "choose_category".tr);
    } else if (isLocationSelected.value == false) {
      Fluttertoast.showToast(msg: "select_location".tr);
    } else {
      sendOTP();
    }
  }

  Future sendOTP() async {
    try {
      isLoading(true);

      var request = http.Request('POST', Uri.parse(Urls.sendOTP));
      request.body = json.encode({
        "userName": emailController.text.trim(),
        "phoneNumber": numberController.text.trim()
      });
      request.headers.addAll({'Content-Type': 'application/json'});

      http.StreamedResponse response = await request.send();
      var decodeData = await http.Response.fromStream(response);
      // final result = jsonDecode(decodeData.body);
      print("result ==> ${decodeData.body}");

      if (response.statusCode == 200) {
        Get.to(() => Authentication(isReset: false), binding: InitialBinding());
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

  Future resendOTP() async {
    try {
      var request = http.Request('POST', Uri.parse(Urls.sendOTP));
      request.body = json.encode({
        "userName": emailController.text.trim(),
        "phoneNumber": numberController.text.trim()
      });
      request.headers.addAll({'Content-Type': 'application/json'});

      http.StreamedResponse response = await request.send();
      var decodeData = await http.Response.fromStream(response);
      // final result = jsonDecode(decodeData.body);
      print("resent otp result ==> ${decodeData.body}");

      if (response.statusCode == 200) {
      } else {}
    } catch (e) {
      rethrow;
    }
  }

  Future signUp() async {
    try {
      isLoading(true);

      var request = http.Request('POST', Uri.parse(Urls.signUp));
      request.body = json.encode({
        "username": emailController.text.trim(),
        "roles": ["merchant"],
        "password": pin2Controller.text.trim(),
        "phoneNumber": numberController.text.trim(),
        "firstName": firstNameController.text.trim(),
        "lastName": lasttNameController.text.trim(),
        "gender": gender.value,
        "businessName": businessNameController.text.trim(),
        "tin": tinController.text.trim().replaceAll("-", ""),
        "category": selectedCategory.value,
        "location": locationName.value
      });
      request.headers.addAll({'Content-Type': 'application/json'});

      http.StreamedResponse response = await request.send();
      var decodeData = await http.Response.fromStream(response);
      final result = jsonDecode(decodeData.body);

      if (response.statusCode == 200) {
        signupModel.value = SignupModel.fromJson(result);
        SetSharedPref().setData(
            token: signupModel.value.token!,
            refreshToken: signupModel.value.refreshToken!,
            email: signupModel.value.username!,
            userid: signupModel.value.id!);

        userProfile(signupModel.value.token!).then((value) {
          Get.to(() => ChooseSubscription(profileModel: profileModel.value),
              binding: InitialBinding());
        });
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

  Future userProfile(String token) async {
    try {
      var request = http.Request('GET', Uri.parse(Urls.userProfile));

      request.headers.addAll({
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      });

      http.StreamedResponse response = await request.send();
      var decodeData = await http.Response.fromStream(response);
      final result = jsonDecode(decodeData.body);

      if (response.statusCode == 200) {
        profileModel.value = ProfileModel.fromJson(result);
        Params.businessName = profileModel.value.businessName ?? "";
      }
    } catch (e) {
      isLoading(false);
      rethrow;
    }
  }

  Future verifyOTP(bool isReset) async {
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
        print("verified");
        Get.to(() => PinSetup(isReset: isReset), binding: InitialBinding());
        isLoading(false);
      } else {
        Fluttertoast.showToast(msg: "valid_otp".tr);
        isLoading(false);
      }
    } catch (e) {
      isLoading(false);
      rethrow;
    }
  }

  Future verifyFogetOTP(bool isReset, String email) async {
    try {
      isLoading(true);

      var request = http.Request('POST', Uri.parse(Urls.validateOtpFoget));
      request.body = json.encode({
        "otp": int.parse(otpController.text),
        "userName": email,
      });
      request.headers.addAll({'Content-Type': 'application/json'});

      http.StreamedResponse response = await request.send();
      var decodeData = await http.Response.fromStream(response);
      final result = jsonDecode(decodeData.body);

      print("response ==> $result");
      if (response.statusCode == 200) {
        forgetPinModel.value = ForgetPINModel.fromJson(result);
        SetSharedPref().setData(
            token: forgetPinModel.value.token!,
            refreshToken: forgetPinModel.value.refreshToken!,
            email: forgetPinModel.value.username!,
            userid: forgetPinModel.value.id!);
        Get.to(() => PinSetup(isReset: isReset), binding: InitialBinding());
        isLoading(false);
      } else {
        Fluttertoast.showToast(msg: "valid_otp".tr);
        isLoading(false);
      }
    } catch (e) {
      isLoading(false);
      rethrow;
    }
  }

  Future resetPIN(bool isReset) async {
    try {
      isLoading(true);

      var request = http.Request('PUT', Uri.parse(Urls.resetPIN));
      request.body = json.encode({"newpin": pin2Controller.text.trim()});
      request.headers.addAll({
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${Params.userToken}'
      });

      http.StreamedResponse response = await request.send();
      // var decodeData = await http.Response.fromStream(response);
      // final result = jsonDecode(decodeData.body);

      print("verified ==> ${pin2Controller.text.trim()}");
      if (response.statusCode == 200) {
        SetSharedPref().clearData();
        Get.offAll(() => SignIn(), binding: InitialBinding());
        isLoading(false);
      } else {
        print("not verified");
        // Fluttertoast.showToast(msg: result["message"]);
        isLoading(false);
      }
    } catch (e) {
      isLoading(false);
      rethrow;
    }
  }

  Future choosePlan() async {
    print("plan ==> ${selectedSubscription!.title}");
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
      request.body =
          json.encode({"plan": plan, "phoneNumber": numberController.text});
      request.headers.addAll({
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${Params.userToken}'
      });

      http.StreamedResponse response = await request.send();
      var decodeData = await http.Response.fromStream(response);
      final result = jsonDecode(decodeData.body);

      if (response.statusCode == 200) {
        Get.to(() => CreateReward(profileModel: profileModel.value),
            binding: InitialBinding());
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
}

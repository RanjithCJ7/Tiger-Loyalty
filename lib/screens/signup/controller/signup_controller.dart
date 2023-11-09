import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:tiger_loyalty/const/Url.dart';
import 'package:tiger_loyalty/initial_binding.dart';
import 'package:tiger_loyalty/screens/signup/component/pin_setup.dart';
import 'package:tiger_loyalty/src/pages/authentication.dart';
import 'package:tiger_loyalty/screens/signup/component/reg_business.dart';
import 'package:http/http.dart' as http;
import 'package:tiger_loyalty/src/pages/choose_subscription.dart';

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
    'Business category'.tr,
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
  RxString selectedCategory = 'Business category'.tr.obs;

  nextFuncation() {
    if (firstNameController.text.isEmpty) {
      Fluttertoast.showToast(msg: "Please Enter First name");
    } else if (lasttNameController.text.isEmpty) {
      Fluttertoast.showToast(msg: "Please Enter Last name");
    } else if (numberController.text.isEmpty) {
      Fluttertoast.showToast(msg: "Please Enter Phone Number");
    } else if (numberController.text.length < 10) {
      Fluttertoast.showToast(msg: "Please Enter Valid Phone Number");
    } else if (emailController.text.isEmpty) {
      Fluttertoast.showToast(msg: "Please Enter Email");
    } else if (!emailController.text.isEmail) {
      Fluttertoast.showToast(msg: "Please Enter Valid Email");
    } else if (isTermChecked.value == false) {
      Fluttertoast.showToast(msg: "Please Read Terms & Conditions");
    } else {
      Get.to(() => const RegisterBusiness(), binding: InitialBinding());
    }
  }

  registerBusiness() {
    if (businessNameController.text.isEmpty) {
      Fluttertoast.showToast(msg: "Please Enter Registered Business Name");
    } else if (tinController.text.isEmpty) {
      Fluttertoast.showToast(msg: "Please Enter TIN Number");
    } else if (tinController.text.length < 11) {
      Fluttertoast.showToast(msg: "Please Enter Valid TIN Number");
    } else if (selectedCategory.value == "Business category") {
      Fluttertoast.showToast(msg: "Please choose Business category");
    } else if (isLocationSelected.value == false) {
      Fluttertoast.showToast(msg: "Please Select Location");
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
        Get.to(() => ChooseSubscription(), binding: InitialBinding());
        isLoading(false);
      } else {
        print("error ==> ${response.reasonPhrase}");
        Fluttertoast.showToast(msg: result["message"]);
        isLoading(false);
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
        Get.to(() => PinSetup(isReset: isReset), binding: InitialBinding());
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
}

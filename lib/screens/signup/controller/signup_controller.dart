import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:tiger_loyalty/const/Url.dart';
import 'package:tiger_loyalty/initial_binding.dart';
import 'package:tiger_loyalty/src/pages/authentication.dart';
import 'package:tiger_loyalty/screens/signup/component/reg_business.dart';
import 'package:http/http.dart' as http;

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
  RxList<String> businessCategories = [
    'Business category',
    'Bakery',
    'Bar',
    'Beauty',
    'Bookstore',
    'Butcheries',
    'Coffee Shops',
    'Cosmetics',
    'Decor',
    'Electronics',
    'Fashion',
    'Fast Food',
    'Florists',
    'Groceries',
    'Gym',
    'Hotel',
    'Laundry',
    'Liquor Stores',
    'Pets',
    'Pharmacies',
    'Resort',
    'Restaurant',
    'Saloon',
    'Shopping',
    'Spa',
    'Supermarkets',
    'Travel',
    'Yoga'
  ].obs;
  RxString selectedCategory = 'Business category'.obs;

  nextFuncation() {
    if (firstNameController.text.isEmpty) {
      Fluttertoast.showToast(msg: "Please Enter First name");
    } else if (lasttNameController.text.isEmpty) {
      Fluttertoast.showToast(msg: "Please Enter Last name");
    } else if (numberController.text.isEmpty) {
      Fluttertoast.showToast(msg: "Please Enter Phone Number");
    } else if (numberController.text.length < 7) {
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
    } else if (locationController.text.isEmpty) {
      Fluttertoast.showToast(msg: "Please Enter Location");
    } else {
      signUp();
      // Get.to(() => PinSetup(), binding: InitialBinding());
    }
  }

  Future signUp() async {
    try {
      isLoading(true);

      var request = http.Request('POST', Uri.parse(Urls.signUp));
      request.body = json.encode({
        "username": emailController.text.trim(),
        "roles": ["merchant"],
        "password": "password123",
        "phoneNumber": numberController.text.trim(),
        "firstName": firstNameController.text.trim(),
        "lastName": lasttNameController.text.trim(),
        "gender": gender.value,
        "businessName": businessNameController.text.trim(),
        "tin": tinController.text.trim().replaceAll("-", ""),
        "category": selectedCategory.value,
        "location": locationController.text.trim()
      });
      request.headers.addAll({'Content-Type': 'application/json'});

      http.StreamedResponse response = await request.send();
      // var decodeData = jsonDecode(await response.stream.bytesToString());
      print("signup response ==> ${await response.stream.bytesToString()}");

      if (response.statusCode == 200) {
        Get.to(() => Authentication(), binding: InitialBinding());
        isLoading(false);
      } else {
        print("error ==> ${response.reasonPhrase}");
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

      var response = await http.post(Uri.parse(Urls.validateOTP), body: {
        "otp": otpController.text.trim(),
        "userName": emailController.text.trim()
      });

      var decodeData = jsonDecode(response.body);
      print("validateOTP response ==> $decodeData");

      if (response.statusCode == 200) {
        Get.to(() => Authentication(), binding: InitialBinding());

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

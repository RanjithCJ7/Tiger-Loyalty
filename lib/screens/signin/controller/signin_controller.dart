import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:tiger_loyalty/const/Url.dart';
import 'package:tiger_loyalty/const/constant.dart';
import 'package:tiger_loyalty/initial_binding.dart';
import 'package:tiger_loyalty/screens/signin/model/signin_model.dart';
import 'package:tiger_loyalty/src/pages/authentication.dart';
import 'package:tiger_loyalty/screens/bottomTab/component/bottom_tab.dart';

class SigninController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool showMsg = false.obs;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController rstemailController = TextEditingController();
  TextEditingController rstNumberController = TextEditingController();
  Rx<SignInModel> signInModel = SignInModel().obs;

  login() async {
    if (emailController.text.isEmpty) {
      Fluttertoast.showToast(msg: "enter_email_msg".tr);
    } else if (passwordController.text.trim().isEmpty) {
      Fluttertoast.showToast(msg: "enter_pin_msg".tr);
      return;
    } else if (!emailController.text.isEmail) {
      Fluttertoast.showToast(msg: "enter_valid_email_msg".tr);
    } else {
      signIn();
    }
  }

  Future signIn() async {
    try {
      isLoading(true);
      showMsg(false);
      var request = http.Request('POST', Uri.parse(Urls.signIn));
      request.body = json.encode({
        "username": emailController.text.trim(),
        "password": passwordController.text.trim()
      });
      request.headers.addAll({'Content-Type': 'application/json'});

      http.StreamedResponse response = await request.send();
      var decodeData = jsonDecode(await response.stream.bytesToString());
      print("login response ==> $decodeData");

      if (response.statusCode == 200) {
        signInModel.value = SignInModel.fromJson(decodeData);
        Get.offAll(() => const BottomTab(), binding: InitialBinding());

        SetSharedPref().setData(
            token: signInModel.value.token ?? "null",
            refreshToken: signInModel.value.refreshToken ?? "null",
            email: signInModel.value.username ?? "null",
            userid: signInModel.value.id ?? "null");

        isLoading(false);
        showMsg(false);
      } else {
        showMsg(true);
        print("error ==> ${response.reasonPhrase}");
        isLoading(false);
      }
    } catch (e) {
      showMsg(true);
      isLoading(false);
      rethrow;
    }
  }

  Future resetPin() async {
    // Get.to(() => Authentication(isReset: true), binding: InitialBinding());

    try {
      isLoading(true);

      var request = http.Request('POST', Uri.parse(Urls.generateForgetOTP));
      request.body = json.encode({"userName": emailController.text.trim()});
      request.headers.addAll({'Content-Type': 'application/json'});

      http.StreamedResponse response = await request.send();
      var decodeData = await http.Response.fromStream(response);
      // final result = jsonDecode(decodeData.body);
      print("result ==> ${decodeData.body}");

      if (response.statusCode == 200) {
        Get.to(
            () => Authentication(
                isReset: true, email: emailController.text.trim()),
            binding: InitialBinding());

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
}

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:tiger_loyalty/const/Url.dart';
import 'package:tiger_loyalty/const/constant.dart';
import 'package:tiger_loyalty/screens/signin/model/signin_model.dart';
import 'package:tiger_loyalty/src/pages/bottom_tab.dart';

class SigninController extends GetxController {
  RxBool isLoading = false.obs;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  Rx<SignInModel> signInModel = SignInModel().obs;

  login() async {
    if (emailController.text.isEmpty) {
      Fluttertoast.showToast(msg: "Please enter E-mail");
    } else if (passwordController.text.isEmpty) {
      Fluttertoast.showToast(msg: "Please enter PIN");
      return;
    } else if (!emailController.text.isEmail) {
      Fluttertoast.showToast(msg: "Please enter valid E-mail");
    } else {
      signIn();
    }
  }

  Future signIn() async {
    try {
      isLoading(true);

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
        Get.offAll(() => const BottomTab());

        SetSharedPref().setData(
            token: signInModel.value.token ?? "null",
            refreshToken: signInModel.value.refreshToken ?? "null",
            email: signInModel.value.username ?? "null",
            userid: signInModel.value.id ?? "null");

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

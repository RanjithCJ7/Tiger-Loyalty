import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:tiger_loyalty/const/Url.dart';
import 'package:tiger_loyalty/const/constant.dart';
import 'package:tiger_loyalty/initial_binding.dart';
import 'package:tiger_loyalty/screens/profile/model/profile_model.dart';
import 'package:tiger_loyalty/src/pages/save_lipa_namba.dart';
import 'package:tiger_loyalty/widget/show_loader.dart';

class LipaNambaController extends GetxController {
  RxBool isLoading = false.obs;
  TextEditingController lipaNambaTextController = TextEditingController();
  Rx<ProfileModel> profileData = ProfileModel().obs;

  createLipaNamba(ProfileModel profileModel) async {
    if (lipaNambaTextController.text.isEmpty) {
      Fluttertoast.showToast(msg: "enter_lipa_num_msg".tr);
    } else if (lipaNambaTextController.text.length < 6) {
      Fluttertoast.showToast(msg: "lipa_digit_msg".tr);
    } else {
      const LoaderDialog().showLoader();
      var request = http.Request('PUT', Uri.parse(Urls.updateLipaNamba));
      request.body = json.encode({
        "lipaNumber": lipaNambaTextController.text.trim(),
      });
      request.headers.addAll({
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${Params.userToken}'
      });

      http.StreamedResponse response = await request.send();
      var decodeData = await http.Response.fromStream(response);
      final result = jsonDecode(decodeData.body);
      print("response ==> $result");

      if (response.statusCode == 200) {
        userProfile().then((value) => Get.to(
            () => SaveLipaNamba(profileModel: profileData.value),
            binding: InitialBinding()));
        const LoaderDialog().hideLoader();
      } else {
        const LoaderDialog().hideLoader();
        Fluttertoast.showToast(msg: result["message"]);
      }
    }
  }

  Future userProfile() async {
    try {
      var request = http.Request('GET', Uri.parse(Urls.userProfile));

      request.headers.addAll({
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${Params.userToken}'
      });

      http.StreamedResponse response = await request.send();
      var decodeData = await http.Response.fromStream(response);
      final result = jsonDecode(decodeData.body);

      if (response.statusCode == 200) {
        profileData.value = ProfileModel.fromJson(result);
        print("data ==> ${profileData.value.lipaNumber}");
        Params.businessName = profileData.value.businessName ?? "";
      }
    } catch (e) {
      isLoading(false);
      rethrow;
    }
  }
}

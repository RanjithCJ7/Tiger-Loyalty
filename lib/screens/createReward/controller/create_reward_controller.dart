import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:tiger_loyalty/const/Url.dart';
import 'package:tiger_loyalty/const/constant.dart';
import 'package:tiger_loyalty/screens/createReward/component/create_reward.dart';
import 'package:http/http.dart' as http;
import 'package:tiger_loyalty/widget/show_loader.dart';

class CreateRewardController extends GetxController {
  TextEditingController minController = TextEditingController();
  TextEditingController maxController = TextEditingController();
  TextEditingController percentageController = TextEditingController();
  RxList<RewardTableModel> rewardData = <RewardTableModel>[].obs;

  RxBool isPercentageAdded = false.obs;
  RxBool isLoading = false.obs;
  RxBool isValidMax = false.obs;
  RxString rewardNumber = "".obs;

  void addrewardPoints() {
    if (minController.text.isEmpty) {
      Fluttertoast.showToast(msg: "enter_min_msg".tr);
    } else if (maxController.text.isEmpty) {
      Fluttertoast.showToast(msg: "enter_max_msg".tr);
    } else if (percentageController.text.isEmpty) {
      Fluttertoast.showToast(msg: "enter_perc_msg".tr);
    } else {
      int min = int.parse(minController.text.trim().toString());
      int max = int.parse(maxController.text.trim().toString());

      if (min >= max) {
        Fluttertoast.showToast(msg: "enter_valid_max_msg".tr);
      } else {
        const LoaderDialog().showLoader();
        createReward().then((value) => const LoaderDialog().hideLoader());

        getRewardPoints();
        minController.clear();
        maxController.clear();
        percentageController.clear();
        isValidMax.value = false;
        Get.focusScope!.unfocus();
      }
    }
  }

  Future createReward() async {
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${Params.userToken}'
    };
    var request = http.Request('POST', Uri.parse(Urls.createReward));
    request.body = json.encode({
      "rewardNumber": rewardNumber.value,
      "min": minController.text,
      "max": maxController.text,
      "reward": percentageController.text.replaceAll("%", "")
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    var decodeData = await http.Response.fromStream(response);
    final result = jsonDecode(decodeData.body);
    print("response ==> $result");

    if (response.statusCode == 200) {
      getRewardPoints();
    } else {
      Fluttertoast.showToast(msg: result["message"]);
    }
  }

  Future getRewardPoints() async {
    var request = http.Request('GET', Uri.parse(Urls.getRewardPoints));

    request.headers.addAll({
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${Params.userToken}'
    });

    http.StreamedResponse response = await request.send();
    var decodeData = await http.Response.fromStream(response);
    final result = jsonDecode(decodeData.body);

    if (response.statusCode == 200) {
      List<Map<String, dynamic>> apiResponse =
          (json.decode(decodeData.body) as List<dynamic>)
              .map((data) => Map<String, dynamic>.from(data))
              .toList();
      rewardData.value = apiResponse
          .map((data) => RewardTableModel(
              id: data["id"].toString(),
              min: data["min"].toString(),
              max: data["max"].toString(),
              percentage: data["reward"].toString()))
          .toList();
      rewardData
          .sort((a, b) => (double.parse(a.min)).compareTo(double.parse(b.min)));
    } else {
      Fluttertoast.showToast(msg: result["message"]);
    }
  }

  Future removeReward(String id) async {
    var request = http.Request('DELETE', Uri.parse(Urls.deleteReward + id));

    request.headers.addAll({'Authorization': 'Bearer ${Params.userToken}'});

    http.StreamedResponse response = await request.send();
    var decodeData = await http.Response.fromStream(response);
    final result = jsonDecode(decodeData.body);

    if (response.statusCode == 200) {
      getRewardPoints();
      Fluttertoast.showToast(msg: result["message"]);
    } else {
      Fluttertoast.showToast(msg: result["message"]);
    }
  }
}

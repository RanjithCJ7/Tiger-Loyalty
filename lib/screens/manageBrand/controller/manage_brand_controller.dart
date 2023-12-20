import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:tiger_loyalty/const/Url.dart';
import 'package:tiger_loyalty/const/constant.dart';
import 'package:tiger_loyalty/screens/manageBrand/model/review_list_model.dart';
import 'package:tiger_loyalty/screens/manageBrand/model/review_states_model.dart';
import 'package:tiger_loyalty/screens/profile/controller/profile_controller.dart';

class ManagebrandController extends GetxController {
  ProfileController profileController = Get.put(ProfileController());
  RxBool isLoading = false.obs;
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
  TextEditingController businessName = TextEditingController();
  TextEditingController tinNumber = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController whatsappController = TextEditingController();
  TextEditingController facebookController = TextEditingController();
  TextEditingController instagramController = TextEditingController();
  TextEditingController twitterController = TextEditingController();

  RxString locationName = "".obs;
  RxBool isLocationSelected = false.obs;
  RxString filePath = "null".obs;
  XFile businessImage = XFile("null");
  Rx<ReviewStatesModel> reviewStatesModel = ReviewStatesModel().obs;
  RxList<ReviewListModel> reviewList = <ReviewListModel>[].obs;

  @override
  void onInit() {
    reviewStates();
    super.onInit();
  }

  Future uploadMenu() async {
    try {
      var request = http.MultipartRequest('POST', Uri.parse(Urls.uploadMenu));
      request.files
          .add(await http.MultipartFile.fromPath('menu', filePath.value));
      request.headers.addAll({
        'Content-Type': 'application/form',
        'Authorization': 'Bearer ${Params.userToken}'
      });

      http.StreamedResponse response = await request.send();
      var decodeData = await http.Response.fromStream(response);
      final result = jsonDecode(decodeData.body);
      print("upload menu response ==> $result");

      if (response.statusCode == 200) {
        Fluttertoast.showToast(msg: result["message"]);
      } else {
        Fluttertoast.showToast(msg: result["message"]);
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  Future uploadBusinessImage() async {
    try {
      isLoading(true);
      var request =
          http.MultipartRequest('POST', Uri.parse(Urls.uploadBusinessImage));
      request.files
          .add(await http.MultipartFile.fromPath('image', businessImage.path));
      request.headers.addAll({'Authorization': 'Bearer ${Params.userToken}'});

      http.StreamedResponse response = await request.send();
      var decodeData = await http.Response.fromStream(response);
      final result = jsonDecode(decodeData.body);
      print("upload businessimage response ==> $result");

      if (response.statusCode == 200) {
        isLoading(false);
        Fluttertoast.showToast(msg: result["message"]);
      } else {
        isLoading(false);
        Fluttertoast.showToast(msg: result["message"]);
      }
    } catch (e) {
      isLoading(false);
      rethrow;
    }
  }

  Future changeBusinessDetails() async {
    try {
      isLoading(true);
      var request = http.Request('PUT', Uri.parse(Urls.changeBusinessDetails));
      request.body = json.encode({
        "businessName": businessName.text.trim(),
        "category": selectedCategory.value,
        // "phoneNumber": profileController.profileModel.value.phoneNumber,
        // "address": profileController.profileModel.value.location,
        // "whatsapp": whatsappController.text.trim(),
        // "facebook": facebookController.text.trim(),
        // "instagram": instagramController.text.trim(),
        // "twitter": twitterController.text.trim(),
      });
      request.headers.addAll({
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${Params.userToken}'
      });

      http.StreamedResponse response = await request.send();
      var decodeData = await http.Response.fromStream(response);

      if (response.statusCode == 200) {
        print("changeBusinessDetails ==> ${decodeData.body}");
        profileController.userProfile();
        isLoading(false);
      } else {
        isLoading(false);
      }
    } catch (e) {
      isLoading(false);
      rethrow;
    }
  }

  Future updateContactDetails() async {
    if (phoneNumberController.text.isEmpty) {
      Fluttertoast.showToast(msg: "enter_number_msg".tr);
    } else if (phoneNumberController.text.length < 9) {
      Fluttertoast.showToast(msg: "enter_valid_number_msg".tr);
    } else if (whatsappController.text.isEmpty) {
      Fluttertoast.showToast(msg: "enter_whatsapp".tr);
    } else if (whatsappController.text.length < 9) {
      Fluttertoast.showToast(msg: "enter_valid_whatsapp".tr);
    } else if (isLocationSelected.value == false) {
      Fluttertoast.showToast(msg: "select_location".tr);
    } else if (facebookController.text.isEmpty) {
      Fluttertoast.showToast(msg: "enter_facebook".tr);
    } else if (!facebookController.text.trim().contains("facebook.com")) {
      Fluttertoast.showToast(msg: "enter_valid_facebook".tr);
    } else if (instagramController.text.isEmpty) {
      Fluttertoast.showToast(msg: "enter_instagram".tr);
    } else if (!instagramController.text.trim().contains("instagram.com")) {
      Fluttertoast.showToast(msg: "enter_valid_instagram".tr);
    } else if (twitterController.text.isEmpty) {
      Fluttertoast.showToast(msg: "enter_twitter".tr);
    } else if (!twitterController.text.trim().contains("twitter.com")) {
      Fluttertoast.showToast(msg: "enter_valid_twitter".tr);
    } else {
      try {
        isLoading(true);
        var request =
            http.Request('PUT', Uri.parse(Urls.changeBusinessDetails));
        request.body = json.encode({
          "businessName": profileController.profileModel.value.businessName,
          "category": profileController.profileModel.value.category,
          "phoneNumber": phoneNumberController.text.trim(),
          "location": locationName.value,
          "whatsapp": whatsappController.text.trim(),
          "facebook": facebookController.text.trim(),
          "instagram": instagramController.text.trim(),
          "twitter": twitterController.text.trim(),
        });
        request.headers.addAll({
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${Params.userToken}'
        });

        http.StreamedResponse response = await request.send();
        var decodeData = await http.Response.fromStream(response);
        final result = jsonDecode(decodeData.body);

        if (response.statusCode == 200) {
          Fluttertoast.showToast(msg: "saved_msg".tr);
          profileController.userProfile();

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

  Future reviewStates() async {
    try {
      isLoading(true);
      var request = http.Request('GET', Uri.parse(Urls.reviewStates));

      request.headers.addAll({
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${Params.userToken}'
      });

      http.StreamedResponse response = await request.send();
      var decodeData = await http.Response.fromStream(response);
      final result = jsonDecode(decodeData.body);

      if (response.statusCode == 200) {
        reviewStatesModel.value = ReviewStatesModel.fromJson(result);
        isLoading(false);
      } else {
        isLoading(false);
      }
    } catch (e) {
      isLoading(false);
      rethrow;
    }
  }

  Future fetchReview() async {
    try {
      var request = http.Request('GET', Uri.parse(Urls.reviewList));

      request.headers.addAll({
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${Params.userToken}'
      });

      http.StreamedResponse response = await request.send();
      var decodeData = await http.Response.fromStream(response);
      final result = jsonDecode(decodeData.body);

      if (response.statusCode == 200) {
        reviewList.value = (result as List)
            .map((data) => ReviewListModel.fromJson(data))
            .toList();
        print("review list ==> $reviewList");
      } else {}
    } catch (e) {
      rethrow;
    }
  }
}

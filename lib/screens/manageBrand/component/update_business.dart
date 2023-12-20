import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:tiger_loyalty/const/Image.dart';
import 'package:tiger_loyalty/screens/manageBrand/controller/manage_brand_controller.dart';
import 'package:tiger_loyalty/screens/profile/controller/profile_controller.dart';
import 'package:tiger_loyalty/screens/signup/component/pin_setup.dart';
import 'package:tiger_loyalty/widget/loader_widget.dart';
import '../../../src/pages/styles.dart';

class UpdateBusiness extends StatefulWidget {
  @override
  _UpdateBusinessState createState() => _UpdateBusinessState();
}

class _UpdateBusinessState extends State<UpdateBusiness> {
  ManagebrandController managebrandController =
      Get.find<ManagebrandController>();
  ProfileController profileController = Get.find<ProfileController>();
  final tinFormatter = CustomTextInputFormatter();

  @override
  void initState() {
    super.initState();
    managebrandController.businessName.text =
        profileController.profileModel.value.businessName ?? "";

    managebrandController.tinNumber.text =
        '${profileController.profileModel.value.tin!.substring(0, 3)}-${profileController.profileModel.value.tin!.substring(3, 6)}-${profileController.profileModel.value.tin!.substring(6)}';

    if (managebrandController.businessCategories
        .contains(profileController.profileModel.value.category!.tr)) {
      managebrandController.selectedCategory.value =
          profileController.profileModel.value.category!.tr;
    } else {
      managebrandController.selectedCategory.value = 'Business category'.tr;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Color(0xFF0E2ED4),
          ),
        ),
      ),
      body: Obx(
        () => profileController.isLoading.value ||
                managebrandController.isLoading.value
            ? const LoaderWidget()
            : Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Column(
                          children: [
                            Image.asset(
                              Images.updateBusinessDetails,
                              height: 50,
                            ),
                            const SizedBox(height: 15),
                            Text('change_business_details'.tr, style: label),
                          ],
                        ),
                        const SizedBox(height: 30),
                        Container(
                          margin: const EdgeInsets.only(
                              bottom: 5.0, left: 15.0, right: 15.0),
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: const Color(0xFFD9D9D9), width: 1),
                            color: const Color(0xFFF5F5F5),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: TextField(
                              controller: managebrandController.businessName,
                              decoration: InputDecoration(
                                hintText: profileController
                                        .profileModel.value.businessName ??
                                    "Boo Boo Restaurant",
                                hintStyle:
                                    const TextStyle(color: Color(0xFF808080)),
                                border: InputBorder.none,
                              ),
                              style: textFieldStyle,
                            ),
                          ),
                        ),
                        /* Container(
                          margin: const EdgeInsets.only(
                              bottom: 5.0, left: 15.0, right: 15.0),
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: const Color(0xFFD9D9D9), width: 1),
                            color: const Color(0xFFF5F5F5),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: TextField(
                              controller: managebrandController.tinNumber,
                              keyboardType: TextInputType.number,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.digitsOnly,
                                LengthLimitingTextInputFormatter(9),
                                tinFormatter,
                              ],
                              decoration: const InputDecoration(
                                hintText: '123-344-232',
                                hintStyle: TextStyle(color: Color(0xFF808080)),
                                border: InputBorder.none,
                              ),
                              style: textFieldStyle,
                            ),
                          ),
                        ), */
                        Container(
                          margin: const EdgeInsets.only(
                              bottom: 20.0, left: 15, right: 15),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: const Color(0xFFD9D9D9), width: 1),
                            color: const Color(0xFFF5F5F5),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              children: [
                                Expanded(
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton<String>(
                                      value: managebrandController
                                          .selectedCategory.value,
                                      onChanged: (newValue) {
                                        setState(() {
                                          managebrandController.selectedCategory
                                              .value = newValue ?? '';
                                        });
                                      },
                                      items: managebrandController
                                          .businessCategories
                                          .map((category) {
                                        return DropdownMenuItem<String>(
                                          value: category,
                                          child: Text(
                                            category,
                                            style: textFieldStyle.copyWith(
                                                color: managebrandController
                                                            .selectedCategory
                                                            .value ==
                                                        "business_category".tr
                                                    ? const Color(0XFF808080)
                                                    : Colors.black),
                                          ),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: TextButton(
                            onPressed: () {
                              if (managebrandController
                                  .businessName.text.isEmpty) {
                                Fluttertoast.showToast(
                                    msg: "enter_business_name_msg".tr);
                              } /* else if (managebrandController
                                  .tinNumber.text.isEmpty) {
                                Fluttertoast.showToast(msg: "enter_tin_msg".tr);
                              } else if (managebrandController
                                      .tinNumber.text.length <
                                  11) {
                                Fluttertoast.showToast(
                                    msg: "enter_valid_tin_msg".tr);
                              } */
                              else if (managebrandController
                                      .selectedCategory.value ==
                                  "Business category") {
                                Fluttertoast.showToast(
                                    msg: "choose_category".tr);
                              } else {
                                managebrandController.changeBusinessDetails();
                              }
                            },
                            style: btnGold2,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: SizedBox(
                                width: double.infinity,
                                child: Text(
                                  'update'.tr,
                                  style: btnGoldText2,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}

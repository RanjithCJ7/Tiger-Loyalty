import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:tiger_loyalty/const/Image.dart';
import 'package:tiger_loyalty/initial_binding.dart';
import 'package:tiger_loyalty/screens/manageBrand/component/edit_address.dart';
import 'package:tiger_loyalty/screens/manageBrand/controller/manage_brand_controller.dart';
import 'package:tiger_loyalty/screens/profile/controller/profile_controller.dart';
import 'package:tiger_loyalty/widget/loader_widget.dart';

import '../../../src/pages/styles.dart';

// ignore: must_be_immutable
class UpdateContact extends StatefulWidget {
  UpdateContact({super.key});

  @override
  State<UpdateContact> createState() => _UpdateContactState();
}

class _UpdateContactState extends State<UpdateContact> {
  ManagebrandController managebrandController =
      Get.find<ManagebrandController>();

  ProfileController profileController = Get.find<ProfileController>();

  @override
  void initState() {
    if (profileController.profileModel.value.phoneNumber != null) {
      managebrandController.phoneNumberController.text =
          profileController.profileModel.value.phoneNumber!;
    }
    if (profileController.profileModel.value.whatsapp != null) {
      managebrandController.whatsappController.text =
          profileController.profileModel.value.whatsapp!;
    }
    if (profileController.profileModel.value.facebook != null) {
      managebrandController.facebookController.text =
          profileController.profileModel.value.facebook!;
    }
    if (profileController.profileModel.value.instagram != null) {
      managebrandController.instagramController.text =
          profileController.profileModel.value.instagram!;
    }
    if (profileController.profileModel.value.twitter != null) {
      managebrandController.twitterController.text =
          profileController.profileModel.value.twitter!;
    }
    if (profileController.profileModel.value.location != null) {
      managebrandController.isLocationSelected.value = true;
      managebrandController.locationName.value =
          profileController.profileModel.value.location!;
    }
    super.initState();
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
        title: Text('contact_address'.tr,
            style: label.copyWith(color: Colors.black)),
      ),
      body: Obx(
        () => profileController.isLoading.value ||
                managebrandController.isLoading.value
            ? const LoaderWidget()
            : SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    SizedBox(height: Get.height * 0.05),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 30.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xFFF5F5F5)),
                        color: const Color(0xFFD9D9D9),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(right: 10),
                              child: Image.asset(Images.phoneImg),
                            ),
                            Expanded(
                              child: TextField(
                                controller:
                                    managebrandController.phoneNumberController,
                                keyboardType: TextInputType.number,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.digitsOnly,
                                  LengthLimitingTextInputFormatter(10),
                                ],
                                decoration: InputDecoration(
                                  hintText: 'phone'.tr,
                                  hintStyle:
                                      const TextStyle(color: Color(0xFF808080)),
                                  border: InputBorder.none,
                                ),
                                style: textFieldStyle,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 30.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xFFF5F5F5)),
                        color: const Color(0xFFD9D9D9),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(right: 10),
                              child: Image.asset(Images.whatsappImg),
                            ),
                            Expanded(
                              child: TextField(
                                controller:
                                    managebrandController.whatsappController,
                                keyboardType: TextInputType.number,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.digitsOnly,
                                  LengthLimitingTextInputFormatter(10),
                                ],
                                decoration: InputDecoration(
                                  hintText: 'whatsapp'.tr,
                                  hintStyle:
                                      const TextStyle(color: Color(0xFF808080)),
                                  border: InputBorder.none,
                                ),
                                style: textFieldStyle,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    GestureDetector(
                      onTap: () async {
                        PermissionStatus status =
                            await Permission.location.status;
                        if (status.isGranted) {
                          Get.to(() => const EditAddressPicker(),
                                  binding: InitialBinding())!
                              .then((value) {});
                        } else if (status.isDenied) {
                          Permission.location.request();
                        } else if (status.isPermanentlyDenied) {
                          Permission.location.request();
                        }
                      },
                      child: Container(
                        width: Get.width,
                        margin: const EdgeInsets.only(
                            bottom: 20.0, left: 30, right: 30),
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 15),
                        // alignment: Alignment.center,
                        decoration: BoxDecoration(
                          border: Border.all(color: const Color(0xFFF5F5F5)),
                          color: const Color(0xFFD9D9D9),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Row(
                          children: [
                            Image.asset(Images.locationImg),
                            const SizedBox(width: 10),
                            SizedBox(
                              width: Get.width * 0.7,
                              child: Text(
                                managebrandController
                                            .isLocationSelected.value ==
                                        false
                                    ? 'location'.tr
                                    : managebrandController.locationName.value,
                                textAlign: TextAlign.start,
                                style: textFieldStyle.copyWith(
                                  color: managebrandController
                                              .isLocationSelected.value ==
                                          false
                                      ? const Color(0xFF808080)
                                      : Colors.black,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                    Container(
                      width: double.infinity,
                      margin: const EdgeInsets.only(left: 30),
                      child: Text(
                        'social_media'.tr,
                        style: settingsTitle,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 30.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xFFF5F5F5)),
                        color: const Color(0xFFD9D9D9),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(right: 10),
                              child: Image.asset(Images.facebookImg),
                            ),
                            Expanded(
                              child: TextField(
                                controller:
                                    managebrandController.facebookController,
                                decoration: InputDecoration(
                                  hintText: 'facebook'.tr,
                                  hintStyle:
                                      const TextStyle(color: Color(0xFF808080)),
                                  border: InputBorder.none,
                                ),
                                style: textFieldStyle,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 30.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xFFF5F5F5)),
                        color: const Color(0xFFD9D9D9),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(right: 10),
                              child: Image.asset(Images.instaImg),
                            ),
                            Expanded(
                              child: TextField(
                                controller:
                                    managebrandController.instagramController,
                                decoration: InputDecoration(
                                  hintText: 'instagram'.tr,
                                  hintStyle:
                                      const TextStyle(color: Color(0xFF808080)),
                                  border: InputBorder.none,
                                ),
                                style: textFieldStyle,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 30.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xFFF5F5F5)),
                        color: const Color(0xFFD9D9D9),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(right: 10),
                              child: Image.asset(Images.twitterImg),
                            ),
                            Expanded(
                              child: TextField(
                                controller:
                                    managebrandController.twitterController,
                                decoration: InputDecoration(
                                  hintText: 'x'.tr,
                                  hintStyle:
                                      const TextStyle(color: Color(0xFF808080)),
                                  border: InputBorder.none,
                                ),
                                style: textFieldStyle,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: TextButton(
                        onPressed: () {
                          managebrandController.updateContactDetails();
                        },
                        style: btnGold2,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: SizedBox(
                            width: double.infinity,
                            child: Text(
                              'save'.tr,
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
      ),
    );
  }
}

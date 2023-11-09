import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiger_loyalty/widget/select_image.dart';
import 'styles.dart';

class Charity extends StatefulWidget {
  @override
  _CharityState createState() => _CharityState();
}

class _CharityState extends State<Charity> {
  String filePath = "null";
  TextEditingController nameController = TextEditingController();
  TextEditingController descController = TextEditingController();

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
            Icons.arrow_back_ios_new_rounded,
            color: Color(0xFF0E2ED4),
          ),
        ),
        title:
            Text('New Promotion', style: label.copyWith(color: Colors.black)),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: Get.height * 0.02, horizontal: Get.height * 0.03),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Details',
                style: settingsTitle,
              ),
              SizedBox(height: Get.height * 0.02),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xFFF5F5F5)),
                  color: const Color(0xFFD9D9D9),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    controller: nameController,
                    decoration: const InputDecoration(
                      hintText: 'Name',
                      hintStyle: TextStyle(color: Color(0xFF808080)),
                      border: InputBorder.none,
                    ),
                    style: textFieldStyle,
                  ),
                ),
              ),
              SizedBox(height: Get.height * 0.01),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xFFF5F5F5)),
                  color: const Color(0xFFD9D9D9),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    controller: descController,
                    decoration: const InputDecoration(
                      hintText: 'Description',
                      hintStyle: TextStyle(color: Color(0xFF808080)),
                      border: InputBorder.none,
                    ),
                    maxLines: 20,
                    style: textFieldStyle,
                  ),
                ),
              ),
              SizedBox(height: Get.height * 0.02),
              GestureDetector(
                onTap: () async {
                  ImageUploadHelper().showImagePicker(context, (p0) {
                    if (p0 != null) {
                      filePath = p0.path;
                    }
                  });
                },
                child: Container(
                  height: Get.height * 0.06,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xFFF5F5F5)),
                    color: const Color(0xFFD9D9D9),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Row(
                    children: [
                      SizedBox(width: Get.width * 0.04),
                      const Icon(
                        Icons.image,
                        color: Colors.black,
                      ),
                      SizedBox(width: Get.width * 0.04),
                      Text(
                        "Cover Photo",
                        style: textFieldStyle.copyWith(
                            color: const Color(0xFF808080)),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: Get.height * 0.04),
              TextButton(
                onPressed: () {
                  showPreview();
                },
                style: btnGold2,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: SizedBox(
                    width: Get.width,
                    child: Text(
                      'Preview',
                      style: btnGoldText2,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }

  void showPreview() {
    Get.bottomSheet(
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15), topRight: Radius.circular(15))),
        Container(
          height: Get.height * 0.8,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15), topRight: Radius.circular(15))),
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.all(Get.height * 0.03),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Charity',
                            style: alertTitle,
                          ),
                        ],
                      ),
                      SizedBox(height: Get.height * 0.02),
                      Container(
                        height: Get.height * 0.25,
                        width: Get.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          image: DecorationImage(
                              image: FileImage(File(filePath)),
                              fit: BoxFit.fill),
                        ),
                      ),
                      SizedBox(height: Get.height * 0.02),
                      Text(
                        nameController.text,
                        style: const TextStyle(
                            fontFamily: "Inter",
                            fontWeight: FontWeight.w700,
                            fontSize: 22,
                            color: Colors.black),
                      ),
                      SizedBox(height: Get.height * 0.01),
                      Text(
                        descController.text,
                        style: const TextStyle(
                            fontFamily: "Inter",
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: Color(0xFF8E8E8E)),
                      ),
                      TextButton(
                        onPressed: () {
                          Get.close(1);
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          backgroundColor: const Color(0xFFF5F5F5),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: SizedBox(
                            width: Get.width,
                            child: Text(
                              'Publish',
                              style: btnGoldText2.copyWith(color: Colors.black),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 15,
                right: 10,
                child: InkWell(
                  onTap: () {
                    Get.close(1);
                  },
                  child: Container(
                    margin: const EdgeInsets.only(
                      left: 30.0,
                    ),
                    child: Image.asset('assets/close.png'),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

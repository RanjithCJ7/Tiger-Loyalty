import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:get/get.dart';
import 'package:smooth_star_rating_null_safety/smooth_star_rating_null_safety.dart';
import 'package:tiger_loyalty/const/Image.dart';
import 'package:tiger_loyalty/initial_binding.dart';
import 'package:tiger_loyalty/screens/manageBrand/controller/manage_brand_controller.dart';
import 'package:tiger_loyalty/screens/profile/controller/profile_controller.dart';
import 'package:tiger_loyalty/screens/updateRewardTable/component/update_reward_table.dart';
import 'package:tiger_loyalty/src/pages/reviews.dart';
import 'package:tiger_loyalty/screens/manageBrand/component/update_business.dart';
import 'package:tiger_loyalty/screens/manageBrand/component/update_contact.dart';
import 'package:tiger_loyalty/widget/loader_widget.dart';
import 'package:tiger_loyalty/widget/select_image.dart';
import '../../../src/pages/styles.dart';

class RewardData {
  String text;
  String image;

  RewardData({required this.text, required this.image});
}

class EditReward extends StatefulWidget {
  @override
  _EditRewardState createState() => _EditRewardState();
}

class _EditRewardState extends State<EditReward> {
  ProfileController profileController = Get.find<ProfileController>();
  ManagebrandController managebrandController =
      Get.find<ManagebrandController>();

  List<RewardData> settingData = [
    RewardData(
        text: 'change_business_details'.tr, image: Images.changeBusiness),
    RewardData(text: 'add_menu'.tr, image: Images.addMenu),
    RewardData(text: 'update_reward_table'.tr, image: Images.updateReward),
    RewardData(text: 'update_contacts'.tr, image: Images.updateContact)
  ];

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
            : Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Stack(
                              children: [
                                Align(
                                  child: Container(
                                    padding: const EdgeInsets.all(2),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            color: const Color(0xFFCFAF4E),
                                            width: 3)),
                                    child: ValueListenableBuilder(
                                        valueListenable:
                                            profileController.notifieImage,
                                        builder: (context, value, child) {
                                          return profileController.profileModel
                                                      .value.businessimage !=
                                                  null
                                              ? CircleAvatar(
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  backgroundImage: MemoryImage(
                                                      profileController
                                                          .businessImageURL
                                                          .bodyBytes),
                                                  radius: Get.height * 0.06,
                                                )
                                              : CircleAvatar(
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  backgroundImage: AssetImage(
                                                    Images.editReward,
                                                  ),
                                                  radius: Get.height * 0.06,
                                                );
                                        }), /* CircleAvatar(
                                      backgroundImage:
                                          AssetImage(Images.editReward),
                                      radius: Get.height * 0.06,
                                    ), */
                                  ),
                                ),
                                Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: GestureDetector(
                                    onTap: () {
                                      ImageUploadHelper().showCropImagePicker(
                                          context, true, (p0) {
                                        if (p0 != null) {
                                          managebrandController.businessImage =
                                              p0;
                                          showDialog(
                                            context: context,
                                            barrierColor:
                                                Colors.black.withOpacity(0.7),
                                            builder: (BuildContext context) {
                                              return Container(
                                                padding:
                                                    const EdgeInsets.all(20),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Image.file(File(
                                                        managebrandController
                                                            .businessImage
                                                            .path)),
                                                    const SizedBox(height: 20),
                                                    SizedBox(
                                                      width: double.infinity,
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .stretch,
                                                        children: [
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceAround,
                                                            children: [
                                                              TextButton(
                                                                onPressed: () {
                                                                  Get.close(1);
                                                                },
                                                                style: photoBtn,
                                                                child: Padding(
                                                                  padding: const EdgeInsets
                                                                      .symmetric(
                                                                      horizontal:
                                                                          20,
                                                                      vertical:
                                                                          5),
                                                                  child: Text(
                                                                      'cancel'
                                                                          .tr,
                                                                      style:
                                                                          photoText),
                                                                ),
                                                              ),
                                                              TextButton(
                                                                onPressed: () {
                                                                  Get.close(1);
                                                                  managebrandController
                                                                      .uploadBusinessImage()
                                                                      .then((value) =>
                                                                          profileController
                                                                              .userProfile());
                                                                },
                                                                style: photoBtn,
                                                                child: Padding(
                                                                  padding: const EdgeInsets
                                                                      .symmetric(
                                                                      horizontal:
                                                                          20,
                                                                      vertical:
                                                                          5),
                                                                  child: Row(
                                                                    children: [
                                                                      Container(
                                                                        margin: const EdgeInsets
                                                                            .only(
                                                                            right:
                                                                                5.0),
                                                                        child: Image.asset(
                                                                            'assets/tick.png'),
                                                                      ),
                                                                      Text(
                                                                          'choose'
                                                                              .tr,
                                                                          style:
                                                                              photoText),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                          );
                                        }
                                      });
                                    },
                                    child: CircleAvatar(
                                      radius: 15,
                                      backgroundColor: Colors.white,
                                      child: Container(
                                        padding: const EdgeInsets.all(2),
                                        decoration: BoxDecoration(
                                            color: const Color(0xFF0E2ED4),
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                                color: Colors.white, width: 3)),
                                        child: const Icon(
                                          Icons.camera_alt,
                                          color: Colors.white,
                                          size: 20,
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        Column(
                          children: [
                            Text(
                                profileController
                                        .profileModel.value.businessName ??
                                    "",
                                style: invoiceLabel),
                            const SizedBox(height: 10),
                            Text(
                                profileController.profileModel.value.location ??
                                    "",
                                style: desc),
                          ],
                        ),
                        const SizedBox(height: 10),
                        TextButton(
                          onPressed: () {
                            Get.to(() => Review(), binding: InitialBinding());
                          },
                          child: Column(
                            children: [
                              SmoothStarRating(
                                onRatingChanged: (rating) {
                                  Get.to(() => Review(),
                                      binding: InitialBinding());
                                },
                                allowHalfRating: true,
                                starCount: 5,
                                rating: managebrandController.reviewStatesModel
                                        .value.averageRating ??
                                    0,
                                size: 35.0,
                                color: Colors.black,
                                borderColor: Colors.black,
                                spacing: 0.0,
                              ),
                              const SizedBox(height: 10),
                              IntrinsicHeight(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                            "${managebrandController.reviewStatesModel.value.averageRating ?? "0"}",
                                            style: rewardText),
                                        const Icon(
                                          Icons.star_rounded,
                                          color: Color(0xFFCFAF4E),
                                        ),
                                      ],
                                    ),
                                    const VerticalDivider(
                                      color: Colors.black,
                                      thickness: 1,
                                    ),
                                    Row(
                                      children: [
                                        Image.asset(
                                          Images.comment,
                                          height: Get.height * 0.023,
                                        ),
                                        const SizedBox(width: 5),
                                        Text(
                                            "${managebrandController.reviewStatesModel.value.numberOfReviews ?? "0"}",
                                            style: rewardText),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 40),
                        _rewardItems(),
                      ],
                    ),
                  ),
                  Positioned(
                    right: 10,
                    top: 30,
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'edit_brands'.tr,
                        style: const TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF0E2ED4),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  void _navigateToScreen(BuildContext context, String title) {
    switch (title) {
      case 'Change business details' || 'Badili taarifa za biashara':
        Get.to(() => UpdateBusiness(), binding: InitialBinding());

        break;
      case 'Add menu (pdf)' || 'Weka menu (pdf)':
        selectPDFBottomSheet(context);
        break;
      case 'Update reward table' || 'Rekebisha jedwali la tuzo':
        Get.to(
            () => UpdateRewardTable(
                rewardNumber:
                    profileController.profileModel.value.rewardNumber!),
            binding: InitialBinding());

        break;
      case 'Update Contacts' || 'Rekebisha mawasiliano':
        Get.to(() => UpdateContact(), binding: InitialBinding());
        break;
      default:
        break;
    }
  }

  Widget _rewardItems() {
    return Column(
      children: settingData.map((data) {
        return _rewardItem(data.text, data.image);
      }).toList(),
    );
  }

  Widget _rewardItem(String title, String image) {
    return Builder(
      builder: (BuildContext context) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 2),
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xFFF5F5F5)),
            color: const Color(0xFFF5F5F5),
            borderRadius: BorderRadius.circular(5),
          ),
          child: TextButton(
            onPressed: () {
              _navigateToScreen(context, title);
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.only(right: 10),
                    child: Image.asset(
                      image,
                      height: 20,
                      color: const Color(0xFFACACAC),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF000000),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  selectPDFBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15))),
      builder: (BuildContext context) {
        return StatefulBuilder(builder: (context, setState) {
          return Container(
            margin: const EdgeInsets.only(bottom: 50.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        Get.close(1);
                      },
                      child: Image.asset('assets/close.png'),
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'upload_menu'.tr,
                        style: changeLabel,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 30.0),
                      SizedBox(
                        width: double.infinity,
                        height: Get.height * 0.06,
                        child: TextButton(
                          onPressed: () async {
                            FilePickerResult? result =
                                await FilePicker.platform.pickFiles(
                              type: FileType.custom,
                              allowedExtensions: ['pdf'],
                            );

                            setState(() {
                              if (result != null) {
                                managebrandController.filePath.value =
                                    result.paths.first!;
                              }
                            });
                          },
                          style: btnGrey,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(right: 10),
                                child: Image.asset(
                                  Images.uploadMenu,
                                  height: 20,
                                ),
                              ),
                              Text(
                                managebrandController.filePath.value == "null"
                                    ? 'upload_file'.tr
                                    : managebrandController.filePath.value
                                        .split('/')
                                        .last,
                                style: btnGreyText,
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      SizedBox(
                        width: double.infinity,
                        height: 53,
                        child: TextButton(
                          onPressed: () {
                            if (managebrandController.filePath.value ==
                                "null") {
                              Fluttertoast.showToast(msg: "select_menu_msg".tr);
                            } else {
                              Get.close(1);
                              managebrandController.uploadMenu();
                            }
                          },
                          style: btnGrey,
                          child: Text(
                            'save_menu'.tr,
                            style: btnGreyText,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
      },
    ).then((value) {
      managebrandController.filePath.value = "null";
    });
  }
}

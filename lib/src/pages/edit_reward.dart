import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:smooth_star_rating_null_safety/smooth_star_rating_null_safety.dart';
import 'package:tiger_loyalty/const/Image.dart';
import 'package:tiger_loyalty/src/pages/reviews.dart';
import 'package:tiger_loyalty/src/pages/update_business.dart';
import 'package:tiger_loyalty/src/pages/update_contact.dart';
import 'package:tiger_loyalty/src/pages/update_reward_table.dart';
import 'package:tiger_loyalty/widget/select_image.dart';
import 'styles.dart';

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
  List<RewardData> settingData = [
    RewardData(text: 'Change business details', image: Images.changeBusiness),
    RewardData(text: 'Add menu (pdf)', image: Images.addMenu),
    RewardData(text: 'Update reward table', image: Images.updateReward),
    RewardData(text: 'Update Contacts', image: Images.updateContact)
  ];
  String filePath = "null";

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
      body: Column(
        children: [
          Expanded(
            child: Stack(
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
                                  child: CircleAvatar(
                                    backgroundImage:
                                        AssetImage(Images.editReward),
                                    radius: Get.height * 0.06,
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: GestureDetector(
                                  onTap: () {
                                    ImageUploadHelper().showCropImagePicker(
                                        context, true, (p0) {
                                      if (p0 != null) {}
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
                          Text('Boo Boo Restaurant', style: invoiceLabel),
                          const SizedBox(height: 10),
                          Text('Magomeni Mikumi, Dar es salaam', style: desc),
                        ],
                      ),
                      const SizedBox(height: 10),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => Review(),
                            ),
                          );
                        },
                        child: Column(
                          children: [
                            SmoothStarRating(
                              allowHalfRating: false,
                              onRatingChanged: (value) {
                                setState(() {});
                              },
                              starCount: 5,
                              rating: 4,
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
                                      Text('4.0', style: rewardText),
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
                                      Text('213', style: rewardText),
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
                    onPressed: () {
                      showDialog(
                        context: context,
                        barrierColor: Colors.black.withOpacity(0.7),
                        builder: (BuildContext context) {
                          return Container(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(Images.restaurantModal),
                                const SizedBox(height: 20),
                                // ElevatedButton(
                                //   onPressed: () {
                                //     Navigator.of(context).pop();
                                //   },
                                //   child: Text('Close'),
                                // ),
                                SizedBox(
                                  width: double.infinity,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          TextButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            style: photoBtn,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 20,
                                                      vertical: 5),
                                              child: Text('Cancel',
                                                  style: photoText),
                                            ),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              // Navigator.of(context).push(
                                              //   MaterialPageRoute(
                                              //     builder: (context) => CreateAccount(),
                                              //   ),
                                              // );
                                            },
                                            style: photoBtn,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 20,
                                                      vertical: 5),
                                              child: Row(
                                                children: [
                                                  Container(
                                                    margin:
                                                        const EdgeInsets.only(
                                                            right: 5.0),
                                                    child: Image.asset(
                                                        'assets/tick.png'),
                                                  ),
                                                  Text('Choose',
                                                      style: photoText),
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
                    },
                    child: const Text(
                      'Edit brand',
                      style: TextStyle(
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
        ],
      ),
    );
  }

  void _navigateToScreen(BuildContext context, String title) {
    switch (title) {
      case 'Change business details':
        Get.to(() => UpdateBusiness(name: "Boo Boo Restaurant"));

        break;
      case 'Add menu (pdf)':
        selectPDFBottomSheet(context);
        break;
      case 'Update reward table':
        Get.to(() => UpdateRewardTable());

        break;
      case 'Update Contacts':
        Get.to(() => UpdateContact());
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
          margin: const EdgeInsets.symmetric(horizontal: 10.0),
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xFFF5F5F5)),
            color: const Color(0xFFD9D9D9),
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
                      style: settingsLabel,
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
                        'UPLOAD MENU',
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
                                filePath = result.paths.first!;
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
                                filePath == "null"
                                    ? 'Upload file'
                                    : filePath.split('/').last,
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
                            Get.close(1);
                            filePath = "null";
                          },
                          style: btnGrey,
                          child: Text(
                            'SAVE',
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
      filePath = "null";
    });
  }
}

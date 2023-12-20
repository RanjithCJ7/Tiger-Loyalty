import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:tiger_loyalty/initial_binding.dart';
import 'package:tiger_loyalty/screens/createLipaNamba/component/add_lipa_namba.dart';
import 'package:tiger_loyalty/screens/createReward/controller/create_reward_controller.dart';
import 'package:tiger_loyalty/screens/profile/model/profile_model.dart';
import 'package:tiger_loyalty/widget/loader_widget.dart';
import 'package:tiger_loyalty/widget/show_loader.dart';
import '../../../src/pages/styles.dart';

class RewardTableModel {
  String id, min, max, percentage;
  RewardTableModel({
    required this.id,
    required this.min,
    required this.max,
    required this.percentage,
  });
}

// ignore: must_be_immutable
class CreateReward extends StatefulWidget {
  ProfileModel profileModel;
  CreateReward({required this.profileModel});

  @override
  _CreateRewardState createState() => _CreateRewardState();
}

class _CreateRewardState extends State<CreateReward> {
  CreateRewardController createRewardController =
      Get.find<CreateRewardController>();

  @override
  void initState() {
    super.initState();
    createRewardController.rewardNumber.value =
        widget.profileModel.rewardNumber!;
    print("reward number ==> ${widget.profileModel.rewardNumber}");
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => createRewardController.isLoading.value
            ? const LoaderWidget()
            : Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Column(
                          children: [
                            Container(
                              alignment: Alignment.center,
                              margin:
                                  const EdgeInsets.symmetric(vertical: 15.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'get_started'.tr,
                                    style: label,
                                  ),
                                  const SizedBox(
                                    height: 35.0,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        alignment: Alignment.center,
                                        child: Text(
                                          'reward_desc'.tr,
                                          style: desc,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 35.0,
                                      ),
                                      if (createRewardController
                                          .rewardData.isNotEmpty) ...[
                                        Container(
                                          alignment: Alignment.center,
                                          child: Text(
                                            'reward_table'.tr,
                                            style: labelSm,
                                            textAlign: TextAlign.center,
                                          ),
                                        )
                                      ],
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      if (createRewardController
                                          .rewardData.isNotEmpty) ...[
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 5, vertical: 5),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              SizedBox(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.29,
                                                  child: Text(
                                                    "min".tr,
                                                    style: const TextStyle(
                                                      fontFamily: 'Inter',
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w800,
                                                    ),
                                                  )),
                                              SizedBox(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.29,
                                                  child: Text(
                                                    "max".tr,
                                                    style: const TextStyle(
                                                      fontFamily: 'Inter',
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w800,
                                                    ),
                                                  )),
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.19,
                                                child: Text(
                                                  "reward_perc".tr,
                                                  style: const TextStyle(
                                                    fontFamily: 'Inter',
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w800,
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        ListView.builder(
                                          padding: EdgeInsets.zero,
                                          shrinkWrap: true,
                                          itemCount: createRewardController
                                              .rewardData.length,
                                          itemBuilder: (context, index) {
                                            var data = createRewardController
                                                .rewardData[index];
                                            return Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 5),
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.055,
                                              decoration: BoxDecoration(
                                                  color: index.isEven
                                                      ? const Color(0XFFD9D9D9)
                                                      : Colors.white),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  SizedBox(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.25,
                                                    child: Text(
                                                      "${double.parse(data.min).round()}",
                                                      style: const TextStyle(
                                                        fontFamily: "Inter",
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 16,
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.25,
                                                    child: Text(
                                                      "${double.parse(data.max).round()}",
                                                      style: const TextStyle(
                                                        fontFamily: "Inter",
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 16,
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.20,
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          data.percentage,
                                                          style:
                                                              const TextStyle(
                                                            fontFamily: "Inter",
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontSize: 16,
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                            width: 5),
                                                        GestureDetector(
                                                          onTap: () {
                                                            const LoaderDialog()
                                                                .showLoader();
                                                            createRewardController
                                                                .removeReward(
                                                                    data.id)
                                                                .then((value) =>
                                                                    const LoaderDialog()
                                                                        .hideLoader());
                                                          },
                                                          child: Container(
                                                            decoration:
                                                                const BoxDecoration(
                                                              color: Color(
                                                                  0xffDA001E),
                                                              shape: BoxShape
                                                                  .circle,
                                                            ),
                                                            child: const Icon(
                                                              Icons.remove,
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          ),
                                                        )
                                                        // Image.asset(
                                                        //     'assets/remove.png'),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        )
                                      ],
                                      if (createRewardController
                                          .rewardData.isNotEmpty) ...[
                                        const SizedBox(
                                          height: 20.0,
                                        )
                                      ],
                                      Container(
                                        margin:
                                            const EdgeInsets.only(bottom: 15.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              createRewardController
                                                      .rewardData.isEmpty
                                                  ? 'create_reward_Tabel'.tr
                                                  : 'add_field'.tr,
                                              style: labelSm,
                                              textAlign: TextAlign.center,
                                            ),
                                            if (createRewardController
                                                .isValidMax.value) ...[
                                              SizedBox(
                                                width: Get.width * 0.3,
                                                child: Text('add_max_val'.tr,
                                                    maxLines: 2,
                                                    style: labelSm.copyWith(
                                                        color: Colors.red),
                                                    textAlign: TextAlign.left),
                                              )
                                            ]
                                          ],
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.37,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.07,
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                              color: const Color(0xFFD9D9D9),
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            child: TextField(
                                              controller: createRewardController
                                                  .minController,
                                              keyboardType:
                                                  TextInputType.number,
                                              inputFormatters: <TextInputFormatter>[
                                                FilteringTextInputFormatter
                                                    .digitsOnly
                                              ],
                                              decoration: InputDecoration(
                                                hintText: 'min_spend'.tr,
                                                hintStyle: const TextStyle(
                                                    color: Color(0xFF808080)),
                                                border: InputBorder.none,
                                              ),
                                              style: textFieldStyle,
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                          // Spacer(),
                                          Text(
                                            '-',
                                            style: label,
                                          ),
                                          // Spacer(),
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.37,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.07,
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                              color: const Color(0xFFD9D9D9),
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            child: TextField(
                                              controller: createRewardController
                                                  .maxController,
                                              keyboardType:
                                                  TextInputType.number,
                                              inputFormatters: <TextInputFormatter>[
                                                FilteringTextInputFormatter
                                                    .digitsOnly
                                              ],
                                              onChanged: (value) {
                                                if (value.isNotEmpty &&
                                                    int.parse(value) <
                                                        int.parse(
                                                            createRewardController
                                                                .minController
                                                                .text)) {
                                                  createRewardController
                                                      .isValidMax.value = true;
                                                } else if (value.isNotEmpty &&
                                                    int.parse(value) ==
                                                        int.parse(
                                                            createRewardController
                                                                .minController
                                                                .text)) {
                                                  createRewardController
                                                      .isValidMax.value = true;
                                                } else {
                                                  createRewardController
                                                      .isValidMax.value = false;
                                                }
                                              },
                                              decoration: InputDecoration(
                                                hintText: 'max_spend'.tr,
                                                hintStyle: const TextStyle(
                                                    color: Color(0xFF808080)),
                                                border: InputBorder.none,
                                              ),
                                              style: textFieldStyle,
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 15.0,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.37,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.07,
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                              color: const Color(0xFFD9D9D9),
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            child: Container(
                                              margin: const EdgeInsets.only(
                                                  left: 20),
                                              child: TextField(
                                                controller:
                                                    createRewardController
                                                        .percentageController,
                                                keyboardType:
                                                    const TextInputType
                                                        .numberWithOptions(
                                                        decimal: true),
                                                inputFormatters: [
                                                  OneDotFormatter(),
                                                  PercentageFormatter(),
                                                  FilteringTextInputFormatter
                                                      .allow(RegExp(
                                                          r'^\d*\.?\d{0,2}'))
                                                ],
                                                onChanged: (text) {
                                                  if (!createRewardController
                                                      .isPercentageAdded
                                                      .value) {
                                                    if (text.endsWith('%')) {
                                                      createRewardController
                                                          .isPercentageAdded
                                                          .value = true;
                                                    } else {
                                                      createRewardController
                                                          .percentageController
                                                          .text = text + '%';
                                                      // Move the cursor to the end of the text
                                                      createRewardController
                                                              .percentageController
                                                              .selection =
                                                          TextSelection
                                                              .fromPosition(
                                                        TextPosition(
                                                            offset: createRewardController
                                                                    .percentageController
                                                                    .text
                                                                    .length -
                                                                1),
                                                      );
                                                      createRewardController
                                                          .isPercentageAdded
                                                          .value = true;
                                                    }
                                                  }
                                                  if (!text.endsWith('%')) {
                                                    createRewardController
                                                        .percentageController
                                                        .text = text + '%';
                                                    // Move the cursor to the end of the text
                                                    createRewardController
                                                            .percentageController
                                                            .selection =
                                                        TextSelection
                                                            .fromPosition(
                                                      TextPosition(
                                                          offset: createRewardController
                                                                  .percentageController
                                                                  .text
                                                                  .length -
                                                              1),
                                                    );
                                                    createRewardController
                                                        .isPercentageAdded
                                                        .value = true;
                                                  }
                                                },
                                                decoration:
                                                    const InputDecoration(
                                                  // suffixText: '%',
                                                  hintText: '%',
                                                  hintStyle: TextStyle(
                                                      color: Color(0xFF000000)),
                                                  border: InputBorder.none,
                                                ),
                                                style: textFieldStyle,
                                              ),
                                            ),
                                          ),
                                          const Spacer(),
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.37,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.07,
                                            decoration: BoxDecoration(
                                              color: const Color(0xFFD9D9D9),
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            child: TextButton(
                                              onPressed: () {
                                                createRewardController
                                                    .addrewardPoints();
                                              },
                                              style: btnGold2,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 8.0),
                                                child: Text(
                                                  'save'.tr,
                                                  style: btnGoldText2,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 80.0,
                                  ),
                                  SizedBox(
                                    width: Get.width * 0.45,
                                    child: Text(
                                      'change_config'.tr,
                                      style: desc,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20.0,
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      if (createRewardController
                                          .rewardData.isEmpty) {
                                        Fluttertoast.showToast(
                                            msg: "add_data_msg".tr);
                                      } else {
                                        Get.to(
                                            () => AddLipaNamba(
                                                profileModel:
                                                    widget.profileModel),
                                            binding: InitialBinding());
                                        // Get.offAll(() => const BottomTab(),
                                        //     binding: InitialBinding());
                                      }
                                    },
                                    style: btnGold2,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10),
                                      child: SizedBox(
                                        width: double.infinity,
                                        child: Text(
                                          'proceed'.tr,
                                          style: btnGoldText2,
                                          textAlign: TextAlign.center,
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
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}

class OneDotFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text == '.') {
      // Prevent entering a dot if it's the first character.
      return oldValue;
    } else if (newValue.text.split('.').length > 2) {
      // Allow only one dot.
      return oldValue;
    }
    return newValue;
  }
}

class PercentageFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final newText = newValue.text;

    // Ensure that the '%' character is not typed and restrict any input after it.
    if (newText.contains('%')) {
      final textBeforePercentage = newText.substring(0, newText.indexOf('%'));
      return TextEditingValue(
        text: textBeforePercentage,
        selection: TextSelection.collapsed(offset: textBeforePercentage.length),
      );
    }

    return newValue;
  }
}

import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:tiger_loyalty/src/pages/bottom_tab.dart';

import 'package:tiger_loyalty/widget/loader_widget.dart';
import 'styles.dart';

class RewardTableModel {
  String min, max, percentage;
  RewardTableModel(
      {required this.min, required this.max, required this.percentage});
}

class CreateReward extends StatefulWidget {
  @override
  _CreateRewardState createState() => _CreateRewardState();
}

class _CreateRewardState extends State<CreateReward> {
  TextEditingController minController = TextEditingController();
  TextEditingController maxController = TextEditingController();
  TextEditingController percentageController = TextEditingController();
  List<RewardTableModel> rewardData = [];
  RxBool isPercentageAdded = false.obs;
  RxBool isLoading = false.obs;
  RxBool isValidMax = false.obs;
  String selectedMinValue = '';
  String selectedMaxValue = '';
  bool showCreateReward = true;
  List data = [
    {'min': '10,000', 'max': "100,000"},
    {'min': '100,001', 'max': "100,000"},
    {'min': '1,000,001', 'max': "5,000,000"},
    {'min': '5,000,001', 'max': "10,000,000"},
  ];

  @override
  void dispose() {
    minController.dispose();
    maxController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => isLoading.value
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
                                    'Get started',
                                    style: label,
                                  ),
                                  const SizedBox(
                                    height: 35.0,
                                  ),
                                  // if (rewardData.isEmpty)
                                  //   Column(
                                  //     crossAxisAlignment:
                                  //         CrossAxisAlignment.start,
                                  //     children: [
                                  //       Center(
                                  //         child: SizedBox(
                                  //           width: 176,
                                  //           child: Text(
                                  //             'Define your reward points value to get started',
                                  //             style: desc,
                                  //             textAlign: TextAlign.center,
                                  //           ),
                                  //         ),
                                  //       ),
                                  //       const SizedBox(
                                  //         height: 35.0,
                                  //       ),
                                  //       Container(
                                  //         margin: const EdgeInsets.only(
                                  //             bottom: 15.0),
                                  //         child: Row(
                                  //           mainAxisAlignment:
                                  //               MainAxisAlignment.spaceBetween,
                                  //           children: [
                                  //             Text(
                                  //               'Create reward table',
                                  //               style: labelSm,
                                  //               textAlign: TextAlign.start,
                                  //             ),
                                  //             if (isValidMax.value) ...[
                                  //               Text('Add max value',
                                  //                   style: labelSm.copyWith(
                                  //                       color: Colors.red),
                                  //                   textAlign: TextAlign.left)
                                  //             ]
                                  //           ],
                                  //         ),
                                  //       ),
                                  //       Row(
                                  //         mainAxisAlignment:
                                  //             MainAxisAlignment.spaceBetween,
                                  //         children: [
                                  //           Container(
                                  //             width: MediaQuery.of(context)
                                  //                     .size
                                  //                     .width *
                                  //                 0.37,
                                  //             height: MediaQuery.of(context)
                                  //                     .size
                                  //                     .height *
                                  //                 0.07,
                                  //             decoration: BoxDecoration(
                                  //               color: const Color(0xFFD9D9D9),
                                  //               borderRadius:
                                  //                   BorderRadius.circular(5),
                                  //             ),
                                  //             alignment: Alignment.center,
                                  //             child: TextField(
                                  //               controller: minController,
                                  //               keyboardType:
                                  //                   TextInputType.number,
                                  //               inputFormatters: <TextInputFormatter>[
                                  //                 FilteringTextInputFormatter
                                  //                     .digitsOnly
                                  //               ],
                                  //               decoration:
                                  //                   const InputDecoration(
                                  //                 hintText: 'Min. spending',
                                  //                 hintStyle: TextStyle(
                                  //                     color: Color(0xFF808080)),
                                  //                 border: InputBorder.none,
                                  //               ),
                                  //               style: textFieldStyle,
                                  //               textAlign: TextAlign.center,
                                  //             ),
                                  //           ),
                                  //           const Spacer(),
                                  //           Text(
                                  //             '-',
                                  //             style: label,
                                  //           ),
                                  //           const Spacer(),
                                  //           Container(
                                  //             width: MediaQuery.of(context)
                                  //                     .size
                                  //                     .width *
                                  //                 0.37,
                                  //             height: MediaQuery.of(context)
                                  //                     .size
                                  //                     .height *
                                  //                 0.07,
                                  //             alignment: Alignment.center,
                                  //             decoration: BoxDecoration(
                                  //               color: const Color(0xFFD9D9D9),
                                  //               borderRadius:
                                  //                   BorderRadius.circular(5),
                                  //             ),
                                  //             child: TextField(
                                  //               controller: maxController,
                                  //               keyboardType:
                                  //                   TextInputType.number,
                                  //               inputFormatters: <TextInputFormatter>[
                                  //                 FilteringTextInputFormatter
                                  //                     .digitsOnly
                                  //               ],
                                  //               onChanged: (value) {
                                  //                 if (value.isNotEmpty &&
                                  //                     int.parse(value) <
                                  //                         int.parse(
                                  //                             minController
                                  //                                 .text)) {
                                  //                   isValidMax.value = true;
                                  //                 } else if (value.isNotEmpty &&
                                  //                     int.parse(value) ==
                                  //                         int.parse(
                                  //                             minController
                                  //                                 .text)) {
                                  //                   isValidMax.value = true;
                                  //                 } else {
                                  //                   isValidMax.value = false;
                                  //                 }
                                  //               },
                                  //               decoration:
                                  //                   const InputDecoration(
                                  //                 hintText: 'Max. Spending',
                                  //                 hintStyle: TextStyle(
                                  //                     color: Color(0xFF808080)),
                                  //                 border: InputBorder.none,
                                  //               ),
                                  //               style: textFieldStyle,
                                  //               textAlign: TextAlign.center,
                                  //             ),
                                  //           ),
                                  //         ],
                                  //       ),
                                  //       const SizedBox(
                                  //         height: 15.0,
                                  //       ),
                                  //       Row(
                                  //         mainAxisAlignment:
                                  //             MainAxisAlignment.spaceBetween,
                                  //         children: [
                                  //           Container(
                                  //             width: MediaQuery.of(context)
                                  //                     .size
                                  //                     .width *
                                  //                 0.37,
                                  //             height: MediaQuery.of(context)
                                  //                     .size
                                  //                     .height *
                                  //                 0.07,
                                  //             alignment: Alignment.center,
                                  //             decoration: BoxDecoration(
                                  //               color: const Color(0xFFD9D9D9),
                                  //               borderRadius:
                                  //                   BorderRadius.circular(5),
                                  //             ),
                                  //             child: Container(
                                  //               margin: const EdgeInsets.only(
                                  //                   left: 20),
                                  //               child: TextField(
                                  //                 controller:
                                  //                     percentageController,
                                  //                 keyboardType:
                                  //                     const TextInputType
                                  //                         .numberWithOptions(
                                  //                         decimal: true),
                                  //                 inputFormatters: [
                                  //                   OneDotFormatter(),
                                  //                   PercentageFormatter(),
                                  //                   FilteringTextInputFormatter
                                  //                       .allow(RegExp(
                                  //                           r'^\d*\.?\d{0,2}'))
                                  //                 ],
                                  //                 onChanged: (text) {
                                  //                   if (!isPercentageAdded
                                  //                       .value) {
                                  //                     if (text.endsWith('%')) {
                                  //                       isPercentageAdded
                                  //                           .value = true;
                                  //                     } else {
                                  //                       percentageController
                                  //                           .text = text + '%';
                                  //                       // Move the cursor to the end of the text
                                  //                       percentageController
                                  //                               .selection =
                                  //                           TextSelection
                                  //                               .fromPosition(
                                  //                         TextPosition(
                                  //                             offset:
                                  //                                 percentageController
                                  //                                         .text
                                  //                                         .length -
                                  //                                     1),
                                  //                       );
                                  //                       isPercentageAdded
                                  //                           .value = true;
                                  //                     }
                                  //                   }
                                  //                   if (!text.endsWith('%')) {
                                  //                     percentageController
                                  //                         .text = text + '%';
                                  //                     // Move the cursor to the end of the text
                                  //                     percentageController
                                  //                             .selection =
                                  //                         TextSelection
                                  //                             .fromPosition(
                                  //                       TextPosition(
                                  //                           offset:
                                  //                               percentageController
                                  //                                       .text
                                  //                                       .length -
                                  //                                   1),
                                  //                     );
                                  //                     isPercentageAdded.value =
                                  //                         true;
                                  //                   }
                                  //                 },
                                  //                 decoration:
                                  //                     const InputDecoration(
                                  //                   // suffixText: '%',
                                  //                   hintText: '%',
                                  //                   hintStyle: TextStyle(
                                  //                       color:
                                  //                           Color(0xFF000000)),
                                  //                   border: InputBorder.none,
                                  //                 ),
                                  //                 // textAlign: TextAlign.center,
                                  //                 style: textFieldStyle,
                                  //               ),
                                  //             ),
                                  //           ),
                                  //           const Spacer(),
                                  //           Container(
                                  //             width: MediaQuery.of(context)
                                  //                     .size
                                  //                     .width *
                                  //                 0.38,
                                  //             height: MediaQuery.of(context)
                                  //                     .size
                                  //                     .height *
                                  //                 0.07,
                                  //             decoration: BoxDecoration(
                                  //               color: const Color(0xFFD9D9D9),
                                  //               borderRadius:
                                  //                   BorderRadius.circular(5),
                                  //             ),
                                  //             child: TextButton(
                                  //               onPressed: () {
                                  //                 setState(() {
                                  //                   showCreateReward = false;
                                  //                 });
                                  //               },
                                  //               style: btnGold2,
                                  //               child: Padding(
                                  //                 padding: const EdgeInsets
                                  //                     .symmetric(vertical: 8.0),
                                  //                 child: Text(
                                  //                   'Save',
                                  //                   style: btnGoldText2,
                                  //                 ),
                                  //               ),
                                  //             ),
                                  //           ),
                                  //         ],
                                  //       ),
                                  //       const SizedBox(
                                  //         height: 75.0,
                                  //       ),
                                  //     ],
                                  //   )
                                  // else
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        alignment: Alignment.center,
                                        child: Text(
                                          'Define your reward points value to get started',
                                          style: desc,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 35.0,
                                      ),
                                      if (rewardData.isNotEmpty) ...[
                                        Container(
                                          alignment: Alignment.center,
                                          child: Text(
                                            'Reward table',
                                            style: labelSm,
                                            textAlign: TextAlign.center,
                                          ),
                                        )
                                      ],
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      if (rewardData.isNotEmpty) ...[
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
                                                  child: const Text(
                                                    "Min",
                                                    style: TextStyle(
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
                                                  child: const Text(
                                                    "Max",
                                                    style: TextStyle(
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
                                                child: const Text(
                                                  "Reward%",
                                                  style: TextStyle(
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
                                          itemCount: rewardData.length,
                                          itemBuilder: (context, index) {
                                            var data = rewardData[index];
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
                                                      data.min,
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
                                                      data.max,
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
                                                            setState(() {
                                                              rewardData
                                                                  .removeAt(
                                                                      index);
                                                            });
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
                                      if (rewardData.isNotEmpty) ...[
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
                                              rewardData.isEmpty
                                                  ? 'Create reward table'
                                                  : 'Add field',
                                              style: labelSm,
                                              textAlign: TextAlign.center,
                                            ),
                                            if (isValidMax.value) ...[
                                              Text('Add max value',
                                                  style: labelSm.copyWith(
                                                      color: Colors.red),
                                                  textAlign: TextAlign.left)
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
                                              controller: minController,
                                              keyboardType:
                                                  TextInputType.number,
                                              inputFormatters: <TextInputFormatter>[
                                                FilteringTextInputFormatter
                                                    .digitsOnly
                                              ],
                                              decoration: const InputDecoration(
                                                hintText: 'Min. spending',
                                                hintStyle: TextStyle(
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
                                              controller: maxController,
                                              keyboardType:
                                                  TextInputType.number,
                                              inputFormatters: <TextInputFormatter>[
                                                FilteringTextInputFormatter
                                                    .digitsOnly
                                              ],
                                              onChanged: (value) {
                                                if (value.isNotEmpty &&
                                                    int.parse(value) <
                                                        int.parse(minController
                                                            .text)) {
                                                  isValidMax.value = true;
                                                } else if (value.isNotEmpty &&
                                                    int.parse(value) ==
                                                        int.parse(minController
                                                            .text)) {
                                                  isValidMax.value = true;
                                                } else {
                                                  isValidMax.value = false;
                                                }
                                              },
                                              decoration: const InputDecoration(
                                                hintText: 'Max. Spending',
                                                hintStyle: TextStyle(
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
                                                    percentageController,
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
                                                  if (!isPercentageAdded
                                                      .value) {
                                                    if (text.endsWith('%')) {
                                                      isPercentageAdded.value =
                                                          true;
                                                    } else {
                                                      percentageController
                                                          .text = text + '%';
                                                      // Move the cursor to the end of the text
                                                      percentageController
                                                              .selection =
                                                          TextSelection
                                                              .fromPosition(
                                                        TextPosition(
                                                            offset:
                                                                percentageController
                                                                        .text
                                                                        .length -
                                                                    1),
                                                      );
                                                      isPercentageAdded.value =
                                                          true;
                                                    }
                                                  }
                                                  if (!text.endsWith('%')) {
                                                    percentageController.text =
                                                        text + '%';
                                                    // Move the cursor to the end of the text
                                                    percentageController
                                                            .selection =
                                                        TextSelection
                                                            .fromPosition(
                                                      TextPosition(
                                                          offset:
                                                              percentageController
                                                                      .text
                                                                      .length -
                                                                  1),
                                                    );
                                                    isPercentageAdded.value =
                                                        true;
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
                                                addrewardPoints();
                                              },
                                              style: btnGold2,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 8.0),
                                                child: Text(
                                                  'Save',
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
                                    width: 180,
                                    child: Text(
                                      'You can change this configurations on setting page',
                                      style: desc,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20.0,
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      if (rewardData.isEmpty) {
                                        Fluttertoast.showToast(
                                            msg: "Please add reward data");
                                      } else {
                                        Get.offAll(() => const BottomTab());
                                      }
                                    },
                                    style: btnGold2,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10),
                                      child: SizedBox(
                                        width: double.infinity,
                                        child: Text(
                                          'Proceed',
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

  void addrewardPoints() {
    if (minController.text.isEmpty) {
      Fluttertoast.showToast(msg: "Please enter min value");
    } else if (maxController.text.isEmpty) {
      Fluttertoast.showToast(msg: "Please enter max value");
    } else if (percentageController.text.isEmpty) {
      Fluttertoast.showToast(msg: "Please enter percentage value");
    } else {
      int min = int.parse(minController.text.trim().toString());
      int max = int.parse(maxController.text.trim().toString());

      if (min > max) {
        Fluttertoast.showToast(msg: "Please enter valid max value");
      } else {
        setState(() {
          rewardData.add(RewardTableModel(
              min: min.toString(),
              max: max.toString(),
              percentage: percentageController.text.trim()));
          minController.clear();
          maxController.clear();
          percentageController.clear();
          Get.focusScope!.unfocus();
        });
      }
    }
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

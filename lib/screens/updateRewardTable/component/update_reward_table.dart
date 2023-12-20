import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:tiger_loyalty/screens/updateRewardTable/controller/update_reward_table_controller.dart';
import 'package:tiger_loyalty/widget/loader_widget.dart';
import 'package:tiger_loyalty/widget/show_loader.dart';
import '../../../src/pages/styles.dart';

// ignore: must_be_immutable
class UpdateRewardTable extends StatefulWidget {
  String rewardNumber;
  UpdateRewardTable({required this.rewardNumber});
  @override
  _UpdateRewardTableState createState() => _UpdateRewardTableState();
}

class _UpdateRewardTableState extends State<UpdateRewardTable> {
  UpdateRewardTableController updateRewardTableController =
      Get.find<UpdateRewardTableController>();

  @override
  void initState() {
    super.initState();
    updateRewardTableController.rewardNumber.value = widget.rewardNumber;
    updateRewardTableController.isLoading.value = true;
    updateRewardTableController
        .getRewardPoints()
        .then((value) => updateRewardTableController.isLoading.value = false);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

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
        title:
            Text('reward_table'.tr, style: label.copyWith(color: Colors.black)),
      ),
      body: Obx(
        () => updateRewardTableController.isLoading.value
            ? const LoaderWidget()
            : SingleChildScrollView(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                  child: Column(
                    children: [
                      if (updateRewardTableController
                          .rewardData.isNotEmpty) ...[
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.29,
                                  child: Text(
                                    "min".tr,
                                    style: const TextStyle(
                                      fontFamily: 'Inter',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  )),
                              SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.25,
                                  child: Text(
                                    "max".tr,
                                    style: const TextStyle(
                                      fontFamily: 'Inter',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  )),
                              SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.19,
                                  child: Text(
                                    "reward_perc".tr,
                                    style: const TextStyle(
                                      fontFamily: 'Inter',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ))
                            ],
                          ),
                        )
                      ],
                      ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        itemCount:
                            updateRewardTableController.rewardData.length,
                        itemBuilder: (context, index) {
                          var data =
                              updateRewardTableController.rewardData[index];
                          return Container(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            height: MediaQuery.of(context).size.height * 0.055,
                            decoration: BoxDecoration(
                                color: index.isEven
                                    ? const Color(0XFFD9D9D9)
                                    : Colors.white),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.25,
                                  child: Text(
                                    "${double.parse(data.min).round()}",
                                    style: const TextStyle(
                                      fontFamily: "Inter",
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.25,
                                  child: Text(
                                    "${double.parse(data.max).round()}",
                                    style: const TextStyle(
                                      fontFamily: "Inter",
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.20,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        data.percentage,
                                        style: const TextStyle(
                                          fontFamily: "Inter",
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16,
                                        ),
                                      ),
                                      const SizedBox(width: 5),
                                      GestureDetector(
                                        onTap: () {
                                          const LoaderDialog().showLoader();
                                          updateRewardTableController
                                              .removeReward(data.id)
                                              .then((value) =>
                                                  const LoaderDialog()
                                                      .hideLoader());
                                        },
                                        child: Container(
                                          decoration: const BoxDecoration(
                                            color: Color(0xffDA001E),
                                            shape: BoxShape.circle,
                                          ),
                                          child: const Icon(
                                            Icons.remove,
                                            color: Colors.white,
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
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            // width: MediaQuery.of(context).size.width * 1.0,
                            child: Text('add_field'.tr,
                                style: labelSm, textAlign: TextAlign.left),
                          ),
                          if (updateRewardTableController.isValidMax.value) ...[
                            Text('add_max_val'.tr,
                                style: labelSm.copyWith(color: Colors.red),
                                textAlign: TextAlign.left)
                          ]
                        ],
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.35,
                            height: MediaQuery.of(context).size.height * 0.07,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: const Color(0xFFD9D9D9),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: TextField(
                              controller:
                                  updateRewardTableController.minController,
                              keyboardType: TextInputType.number,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              decoration: InputDecoration(
                                hintText: 'min_spend'.tr,
                                hintStyle:
                                    const TextStyle(color: Color(0xFF808080)),
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
                          Container(
                            width: MediaQuery.of(context).size.width * 0.35,
                            height: MediaQuery.of(context).size.height * 0.07,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: const Color(0xFFD9D9D9),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: TextField(
                              controller:
                                  updateRewardTableController.maxController,
                              keyboardType: TextInputType.number,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              onChanged: (value) {
                                if (value.isNotEmpty &&
                                    int.parse(value) <
                                        int.parse(updateRewardTableController
                                            .minController.text)) {
                                  updateRewardTableController.isValidMax.value =
                                      true;
                                } else if (value.isNotEmpty &&
                                    int.parse(value) ==
                                        int.parse(updateRewardTableController
                                            .minController.text)) {
                                  updateRewardTableController.isValidMax.value =
                                      true;
                                } else {
                                  updateRewardTableController.isValidMax.value =
                                      false;
                                }
                              },
                              decoration: InputDecoration(
                                hintText: 'max_spend'.tr,
                                hintStyle:
                                    const TextStyle(color: Color(0xFF808080)),
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.35,
                            height: MediaQuery.of(context).size.height * 0.07,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: const Color(0xFFD9D9D9),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Container(
                              margin:
                                  const EdgeInsets.only(left: 20, right: 20),
                              child: TextField(
                                controller: updateRewardTableController
                                    .percentageController,
                                // keyboardType: TextInputType.number,
                                // inputFormatters: <TextInputFormatter>[
                                //   FilteringTextInputFormatter.digitsOnly,
                                //   LengthLimitingTextInputFormatter(3),
                                //   _rpFormatter,
                                // ],
                                inputFormatters: [
                                  OneDotFormatter(),
                                  PercentageFormatter(),
                                  FilteringTextInputFormatter.allow(
                                      RegExp(r'^\d*\.?\d{0,2}'))
                                ],
                                keyboardType:
                                    const TextInputType.numberWithOptions(
                                        decimal: true),
                                onChanged: (text) {
                                  if (!updateRewardTableController
                                      .isPercentageAdded.value) {
                                    if (text.endsWith('%')) {
                                      updateRewardTableController
                                          .isPercentageAdded.value = true;
                                    } else {
                                      updateRewardTableController
                                          .percentageController
                                          .text = text + '%';
                                      // Move the cursor to the end of the text
                                      updateRewardTableController
                                              .percentageController.selection =
                                          TextSelection.fromPosition(
                                        TextPosition(
                                            offset: updateRewardTableController
                                                    .percentageController
                                                    .text
                                                    .length -
                                                1),
                                      );
                                      updateRewardTableController
                                          .isPercentageAdded.value = true;
                                    }
                                  }
                                  if (!text.endsWith('%')) {
                                    updateRewardTableController
                                        .percentageController.text = text + '%';
                                    // Move the cursor to the end of the text
                                    updateRewardTableController
                                        .percentageController
                                        .selection = TextSelection.fromPosition(
                                      TextPosition(
                                          offset: updateRewardTableController
                                                  .percentageController
                                                  .text
                                                  .length -
                                              1),
                                    );
                                    updateRewardTableController
                                        .isPercentageAdded.value = true;
                                  }
                                },

                                decoration: const InputDecoration(
                                  // suffixText: '%',
                                  hintText: '%',
                                  hintStyle:
                                      TextStyle(color: Color(0xFF000000)),
                                  border: InputBorder.none,
                                ),
                                style: textFieldStyle,
                              ),
                            ),
                          ),
                          const Spacer(),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.35,
                            height: MediaQuery.of(context).size.height * 0.07,
                            decoration: BoxDecoration(
                              color: const Color(0xFFD9D9D9),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: TextButton(
                              onPressed: () {
                                updateRewardTableController.addrewardPoints();
                              },
                              style: btnGold2,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                child: Text(
                                  'save'.tr,
                                  style: btnGoldText2,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                      TextButton(
                        onPressed: () {
                          Get.back();
                        },
                        style: btnGold2,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 10,
                          ),
                          child: SizedBox(
                            width: size.width * 1.0,
                            child: Text(
                              'update'.tr,
                              style: btnGoldText2,
                              textAlign: TextAlign.center,
                            ),
                          ),
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

class CustomTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text.isEmpty) {
      return newValue;
    }
    String text = newValue.text.replaceAll(RegExp(r'\D'), '');

    int discountValue = int.tryParse(text) ?? 0;
    discountValue = discountValue.clamp(1, 100);

    String formattedText = '$discountValue%';

    return TextEditingValue(
      text: formattedText,
      selection: TextSelection.collapsed(offset: formattedText.length),
    );
  }
}

class OneDotFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text == '.') {
      return oldValue;
    } else if (newValue.text.split('.').length > 2) {
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

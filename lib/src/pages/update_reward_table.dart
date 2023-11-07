import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:tiger_loyalty/widget/loader_widget.dart';
import 'styles.dart';

final _rpFormatter = CustomTextInputFormatter();

class RewardTableModel {
  String min, max, percentage;
  RewardTableModel(
      {required this.min, required this.max, required this.percentage});
}

class UpdateRewardTable extends StatefulWidget {
  @override
  _UpdateRewardTableState createState() => _UpdateRewardTableState();
}

class _UpdateRewardTableState extends State<UpdateRewardTable> {
  TextEditingController minController = TextEditingController();
  TextEditingController maxController = TextEditingController();
  TextEditingController percentageController = TextEditingController();
  List<RewardTableModel> rewardData = [];
  RxBool isValidMax = false.obs;
  RxBool isLoading = false.obs;
  RxBool isPercentageAdded = false.obs;

  List data = [
    {'min': '10,000', 'max': "100,000", 'percentage': "1%"},
    {'min': '100,001', 'max': "100,000", 'percentage': "2%"},
    {'min': '1,000,001', 'max': "5,000,000", 'percentage': "3%"},
    {'min': '5,000,001', 'max': "10,000,000", 'percentage': "4%"},
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    minController.dispose();
    maxController.dispose();
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
        title: Text('Reward table', style: label.copyWith(color: Colors.black)),
      ),
      body: SingleChildScrollView(
        child: Obx(
          () => isLoading.value
              ? const LoaderWidget()
              : Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 30),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 5, vertical: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.29,
                                    child: const Text(
                                      "Min",
                                      style: TextStyle(
                                        fontFamily: 'Inter',
                                        fontSize: 16,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    )),
                                SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.25,
                                    child: const Text(
                                      "Max",
                                      style: TextStyle(
                                        fontFamily: 'Inter',
                                        fontSize: 16,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    )),
                                SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.19,
                                    child: const Text(
                                      "Reward%",
                                      style: TextStyle(
                                        fontFamily: 'Inter',
                                        fontSize: 16,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ))
                              ],
                            ),
                          ),
                          ListView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            itemCount: data.length,
                            itemBuilder: (context, index) {
                              return Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                height:
                                    MediaQuery.of(context).size.height * 0.055,
                                decoration: BoxDecoration(
                                    color: index.isEven
                                        ? const Color(0XFFD9D9D9)
                                        : Colors.white),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.25,
                                        child: Text(data[index]["min"])),
                                    SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.25,
                                        child: Text(data[index]["max"])),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.20,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(data[index]["percentage"]),
                                          const SizedBox(width: 5),
                                          Image.asset('assets/remove.png'),
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
                                child: Text('Add field',
                                    style: labelSm, textAlign: TextAlign.left),
                              ),
                              if (isValidMax.value) ...[
                                Text('Add max value',
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
                                height:
                                    MediaQuery.of(context).size.height * 0.07,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: const Color(0xFFD9D9D9),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: TextField(
                                  controller: minController,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: <TextInputFormatter>[
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                  decoration: const InputDecoration(
                                    hintText: 'Min. spending',
                                    hintStyle:
                                        TextStyle(color: Color(0xFF808080)),
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
                                height:
                                    MediaQuery.of(context).size.height * 0.07,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: const Color(0xFFD9D9D9),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: TextField(
                                  controller: maxController,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: <TextInputFormatter>[
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                  onChanged: (value) {
                                    if (value.isNotEmpty &&
                                        int.parse(value) <
                                            int.parse(minController.text)) {
                                      isValidMax.value = true;
                                    } else if (value.isNotEmpty &&
                                        int.parse(value) ==
                                            int.parse(minController.text)) {
                                      isValidMax.value = true;
                                    } else {
                                      isValidMax.value = false;
                                    }
                                  },
                                  decoration: const InputDecoration(
                                    hintText: 'Max. Spending',
                                    hintStyle:
                                        TextStyle(color: Color(0xFF808080)),
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
                                height:
                                    MediaQuery.of(context).size.height * 0.07,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: const Color(0xFFD9D9D9),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Container(
                                  margin: const EdgeInsets.only(
                                      left: 20, right: 20),
                                  child: TextField(
                                    controller: percentageController,
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
                                      if (!isPercentageAdded.value) {
                                        if (text.endsWith('%')) {
                                          isPercentageAdded.value = true;
                                        } else {
                                          percentageController.text =
                                              text + '%';
                                          // Move the cursor to the end of the text
                                          percentageController.selection =
                                              TextSelection.fromPosition(
                                            TextPosition(
                                                offset: percentageController
                                                        .text.length -
                                                    1),
                                          );
                                          isPercentageAdded.value = true;
                                        }
                                      }
                                      if (!text.endsWith('%')) {
                                        percentageController.text = text + '%';
                                        // Move the cursor to the end of the text
                                        percentageController.selection =
                                            TextSelection.fromPosition(
                                          TextPosition(
                                              offset: percentageController
                                                      .text.length -
                                                  1),
                                        );
                                        isPercentageAdded.value = true;
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
                                height:
                                    MediaQuery.of(context).size.height * 0.07,
                                decoration: BoxDecoration(
                                  color: const Color(0xFFD9D9D9),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: TextButton(
                                  onPressed: () {
                                    addrewardPoints();
                                  },
                                  style: btnGold2,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
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
                          const SizedBox(
                            height: 30.0,
                          ),
                          TextButton(
                            onPressed: () {},
                            style: btnGold2,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 10,
                              ),
                              child: SizedBox(
                                width: size.width * 1.0,
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
    } else if (int.parse(maxController.text) < int.parse(minController.text)) {
      Fluttertoast.showToast(msg: "Please enter valid max value");
    } else if (int.parse(maxController.text) == int.parse(minController.text)) {
      Fluttertoast.showToast(msg: "Please enter valid max value");
    } else {
      setState(() {
        data.add({
          'min': minController.text.trim(),
          'max': maxController.text.trim(),
          'percentage': percentageController.text.trim()
        });
      });
      minController.clear();
      maxController.clear();
      percentageController.clear();
    }
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

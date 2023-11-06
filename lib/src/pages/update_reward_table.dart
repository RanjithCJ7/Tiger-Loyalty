import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'styles.dart';

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
  // bool showCreateReward = true;
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
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.29,
                            child: const Text(
                              "Min",
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 16,
                                fontWeight: FontWeight.w800,
                              ),
                            )),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.25,
                            child: const Text(
                              "Max",
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 16,
                                fontWeight: FontWeight.w800,
                              ),
                            )),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.19,
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
                                width: MediaQuery.of(context).size.width * 0.25,
                                child: Text(data[index]["min"])),
                            SizedBox(
                                width: MediaQuery.of(context).size.width * 0.25,
                                child: Text(data[index]["max"])),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.15,
                              child: Row(
                                children: [
                                  Text("${index + 1}%"),
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
                  Container(
                    width: MediaQuery.of(context).size.width * 1.0,
                    child: Text('Add field',
                        style: labelSm, textAlign: TextAlign.left),
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
                          controller: minController,
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          decoration: const InputDecoration(
                            hintText: 'Min. spending',
                            hintStyle: TextStyle(color: Color(0xFF808080)),
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
                          controller: maxController,
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          decoration: const InputDecoration(
                            hintText: 'Max. Spending',
                            hintStyle: TextStyle(color: Color(0xFF808080)),
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
                          margin: const EdgeInsets.only(left: 20),
                          child: TextField(
                            controller: percentageController,
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            decoration: const InputDecoration(
                              hintText: '%',
                              hintStyle: TextStyle(color: Color(0xFF000000)),
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
                            addrewardPoints();
                          },
                          style: btnGold2,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
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
      print("min ==> ${minController.text}");
      if (min > max) {
        Fluttertoast.showToast(msg: "Please enter valid max value");
      } else {
        setState(() {
          rewardData.add(RewardTableModel(
              min: min.toString(),
              max: max.toString(),
              percentage: percentageController.text.trim()));
        });
      }
    }
  }
}

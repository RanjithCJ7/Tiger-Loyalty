import 'dart:async';
import 'dart:io';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:tiger_loyalty/src/pages/home.dart';
import 'styles.dart';

class CreateReward extends StatefulWidget {
  @override
  _CreateRewardState createState() => _CreateRewardState();
}

class _CreateRewardState extends State<CreateReward> {
  List<String> minReward = [
    'Min. spending',
    '10,000',
    '100,001',
    '1,000,001',
    '5,000,001'
  ];
  List<String> maxReward = [
    'Max. Spending',
    '100,000',
    '1,000,000',
    '5,000,000',
    '10,000,000'
  ];

  String selectedMinValue = 'Min. spending';
  String selectedMaxValue = 'Max. Spending';

  bool showCreateReward = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(40.0),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.symmetric(vertical: 15.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Get started',
                            style: label,
                          ),
                          SizedBox(
                            height: 35.0,
                          ),
                          if (showCreateReward)
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Center(
                                  child: Container(
                                    width: 176,
                                    child: Text(
                                      'Define your reward points value to get started',
                                      style: desc,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 35.0,
                                ),
                                Container(
                                  margin: EdgeInsets.only(bottom: 15.0),
                                  child: Text(
                                    'Create reward table',
                                    style: labelSm,
                                    textAlign: TextAlign.start,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Container(
                                      width: 144,
                                      height: 53,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFD9D9D9),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: Center(
                                        child: DropdownButton<String>(
                                          value: selectedMinValue,
                                          onChanged: (newValue) {
                                            setState(() {
                                              selectedMinValue =
                                                  newValue ?? 'Min. spending';
                                            });
                                          },
                                          items: minReward.map((category) {
                                            return DropdownMenuItem<String>(
                                              value: category,
                                              child: Text(category,
                                                  style: dropDownText),
                                            );
                                          }).toList(),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 15),
                                      child: Text(
                                        '-',
                                        style: label,
                                      ),
                                    ),
                                    Container(
                                      width: 144,
                                      height: 53,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFD9D9D9),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: Center(
                                        child: DropdownButton<String>(
                                          value: selectedMaxValue,
                                          onChanged: (newValue) {
                                            setState(() {
                                              selectedMaxValue =
                                                  newValue ?? 'Max. Spending';
                                            });
                                          },
                                          items: maxReward.map((category) {
                                            return DropdownMenuItem<String>(
                                              value: category,
                                              child: Text(category,
                                                  style: dropDownText),
                                            );
                                          }).toList(),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 15.0,
                                ),
                                Row(
                                  children: [
                                    Container(
                                      width: 144,
                                      height: 53,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFD9D9D9),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      margin: EdgeInsets.only(right: 38.0),
                                      child: TextField(
                                        decoration: InputDecoration(
                                          hintText: '%',
                                          hintStyle: TextStyle(
                                              color: Color(0xFF000000)),
                                          border: InputBorder.none,
                                          contentPadding: EdgeInsets.all(20),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 144,
                                      height: 53,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFD9D9D9),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: TextButton(
                                        onPressed: () {
                                          setState(() {
                                            showCreateReward = false;
                                          });
                                        },
                                        style: btnGold2,
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
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
                                SizedBox(
                                  height: 75.0,
                                ),
                              ],
                            )
                          else
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Define your reward points value to get started',
                                    style: desc,
                                  ),
                                ),
                                SizedBox(
                                  height: 35.0,
                                ),
                                Text(
                                  'Reward table',
                                  style: labelSm,
                                  textAlign: TextAlign.center,
                                ),
                                SingleChildScrollView(
                                  child: DataTable(
                                    columns: [
                                      DataColumn(
                                        label: Text('Min', style: labelSm),
                                      ),
                                      DataColumn(
                                        label: Text('Max', style: labelSm),
                                      ),
                                      DataColumn(
                                        label: Text('Reward%', style: labelSm),
                                      ),
                                    ],
                                    rows: [
                                      DataRow(
                                        cells: [
                                          DataCell(Text('10,000')),
                                          DataCell(Text('100,000')),
                                          DataCell(
                                            Row(
                                              children: [
                                                Text('1%'),
                                                Image.asset('assets/remove.png')
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      DataRow(cells: [
                                        DataCell(Text('100,001')),
                                        DataCell(Text('1,000,000')),
                                        DataCell(
                                          Row(
                                            children: [
                                              Text('2%'),
                                              Image.asset('assets/remove.png')
                                            ],
                                          ),
                                        ),
                                      ]),
                                      DataRow(cells: [
                                        DataCell(Text('1,000,001')),
                                        DataCell(Text('5,000,000')),
                                        DataCell(
                                          Row(
                                            children: [
                                              Text('3%'),
                                              Image.asset('assets/remove.png')
                                            ],
                                          ),
                                        ),
                                      ]),
                                      DataRow(cells: [
                                        DataCell(Text('5,000,001')),
                                        DataCell(Text('10,000,000')),
                                        DataCell(
                                          Row(
                                            children: [
                                              Text('4%'),
                                              Image.asset('assets/remove.png')
                                            ],
                                          ),
                                        ),
                                      ]),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 20.0,
                                ),
                                Container(
                                  margin: EdgeInsets.only(bottom: 15.0),
                                  child: Text(
                                    'Add field',
                                    style: labelSm,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Container(
                                      width: 144,
                                      height: 53,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFD9D9D9),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: Center(
                                        child: DropdownButton<String>(
                                          value: selectedMinValue,
                                          onChanged: (newValue) {
                                            setState(() {
                                              selectedMinValue =
                                                  newValue ?? 'Min. spending';
                                            });
                                          },
                                          items: minReward.map((category) {
                                            return DropdownMenuItem<String>(
                                              value: category,
                                              child: Text(category,
                                                  style: dropDownText),
                                            );
                                          }).toList(),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 15),
                                      child: Text(
                                        '-',
                                        style: label,
                                      ),
                                    ),
                                    Container(
                                      width: 144,
                                      height: 53,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFD9D9D9),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: Center(
                                        child: DropdownButton<String>(
                                          value: selectedMaxValue,
                                          onChanged: (newValue) {
                                            setState(() {
                                              selectedMaxValue =
                                                  newValue ?? 'Max. Spending';
                                            });
                                          },
                                          items: maxReward.map((category) {
                                            return DropdownMenuItem<String>(
                                              value: category,
                                              child: Text(category,
                                                  style: dropDownText),
                                            );
                                          }).toList(),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 15.0,
                                ),
                                Row(
                                  children: [
                                    Container(
                                      width: 144,
                                      height: 53,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFD9D9D9),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      margin: EdgeInsets.only(right: 38.0),
                                      child: TextField(
                                        decoration: InputDecoration(
                                          hintText: '%',
                                          hintStyle: TextStyle(
                                              color: Color(0xFF000000)),
                                          border: InputBorder.none,
                                          contentPadding: EdgeInsets.all(20),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 144,
                                      height: 53,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFD9D9D9),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pushReplacement(
                                            MaterialPageRoute(
                                              builder: (context) => Home(),
                                            ),
                                          );
                                        },
                                        style: btnGold2,
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
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
                          SizedBox(
                            height: 80.0,
                          ),
                          Container(
                            width: 180,
                            child: Text(
                              'You can change this configurations on setting page',
                              style: desc,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          Container(
                            child: TextButton(
                              onPressed: () {
                                // Navigator.of(context).push(
                                //   MaterialPageRoute(
                                //     builder: (context) => Authentication(),
                                //   ),
                                // );
                              },
                              style: btnGold2,
                              child: Container(
                                width: double.infinity,
                                height: 53,
                                alignment: Alignment.center,
                                child: Text(
                                  'Proceed',
                                  style: btnGoldText2,
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
    );
  }
}

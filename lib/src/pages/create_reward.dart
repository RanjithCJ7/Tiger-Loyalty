import 'dart:async';
import 'dart:io';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:tiger_loyalty/src/pages/home.dart';
import 'styles.dart';

class CreateReward extends StatefulWidget {
  @override
  _CreateRewardState createState() => _CreateRewardState();
}

class _CreateRewardState extends State<CreateReward> {
  TextEditingController _minController = TextEditingController();
  TextEditingController _maxController = TextEditingController();

  List<DataRow> generateRows(List<List<String>> data) {
    return data.asMap().entries.map((entry) {
      int index = entry.key;
      List<String> rowData = entry.value;

      Color backgroundColor = index.isOdd ? Colors.white : Color(0xFFD9D9D9);

      return DataRow(
        color: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.selected)) {
            return Theme.of(context).colorScheme.primary.withOpacity(0.08);
          }
          return backgroundColor;
        }),
        cells: [
          DataCell(Text(rowData[0])),
          DataCell(Text(rowData[1])),
          DataCell(
            Row(
              children: [
                Text(rowData[2]),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Image.asset('assets/remove.png'),
                ),
              ],
            ),
          ),
        ],
      );
    }).toList();
  }

  List<String> rowData = [];

  String selectedMinValue = '';
  String selectedMaxValue = '';

  bool showCreateReward = true;

  @override
  void dispose() {
    _minController.dispose();
    _maxController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<List<String>> tableData = [
      ['10,000', '100,000', '1%', ''],
      ['100,001', '1,000,000', '2%', ''],
      ['1,000,001', '5,000,000', '3%', ''],
      ['5,000,001', '10,000,000', '4%', ''],
    ];

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
                                      child: TextField(
                                        controller: _minController,
                                        keyboardType: TextInputType.number,
                                        inputFormatters: <TextInputFormatter>[
                                          FilteringTextInputFormatter.digitsOnly
                                        ],
                                        decoration: InputDecoration(
                                          hintText: 'Min. spending',
                                          hintStyle: TextStyle(
                                              color: Color(0xFF808080)),
                                          border: InputBorder.none,
                                        ),
                                        style: textFieldStyle,
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    Spacer(),
                                    Text(
                                      '-',
                                      style: label,
                                    ),
                                    Spacer(),
                                    Container(
                                      width: 144,
                                      height: 53,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFD9D9D9),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: TextField(
                                        controller: _maxController,
                                        keyboardType: TextInputType.number,
                                        inputFormatters: <TextInputFormatter>[
                                          FilteringTextInputFormatter.digitsOnly
                                        ],
                                        decoration: InputDecoration(
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
                                      child: Container(
                                        margin: EdgeInsets.only(left: 20),
                                        child: TextField(
                                          keyboardType: TextInputType.number,
                                          inputFormatters: <TextInputFormatter>[
                                            FilteringTextInputFormatter
                                                .digitsOnly
                                          ],
                                          decoration: InputDecoration(
                                            hintText: '%',
                                            hintStyle: TextStyle(
                                                color: Color(0xFF000000)),
                                            border: InputBorder.none,
                                          ),
                                          style: textFieldStyle,
                                        ),
                                      ),
                                    ),
                                    Spacer(),
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
                                      DataColumn(label: Text('Min')),
                                      DataColumn(label: Text('Max')),
                                      DataColumn(label: Text('Reward%')),
                                    ],
                                    rows: generateRows(tableData),
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
                                      child: TextField(
                                        keyboardType: TextInputType.number,
                                        inputFormatters: <TextInputFormatter>[
                                          FilteringTextInputFormatter.digitsOnly
                                        ],
                                        decoration: InputDecoration(
                                          hintText: 'Min. spending',
                                          hintStyle: TextStyle(
                                              color: Color(0xFF808080)),
                                          border: InputBorder.none,
                                        ),
                                        style: textFieldStyle,
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    Spacer(),
                                    Text(
                                      '-',
                                      style: label,
                                    ),
                                    Spacer(),
                                    Container(
                                      width: 144,
                                      height: 53,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFD9D9D9),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: TextField(
                                        keyboardType: TextInputType.number,
                                        inputFormatters: <TextInputFormatter>[
                                          FilteringTextInputFormatter.digitsOnly
                                        ],
                                        decoration: InputDecoration(
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
                                      child: Container(
                                        margin: EdgeInsets.only(left: 20),
                                        child: TextField(
                                          keyboardType: TextInputType.number,
                                          inputFormatters: <TextInputFormatter>[
                                            FilteringTextInputFormatter
                                                .digitsOnly
                                          ],
                                          decoration: InputDecoration(
                                            hintText: '%',
                                            hintStyle: TextStyle(
                                                color: Color(0xFF000000)),
                                            border: InputBorder.none,
                                          ),
                                          style: textFieldStyle,
                                        ),
                                      ),
                                    ),
                                    Spacer(),
                                    Container(
                                      width: 144,
                                      height: 53,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFD9D9D9),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: TextButton(
                                        onPressed: (){},
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
                                Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                    builder: (context) => Home(),
                                  ),
                                );
                              },
                              style: btnGold2,
                              child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                child: Container(
                                  width: double.infinity,
                                  child: Text(
                                    'Proceed',
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

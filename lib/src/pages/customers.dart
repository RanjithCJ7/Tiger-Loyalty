import 'dart:io';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:tiger_loyalty/src/pages/add_lipa_namba.dart';
import 'package:tiger_loyalty/src/pages/customers_summary.dart';
import 'package:tiger_loyalty/src/pages/give_reward.dart';
import 'package:tiger_loyalty/src/pages/home.dart';
import 'package:tiger_loyalty/src/pages/profile.dart';
import 'package:tiger_loyalty/src/pages/signin.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:tiger_loyalty/src/pages/transactions.dart';
import 'styles.dart';

class Customers extends StatefulWidget {
  @override
  _CustomersState createState() => _CustomersState();
}

class PointsData {
  String points;
  String name;
  String image;

  PointsData({required this.points, required this.name, required this.image});
}

class _CustomersState extends State<Customers> {
  String selectedToday = 'Date';
  List<String> selectDay = ['Date', '', ''];

  List<PointsData> pointsData = [
    PointsData(points: '4,000', name: 'Juma hamza', image: 'assets/cust_1.png'),
    PointsData(
        points: '250', name: 'Hamisa Kichwa', image: 'assets/cust_2.png'),
    PointsData(
        points: '1230', name: 'Jane Jackson', image: 'assets/cust_3.png'),
    PointsData(
        points: '700', name: 'Jaribu Athumani', image: 'assets/cust_4.png'),
    PointsData(points: '0', name: 'Anna Kitonga', image: 'assets/cust_5.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 50.0),
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Customers', style: label),
                    ],
                  ),
                ),
                Stack(
                  children: [
                    Container(
                      margin:
                          EdgeInsets.only(bottom: 30.0, right: 5.0, top: 5.0),
                      child: Image.asset('assets/notification.png'),
                    ),
                    Positioned(
                      top: -1,
                      right: 0,
                      child: Container(
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Image.asset('assets/notification_bg.png'),
                            Text('3', style: notificationText),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Container(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset('assets/rectangle_3.png'),
                      Positioned(
                        bottom: 0,
                        right: 10,
                        child: Image.asset('assets/rectangle_4.png'),
                      ),
                      Container(
                        padding: EdgeInsets.all(15.0),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 30.0),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text('Summary', style: imgLabel),
                                  Spacer(),
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.white,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(25.0),
                                    ),
                                    height: 20,
                                    child: DropdownButton<String>(
                                      value: selectedToday,
                                      onChanged: (newValue) {
                                        setState(() {
                                          selectedToday = newValue ?? '';
                                        });
                                      },
                                      items: selectDay.map((today) {
                                        return DropdownMenuItem<String>(
                                          value: today,
                                          child: Text(today, style: dateText),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 15.0),
                              Row(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('219', style: imgNum),
                                      SizedBox(height: 5.0),
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).push(
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  Customers_Summary(),
                                            ),
                                          );
                                        },
                                        child:
                                            Text('Customers', style: imgDesc),
                                      )
                                    ],
                                  ),
                                  Spacer(),
                                  Image.asset('assets/line.png'),
                                  Spacer(),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('3,478,300', style: imgNum),
                                      SizedBox(height: 5.0),
                                      Text('Total issued points',
                                          style: imgDescDark)
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 10.0),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 2.0),
                        child: Image.asset('assets/dot_blue.png'),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 1.0),
                        child: Image.asset('assets/dot_grey.png'),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15.0),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20.0),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0xFFD9D9D9),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 5, bottom: 5.0),
                          child: Image.asset('assets/search.png'),
                        ),
                        Container(
                          width: 95,
                          height: 24,
                          decoration: BoxDecoration(
                            color: Color(0xFFD9D9D9),
                          ),
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Search customer',
                              border: InputBorder.none,
                            ),
                            style: dialogTextSm,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10.0),
                Container(
                  child: SingleChildScrollView(
                    child: DataTable(
                      columns: [
                        DataColumn(label: Text('')),
                        DataColumn(label: Text('')),
                      ],
                      rows: pointsData.map((data) {
                        return DataRow(cells: [
                          DataCell(
                            TextButton(
                              onPressed: () {
                                showModalBottomSheet(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return Container(
                                      margin: EdgeInsets.only(bottom: 50.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: <Widget>[
                                          TextButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            child:
                                                Image.asset('assets/close.png'),
                                          ),
                                          Container(
                                            width: double.infinity,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Container(
                                                    width: 52,
                                                    height: 52,
                                                    decoration: BoxDecoration(
                                                      color: Colors.transparent,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              26),
                                                      border: Border.all(
                                                        color:
                                                            Color(0xFFCFAF4E),
                                                        width: 1,
                                                      ),
                                                    ),
                                                    child: Image.asset(
                                                        data.image)),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Text(data.name,
                                                    style: custName),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Text(data.points, style: label),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Text('Total points',
                                                    style: totalText),
                                                SizedBox(
                                                  height: 50,
                                                ),
                                                Text('0723 732 770',
                                                    style: numText),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Text(
                                                  'Phone number',
                                                  style: numDesc,
                                                ),
                                                SizedBox(
                                                  height: 30,
                                                ),
                                                TextButton(
                                                  onPressed: () {
                                                    Navigator.of(context).push(
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            Transactions(
                                                          data.image,
                                                          data.name,
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                  child: Text('Transactions',
                                                      style: transText),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                );
                              },
                              child: Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(right: 15.0),
                                    child: Image.asset(data.image),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(data.name, style: custName),
                                      Text('Points: ' + data.points,
                                          style: desc2),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          DataCell(
                            Row(
                              children: [
                                Container(
                                  width: 36,
                                  height: 36,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(18),
                                    color: Color(0xFFD9D9D9),
                                  ),
                                  margin: EdgeInsets.only(right: 15),
                                  child: Center(
                                    child: Image.asset('assets/whatsapp.png'),
                                  ),
                                ),
                                Container(
                                  width: 36,
                                  height: 36,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(18),
                                    color: Color(0xFFD9D9D9),
                                  ),
                                  child: Center(
                                    child: Image.asset('assets/call.png'),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ]);
                      }).toList(),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
            decoration: BoxDecoration(
              color: Color(0xFFD9D9D9),
            ),
            child: Row(
              children: [
                // Footer Navigation Buttons
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => Home(),
                        ),
                      );
                    },
                    child: Column(
                      children: [
                        Image.asset('assets/home.png',
                            color: Color.fromRGBO(0, 0, 0, 0.3)),
                        SizedBox(height: 5),
                        Text('Home',
                            style: footerText.copyWith(
                                color: Color.fromRGBO(0, 0, 0, 0.3))),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => GiveReward(),
                        ),
                      );
                    },
                    child: Column(
                      children: [
                        Image.asset('assets/reward.png',
                            color: Color.fromRGBO(0, 0, 0, 0.3)),
                        SizedBox(height: 5),
                        Text('Give reward',
                            style: footerText.copyWith(
                                color: Color.fromRGBO(0, 0, 0, 0.3))),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Image.asset('assets/customer.png'),
                      SizedBox(height: 5),
                      Text('Customers', style: footerText),
                    ],
                  ),
                ),
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      // Navigator.of(context).push(
                      //   MaterialPageRoute(
                      //     builder: (context) => Profile(),
                      //   ),
                      // );
                    },
                    child: Column(
                      children: [
                        Image.asset('assets/profile.png',
                            color: Color.fromRGBO(0, 0, 0, 0.3)),
                        SizedBox(height: 5),
                        Text('Profile',
                            style: footerText.copyWith(
                                color: Color.fromRGBO(0, 0, 0, 0.3))),
                      ],
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
}

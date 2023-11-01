import 'dart:async';
import 'dart:io';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:tiger_loyalty/src/pages/customers.dart';
import 'package:tiger_loyalty/src/pages/download_code.dart';
import 'package:tiger_loyalty/src/pages/give_reward.dart';
import 'package:tiger_loyalty/src/pages/profile.dart';
import 'package:tiger_loyalty/src/pages/signin.dart';
import 'package:dotted_border/dotted_border.dart';
import 'styles.dart';

class Transactions extends StatefulWidget {
  final String image;
  final String name;

  Transactions(this.image, this.name);

  @override
  _TransactionsState createState() => _TransactionsState();
}

class PointsData {
  String date;
  String amount;
  String points;

  PointsData({required this.date, required this.amount, required this.points});
}

class _TransactionsState extends State<Transactions> {
  List<PointsData> pointsData = [
    PointsData(date: '23/09/2023', amount: '1,300,000', points: '4000'),
    PointsData(date: '20/09/2023', amount: '2,300,000', points: '4000'),
    PointsData(date: '15/09/2023', amount: '700,000', points: '4000'),
    PointsData(date: '12/08/2023', amount: '2,130,000', points: '4000'),
    PointsData(date: '08/08/2023', amount: '700,000', points: '4000'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
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
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(right: 15),
                              child: Container(
                                child: Image.asset(widget.image),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.name,
                                  style: label,
                                ),
                                SizedBox(height: 10.0),
                                Text(
                                  'Transactions',
                                  style: desc,
                                ),
                                SizedBox(height: 10.0),
                              ],
                            ),
                          ],
                        )
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
              child: Container(
                child: SingleChildScrollView(
                  child: DataTable(
                    columns: [
                      DataColumn(label: Text('')),
                      DataColumn(label: Text('')),
                    ],
                    rows: pointsData.map((data) {
                      return DataRow(cells: [
                        DataCell(
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(data.date, style: transBold),
                                Text(
                                  'Amount paid: ' + data.amount,
                                  style: transDesc,
                                )
                              ],
                            ),
                          ),
                        ),
                        DataCell(
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(data.points, style: transBold),
                              Text('Points', style: transDesc),
                            ],
                          ),
                        )
                      ]);
                    }).toList(),
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
              decoration: BoxDecoration(
                color: Color(0xFFD9D9D9),
              ),
              child: Row(
                children: [
                  Expanded(
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
                        Image.asset(
                          'assets/customer.png',
                        ),
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
      ),
    );
  }
}

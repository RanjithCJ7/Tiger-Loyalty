import 'dart:async';
import 'dart:io';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:tiger_loyalty/src/pages/customers.dart';
import 'package:tiger_loyalty/src/pages/download_code.dart';
import 'package:tiger_loyalty/src/pages/give_reward.dart';
import 'package:tiger_loyalty/src/pages/home.dart';
import 'package:tiger_loyalty/src/pages/notification.dart';
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
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: size.height * 0.08,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.black,
          ),
        ),
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(widget.image),
                const SizedBox(width: 5),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.name,
                      style: label.copyWith(color: Colors.black),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Transactions',
                      style: desc,
                    ),
                  ],
                )
              ],
            ),
            Container(
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => NotificationScreen(),
                    ),
                  );
                },
                child: Stack(
                  children: [
                    Image.asset('assets/notification.png'),
                    Positioned(
                      top: -1,
                      right: 0,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Image.asset('assets/notification_bg.png'),
                          Text('3', style: notificationText),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: <Widget>[
          // Container(
          //   margin: EdgeInsets.only(top: 50.0),
          //   padding: EdgeInsets.symmetric(horizontal: 20.0),
          //   child: Row(
          //     children: [
          //       Expanded(
          //         child: Column(
          //           crossAxisAlignment: CrossAxisAlignment.start,
          //           children: [
          //             Row(
          //               children: [
          //                 Padding(
          //                   padding: EdgeInsets.only(right: 15),
          //                   child: Container(
          //                     child: Image.asset(widget.image),
          //                   ),
          //                 ),
          //                 Column(
          //                   crossAxisAlignment: CrossAxisAlignment.start,
          //                   children: [
          //                     Text(
          //                       widget.name,
          //                       style: label,
          //                     ),
          //                     SizedBox(height: 10.0),
          //                     Text(
          //                       'Transactions',
          //                       style: desc,
          //                     ),
          //                     SizedBox(height: 10.0),
          //                   ],
          //                 ),
          //               ],
          //             )
          //           ],
          //         ),
          //       ),
          //       Stack(
          //         children: [
          //           Container(
          //             margin:
          //                 EdgeInsets.only(bottom: 30.0, right: 5.0, top: 5.0),
          //             child: Image.asset('assets/notification.png'),
          //           ),
          //           Positioned(
          //             top: -1,
          //             right: 0,
          //             child: Container(
          //               child: Stack(
          //                 alignment: Alignment.center,
          //                 children: [
          //                   Image.asset('assets/notification_bg.png'),
          //                   Text('3', style: notificationText),
          //                 ],
          //               ),
          //             ),
          //           ),
          //         ],
          //       ),
          //     ],
          //   ),
          // ),
          ListView.separated(
            padding: const EdgeInsets.only(top: 10),
            shrinkWrap: true,
            itemCount: pointsData.length,
            separatorBuilder: (context, index) => const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Divider(color: Color(0XFFD9D9D9), thickness: 1),
            ),
            itemBuilder: (context, index) {
              var data = pointsData[index];
              return Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                ),
                height: MediaQuery.of(context).size.height * 0.055,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          data.date,
                          style: const TextStyle(
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w700,
                              fontSize: 16),
                        ),
                        Text(
                          "Amount paid:${data.amount}",
                          style: const TextStyle(
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: Color(0XFF808080)),
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          data.points,
                          style: const TextStyle(
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w700,
                              fontSize: 16),
                        ),
                        const Text(
                          "Points",
                          style: TextStyle(
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: Color(0XFF808080)),
                        )
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
          /* Expanded(
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
           */
          // Container(
          //   padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
          //   decoration: BoxDecoration(
          //     color: Color(0xFFD9D9D9),
          //   ),
          //   child: Row(
          //     children: [
          //       Expanded(
          //         child: Column(
          //           children: [
          //             Image.asset('assets/home.png',
          //                 color: Color.fromRGBO(0, 0, 0, 0.3)),
          //             SizedBox(height: 5),
          //             Text('Home',
          //                 style: footerText.copyWith(
          //                     color: Color.fromRGBO(0, 0, 0, 0.3))),
          //           ],
          //         ),
          //       ),
          //       Expanded(
          //         child: TextButton(
          //           onPressed: () {
          //             Navigator.of(context).push(
          //               MaterialPageRoute(
          //                 builder: (context) => GiveReward(),
          //               ),
          //             );
          //           },
          //           child: Column(
          //             children: [
          //               Image.asset('assets/reward.png',
          //                   color: Color.fromRGBO(0, 0, 0, 0.3)),
          //               SizedBox(height: 5),
          //               Text('Give reward',
          //                   style: footerText.copyWith(
          //                       color: Color.fromRGBO(0, 0, 0, 0.3))),
          //             ],
          //           ),
          //         ),
          //       ),
          //       Expanded(
          //         child: Column(
          //           children: [
          //             Image.asset(
          //               'assets/customer.png',
          //             ),
          //             SizedBox(height: 5),
          //             Text('Customers', style: footerText),
          //           ],
          //         ),
          //       ),
          //       Expanded(
          //         child: TextButton(
          //           onPressed: () {
          //             // Navigator.of(context).push(
          //             //   MaterialPageRoute(
          //             //     builder: (context) => Profile(),
          //             //   ),
          //             // );
          //           },
          //           child: Column(
          //             children: [
          //               Image.asset('assets/profile.png',
          //                   color: Color.fromRGBO(0, 0, 0, 0.3)),
          //               SizedBox(height: 5),
          //               Text('Profile',
          //                   style: footerText.copyWith(
          //                       color: Color.fromRGBO(0, 0, 0, 0.3))),
          //             ],
          //           ),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}

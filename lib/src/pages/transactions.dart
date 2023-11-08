import 'package:flutter/material.dart';
import 'package:tiger_loyalty/const/my_appbar.dart';

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
      backgroundColor: Colors.white,
      appBar: My_AppBar(
        context,
        title: Row(
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
      ),
      body: Column(
        children: <Widget>[
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
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Divider(color: Color(0XFFD9D9D9), thickness: 1),
          )
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

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

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class PointsData {
  String points;
  String name;
  String image;

  PointsData({required this.points, required this.name, required this.image});
}

class _HomeState extends State<Home> {
  bool points = true;
  String selectedToday = 'Today';
  List<String> selectDay = ['Today', 'Tomorrow', 'Next Week'];

  List<PointsData> pointsData = [
    PointsData(
        points: '4,000', name: 'Juma hamza', image: 'assets/pending_1.png'),
    PointsData(
        points: '250', name: 'Hamisa Kichwa', image: 'assets/pending_2.png'),
    PointsData(
        points: '1,230', name: 'Jane Jackson', image: 'assets/pending_3.png'),
    PointsData(
        points: '700', name: 'Jaribu Athumani', image: 'assets/pending_4.png'),
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
                        Text('Hello Jane,', style: label),
                        SizedBox(height: 10.0),
                        Text('Boob Boo Restaurant', style: desc),
                        SizedBox(height: 10.0),
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
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children: [
                    Container(
                      child: points
                          ? Stack(
                              alignment: Alignment.center,
                              children: [
                                Image.asset('assets/rectangle_1.png'),
                                Positioned(
                                  bottom: 0,
                                  right: 30,
                                  child: Image.asset('assets/rectangle_2.png'),
                                ),
                                Container(
                                  padding: EdgeInsets.all(15.0),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Text('Issuance', style: imgLabel),
                                          const Spacer(),
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 5),
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: Colors.white,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(25.0),
                                            ),
                                            height: 20,
                                            child: DropdownButtonHideUnderline(
                                              child: DropdownButton<String>(
                                                value: selectedToday,
                                                iconSize: 18,
                                                onChanged: (newValue) {
                                                  setState(() {
                                                    selectedToday =
                                                        newValue ?? '';
                                                  });
                                                },
                                                items: selectDay.map((today) {
                                                  return DropdownMenuItem<
                                                      String>(
                                                    value: today,
                                                    child: Text(today,
                                                        style: todayText),
                                                  );
                                                }).toList(),
                                              ),
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
                                              Text('10', style: imgNum),
                                              SizedBox(height: 5.0),
                                              Text('Customers', style: imgDesc)
                                            ],
                                          ),
                                          Spacer(),
                                          Image.asset('assets/line.png'),
                                          Spacer(),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text('60,120', style: imgNum),
                                              SizedBox(height: 5.0),
                                              Text('Total issued points',
                                                  style: imgDesc)
                                            ],
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                )
                              ],
                            )
                          : Stack(
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
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Text('Redemption', style: imgLabel),
                                          Spacer(),
                                          Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 5),
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: Colors.white,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(25.0),
                                            ),
                                            height: 20,
                                            child: DropdownButton<String>(
                                              value: selectedToday,
                                              iconSize: 18,
                                              icon: const Icon(
                                                Icons.arrow_drop_down,
                                                color: Colors.white,
                                              ),
                                              onChanged: (newValue) {
                                                setState(() {
                                                  selectedToday =
                                                      newValue ?? '';
                                                });
                                              },
                                              selectedItemBuilder:
                                                  (BuildContext context) {
                                                return <DropdownMenuItem<
                                                    String>>[
                                                  DropdownMenuItem<String>(
                                                    value: selectedToday,
                                                    child: Text(selectedToday,
                                                        style: dateText),
                                                  ),
                                                ];
                                              },
                                              items: selectDay.map((today) {
                                                return DropdownMenuItem<String>(
                                                  value: today,
                                                  child: Text(today,
                                                      style: todayText),
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
                                              Text('23', style: imgNum),
                                              SizedBox(height: 5.0),
                                              Text('Customers', style: imgDesc)
                                            ],
                                          ),
                                          Spacer(),
                                          Image.asset('assets/line.png'),
                                          Spacer(),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text('178,300', style: imgNum),
                                              SizedBox(height: 5.0),
                                              Text('Total redeemed points',
                                                  style: imgDescDark)
                                            ],
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                    ),
                    SizedBox(height: 10.0),
                    Container(
                      child: points
                          ? Row(
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
                            )
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 1.0),
                                  child: Image.asset('assets/dot_grey.png'),
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 1.0),
                                  child: Image.asset('assets/dot_blue.png'),
                                ),
                              ],
                            ),
                    ),
                    SizedBox(height: 15.0),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Issued points', style: labelSm),
                          Container(
                            decoration: BoxDecoration(
                                color: const Color(0xFFF5F5F5),
                                borderRadius: BorderRadius.circular(5),
                                border:
                                    Border.all(color: const Color(0XFFD9D9D9))),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset('assets/search.png'),
                                  const SizedBox(width: 10),
                                  SizedBox(
                                    width: 95,
                                    height: 24,
                                    child: TextField(
                                      decoration: InputDecoration(
                                        contentPadding:
                                            EdgeInsets.symmetric(vertical: 11),
                                        hintText: 'Search customer',
                                        border: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                      ),
                                      style: dialogTextSm,
                                    ),
                                  )
                                  /* Padding(
                                    padding: const EdgeInsets.only(
                                        right: 5, bottom: 5.0),
                                    child: Image.asset('assets/search.png'),
                                  ),
                                  Container(
                                    width: 95,
                                    height: 24,
                                    decoration: BoxDecoration(
                                        // color: Color.fromARGB(255, 247, 210, 210),
                                        ),
                                    child: TextField(
                                      decoration: InputDecoration(
                                        hintText: 'Search customer',
                                        border: InputBorder.none,
                                      ),
                                      style: dialogTextSm,
                                    ),
                                  ), */
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Container(
                      height: 32,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border:
                            Border.all(color: Color(0xFF000000), width: 0.5),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: points ? Color(0xFFD9D9D9) : null,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: TextButton(
                                onPressed: () {
                                  setState(() {
                                    points = true;
                                  });
                                },
                                child: Text('Pending', style: smText),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: points ? null : Color(0xFFD9D9D9),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: TextButton(
                                onPressed: () {
                                  setState(() {
                                    points = false;
                                  });
                                },
                                child: Text('Issued', style: smText),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Expanded(
                        child: SingleChildScrollView(
                          child: DataTable(
                            horizontalMargin: 5,
                            headingRowHeight: 10,
                            checkboxHorizontalMargin: 0,
                            columns: [
                              DataColumn(label: Text('')),
                              DataColumn(label: Text('')),
                            ],
                            rows: pointsData.map((data) {
                              return DataRow(cells: [
                                DataCell(
                                  Row(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(right: 15.0),
                                        child: Image.asset(data.image),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(data.points, style: labelSm),
                                          Text(data.name, style: desc),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                if (points)
                                  DataCell(
                                    Row(
                                      children: [
                                        TextButton(
                                          onPressed: () {},
                                          style: approveBtn,
                                          child: Row(
                                            children: [
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(right: 5.0),
                                                child: Image.asset(
                                                    'assets/approve.png'),
                                              ),
                                              Text('Approve',
                                                  style: approveText),
                                            ],
                                          ),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            showModalBottomSheet(
                                              context: context,
                                              shape:
                                                  const RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.vertical(
                                                  top: Radius.circular(15.0),
                                                ),
                                              ),
                                              builder: (BuildContext context) {
                                                return Stack(
                                                  children: [
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                          bottom: 50, top: 15),
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .end,
                                                        children: <Widget>[
                                                          Padding(
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                    horizontal:
                                                                        15,
                                                                    vertical:
                                                                        10),
                                                            child: Container(
                                                              width: double
                                                                  .infinity,
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .min,
                                                                children: [
                                                                  Container(
                                                                    width: 260,
                                                                    alignment:
                                                                        Alignment
                                                                            .center,
                                                                    child: Text(
                                                                      'Do you want to cancel ${data.name} rewards point?',
                                                                      style:
                                                                          labelSm,
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                      height:
                                                                          15.0),
                                                                  Container(
                                                                    width: double
                                                                        .infinity,
                                                                    height: 53,
                                                                    child:
                                                                        TextButton(
                                                                      onPressed:
                                                                          () {},
                                                                      style:
                                                                          btnGrey,
                                                                      child:
                                                                          Text(
                                                                        'No',
                                                                        style:
                                                                            btnGreyText,
                                                                        textAlign:
                                                                            TextAlign.center,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                      height:
                                                                          5.0),
                                                                  Container(
                                                                    width: double
                                                                        .infinity,
                                                                    height: 53,
                                                                    child:
                                                                        TextButton(
                                                                      onPressed:
                                                                          () {},
                                                                      style:
                                                                          btnRed,
                                                                      child:
                                                                          Text(
                                                                        'Yes',
                                                                        style:
                                                                            yesText,
                                                                        textAlign:
                                                                            TextAlign.center,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Positioned(
                                                      right: 0,
                                                      child: TextButton(
                                                        onPressed: () {
                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                        child: Image.asset(
                                                            'assets/close.png'),
                                                      ),
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                          },
                                          child: Align(
                                            alignment: Alignment.centerRight,
                                            child: Image.asset(
                                                'assets/close_sm.png'),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                else
                                  DataCell(
                                    TextButton(
                                      onPressed: () {
                                        /* showModalBottomSheet(
                                          context: context,
                                          shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.vertical(
                                              top: Radius.circular(15.0),
                                            ),
                                          ),
                                          builder: (BuildContext context) {
                                            return Stack(
                                              children: [
                                                Container(
                                                  margin: EdgeInsets.only(
                                                      bottom: 50, top: 15),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.end,
                                                    children: <Widget>[
                                                      Padding(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal: 15,
                                                                vertical: 10),
                                                        child: Container(
                                                          width:
                                                              double.infinity,
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            children: [
                                                              Container(
                                                                width: 260,
                                                                alignment:
                                                                    Alignment
                                                                        .center,
                                                                child: Text(
                                                                  'Do you want to cancel ${data.name} rewards point?',
                                                                  style:
                                                                      labelSm,
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                  height: 15.0),
                                                              Container(
                                                                width: double
                                                                    .infinity,
                                                                height: 53,
                                                                child:
                                                                    TextButton(
                                                                  onPressed:
                                                                      () {},
                                                                  style:
                                                                      btnGrey,
                                                                  child: Text(
                                                                    'No',
                                                                    style:
                                                                        btnGreyText,
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                  ),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                  height: 5.0),
                                                              Container(
                                                                width: double
                                                                    .infinity,
                                                                height: 53,
                                                                child:
                                                                    TextButton(
                                                                  onPressed:
                                                                      () {},
                                                                  style: btnRed,
                                                                  child: Text(
                                                                    'Yes',
                                                                    style:
                                                                        yesText,
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Positioned(
                                                  right: 0,
                                                  child: TextButton(
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: Image.asset(
                                                        'assets/close.png'),
                                                  ),
                                                ),
                                              ],
                                            );
                                          },
                                        ); */
                                        showModalBottomSheet(
                                          context: context,
                                          shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.vertical(
                                              top: Radius.circular(15.0),
                                            ),
                                          ),
                                          builder: (BuildContext context) {
                                            return Stack(
                                              children: [
                                                Container(
                                                  margin: EdgeInsets.only(
                                                      bottom: 50, top: 25),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.end,
                                                    children: <Widget>[
                                                      Padding(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                          horizontal: 15,
                                                        ),
                                                        child: Container(
                                                          width:
                                                              double.infinity,
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            children: [
                                                              Container(
                                                                width: 260,
                                                                alignment:
                                                                    Alignment
                                                                        .center,
                                                                child: Text(
                                                                  'Do you want to cancel ${data.name} rewards point?',
                                                                  style:
                                                                      labelSm,
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                  height: 15.0),
                                                              Container(
                                                                width: double
                                                                    .infinity,
                                                                height: 53,
                                                                child:
                                                                    TextButton(
                                                                  onPressed:
                                                                      () {},
                                                                  style:
                                                                      btnGrey,
                                                                  child: Text(
                                                                    'No',
                                                                    style:
                                                                        btnGreyText,
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                  ),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                  height: 5.0),
                                                              Container(
                                                                width: double
                                                                    .infinity,
                                                                height: 53,
                                                                child:
                                                                    TextButton(
                                                                  onPressed:
                                                                      () {},
                                                                  style: btnRed,
                                                                  child: Text(
                                                                    'Yes',
                                                                    style:
                                                                        yesText,
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Positioned(
                                                  right: 0,
                                                  child: TextButton(
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: Image.asset(
                                                        'assets/close.png'),
                                                  ),
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      },
                                      style: cancelBtn,
                                      child: Text(
                                        'Cancel',
                                        style: cancelText,
                                      ),
                                    ),
                                  ),
                              ]);
                            }).toList(),
                          ),
                        ),
                      ),
                    )
                  ],
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
                        Image.asset('assets/home.png'),
                        SizedBox(height: 5),
                        Text('Home', style: footerText),
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
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => Customers(),
                          ),
                        );
                      },
                      child: Column(
                        children: [
                          Image.asset('assets/customer.png',
                              color: Color.fromRGBO(0, 0, 0, 0.3)),
                          SizedBox(height: 5),
                          Text('Customers',
                              style: footerText.copyWith(
                                  color: Color.fromRGBO(0, 0, 0, 0.3))),
                        ],
                      ),
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

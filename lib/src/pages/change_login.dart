import 'package:flutter/material.dart';

import 'package:tiger_loyalty/src/pages/customers.dart';
import 'package:tiger_loyalty/screens/home/component/home.dart';

import 'styles.dart';

class ChangeLogin extends StatelessWidget {
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
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Stack(
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                                bottom: 30.0, right: 5.0, top: 5.0),
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
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Change Login',
                          style: label,
                        ),
                        SizedBox(height: 20),
                        // Stack(
                        //   alignment: Alignment.center,
                        //   children: [
                        //     Image.asset('assets/download_code.png'),
                        //     Image.asset('assets/tigersuit_sm.png'),
                        //   ],
                        // ),
                        // Container(
                        //   margin: EdgeInsets.all(40.0),
                        //   child: Row(
                        //     children: [
                        //       Expanded(
                        //         child: Divider(
                        //           color: Color(0xFF808080),
                        //         ),
                        //       ),
                        //       Padding(
                        //         padding: const EdgeInsets.symmetric(
                        //             horizontal: 16.0),
                        //         child: Text("OR", style: orText),
                        //       ),
                        //       Expanded(
                        //         child: Divider(
                        //           color: Color(0xFF808080),
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        // Padding(
                        //   padding: EdgeInsets.symmetric(horizontal: 40.0),
                        //   child: Text(
                        //     'Enter Boo Boo restaurant reward namba',
                        //     style: textGrey,
                        //     textAlign: TextAlign.center,
                        //   ),
                        // ),
                        // SizedBox(height: 30),
                        // Container(
                        //   width: 263,
                        //   child: Text(
                        //     '1 2 3 4 5 6',
                        //     style: numBig.copyWith(
                        //       letterSpacing: 5,
                        //     ),
                        //     textAlign: TextAlign.center,
                        //   ),
                        // ),
                        // SizedBox(height: 20),
                        // Container(
                        //   // width: 70,
                        //   child: TextButton(
                        //     onPressed: () {},
                        //     child: Row(
                        //       mainAxisAlignment: MainAxisAlignment.center,
                        //       children: [
                        //         Padding(
                        //           padding: const EdgeInsets.only(
                        //               right: 10.0, bottom: 5.0),
                        //           child: Image.asset('assets/download.png'),
                        //         ),
                        //         Text(
                        //           'Download',
                        //           style: resetBtnText,
                        //         ),
                        //       ],
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
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
                  child: Column(
                    children: [
                      Image.asset('assets/reward.png'),
                      SizedBox(height: 5),
                      Text('Give reward', style: footerText),
                    ],
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
    );
  }
}

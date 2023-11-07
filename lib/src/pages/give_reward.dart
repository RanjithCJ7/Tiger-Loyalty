import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';

import 'package:tiger_loyalty/const/my_appbar.dart';

import 'styles.dart';

class GiveReward extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: My_AppBar(context),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            // Container(
            //   padding:
            //       const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
            //   child: Row(
            //     children: [
            //       Expanded(
            //         child: Column(
            //           crossAxisAlignment: CrossAxisAlignment.end,
            //           children: [
            //             Stack(
            //               children: [
            //                 Image.asset('assets/notification.png'),
            //                 Positioned(
            //                   top: -1,
            //                   right: 0,
            //                   child: Stack(
            //                     alignment: Alignment.center,
            //                     children: [
            //                       Image.asset('assets/notification_bg.png'),
            //                       Text('3', style: notificationText),
            //                     ],
            //                   ),
            //                 ),
            //               ],
            //             ),
            //           ],
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
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
                            'Scan to collect points',
                            style: label,
                          ),
                          const SizedBox(height: 20),
                          // Stack(
                          //   alignment: Alignment.center,
                          //   children: [
                          //     Image.asset('assets/download_code.png'),
                          //     Image.asset('assets/tigersuit_sm.png'),
                          //   ],
                          // ),
                          QrImageView(
                            data: '1234567890',
                            version: QrVersions.auto,
                            size: Get.width * 0.62,
                            embeddedImage:
                                const AssetImage('assets/tigersuit_sm.png'),
                          ),
                          Container(
                            margin: const EdgeInsets.all(40.0),
                            child: Row(
                              children: [
                                const Expanded(
                                  child: Divider(
                                    color: Color(0xFF808080),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0),
                                  child: Text("OR", style: orText),
                                ),
                                const Expanded(
                                  child: Divider(
                                    color: Color(0xFF808080),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 40.0),
                            child: Text(
                              'Enter Boo Boo restaurant reward namba',
                              style: textGrey,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(height: size.height * 0.03),
                          SizedBox(
                            width: size.width * 0.6,
                            child: Text(
                              '1 2 3 4 5 6',
                              style: numBig.copyWith(
                                letterSpacing: 5,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(height: size.height * 0.03),
                          TextButton(
                            onPressed: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 10.0, bottom: 5.0),
                                  child: Image.asset('assets/download.png'),
                                ),
                                Text(
                                  'Download',
                                  style: resetBtnText,
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
            /* Container(
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
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => Profile(),
                          ),
                        );
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
           */
          ],
        ),
      ),
    );
  }
}

import 'dart:async';
import 'dart:io';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:tiger_loyalty/src/pages/add_lipa_namba.dart';
import 'package:tiger_loyalty/src/pages/signin.dart';
import 'package:dotted_border/dotted_border.dart';
import 'styles.dart';

class DownloadCode extends StatelessWidget {
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
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Boo Boo Restaurant',
                            style: label,
                          ),
                          SizedBox(height: 10),
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              Image.asset('assets/download_code.png'),
                              Image.asset('assets/tigersuit_sm.png'),
                            ],
                          ),
                          SizedBox(height: 10),
                          DottedBorder(
                            borderType: BorderType.RRect,
                            radius: Radius.circular(5),
                            dashPattern: [6, 7],
                            color: Colors.black,
                            strokeWidth: 1.5,
                            child: Container(
                              width: 263,
                              decoration: BoxDecoration(
                                color: Color(0xFFCFAF4E).withOpacity(0.4),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Center(
                                child: Text(
                                  '1 2 3 4 5 6',
                                  style: numBig.copyWith(
                                    letterSpacing: 5,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: 70,
                            child: TextButton(
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
                                    'Save',
                                    style: resetBtnText,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 25.0),
                      width: 122,
                      child: TextButton(
                        style: btnGrey,
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => SignIn(),
                            ),
                          );
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(right: 10.0),
                                child: Text(
                                  'Sign in',
                                  style: btnGreyText,
                                ),
                              ),
                              Image.asset('assets/btn_arrow_right.png'),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 20.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Divider(
                              color: Color(0xFF808080),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Text("OR", style: orText),
                          ),
                          Expanded(
                            child: Divider(
                              color: Color(0xFF808080),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40.0),
                      child: Column(
                        children: [
                          Text(
                            'Use Airtel Money lipa namba to receive payment and give instant reward to customers',
                            style: textGrey,
                            textAlign: TextAlign.center,
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 25.0),
                            width: 223,
                            child: TextButton(
                              style: btnGrey,
                              onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => AddLipaNamba(),
                                  ),
                                );
                              },
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10.0, vertical: 8.0),
                                child: Row(
                                  children: [
                                    Image.asset('assets/add_lipa.png'),
                                    Padding(
                                      padding: EdgeInsets.only(left: 35.0),
                                      child: Text(
                                        'Add Lipa namba',
                                        style: btnGreyText,
                                      ),
                                    ),
                                  ],
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

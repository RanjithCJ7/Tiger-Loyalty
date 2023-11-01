import 'dart:async';
import 'dart:io';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:tiger_loyalty/src/pages/download_code.dart';
import 'package:tiger_loyalty/src/pages/signin.dart';
import 'package:dotted_border/dotted_border.dart';
import 'styles.dart';

class CreateAccount extends StatefulWidget {
  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => Welcome(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(bottom: 20.0),
              child: Text(
                'Please wait...',
                style: label,
              ),
            ),
            Text(
              'Tiger is creating your account',
              style: desc,
            ),
          ],
        ),
      ),
    );
  }
}

class Welcome extends StatelessWidget {
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
                          Image.asset('assets/tigersuit.png'),
                          SizedBox(height: 20),
                          Text(
                            'Welcome to Tiger',
                            style: desc,
                          ),
                          SizedBox(height: 15),
                          Text(
                            'Boo Boo Restaurant',
                            style: label,
                          ),
                          SizedBox(height: 15),
                          Text(
                            'Your Merchant reward number is',
                            style: desc,
                          ),
                          SizedBox(height: 25),
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
                            width: 150,
                            child: TextButton(
                              onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => DownloadCode(),
                                  ),
                                );
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        right: 10.0, bottom: 5.0),
                                    child: Image.asset('assets/download.png'),
                                  ),
                                  Text(
                                    'Download QR Code',
                                    style: resetBtnText,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40.0),
                      child: Text(
                        'The number above allows your customers to pay cash and collect reward points from you.',
                        style: textDark,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 25.0),
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
                      padding: EdgeInsets.symmetric(horizontal: 50.0),
                      child: Column(
                        children: [
                          Text(
                            'Use Lipa number to receive payment and give instant rewards to customers',
                            style: textGrey,
                            textAlign: TextAlign.center,
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 25.0),
                            width: 223,
                            child: TextButton(
                              style: btnGrey,
                              onPressed: () {
                                // Navigator.of(context).push(
                                //   MaterialPageRoute(
                                //     builder: (context) => SignIn(),
                                //   ),
                                // );
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

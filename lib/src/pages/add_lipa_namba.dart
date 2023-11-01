import 'dart:async';
import 'dart:io';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:tiger_loyalty/src/pages/choose_subscription.dart';
import 'package:tiger_loyalty/src/pages/download_code.dart';
import 'package:tiger_loyalty/src/pages/save_lipa_namba.dart';
import 'package:tiger_loyalty/src/pages/signin.dart';
import 'package:dotted_border/dotted_border.dart';
import 'styles.dart';

class AddLipaNamba extends StatefulWidget {
  @override
  _AddLipaNambaState createState() => _AddLipaNambaState();
}

class _AddLipaNambaState extends State<AddLipaNamba> {
  final TextEditingController textController = TextEditingController();
  bool showSaveButton = false;

  @override
  void initState() {
    super.initState();

    textController.addListener(() {
      if (textController.text.isEmpty) {
        setState(() {
          showSaveButton = false;
        });
      } else {
        setState(() {
          showSaveButton = true;
        });
      }
    });
  }

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
                          Text(
                            'Lipa + Tiger',
                            style: label,
                          ),
                          SizedBox(height: 50),
                          Text(
                            'Boo Boo Restaurant',
                            style: labelSm,
                          ),
                          SizedBox(height: 20),
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
                                color: Color(0xFFCFAF4E),
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
                      padding: EdgeInsets.symmetric(horizontal: 35.0),
                      child: Text(
                        'By masking Tiger reward number with Lipa namba, your customers will be able to pay you via Lipa namba and receive rewards instantly',
                        style: textDark,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 30.0, bottom: 70.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xFFF5F5F5)),
                        color: Color(0xFFD9D9D9),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: TextField(
                        controller: textController,
                        onChanged: (text) {
                          setState(() {
                            showSaveButton = text.isNotEmpty;
                          });
                        },
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: 'Enter your Lipa namba',
                          hintStyle: TextStyle(color: Color(0xFF808080)),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.all(20),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 30.0),
                      child: Container(
                        width: double.infinity,
                        child: TextButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => SaveLipaNamba(),
                              ),
                            );
                          },
                          style: btnGold2,
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 8.0),
                            child: Text(
                              'Save',
                              style: btnGoldText2,
                            ),
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
                            child:
                                Text("Do it Later on Setting", style: orText),
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
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 10.0),
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

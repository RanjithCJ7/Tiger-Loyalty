import 'package:flutter/material.dart';

import 'package:tiger_loyalty/src/pages/choose_subscription.dart';
import 'package:tiger_loyalty/src/pages/download_code.dart';
import 'package:tiger_loyalty/screens/signin/component/signin.dart';
import 'package:dotted_border/dotted_border.dart';
import 'styles.dart';

class SaveLipaNamba extends StatefulWidget {
  @override
  _SaveLipaNambaState createState() => _SaveLipaNambaState();
}

class _SaveLipaNambaState extends State<SaveLipaNamba> {
  // final TextEditingController textController = TextEditingController();
  // bool showCloseButton = false;
  // bool showSaveButton = false;

  @override
  void initState() {
    super.initState();

    // textController.addListener(() {
    //   if (textController.text.isEmpty) {
    //     setState(() {
    //       // showSaveButton = false;
    //       // showCloseButton = false;
    //     });
    //   } else {
    //     setState(() {
    //       // showSaveButton = true;
    //       // showCloseButton = true;
    //     });
    //   }
    // });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(40.0),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Lipa + Tiger',
                            style: label,
                          ),
                          SizedBox(height: size.height * 0.05),
                          Text(
                            'Boo Boo Restaurant',
                            style: labelSm,
                          ),
                          SizedBox(height: size.height * 0.02),
                          Text(
                            'Your Merchant reward number is',
                            style: desc,
                          ),
                          SizedBox(height: size.height * 0.03),
                          DottedBorder(
                            borderType: BorderType.RRect,
                            radius: const Radius.circular(5),
                            dashPattern: const [6, 7],
                            color: Colors.black,
                            strokeWidth: 1.5,
                            child: Container(
                              width: size.width * 0.6,
                              decoration: BoxDecoration(
                                color: const Color(0xFFCFAF4E),
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
                          SizedBox(
                            width: size.width * 0.5,
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
                      padding:
                          EdgeInsets.symmetric(horizontal: size.width * 0.04),
                      child: Text(
                        'By masking Tiger reward number with Lipa namba, your customers will be able to pay you via Lipa namba and receive rewards instantly',
                        style: textDark,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(height: size.height * 0.04),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xFFF5F5F5)),
                        color: const Color(0xFFD9D9D9),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Text(
                                'Lipa Hapa | 987654',
                                style: textFieldStyle,
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => ChooseSubscription(),
                                ),
                              );
                            },
                            child: Image.asset('assets/remove.png'),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: size.height * 0.08),
                    Row(
                      children: [
                        const Expanded(
                          child: Divider(
                            color: Color(0xFF808080),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Text("Do it Later on Setting", style: orText),
                        ),
                        const Expanded(
                          child: Divider(
                            color: Color(0xFF808080),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: size.height * 0.04),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 50.0),
                      child: SizedBox(
                        // margin: EdgeInsets.symmetric(vertical: 10.0),
                        width: size.width * 0.35,
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
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 10.0),
                                  child: Text(
                                    'Proceed',
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

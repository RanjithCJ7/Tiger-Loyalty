import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:tiger_loyalty/initial_binding.dart';
import 'package:tiger_loyalty/screens/signup/component/pin_setup.dart';
import 'package:tiger_loyalty/screens/signup/controller/signup_controller.dart';
import 'package:tiger_loyalty/screens/signin/component/signin.dart';
import 'styles.dart';

class Authentication extends StatelessWidget {
  bool isReset;
  Authentication({super.key, required this.isReset});

  SignupController signupController = Get.find<SignupController>();

  @override
  Widget build(BuildContext context) {
    signupController.otpController.clear();
    return Scaffold(
      body: Center(
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 15.0),
                        child: Image.asset('assets/auth.png'),
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 20.0),
                        child: Text(
                          'Authentication',
                          style: label,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 30.0),
                        child: Text(
                          'Enter OTP sent to your email',
                          style: desc,
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.only(right: 5.0),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: const Color(0xFFF5F5F5)),
                                color: const Color(0xFFD9D9D9),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 15),
                                    child: Image.asset('assets/pin.png'),
                                  ),
                                  Expanded(
                                    child: TextField(
                                      controller:
                                          signupController.otpController,
                                      keyboardType: TextInputType.number,
                                      inputFormatters: <TextInputFormatter>[
                                        FilteringTextInputFormatter.digitsOnly,
                                        LengthLimitingTextInputFormatter(6),
                                      ],
                                      obscureText: true,
                                      decoration: const InputDecoration(
                                        hintText: '******',
                                        hintStyle: TextStyle(
                                            color: Color(0xFF808080),
                                            letterSpacing: 4.0),
                                        border: InputBorder.none,
                                      ),
                                      obscuringCharacter: '*',
                                      style: textFieldStyle.copyWith(
                                          letterSpacing: 4.0),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              if (signupController.otpController.text.isEmpty) {
                                Fluttertoast.showToast(msg: "Please enter OTP");
                              } else if (signupController
                                      .otpController.text.length <
                                  6) {
                                Fluttertoast.showToast(
                                    msg: "OTP should be 6 digit");
                              } else {
                                if (isReset) {
                                  Get.to(() => PinSetup(isReset: isReset),
                                      binding: InitialBinding());
                                } else {
                                  signupController.verifyOTP(isReset);
                                }
                              }
                            },
                            style: btnGold,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 13, vertical: 8.0),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 10.0),
                                    child: Text(
                                      'Next',
                                      style: btnGoldText,
                                    ),
                                  ),
                                  Image.asset('assets/btn_arrow_right.png'),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Text(
                            'Haven’t received?',
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              // Navigator.of(context).push(
                              //   MaterialPageRoute(
                              //     builder: (context) => PinSetup(),
                              //   ),
                              // );
                            },
                            child: const Text('Resend'),
                          ),
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 25.0, bottom: 30.0),
                        child: Row(
                          children: [
                            const Expanded(
                              child: Divider(
                                color: Color(0xFF808080),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
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
                      Container(
                        margin: const EdgeInsets.only(bottom: 50.0),
                        width: double.infinity,
                        height: 50,
                        child: TextButton(
                          style: btnGrey,
                          onPressed: () {
                            Get.offAll(() => SignIn(),
                                binding: InitialBinding());
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.arrow_back,
                                  color: Colors.black,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: Text(
                                    'Sign in',
                                    style: btnGreyText.copyWith(
                                        color: Colors.black),
                                  ),
                                ),
                              ],
                            ),
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
    );
  }
}

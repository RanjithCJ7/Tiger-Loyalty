import 'dart:convert';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:tiger_loyalty/src/pages/pin_setup.dart';
import 'package:tiger_loyalty/src/pages/signin.dart';
import 'styles.dart';

class Authentication extends StatelessWidget {
  TextEditingController pinController = TextEditingController();

  final _tinFormatter = CustomTextInputFormatter();

  Future<void> otpLogin(String pin, BuildContext context) async {
    print('name: 29 $pin');

    if (pin.isEmpty) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            // title: Text('Please enter'),
            content: Text('Please enter an OTP'),
            // actions: [
            //   TextButton(
            //     onPressed: () {
            //       Navigator.of(context).pop();
            //     },
            //     child: Text('OK'),
            //   ),
            // ],
          );
        },
      );
      return;
    }

    try {
      final String apiUrl = "https://dummyjson.com/auth/login";

      Map<String, String> formData = {
        "pin": pin,
      };

      final response = await http.post(
        Uri.parse(apiUrl),
        body: formData,
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);

        String token = data['token'];
        String pin = data['pin'];

        print('Token: $token');
        print('PIN : $pin');
        print('Login successfully');

        // Now you can navigate to another screen or perform other actions upon successful login.
        // For example:
        // Navigator.of(context).pushReplacement(MaterialPageRoute(
        //   builder: (context) {
        //     // Pass user data to the next screen if needed
        //     return NextScreen(username, token);
        //   },
        // ));
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Verifying'),
              content: Text('Please wait'),
            );
          },
        );
      } else {
        final Map<String, dynamic> errorData = jsonDecode(response.body);
        String errorMessage = errorData['message'];
        print('Login failed. Status code: ${response.statusCode}');
        print('Error Message: $errorMessage');

        // Show an error message to the user, e.g., using a SnackBar
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Please enter otp'),
          ),
        );
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 15.0),
                          child: Image.asset('assets/auth.png'),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 20.0),
                          child: Text(
                            'Authentication',
                            style: label,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 30.0),
                          child: Text(
                            'Enter OTP sent to your email',
                            style: desc,
                          ),
                        ),
                        Container(
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  margin: EdgeInsets.only(right: 5.0),
                                  decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Color(0xFFF5F5F5)),
                                    color: Color(0xFFD9D9D9),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Row(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 15),
                                        child: Image.asset('assets/pin.png'),
                                      ),
                                      Expanded(
                                        child: TextField(
                                          controller: pinController,
                                          keyboardType: TextInputType.number,
                                          inputFormatters: <TextInputFormatter>[
                                            FilteringTextInputFormatter
                                                .digitsOnly,
                                            LengthLimitingTextInputFormatter(4),
                                            _tinFormatter,
                                          ],
                                          obscureText: true,
                                          decoration: InputDecoration(
                                            hintText: '* * * *',
                                            hintStyle: TextStyle(
                                                color: Color(0xFF808080)),
                                            border: InputBorder.none,
                                          ),
                                          style: textFieldStyle,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  otpLogin(pinController.text, context);
                                },
                                style: btnGold,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 13, vertical: 8.0),
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(right: 10.0),
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
                        ),
                        Row(
                          children: [
                            Text(
                              'Haven’t received?',
                              style: forgotLabel,
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => PinSetup(),
                                  ),
                                );
                              },
                              child: Text('Resend'),
                            ),
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 25.0, bottom: 30.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: Divider(
                                  color: Color(0xFF808080),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0),
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
                        Container(
                          margin: EdgeInsets.only(bottom: 50.0),
                          width: double.infinity,
                          height: 50,
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
                                  Image.asset('assets/btn_arrow_left.png'),
                                  Padding(
                                    padding: EdgeInsets.only(left: 10.0),
                                    child: Text(
                                      'Sign in',
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
    );
  }
}

class CustomTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isEmpty) {
      return newValue;
    }

    String text = newValue.text.replaceAll(RegExp(r'\D'), '');

    final StringBuffer newText = StringBuffer();
    for (int i = 0; i < text.length; i++) {
      if (i > 0 && i % 3 == 0) {
        newText.write('-');
      }
      newText.write(text[i]);
    }

    return TextEditingValue(
      text: newText.toString(),
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}

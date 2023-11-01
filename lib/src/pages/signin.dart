import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:tiger_loyalty/src/pages/reg_user.dart';
import 'styles.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController emailController = TextEditingController();
  // TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isValid(String name) {
    final namePattern = r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$';
    final regExp = RegExp(namePattern);
    return regExp.hasMatch(name);
  }

  Future<void> login(String name, String password) async {
    if (name.isEmpty) {
      showAlertDialog("Please enter Username");
      return;
    }
    if (password.isEmpty) {
      showAlertDialog("Please enter Password");
      return;
    }

    // if (name.isEmpty) {
    //   showDialog(
    //     context: context,
    //     builder: (context) {
    //       return AlertDialog(
    //         title: Text('Please enter'),
    //         content: Text('Username'),
    //         actions: [
    //           TextButton(
    //             onPressed: () {
    //               Navigator.of(context).pop();
    //             },
    //             child: Text('OK'),
    //           ),
    //         ],
    //       );
    //     },
    //   );
    //   return;
    // }
    // if (!isValid(name, password)) {
    //   showDialog(
    //     context: context,
    //     builder: (context) {
    //       return AlertDialog(
    //         title: Text('Wrong PIN or phone number !'),
    //         content: Text('Please enter correct Phone number/PIN'),
    //         actions: [
    //           TextButton(
    //             onPressed: () {
    //               Navigator.of(context).pop();
    //             },
    //             child: Text('OK'),
    //           ),
    //         ],
    //       );
    //     },
    //   );
    //   return;
    // }

    // if (password.isEmpty) {
    //   showDialog(
    //     context: context,
    //     builder: (context) {
    //       return AlertDialog(
    //         title: Text('Please enter'),
    //         content: Text('Password'),
    //         actions: [
    //           TextButton(
    //             onPressed: () {
    //               Navigator.of(context).pop();
    //             },
    //             child: Text('OK'),
    //           ),
    //         ],
    //       );
    //     },
    //   );
    //   return;
    // }
    // if (password.length < 8) {
    //   showDialog(
    //     context: context,
    //     builder: (context) {
    //       return AlertDialog(
    //         title: Text('Invalid Password'),
    //         content: Text('Password must be at least 8 characters long'),
    //         actions: [
    //           TextButton(
    //             onPressed: () {
    //               Navigator.of(context).pop();
    //             },
    //             child: Text('OK'),
    //           ),
    //         ],
    //       );
    //     },
    //   );
    //   return;
    // }

    try {
      final String apiUrl = "https://dummyjson.com/auth/login";

      Map<String, String> formData = {
        "username": 'kminchelle',
        "password": '0lelplR',
      };

      final response = await http.post(
        Uri.parse(apiUrl),
        body: formData,
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);

        String token = data['token'];
        String username = data['username'];

        print('Token: $token');
        print('Username: $username');
        print('Login successfully');

        showAlertDialog("Logged in successfully");
      } else {
        final Map<String, dynamic> errorData = jsonDecode(response.body);
        String errorMessage = errorData['message'];
        print('Login failed. Status code: ${response.statusCode}');
        print('Error Message: $errorMessage');
        showAlertDialog("$errorMessage");

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Please check username and password'),
          ),
        );
      }
    } catch (e) {
      print(e.toString());
    }
  }

  void showAlertDialog(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Message'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(40.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 15.0),
                          child: Image.asset('assets/signin.png'),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 20.0),
                          child: Text(
                            'Sign in',
                            style: label,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 30.0),
                          child: Text(
                            'Login to use Tiger Loyalty for Merchants',
                            style: desc,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 5.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xFFF5F5F5)),
                      color: Color(0xFFD9D9D9),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        children: [
                          Image.asset('assets/ion_keypad.png'),
                          Expanded(
                            child: TextField(
                              controller: emailController,
                              decoration: InputDecoration(
                                hintText: 'E-mail',
                                hintStyle: TextStyle(color: Color(0xFF808080)),
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.all(10),
                              ),
                              style: textFieldStyle,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Container(
                  //   margin: EdgeInsets.only(bottom: 5.0),
                  //   decoration: BoxDecoration(
                  //     border: Border.all(color: Color(0xFFF5F5F5)),
                  //     color: Color(0xFFD9D9D9),
                  //     borderRadius: BorderRadius.circular(5),
                  //   ),
                  //   child: Container(
                  //     margin: EdgeInsets.symmetric(horizontal: 15),
                  //     child: Row(
                  //       children: [
                  //         Image.asset('assets/ion_keypad.png'),
                  //         Expanded(
                  //           child: TextField(
                  //             controller: nameController,
                  //             decoration: InputDecoration(
                  //               hintText: 'Username',
                  //               hintStyle: TextStyle(color: Color(0xFF808080)),
                  //               border: InputBorder.none,
                  //               contentPadding: EdgeInsets.all(10),
                  //             ),
                  //             style: textFieldStyle,
                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  Container(
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(right: 5.0),
                            decoration: BoxDecoration(
                              border: Border.all(color: Color(0xFFF5F5F5)),
                              color: Color(0xFFD9D9D9),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 15),
                                  child: Image.asset('assets/pin.png'),
                                ),
                                Expanded(
                                  child: TextField(
                                    controller: passwordController,
                                    obscureText: true,
                                    decoration: InputDecoration(
                                      hintText: 'PIN',
                                      hintStyle:
                                          TextStyle(color: Color(0xFF808080)),
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
                            // login(nameController.text, passwordController.text);
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
                                    'Sign in',
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
                        'Forgot PIN?',
                        style: forgotLabel,
                      ),
                      TextButton(
                        onPressed: () {
                          // Add your reset PIN logic here
                          // For example, you can show a dialog or navigate to a reset PIN screen.
                          // Replace the following code with your logic.
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text('Reset PIN'),
                                content: Text(
                                    'Are you sure you want to reset your PIN?'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      // Implement the reset logic here
                                      // You can call a function or navigate to a reset PIN screen.
                                      // After resetting, you might want to close the dialog.
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      'Reset',
                                      style: resetBtnText,
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text('Cancel'),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: Text('Reset'),
                      ),
                    ],
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
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
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
                    margin: EdgeInsets.only(bottom: 75.0),
                    width: double.infinity,
                    height: 50,
                    child: TextButton(
                      style: btnGrey,
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => RegisterUser(),
                          ),
                        );
                      },
                      child: Text('Register', style: btnGreyText),
                    ),
                  ),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Badili lugha?',
                          style: smText,
                        ),
                        TextButton(
                          onPressed: () {
                            // Add your registration logic here
                          },
                          child: Text(
                            'KSW',
                            style: boldText,
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

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiger_loyalty/initial_binding.dart';
import 'package:tiger_loyalty/screens/signin/controller/signin_controller.dart';
import 'package:tiger_loyalty/screens/signup/component/reg_user.dart';
import 'package:tiger_loyalty/widget/loader_widget.dart';
import '../../../src/pages/styles.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  SigninController signinController = Get.find<SigninController>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: Obx(
        () => signinController.isLoading.value
            ? const LoaderWidget()
            : Center(
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
                                padding: const EdgeInsets.only(bottom: 15.0),
                                child: Image.asset('assets/signin.png'),
                              ),
                              Container(
                                padding: const EdgeInsets.only(bottom: 20.0),
                                child: Text(
                                  'Sign in',
                                  style: label,
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.only(bottom: 30.0),
                                child: Text(
                                  'Login to use Tiger Loyalty for Merchants',
                                  style: desc,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            margin: const EdgeInsets.only(bottom: 5.0),
                            decoration: BoxDecoration(
                              border:
                                  Border.all(color: const Color(0xFFF5F5F5)),
                              color: const Color(0xFFD9D9D9),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: Row(
                                children: [
                                  Image.asset('assets/ion_keypad.png'),
                                  Expanded(
                                    child: TextField(
                                      controller:
                                          signinController.emailController,
                                      decoration: const InputDecoration(
                                        hintText: 'E-mail',
                                        hintStyle:
                                            TextStyle(color: Color(0xFF808080)),
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
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  margin: const EdgeInsets.only(right: 5.0),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: const Color(0xFFF5F5F5)),
                                    color: const Color(0xFFD9D9D9),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Row(
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 15),
                                        child: Image.asset('assets/pin.png'),
                                      ),
                                      Expanded(
                                        child: TextField(
                                          controller: signinController
                                              .passwordController,
                                          keyboardType:
                                              TextInputType.visiblePassword,
                                          // inputFormatters: <TextInputFormatter>[
                                          //   FilteringTextInputFormatter.digitsOnly
                                          // ],
                                          obscureText: true,
                                          decoration: const InputDecoration(
                                            hintText: 'PIN',
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
                                  signinController.login();
                                },
                                style: btnGold,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 13, vertical: 5.0),
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 10.0),
                                        child: Text(
                                          'Sign in',
                                          style: btnGoldText,
                                        ),
                                      ),
                                      const Icon(
                                        Icons.arrow_forward,
                                        color: Colors.black,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
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
                                        title: const Text('Reset PIN'),
                                        content: const Text(
                                            'Are you sure you want to reset your PIN?'),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: const Text(
                                              'Reset',
                                              // style: resetBtnText,
                                            ),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: const Text('Cancel'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                                child: const Text('Reset'),
                              ),
                            ],
                          ),
                          Container(
                            margin: const EdgeInsets.only(bottom: 20.0),
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
                          SizedBox(
                            width: size.width,
                            height: size.height * 0.06,
                            child: TextButton(
                              style: btnGrey,
                              onPressed: () {
                                Get.to(() => RegisterUser(),
                                    binding: InitialBinding());
                              },
                              child: Text('Register', style: btnGreyText),
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.075,
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
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:tiger_loyalty/screens/signin/controller/signin_controller.dart';
import 'package:tiger_loyalty/widget/loader_widget.dart';
import 'package:tiger_loyalty/widget/translate_language.dart';
import '../../../src/pages/styles.dart';

class ResetPIN extends StatefulWidget {
  @override
  _ResetPINState createState() => _ResetPINState();
}

class _ResetPINState extends State<ResetPIN> {
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
                                child: Image.asset('assets/pin_setup.png'),
                              ),
                              Container(
                                padding: const EdgeInsets.only(bottom: 20.0),
                                child: Text(
                                  'pin'.tr,
                                  style: label,
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.only(bottom: 30.0),
                                child: Text(
                                  'login_desc'.tr,
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
                                          signinController.rstemailController,
                                      decoration: InputDecoration(
                                        hintText: 'email'.tr,
                                        hintStyle: const TextStyle(
                                            color: Color(0xFF808080)),
                                        border: InputBorder.none,
                                        contentPadding:
                                            const EdgeInsets.all(10),
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
                                        child: Image.asset(
                                          'assets/phoneImg.png',
                                          color: Colors.grey,
                                        ),
                                      ),
                                      Expanded(
                                        child: TextField(
                                          controller: signinController
                                              .rstNumberController,
                                          keyboardType: TextInputType.number,
                                          inputFormatters: <TextInputFormatter>[
                                            FilteringTextInputFormatter
                                                .digitsOnly,
                                            LengthLimitingTextInputFormatter(
                                                10),
                                          ],
                                          obscureText: true,
                                          decoration: InputDecoration(
                                            hintText: 'phone_number'.tr,
                                            hintStyle: const TextStyle(
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
                                  if (signinController
                                      .rstemailController.text.isEmpty) {
                                    Fluttertoast.showToast(
                                        msg: "enter_email_msg".tr);
                                  } else if (!signinController
                                      .rstemailController.text
                                      .trim()
                                      .isEmail) {
                                    Fluttertoast.showToast(
                                        msg: "enter_valid_email_msg".tr);
                                  } else if (signinController
                                      .rstNumberController.text.isEmpty) {
                                    Fluttertoast.showToast(
                                        msg: "enter_number_msg".tr);
                                  } else if (signinController
                                          .rstNumberController.text.length <
                                      9) {
                                    Fluttertoast.showToast(
                                        msg: "enter_valid_number_msg".tr);
                                  } else {
                                    signinController.resetPin();
                                  }
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
                                          'next'.tr,
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
                          Container(
                            margin:
                                const EdgeInsets.only(bottom: 20.0, top: 20.0),
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
                                  child: Text("or".tr, style: orText),
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
                                Get.back();
                              },
                              child: Text('sign_in'.tr, style: btnGreyText),
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
                                  'change_lang'.tr,
                                  style: smText,
                                ),
                                const SizedBox(width: 5),
                                GestureDetector(
                                  onTap: () {
                                    ChangeLanguage().changeLanguage();
                                  },
                                  child: Text(
                                    'ksw'.tr,
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

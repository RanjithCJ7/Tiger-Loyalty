import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:tiger_loyalty/initial_binding.dart';
import 'package:tiger_loyalty/screens/signup/component/address_picker.dart';
import 'package:tiger_loyalty/screens/signup/controller/signup_controller.dart';
import 'package:tiger_loyalty/screens/signin/component/signin.dart';
import 'package:tiger_loyalty/widget/loader_widget.dart';
import '../../../src/pages/styles.dart';

class RegisterBusiness extends StatefulWidget {
  const RegisterBusiness({super.key});

  @override
  _RegisterBusinessState createState() => _RegisterBusinessState();
}

class _RegisterBusinessState extends State<RegisterBusiness> {
  SignupController signupController = Get.find<SignupController>();
  final _tinFormatter = CustomTextInputFormatter();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => signupController.isLoading.value
            ? const LoaderWidget()
            : Center(
                child: ListView(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(40.0),
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.only(bottom: 15.0),
                            child: Image.asset('assets/reg_business.png'),
                          ),
                          Container(
                            padding: const EdgeInsets.only(bottom: 20.0),
                            child: Text(
                              'Register - Business',
                              style: label,
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(bottom: 5.0),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              border:
                                  Border.all(color: const Color(0xFFF5F5F5)),
                              color: const Color(0xFFD9D9D9),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: TextField(
                              controller:
                                  signupController.businessNameController,
                              decoration: const InputDecoration(
                                hintText: 'Registered business name',
                                hintStyle: TextStyle(color: Color(0xFF808080)),
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.all(20),
                              ),
                              style: textFieldStyle,
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(bottom: 5.0),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              border:
                                  Border.all(color: const Color(0xFFF5F5F5)),
                              color: const Color(0xFFD9D9D9),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: TextField(
                              controller: signupController.tinController,
                              keyboardType: TextInputType.number,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.digitsOnly,
                                LengthLimitingTextInputFormatter(9),
                                _tinFormatter,
                              ],
                              decoration: const InputDecoration(
                                hintText: 'TIN number',
                                hintStyle: TextStyle(color: Color(0xFF808080)),
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.all(20),
                              ),
                              style: textFieldStyle,
                            ),
                          ),
                          Container(
                              // height: Get.height * 0.072,
                              margin: const EdgeInsets.only(bottom: 5.0),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: const Color(0xFFF5F5F5)),
                                color: const Color(0xFFD9D9D9),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: DropdownButtonHideUnderline(
                                        child: DropdownButton<String>(
                                          value: signupController
                                              .selectedCategory.value,
                                          style: textFieldStyle,
                                          onChanged: (newValue) {
                                            signupController.selectedCategory
                                                .value = newValue ?? '';
                                          },
                                          items: signupController
                                              .businessCategories
                                              .map((category) {
                                            return DropdownMenuItem<String>(
                                              value: category,
                                              child: Text(
                                                category,
                                                style: textFieldStyle.copyWith(
                                                    color: signupController
                                                                .selectedCategory
                                                                .value ==
                                                            "Business category"
                                                        ? const Color(
                                                            0XFF808080)
                                                        : Colors.black),
                                              ),
                                            );
                                          }).toList(),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                          GestureDetector(
                            onTap: () async {
                              PermissionStatus status =
                                  await Permission.location.status;
                              if (status.isGranted) {
                                Get.to(() => const AddressPicker(),
                                    binding: InitialBinding());
                              } else if (status.isDenied) {
                                Permission.location.request();
                              } else if (status.isPermanentlyDenied) {
                                Permission.location.request();
                              }
                            },
                            child: Container(
                                width: Get.width,
                                margin: const EdgeInsets.only(bottom: 20.0),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 20, horizontal: 20),
                                // alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: const Color(0xFFF5F5F5)),
                                  color: const Color(0xFFD9D9D9),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Text(
                                    signupController.isLocationSelected.value ==
                                            false
                                        ? 'Location'
                                        : signupController.locationName.value,
                                    textAlign: TextAlign.start,
                                    style: textFieldStyle.copyWith(
                                        color: signupController
                                                    .isLocationSelected.value ==
                                                false
                                            ? Color(0xFF808080)
                                            : Colors.black))

                                /* TextField(
                                controller: signupController.locationController,
                                enabled: false,
                                decoration: InputDecoration(
                                  hintText: signupController
                                              .isLocationSelected.value ==
                                          false
                                      ? 'Location'
                                      : signupController.locationName.value,
                                  hintStyle:
                                      const TextStyle(color: Color(0xFF808080)),
                                  border: InputBorder.none,
                                  contentPadding: const EdgeInsets.all(20),
                                ),
                                style: textFieldStyle,
                              ), */
                                ),
                          ),
                          TextButton(
                            onPressed: () {
                              signupController.registerBusiness();
                            },
                            style: btnGold2,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 6.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 10.0),
                                    child: Text(
                                      'Submit',
                                      style: btnGoldText2.copyWith(
                                          color: Colors.black),
                                    ),
                                  ),
                                  const Icon(
                                    Icons.arrow_forward,
                                    color: Colors.black,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            margin:
                                const EdgeInsets.only(top: 25.0, bottom: 30.0),
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
                                padding:
                                    const EdgeInsets.symmetric(vertical: 6.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Icon(
                                      Icons.arrow_back,
                                      color: Colors.black,
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 10.0),
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
                    ),
                  ],
                ),
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

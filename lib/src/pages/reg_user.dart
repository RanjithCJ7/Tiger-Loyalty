import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tiger_loyalty/src/pages/reg_business.dart';
import 'package:tiger_loyalty/src/pages/signin.dart';
import 'styles.dart';

class RegisterUser extends StatefulWidget {
  @override
  _RegisterUserState createState() => _RegisterUserState();
}

class _RegisterUserState extends State<RegisterUser> {
  String isSelected = 'female';
  bool isCheckboxEnabled = true;

  // TextEditingController firstNameController = TextEditingController();
  // TextEditingController lastNameController = TextEditingController();
  // TextEditingController phoneNumberController = TextEditingController();
  // TextEditingController emailController = TextEditingController();

  // Future<void> registerUser(
  //   String firstName,
  //   String lastName,
  //   String phoneNumber,
  //   String email,
  // ) async {
  //   print('first name: 27 $firstName');
  //   print('last name: 28 $lastName');
  //   print('phone Num 29 $phoneNumber');
  //   print('first name: 30 $email');
  //   try {
  //     final String apiUrl = "https://reqres.in/api/users";

  //     Map<String, String> formData = {
  //       "first_name": firstName,
  //       "last_name": lastName,
  //       "phonenumber": phoneNumber,
  //       "email": email,
  //     };

  //     final response = await http.post(
  //       Uri.parse(apiUrl),
  //       body: formData,
  //     );

  //     if (response.statusCode == 201) {
  //       final Map<String, dynamic> data = jsonDecode(response.body);

  //       String id = data['id'];
  //       String createdAt = data['createdAt'];

  //       print('User registering');
  //       print('User ID: $id');
  //       print('Created At: $createdAt');

  //       showDialog(
  //         context: context,
  //         builder: (context) {
  //           return AlertDialog(
  //             title: Text('Registering - on process'),
  //             content: Text('Please wait'),
  //           );
  //         },
  //       );

  //       Future.delayed(Duration(seconds: 2), () {
  //         Navigator.of(context).push(
  //           MaterialPageRoute(
  //             builder: (context) => RegisterBusiness(),
  //           ),
  //         );
  //       });
  //     } else {
  //       final Map<String, dynamic> errorData = jsonDecode(response.body);
  //       String errorMessage = errorData['message'];

  //       print('User registration failed. Status code: ${response.statusCode}');
  //       print('Error Message: $errorMessage');

  //       // Show an error message to the user, e.g., using a SnackBar.
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(
  //           content: Text('User registration failed. Please check your input.'),
  //         ),
  //       );
  //     }
  //   } catch (e) {
  //     print(e.toString());
  //   }
  // }

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
                          child: Image.asset('assets/reg_user.png'),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 20.0),
                          child: Text(
                            'Register - User',
                            style: label,
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
                    child: TextField(
                      // controller: firstNameController,
                      decoration: InputDecoration(
                        hintText: 'First name',
                        hintStyle: TextStyle(color: Color(0xFF808080)),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(20),
                      ),
                      style: textFieldStyle,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 5.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xFFF5F5F5)),
                      color: Color(0xFFD9D9D9),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: TextField(
                      // controller: lastNameController,
                      decoration: InputDecoration(
                        hintText: 'Last name',
                        hintStyle: TextStyle(color: Color(0xFF808080)),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(20),
                      ),
                      style: textFieldStyle,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "What's your gender?",
                          style: smText,
                        ),
                        SizedBox(width: 15.0),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              isSelected = 'female';
                            });
                          },
                          style:
                              isSelected == 'female' ? selectBtn : deSelectBtn,
                          child: Container(
                            // width: 97,
                            child: Row(
                              children: [
                                Text("Female",
                                    style: isSelected == 'female'
                                        ? selectBtnBold
                                        : selectBtnSm),
                                if (isSelected == 'female')
                                  Padding(
                                    padding: EdgeInsets.only(left: 15),
                                    child: Image.asset('assets/tick.png'),
                                  ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 10.0),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              isSelected = 'male';
                            });
                          },
                          style: isSelected == 'male' ? selectBtn : deSelectBtn,
                          child: Container(
                            // width: 84,
                            child: Row(
                              children: [
                                Text(
                                  "Male",
                                  style: isSelected == 'male'
                                      ? selectBtnBold
                                      : selectBtnSm,
                                ),
                                if (isSelected == 'male')
                                  Padding(
                                    padding: EdgeInsets.only(left: 15),
                                    child: Image.asset('assets/tick.png'),
                                  ),
                              ],
                            ),
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
                    child: TextField(
                      // controller: phoneNumberController,
                      decoration: InputDecoration(
                        hintText: 'Phone number',
                        hintStyle: TextStyle(color: Color(0xFF808080)),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(20),
                      ),
                      style: textFieldStyle,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 5.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xFFF5F5F5)),
                      color: Color(0xFFD9D9D9),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: TextField(
                      // controller: emailController,
                      decoration: InputDecoration(
                        hintText: 'E-mail',
                        hintStyle: TextStyle(color: Color(0xFF808080)),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(20),
                      ),
                      style: textFieldStyle,
                    ),
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: true,
                        onChanged:
                            isCheckboxEnabled ? (bool? newValue) {} : null,
                        checkColor: Colors.white,
                        fillColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                            if (states.contains(MaterialState.disabled)) {
                              return Colors.grey;
                            }
                            return Colors.black;
                          },
                        ),
                      ),
                      Text("I accept"),
                      TextButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return Container(
                                height:
                                    MediaQuery.of(context).size.height - 125.0,
                                alignment: Alignment.bottomCenter,
                                child: Dialog(
                                  child: Container(
                                    width: 374,
                                    height: 802,
                                    child: Column(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(
                                              top: 10.0, bottom: 20.0),
                                          child: Row(
                                            children: [
                                              Container(
                                                margin: EdgeInsets.only(
                                                  left: 50.0,
                                                ),
                                                child: Text(
                                                  'Terms and Conditions',
                                                  style: alertTitle,
                                                ),
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  Navigator.of(context).pop();
                                                },
                                                child: Container(
                                                  margin: EdgeInsets.only(
                                                    left: 30.0,
                                                  ),
                                                  child: Image.asset(
                                                      'assets/close.png'),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SingleChildScrollView(
                                          child: Container(
                                            margin:
                                                EdgeInsets.only(bottom: 30.0),
                                            child: Column(
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 30.0),
                                                  child: Text(
                                                    'Lorem ipsum dolor sit amet consectetur. Urna pharetra congue et nibh nulla libero massa. Mauris rhoncus quam porttitor massa Lorem ipsum dolor sit amet consectetur. Urna pharetra congue et nibh nulla libero massa. Mauris rhoncus quam porttitor massa Lorem ipsum dolor sit amet consectetur. Urna pharetra congue et nibh nulla libero massa. Mauris rhoncus quam porttitor massa',
                                                    style: dialogTextSm,
                                                    textAlign:
                                                        TextAlign.justify,
                                                  ),
                                                ),
                                                SizedBox(height: 10),
                                                Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 30.0),
                                                  child: Text(
                                                    'Lorem ipsum dolor sit amet consectetur. Urna pharetra congue et nibh nulla libero massa. Mauris rhoncus quam porttitor massa Lorem ipsum dolor sit amet consectetur. Urna pharetra congue et nibh nulla libero massa. Mauris rhoncus quam porttitor massa Lorem ipsum dolor sit amet consectetur. Urna pharetra congue et nibh nulla libero massa. Mauris rhoncus quam porttitor massa',
                                                    style: dialogTextSm,
                                                    textAlign:
                                                        TextAlign.justify,
                                                  ),
                                                ),
                                                SizedBox(height: 10),
                                                Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 30.0),
                                                  child: Text(
                                                    'Lorem ipsum dolor sit amet consectetur. Urna pharetra congue et nibh nulla libero massa. Mauris rhoncus quam porttitor massa Lorem ipsum dolor sit amet consectetur. Urna pharetra congue et nibh nulla libero massa. Mauris rhoncus quam porttitor massa Lorem ipsum dolor sit amet consectetur. Urna pharetra congue et nibh nulla libero massa. Mauris rhoncus quam porttitor massa',
                                                    style: dialogTextSm,
                                                    textAlign:
                                                        TextAlign.justify,
                                                  ),
                                                ),
                                                SizedBox(height: 10),
                                                Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 30.0),
                                                  child: Text(
                                                    'Lorem ipsum dolor sit amet consectetur. Urna pharetra congue et nibh nulla libero massa. Mauris rhoncus quam porttitor massa Lorem ipsum dolor sit amet consectetur. Urna pharetra congue et nibh nulla libero massa. Mauris rhoncus quam porttitor massa Lorem ipsum dolor sit amet consectetur. Urna pharetra congue et nibh nulla libero massa. Mauris rhoncus quam porttitor massa',
                                                    style: dialogTextSm,
                                                    textAlign:
                                                        TextAlign.justify,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Container(
                                          height: 50,
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 30.0),
                                          width: double.infinity,
                                          child: TextButton(
                                            onPressed: () {
                                              // registerUser(
                                              //     firstNameController.text,
                                              //     lastNameController.text,
                                              //     phoneNumberController.text,
                                              //     emailController.text);
                                              Navigator.of(context).push(
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      RegisterBusiness(),
                                                ),
                                              );
                                            },
                                            style: btnGold2,
                                            child: Text(
                                              'Proceed',
                                              style: btnGoldText2,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        child: Text(
                          'Terms and Conditions',
                          style: resetBtnText,
                        ),
                      ),
                    ],
                  ),
                  TextButton(
                    onPressed: () {
                      // registerUser(
                      //     firstNameController.text,
                      //     lastNameController.text,
                      //     phoneNumberController.text,
                      //     emailController.text);
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => RegisterBusiness(),
                        ),
                      );
                    },
                    style: btnGold2,
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: 10.0),
                            child: Text(
                              'Next',
                              style: btnGoldText2,
                            ),
                          ),
                          Image.asset('assets/btn_arrow_right.png'),
                        ],
                      ),
                    ),
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
    );
  }
}

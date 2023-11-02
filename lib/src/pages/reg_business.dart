import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:tiger_loyalty/src/pages/authentication.dart';
import 'package:tiger_loyalty/src/pages/signin.dart';
import 'styles.dart';

class RegisterBusiness extends StatefulWidget {
  @override
  _RegisterBusinessState createState() => _RegisterBusinessState();
}

class _RegisterBusinessState extends State<RegisterBusiness> {
  List<String> businessCategories = [
    '',
    'Bakery',
    'Bar',
    'Beauty',
    'Bookstore',
    'Butcheries',
    'Coffee Shops',
    'Cosmetics',
    'Decor',
    'Electronics',
    'Fashion',
    'Fast Food',
    'Florists',
    'Groceries',
    'Gym',
    'Hotel',
    'Laundry',
    'Liquor Stores',
    'Pets',
    'Pharmacies',
    'Resort',
    'Restaurant',
    'Saloon',
    'Shopping',
    'Spa',
    'Supermarkets',
    'Travel',
    'Yoga'
  ];

  String selectedCategory = '';

  final TextEditingController _tinNumberController = TextEditingController();
  final _tinFormatter = CustomTextInputFormatter();

  // TextEditingController businessNameController = TextEditingController();
  // TextEditingController tinNumberController = TextEditingController();
  // TextEditingController businessCategoryController = TextEditingController();
  // TextEditingController locationController = TextEditingController();

  // Future<void> registerBusiness(
  //   String businessName,
  //   String tinNumber,
  //   String businessCategory,
  //   String location,
  // ) async {
  //   print('business name: 35 $businessName');
  //   print('tin : 36 $tinNumber');
  //   print('business Category : 37 $businessCategory');
  //   print('location 38 $location');
  //   try {
  //     final String apiUrl = "https://reqres.in/api/users";

  //     Map<String, String> formData = {
  //       "business_name": businessName,
  //       "tin_number": tinNumber,
  //       "business_category": businessCategory,
  //       "location": location,
  //     };

  //     final response = await http.post(
  //       Uri.parse(apiUrl),
  //       body: formData,
  //     );

  //     if (response.statusCode == 201) {
  //       final Map<String, dynamic> data = jsonDecode(response.body);

  //       String id = data['id'];
  //       String createdAt = data['createdAt'];

  //       print('User registration Successful');
  //       print('User ID: $id');
  //       print('Created At: $createdAt');

  //       showDialog(
  //         context: context,
  //         builder: (context) {
  //           return AlertDialog(
  //             title: Text('Registering'),
  //             content: Text('Please check your email for OTP'),
  //           );
  //         },
  //       );

  //       Future.delayed(Duration(seconds: 2), () {
  //         Navigator.of(context).push(
  //           MaterialPageRoute(
  //             builder: (context) => Authentication(),
  //           ),
  //         );
  //       });
  //     } else {
  //       final Map<String, dynamic> errorData = jsonDecode(response.body);
  //       String errorMessage = errorData['message'];

  //       print('User registration failed. Status code: ${response.statusCode}');
  //       print('Error Message: $errorMessage');

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
  void dispose() {
    _tinNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: ListView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(40.0),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 15.0),
                      child: Image.asset('assets/reg_business.png'),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 20.0),
                      child: Text(
                        'Register - Business',
                        style: label,
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
                        // controller: businessNameController,
                        decoration: InputDecoration(
                          hintText: 'Registered business name',
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
                        controller: _tinNumberController,
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(9),
                          _tinFormatter,
                        ],
                        decoration: InputDecoration(
                          hintText: 'TIN number',
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
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Row(
                            children: [
                              // Container(
                              //   width: 150,
                              //   child: TextField(
                              //     // controller: businessCategoryController,
                              //     decoration: InputDecoration(
                              //       hintText: 'Business category',
                              //       hintStyle:
                              //           TextStyle(color: Color(0xFF808080)),
                              //     ),
                              //     onChanged: (text) {
                              //       setState(() {
                              //         selectedCategory = text;
                              //       });
                              //     },
                              //   ),
                              // ),
                              // Container(
                              //   // width: double.infinity,
                              //   margin: EdgeInsets.only(right: 15),
                              //   child:
                              Expanded(
                                // child: Container(
                                // margin: EdgeInsets.only(right: 50.0),
                                child: DropdownButton<String>(
                                  value: selectedCategory,
                                  onChanged: (newValue) {
                                    setState(() {
                                      selectedCategory = newValue ?? '';
                                      // businessCategoryController.text =
                                      //     newValue ?? '';
                                    });
                                  },
                                  items: businessCategories.map((category) {
                                    return DropdownMenuItem<String>(
                                      value: category,
                                      child: Text(category),
                                    );
                                  }).toList(),
                                ),
                                // ),
                              ),
                              // )
                            ],
                          ),
                        )),
                    Container(
                      margin: EdgeInsets.only(bottom: 20.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xFFF5F5F5)),
                        color: Color(0xFFD9D9D9),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: TextField(
                        // controller: locationController,
                        decoration: InputDecoration(
                          hintText: 'Location',
                          hintStyle: TextStyle(color: Color(0xFF808080)),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.all(20),
                        ),
                        style: textFieldStyle,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        // registerBusiness(
                        //     businessNameController.text,
                        //     tinNumberController.text,
                        //     businessCategoryController.text,
                        //     locationController.text);
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => Authentication(),
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
                                'Submit',
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

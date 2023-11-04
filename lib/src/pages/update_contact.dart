import 'dart:async';
import 'dart:io';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:tiger_loyalty/src/pages/about.dart';
import 'package:tiger_loyalty/src/pages/add_lipa_namba.dart';
import 'package:tiger_loyalty/src/pages/change_login.dart';
import 'package:tiger_loyalty/src/pages/choose_photo.dart';
import 'package:tiger_loyalty/src/pages/choose_subscription.dart';
import 'package:tiger_loyalty/src/pages/customers.dart';
import 'package:tiger_loyalty/src/pages/edit_reward.dart';
import 'package:tiger_loyalty/src/pages/give_reward.dart';
import 'package:tiger_loyalty/src/pages/give_reward.dart';
import 'package:tiger_loyalty/src/pages/home.dart';
import 'package:tiger_loyalty/src/pages/manage_brand.dart';
import 'package:tiger_loyalty/src/pages/privacy_policy.dart';
import 'package:tiger_loyalty/src/pages/profile.dart';
import 'package:tiger_loyalty/src/pages/signin.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:tiger_loyalty/src/pages/terms_conditions.dart';
import 'styles.dart';

class UpdateContact extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 15, top: 30),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Image.asset('assets/chevron_left.png'),
                        ),
                        Spacer(),
                        Text('Contacts & Address', style: label),
                        Spacer()
                      ],
                    ),
                  ),
                  SizedBox(height: 50),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 30.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xFFF5F5F5)),
                      color: Color(0xFFD9D9D9),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 10),
                            child: Image.asset('assets/uc_phone.png'),
                          ),
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Phone',
                                hintStyle: TextStyle(color: Color(0xFF808080)),
                                border: InputBorder.none,
                              ),
                              style: textFieldStyle,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 30.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xFFF5F5F5)),
                      color: Color(0xFFD9D9D9),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 10),
                            child: Image.asset('assets/uc_whatsapp.png'),
                          ),
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Whatsapp',
                                hintStyle: TextStyle(color: Color(0xFF808080)),
                                border: InputBorder.none,
                              ),
                              style: textFieldStyle,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 30.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xFFF5F5F5)),
                      color: Color(0xFFD9D9D9),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 10),
                            child: Image.asset('assets/uc_location.png'),
                          ),
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Location',
                                hintStyle: TextStyle(color: Color(0xFF808080)),
                                border: InputBorder.none,
                              ),
                              style: textFieldStyle,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 40),
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(left: 30),
                    child: Text(
                      'Social Media',
                      style: settingsTitle,
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 30.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xFFF5F5F5)),
                      color: Color(0xFFD9D9D9),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 10),
                            child: Image.asset('assets/uc_facebook.png'),
                          ),
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Facebook',
                                hintStyle: TextStyle(color: Color(0xFF808080)),
                                border: InputBorder.none,
                              ),
                              style: textFieldStyle,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 30.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xFFF5F5F5)),
                      color: Color(0xFFD9D9D9),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 10),
                            child: Image.asset('assets/uc_instagram.png'),
                          ),
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Instagram',
                                hintStyle: TextStyle(color: Color(0xFF808080)),
                                border: InputBorder.none,
                              ),
                              style: textFieldStyle,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 30.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xFFF5F5F5)),
                      color: Color(0xFFD9D9D9),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 10),
                            child: Image.asset('assets/uc_vector.png'),
                          ),
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'X',
                                hintStyle: TextStyle(color: Color(0xFF808080)),
                                border: InputBorder.none,
                              ),
                              style: textFieldStyle,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 40),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 30.0),
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      style: btnGold2,
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Container(
                          width: double.infinity,
                          child: Text(
                            'Save',
                            style: btnGoldText2,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

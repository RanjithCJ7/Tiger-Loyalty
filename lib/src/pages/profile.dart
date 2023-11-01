import 'dart:async';
import 'dart:io';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:tiger_loyalty/src/pages/about.dart';
import 'package:tiger_loyalty/src/pages/add_lipa_namba.dart';
import 'package:tiger_loyalty/src/pages/change_login.dart';
import 'package:tiger_loyalty/src/pages/choose_photo.dart';
import 'package:tiger_loyalty/src/pages/customers.dart';
import 'package:tiger_loyalty/src/pages/home.dart';
import 'package:tiger_loyalty/src/pages/manage_brand.dart';
import 'package:tiger_loyalty/src/pages/privacy_policy.dart';
import 'package:tiger_loyalty/src/pages/profile.dart';
import 'package:tiger_loyalty/src/pages/signin.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:tiger_loyalty/src/pages/terms_conditions.dart';
import 'styles.dart';

class SettingData {
  String text;
  String image;

  SettingData({required this.text, required this.image});
}

List<SettingData> settingData = [
  SettingData(text: 'Change login details', image: 'assets/setting_3.png'),
  SettingData(text: 'Manage Brand', image: 'assets/setting_4.png'),
  SettingData(text: 'Terms and conditions', image: 'assets/setting_5.png'),
  SettingData(text: 'Privacy policy', image: 'assets/setting_6.png'),
  SettingData(text: 'About Tiger Loyalty', image: 'assets/setting_7.png'),
];

void _navigateToScreen(BuildContext context, String title) {
  switch (title) {
    case 'Change login details':
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => ChangeLogin()));
      break;
    case 'Manage Brand':
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => ManageBrand()));
      break;
    case 'Terms and conditions':
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => TermsConditions()));
      break;
    case 'Privacy policy':
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => PrivacyPolicy()));
      break;
    case 'About Tiger Loyalty':
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => About()));
      break;
    default:
      break;
  }
}

class Profile extends StatelessWidget {
  @override
  Widget _buildSettingItemsList() {
    return Column(
      children: settingData.map((data) {
        return _buildSettingItem(data.text, data.image);
      }).toList(),
    );
  }

  Widget _buildSettingItem(String title, String image) {
    return Builder(
      builder: (BuildContext context) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 20.0),
          decoration: BoxDecoration(
            border: Border.all(color: Color(0xFFF5F5F5)),
            color: Color(0xFFD9D9D9),
            borderRadius: BorderRadius.circular(5),
          ),
          child: TextButton(
            onPressed: () {
              _navigateToScreen(context, title);
            },
            child: Padding(
              padding: EdgeInsets.all(15),
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 10),
                    child:
                        Image.asset(image, color: Color.fromRGBO(0, 0, 0, 0.3)),
                  ),
                  Expanded(
                    child: Text(
                      title,
                      style: settingsLabel,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildInvoiceItem(String title, String image) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0),
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xFFF5F5F5)),
        color: Color(0xFFD9D9D9),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(right: 10),
              child: Image.asset(image, color: Color.fromRGBO(0, 0, 0, 0.3)),
            ),
            Expanded(
              child: Text(
                title,
                style: settingsLabel,
              ),
            ),
            TextButton(
              onPressed: () {},
              style: payBtn,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: Text(
                  'Pay now',
                  style: payBtnText,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 75.0),
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Image.asset('assets/bg_rectangle.png'),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            child: Container(
                              width: double.infinity,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 15),
                                child: Row(
                                  children: [
                                    TextButton(
                                      onPressed: () {
                                        showModalBottomSheet(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return Container(
                                              margin:
                                                  EdgeInsets.only(bottom: 50.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: <Widget>[
                                                  TextButton(
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: Image.asset(
                                                        'assets/close.png'),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 15),
                                                    child: Container(
                                                      width: double.infinity,
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: [
                                                          Text(
                                                              'Change Profile Picture',
                                                              style:
                                                                  changeLabel),
                                                          SizedBox(
                                                              height: 30.0),
                                                          Container(
                                                            width:
                                                                double.infinity,
                                                            height: 53,
                                                            child: TextButton(
                                                              onPressed: () {
                                                                Navigator.of(
                                                                        context)
                                                                    .push(
                                                                  MaterialPageRoute(
                                                                    builder:
                                                                        (context) =>
                                                                            ChoosePhoto(),
                                                                  ),
                                                                );
                                                              },
                                                              style: btnGrey,
                                                              child: Text(
                                                                'Choose Photo',
                                                                style:
                                                                    btnGreyText,
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(height: 5.0),
                                                          Container(
                                                            width:
                                                                double.infinity,
                                                            height: 53,
                                                            child: TextButton(
                                                              onPressed: () {},
                                                              style: btnGrey,
                                                              child: Text(
                                                                'Take picture',
                                                                style:
                                                                    btnGreyText,
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
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
                                          },
                                        );
                                      },
                                      child: Container(
                                        margin: EdgeInsets.only(right: 20),
                                        child: Stack(
                                          alignment: Alignment.bottomRight,
                                          children: [
                                            Image.asset(
                                                'assets/profile_avatar.png'),
                                            Positioned(
                                              bottom: 0,
                                              right: 0,
                                              child: Container(
                                                child: Stack(
                                                  alignment: Alignment.center,
                                                  children: [
                                                    Image.asset(
                                                        'assets/camera_bg.png'),
                                                    Image.asset(
                                                        'assets/camera.png'),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text('Juma Juma', style: nameLabel),
                                          SizedBox(height: 10.0),
                                          Text('Boo Boo Restaurant',
                                              style: nameDesc),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  _buildSettingItem(
                      'Subscription and pricing', 'assets/setting_1.png'),
                  SizedBox(height: 5),
                  _buildInvoiceItem('Invoice', 'assets/setting_2.png'),
                  SizedBox(height: 50),
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(
                      left: 20,
                    ),
                    child: Text(
                      'Settings',
                      style: settingsTitle,
                    ),
                  ),
                  _buildSettingItemsList(),
                  SizedBox(height: 30),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Badili lugha?',
                              style: smText,
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                'KSW',
                                style: boldText,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'Delete my account',
                              style: smText,
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 10.0),
                              width: 122,
                              child: TextButton(
                                style: btnGrey,
                                onPressed: () {
                                  // Navigator.of(context).push(
                                  //   MaterialPageRoute(
                                  //     builder: (context) => SignIn(),
                                  //   ),
                                  // );
                                },
                                child: Padding(
                                  padding: EdgeInsets.symmetric(vertical: 8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(right: 10.0),
                                        child: Text(
                                          'Sign out',
                                          style: btnGreyText,
                                        ),
                                      ),
                                      Image.asset('assets/btn_arrow_right.png'),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text('About Tiger Loyalty V.2', style: smText),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
            decoration: BoxDecoration(
              color: Color(0xFFD9D9D9),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => Home(),
                        ),
                      );
                    },
                    child: Column(
                      children: [
                        Image.asset('assets/home.png',
                            color: Color.fromRGBO(0, 0, 0, 0.3)),
                        SizedBox(height: 5),
                        Text('Home',
                            style: footerText.copyWith(
                                color: Color.fromRGBO(0, 0, 0, 0.3))),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Image.asset('assets/reward.png',
                          color: Color.fromRGBO(0, 0, 0, 0.3)),
                      SizedBox(height: 5),
                      Text('Give reward',
                          style: footerText.copyWith(
                              color: Color.fromRGBO(0, 0, 0, 0.3))),
                    ],
                  ),
                ),
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => Customers(),
                        ),
                      );
                    },
                    child: Column(
                      children: [
                        Image.asset('assets/customer.png',
                            color: Color.fromRGBO(0, 0, 0, 0.3)),
                        SizedBox(height: 5),
                        Text('Customers',
                            style: footerText.copyWith(
                                color: Color.fromRGBO(0, 0, 0, 0.3))),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Image.asset('assets/profile.png'),
                      SizedBox(height: 5),
                      Text('Profile', style: footerText),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

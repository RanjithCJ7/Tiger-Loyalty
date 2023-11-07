import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:tiger_loyalty/const/Image.dart';
import 'package:tiger_loyalty/const/constant.dart';
import 'package:tiger_loyalty/initial_binding.dart';
import 'package:tiger_loyalty/screens/signin/component/signin.dart';

import 'package:tiger_loyalty/src/pages/edit_reward.dart';

import 'package:tiger_loyalty/src/pages/setting.dart';

import 'package:tiger_loyalty/widget/select_image.dart';
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

class Profile extends StatelessWidget {
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Container(
                      padding:
                          const EdgeInsets.only(top: 10, left: 30, right: 30),
                      width: size.width,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Image.asset(Images.profileBack),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 0),
                            child: Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 25),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  TextButton(
                                    onPressed: () {
                                      ImageUploadHelper().showCropImagePicker(
                                          context, true, (p0) {
                                        if (p0 != null) {
                                          print("path ==> $p0");
                                        }
                                      });
                                    },
                                    child: Stack(
                                      children: [
                                        Align(
                                          child: Container(
                                            padding: const EdgeInsets.all(2),
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                    color:
                                                        const Color(0xFFCFAF4E),
                                                    width: 2)),
                                            child: CircleAvatar(
                                              backgroundImage:
                                                  AssetImage(Images.profile),
                                              radius: Get.height * 0.05,
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          bottom: 0,
                                          right: 0,
                                          child: GestureDetector(
                                            onTap: () {
                                              ImageUploadHelper()
                                                  .showCropImagePicker(
                                                      context, true, (p0) {
                                                if (p0 != null) {}
                                              });
                                            },
                                            child: CircleAvatar(
                                              radius: 12,
                                              backgroundColor: Colors.white,
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.all(2),
                                                decoration: BoxDecoration(
                                                    color:
                                                        const Color(0xFF0E2ED4),
                                                    shape: BoxShape.circle,
                                                    border: Border.all(
                                                        color: Colors.white,
                                                        width: 2)),
                                                child: const Icon(
                                                  Icons.camera_alt,
                                                  color: Colors.white,
                                                  size: 16,
                                                ),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Juma Juma', style: nameLabel),
                                      const SizedBox(height: 10.0),
                                      Text('Boo Boo Restaurant',
                                          style: nameDesc),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: size.height * 0.01),
                    _buildSubsItem(
                        'Subscription and pricing', 'assets/setting_1.png'),
                    const SizedBox(height: 5),
                    _buildInvoiceItem('Invoice', 'assets/setting_2.png'),
                    SizedBox(height: size.height * 0.04),
                    Container(
                      width: size.width,
                      padding: const EdgeInsets.only(left: 30),
                      child: Text(
                        'Settings',
                        style: settingsTitle,
                      ),
                    ),
                    const SizedBox(height: 5),
                    _buildSettingItemsList(),
                    const SizedBox(height: 10),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const SizedBox(height: 5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Badili lugha?',
                                style: smText,
                              ),
                              const SizedBox(width: 5),
                              GestureDetector(
                                onTap: () {},
                                child: Text(
                                  'KSW',
                                  style: boldText,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              GestureDetector(
                                onTap: () {
                                  showModalBottomSheet(
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(15),
                                            topRight: Radius.circular(15))),
                                    context: context,
                                    builder: (BuildContext context) {
                                      return Container(
                                        margin:
                                            const EdgeInsets.only(bottom: 50.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: <Widget>[
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                TextButton(
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: Image.asset(
                                                      'assets/close.png'),
                                                ),
                                              ],
                                            ),
                                            Container(
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 30),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  SizedBox(
                                                    width: Get.width * 0.5,
                                                    child: Text(
                                                      'Delete account and all personal data?',
                                                      style: changeLabel,
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                  ),
                                                  const SizedBox(height: 30.0),
                                                  SizedBox(
                                                    width: Get.width,
                                                    height: Get.height * 0.06,
                                                    child: TextButton(
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                      style: btnGrey,
                                                      child: Text(
                                                        'No',
                                                        style: btnGreyText,
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(height: 5.0),
                                                  SizedBox(
                                                    width: Get.width,
                                                    height: Get.height * 0.06,
                                                    child: TextButton(
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                      style: btnRed,
                                                      child: Text(
                                                        'Yes',
                                                        style: yesText,
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  );
                                },
                                child: Text(
                                  'Delete my account',
                                  style: deleteText,
                                ),
                              ),
                              SizedBox(
                                width: Get.width * 0.3,
                                child: TextButton(
                                  style: btnGrey,
                                  onPressed: () {
                                    SetSharedPref().clearData();
                                    Get.offAll(() => SignIn(),
                                        binding: InitialBinding());
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              right: 10.0),
                                          child: Text(
                                            'Sign out',
                                            style: btnGreyText,
                                          ),
                                        ),
                                        Image.asset(
                                            'assets/btn_arrow_right.png'),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Text('About Tiger Loyalty V.2', style: smText),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingItemsList() {
    return Column(
      children: settingData.map((data) {
        return _buildSettingItem(data.text, data.image);
      }).toList(),
    );
  }

  Widget _buildSubsItem(String title, String image) {
    return Builder(
      builder: (BuildContext context) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 30.0),
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xFFF5F5F5)),
            color: const Color(0xFFD9D9D9),
            borderRadius: BorderRadius.circular(5),
          ),
          child: TextButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => Setting(),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 10),
                    child: Image.asset(image,
                        color: const Color.fromRGBO(0, 0, 0, 0.3)),
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
    return Builder(
      builder: (BuildContext context) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 30.0),
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xFFF5F5F5)),
            color: const Color(0xFFD9D9D9),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 10),
                  child: Image.asset(image,
                      color: const Color.fromRGBO(0, 0, 0, 0.3)),
                ),
                Expanded(
                  child: Text(
                    title,
                    style: settingsLabel,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15))),
                      builder: (BuildContext context) {
                        return Padding(
                          padding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).viewInsets.bottom),
                          child: Container(
                            height: Get.height * 0.6,
                            alignment: Alignment.bottomCenter,
                            child: Stack(
                              children: [
                                Column(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(
                                          top: 30.0, bottom: 20.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Invoice',
                                            style: alertTitle,
                                            textAlign: TextAlign.center,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                            'Total bill this month (October 1 - 31)',
                                            style: desc2),
                                        SizedBox(height: Get.height * 0.02),
                                        Text('Tsh. 150,000', style: filterText),
                                        const SizedBox(height: 5),
                                        Text('Total invoice', style: desc2),
                                      ],
                                    ),
                                    SizedBox(height: Get.height * 0.015),
                                    Container(
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 15),
                                      child: IntrinsicHeight(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text('340,600',
                                                    style: invoiceLabel),
                                                const SizedBox(height: 5),
                                                Text('Total points issued',
                                                    style: dialogTextSm),
                                              ],
                                            ),
                                            const VerticalDivider(
                                              color: Colors.black,
                                              thickness: 1,
                                              width: 30,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text('1490',
                                                    style: invoiceLabel),
                                                const SizedBox(height: 5),
                                                Text('Total  customers',
                                                    style: dialogTextSm),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: Get.height * 0.015),
                                    Text('Enter phone number make payment',
                                        style: textFieldStyle),
                                    SizedBox(height: Get.height * 0.01),
                                    Container(
                                      margin: const EdgeInsets.only(
                                          bottom: 10.0, left: 30, right: 30),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: const Color(0xFFF5F5F5)),
                                        color: const Color(0xFFD9D9D9),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: Row(
                                        children: [
                                          Container(
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 20),
                                              child: Image.asset(
                                                  'assets/ion_keypad.png')),
                                          Expanded(
                                            child: TextField(
                                              // controller: phoneNumberController,
                                              keyboardType:
                                                  TextInputType.number,
                                              inputFormatters: <TextInputFormatter>[
                                                FilteringTextInputFormatter
                                                    .digitsOnly
                                              ],
                                              decoration: const InputDecoration(
                                                hintText: 'Phone number',
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
                                    const SizedBox(height: 5),
                                    Container(
                                      margin: const EdgeInsets.only(
                                          bottom: 10.0, left: 30, right: 30),
                                      child: TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        style: btnGold2,
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 10),
                                          child: SizedBox(
                                            width: double.infinity,
                                            child: Text(
                                              'Pay',
                                              style: btnGoldText2,
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Positioned(
                                  top: 10,
                                  right: 0,
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.only(
                                        right: 15.0,
                                      ),
                                      child: Image.asset('assets/close.png'),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                  style: payBtn,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
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
      },
    );
  }

  Widget _buildSettingItem(String title, String image) {
    return Builder(
      builder: (BuildContext context) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 30.0),
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xFFF5F5F5)),
            color: const Color(0xFFD9D9D9),
            borderRadius: BorderRadius.circular(5),
          ),
          child: TextButton(
            onPressed: () {
              _navigateToScreen(context, title);
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 10),
                    child: Image.asset(image,
                        color: const Color.fromRGBO(0, 0, 0, 0.3)),
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

  void _navigateToScreen(BuildContext context, String title) {
    switch (title) {
      case 'Change login details':
        showModalBottomSheet(
          context: context,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15), topRight: Radius.circular(15))),
          builder: (BuildContext context) {
            return Container(
              padding: EdgeInsets.only(bottom: Get.height * 0.05),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Image.asset('assets/close.png'),
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Change login details',
                          style: changeLabel,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 30.0),
                        SizedBox(
                          width: double.infinity,
                          height: Get.height * 0.06,
                          child: TextButton(
                            onPressed: () {
                              Get.close(1);
                              showModalBottomSheet(
                                isScrollControlled: true,
                                shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(15),
                                        topRight: Radius.circular(15))),
                                context: context,
                                builder: (BuildContext context) {
                                  return Padding(
                                    padding: EdgeInsets.only(
                                        bottom: MediaQuery.of(context)
                                            .viewInsets
                                            .bottom),
                                    child: Container(
                                      margin:
                                          const EdgeInsets.only(bottom: 50.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: <Widget>[
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              TextButton(
                                                onPressed: () {
                                                  Get.close(1);
                                                },
                                                child: Image.asset(
                                                    'assets/close.png'),
                                              ),
                                            ],
                                          ),
                                          Container(
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 30),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                const Icon(
                                                  Icons.call,
                                                  color: Colors.black,
                                                  size: 55,
                                                  weight: 10,
                                                ),
                                                const SizedBox(height: 10),
                                                Text(
                                                  'Change e-mail',
                                                  style: changeLabel,
                                                  textAlign: TextAlign.center,
                                                ),
                                                const SizedBox(height: 20),
                                                Text(
                                                  'Change *****ya@**.com as your number',
                                                  style: todayText,
                                                  textAlign: TextAlign.center,
                                                ),
                                                const SizedBox(height: 50.0),
                                                Container(
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: const Color(
                                                            0xFFF5F5F5)),
                                                    color:
                                                        const Color(0xFFD9D9D9),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                  ),
                                                  child: TextField(
                                                    decoration:
                                                        const InputDecoration(
                                                      hintText: 'New e-mail',
                                                      hintStyle: TextStyle(
                                                          color: Color(
                                                              0xFF808080)),
                                                      border: InputBorder.none,
                                                      contentPadding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 20),
                                                    ),
                                                    style: textFieldStyle,
                                                  ),
                                                ),
                                                const SizedBox(height: 10),
                                                TextButton(
                                                  onPressed: () {
                                                    Get.close(1);
                                                    showAuthModelSheet(context);
                                                  },
                                                  style: btnGold2,
                                                  child: Padding(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        vertical: 10),
                                                    child: SizedBox(
                                                      width: double.infinity,
                                                      child: Text(
                                                        'Change',
                                                        style: btnGoldText2,
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(height: 50.0),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                            style: btnGrey,
                            child: Text(
                              'E-mail',
                              style: btnGreyText,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        SizedBox(
                          width: double.infinity,
                          height: Get.height * 0.06,
                          child: TextButton(
                            onPressed: () {
                              Get.close(1);
                            },
                            style: btnGrey,
                            child: Text(
                              'PIN',
                              style: btnGreyText,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        );
        break;
      case 'Manage Brand':
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => EditReward()));
        break;
      case 'Terms and conditions':
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return Container(
              height: Get.height,
              alignment: Alignment.bottomCenter,
              child: Dialog(
                child: Stack(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(top: 30),
                      // width: Get.width * 0.9,
                      height: Get.height,
                      child: Column(
                        children: [
                          Container(
                            margin:
                                const EdgeInsets.only(top: 10.0, bottom: 20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Terms and Conditions',
                                  style: alertTitle,
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: SingleChildScrollView(
                              padding: const EdgeInsets.only(bottom: 30.0),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 30),
                                child: Text(
                                  'Welcome to TIGER! TIGER LOYALTY COMPANY (Tiger) provides Application and website features and other products and services to you when you visit www.tiger.co.tz (the "website") or download Tiger Mobile Application, use TIGER devices, products, or services, use Tiger applications for mobile, or use software provided by Tiger Loyalty company in connection with any of the foregoing (collectively "TIGER Services"). Please see our privacy notice to understand how we collect and process your personal information. TIGER advertise and sells deals to you subject to the conditions set out on this page.\n\nCONDITIONS OF USE\nPlease read these conditions carefully before using TIGER Services. By using TIGER Services, you signify your agreement to be bound by these conditions.\n\nPRIVACY\nTIGER shall follow the privacy policy posted on its website at www.tiger,co.tz/privacypolicy when collecting and using information from you. TIGER may amend the privacy policy at any time by posting and notifying the amended privacy policy on its website. By using the App, you agree to be bound by our Privacy Policy, which is incorporated into these Terms of Use.\n\nELECTRONIC COMMUNICATIONS\nWhen you use any TIGER Service, you are communicating with us electronically. We will communicate with you electronically in a variety of ways, such as by email, text message, call, in-app push notices or by posting e-mail messages or communications on the App. For contractual purposes, you agree that all agreements, notices, disclosures and other communications that we provide you electronically satisfy any legal requirement that such communications be in writing, unless mandatory applicable laws specifically require a different form of communication.\n\nRECOMMENDATIONS AND PERSONALIZATION\nAs part of the TIGER Services, we may recommend features, products, and services, including third-party ads that might be of interest to you, identify your preferences, and personalize your experience.\n\nCOPYRIGHT, AUTHORS\' RIGHTS AND DATABASE RIGHTS\nAll content included in or made available through any TIGER Service, such as text, graphics, logos, button icons, images, audio clips, digital downloads, and data compilations is the property of TIGER or its content suppliers and is protected by applicable Copyright laws. The compilation of all content included in or made available through any TIGER Service is the exclusive property of TIGER and is protected by Tanzanian Copyright laws.\n\nYou may not extract and/or re-utilize parts of the content of any TIGER Service without our express written consent. In particular, you may not utilize any data mining, robots, or similar data gathering and extraction tools to extract (whether once or many times) for re-utilization of any substantial parts of the content of any TIGER Service, without our express written consent. You may also not create and/or publish your own database that features substantial parts of any TIGER Service (e.g. our prices and product listings) without our express written consent.\n\nTRADEMARK\nIn addition, graphics, logos, page headers, button icons, scripts, and service names included in or made available through any TIGER Service are trademarks or trade dress of TIGER. TIGER\'s trademarks and trade dress may not be used in connection with any product or service that is not TIGER’s, in any manner that is likely to cause confusion among customers or in any manner that disparages or discredits TIGER. All other trademarks not owned by TIGER that appear in any TIGER Service are the property of their respective owners, who may or may not be affiliated with, connected to, or sponsored by TIGER.\n\nNOTICE AND PROCEDURE FOR NOTIFYING TIGER OF DEFAMATORY CONTENT\nBecause millions of products are listed, and many thousands of customer reviews and comments are hosted on TIGER. It is not possible for us to be aware of the contents of each product listed for sale, or each customer review or comment that is displayed. Accordingly, we operate on a "notice and action" basis. If you believe that any content on, or within a product advertised for sale on, the TIGER website or App contains a defamatory statement, please notify TIGER immediately by sending an email to support@tiger.co.tz with the subject line "Defamation Notice [insert your name]"\n\nImportant Warning: giving false, misleading, or inaccurate information in the email to TIGER, or TIGER WhatsApp or any other communication channels of Defamatory Content on TIGER website may result in civil and criminal liability.\n\nTIGER SOFTWARE TERMS\nIn addition to these Conditions of Use, the terms found here apply to any software (including any updates or upgrades to the software and any related documentation) that we make available to you from time to time for your use in connection with TIGER Services (the TIGER Application and Website").\n\nOTHER BUSINESSES\nParties other than TIGER operate stores, provide services, or sell product lines on this App. In addition, we provide links, and location to the sites of affiliated companies and certain other businesses. We are not responsible for examining or evaluating, and we do not warrant the offerings of, any of these businesses or individuals or the content of their websites. TIGER does not assume any responsibility or liability for the actions, product, and content of all of these or any other third parties. You can tell when a third party is involved in your transactions, and we may share your information related to those transactions with that third party. You should carefully review their privacy statements and other conditions of use.\n\nTIGER’S ROLE\nTIGER allows third-party sellers to list and sell their products deals at Tiger App and website www.tiger.co.tz. In each such case, this is indicated on the respective product detail page. While TIGER as a service provider helps facilitate transactions that are carried out on the TIGER App, TIGER is neither the manufacturer, importer, representative, buyer nor the seller of the seller\'s items and services. TIGER provides a service for deal owners/sellers and deal seekers/buyers to complete transactions.\n\nAccordingly, the contract formed at the completion of a sale for these third-party products and services is solely between deal seekers/buyer and deal owners/seller. TIGER is not a party to this contract nor assumes any responsibility arising out of or in connection with it. The seller is responsible for the sale of the products/service and for dealing with any buyer claims or any other issue arising out of or in connection with the contract between the deal seeker/buyer and deal owner/seller.\n\nOUR LIABILITY (DISCLAIMER)\nTIGER will do our utmost to ensure that availability of the TIGER Services will be uninterrupted and that transmissions will be error-free. However, due to the nature of the internet, this cannot be guaranteed. Also, your access to TIGER Services may also be occasionally suspended or restricted to allow for repairs, maintenance, or the introduction of new facilities or services. Upon notification to its client TIGER will attempt to limit the frequency and duration of any such suspension or restriction.\n\nTIGER will not be responsible for (i) losses that were not caused by any breach on our part, or (ii) any business loss (including loss of profits, revenue, contracts, anticipated savings, data, goodwill, or wasted expenditure), or (iii) any loss caused by Fraud or misrepresentation, or (iv) any indirect or consequential losses that were not foreseeable to both you and us when you commenced using the TIGER Services.\n\nEach product and description displayed on the platform is according to information received from the Merchant.\n\nThe sole responsibility of TIGER is to facilitate the contractual process between buyer/deal seekers and deal owners/Merchant. TIGER stands as an agent and therefore does not provide warrant, guarantee, or any kind of assurance on its services provided on the platform.\n\nDISPUTE SETTLEMENT\nAny dispute arising from the formation, validity, binding effect, interpretation of or the performance of the terms and conditions hereunder shall be resolved amicably by mediation. If mediation fails, the said dispute will be referred to Arbitration in the presence of an Arbitrator agreed by both parties and pursuant to the current arbitration rules. For the purpose of avoiding doubt, the place of mediation shall be within the United Republic of Tanzania, and the language for arbitration will be in English or Kiswahili upon the client’s choosing. The arbitration award shall be accepted as final and binding upon the Parties, and in any case where the complainant claims for damages, it should be limited to the value of the customer’s exposure to the transaction on the platform.\n\nAPPLICABLE LAW\nThese conditions are governed by and construed in accordance with the laws of the United Republic of Tanzania. We both agree to submit to the jurisdiction of the courts of Tanzania, which means that you may bring a claim to enforce your rights in connection with these Conditions of Sale in Tanzania.\n\nALTERATIONS TO SERVICE OR AMENDMENTS TO THE CONDITIONS OF USE\nTIGER reserves the right to make changes to any TIGER Services with notification to our client, policies, terms and conditions including these Conditions of Use, and Service Terms at any time. However, we will notify the customers of all the changes that have been made. You will be subject to the terms and conditions, policies and Conditions of Use in force at the time that you use the TIGER Services. If any of these Conditions of Use is deemed invalid, void, or for any reason unenforceable, that condition will be deemed severable and will not affect the validity and enforceability of any remaining condition.\n\nWAIVER\nIf you breach these Conditions of Use and we take no action, TIGER will still be entitled to use our rights and remedies in any other situation where you breach these Conditions of Use.\n\nTIGER’S CONTACT DETAILS\nThis App and website is owned and maintained by TIGER LOYALTY COMPANY.\nOld Bagamoyo Road, Mwanga Hakika Tower, Makumbusho\nDar es salaam, Tanzania\nE-mail: business@tiger.co.tz\nPhone: +255 758 559 000\nWhatsApp: +255 758 559 000',
                                  style: dialogTextSm,
                                  textAlign: TextAlign.justify,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            height: 50,
                            margin: const EdgeInsets.all(30.0),
                            child: TextButton(
                              onPressed: () {
                                Get.close(1);
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
                    Positioned(
                      top: 15,
                      right: 10,
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Container(
                          margin: const EdgeInsets.only(
                            left: 30.0,
                          ),
                          child: Image.asset('assets/close.png'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
        break;
      case 'Privacy policy':
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return Container(
              height: MediaQuery.of(context).size.height - 125.0,
              alignment: Alignment.bottomCenter,
              child: Dialog(
                child: SizedBox(
                  width: Get.width * 0.9,
                  height: Get.height,
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 10.0, bottom: 20.0),
                        child: Row(
                          children: [
                            const Spacer(),
                            Text(
                              'Privacy Policy',
                              style: alertTitle,
                              textAlign: TextAlign.center,
                            ),
                            const Spacer(),
                            InkWell(
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              child: Container(
                                margin: const EdgeInsets.only(
                                  right: 15.0,
                                ),
                                child: Image.asset('assets/close.png'),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          padding: const EdgeInsets.only(bottom: 30.0),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            child: Text(
                              'Lorem ipsum dolor sit amet consectetur. Urna pharetra congue et nibh nulla libero massa. Mauris rhoncus quam porttitor massa Lorem ipsum dolor sit amet consectetur. Urna pharetra congue et nibh nulla libero massa. Mauris rhoncus quam porttitor massa Lorem ipsum dolor sit amet consectetur. Urna pharetra congue et nibh nulla libero massa. Mauris rhoncus quam porttitor massa\n\nLorem ipsum dolor sit amet consectetur. Urna pharetra congue et nibh nulla libero massa. Mauris rhoncus quam porttitor massa Lorem ipsum dolor sit amet consectetur. Urna pharetra congue et nibh nulla libero massa. Mauris rhoncus quam porttitor massa Lorem ipsum dolor sit amet consectetur. Urna pharetra congue et nibh nulla libero massa. Mauris rhoncus quam porttitor massa\n\nLorem ipsum dolor sit amet consectetur. Urna pharetra congue et nibh nulla libero massa. Mauris rhoncus quam porttitor massa Lorem ipsum dolor sit amet consectetur. Urna pharetra congue et nibh nulla libero massa. Mauris rhoncus quam porttitor massa Lorem ipsum dolor sit amet consectetur. Urna pharetra congue et nibh nulla libero massa. Mauris rhoncus quam porttitor massa\n\nLorem ipsum dolor sit amet consectetur. Urna pharetra congue et nibh nulla libero massa. Mauris rhoncus quam porttitor massa Lorem ipsum dolor sit amet consectetur. Urna pharetra congue et nibh nulla libero massa. Mauris rhoncus quam porttitor massa Lorem ipsum dolor sit amet consectetur. Urna pharetra congue et nibh nulla libero massa. Mauris rhoncus quam porttitor massa',
                              style: dialogTextSm,
                              textAlign: TextAlign.justify,
                            ),
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
        break;
      case 'About Tiger Loyalty':
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return Container(
              height: MediaQuery.of(context).size.height - 125.0,
              alignment: Alignment.bottomCenter,
              child: Dialog(
                child: Stack(
                  children: [
                    SizedBox(
                      width: Get.width,
                      height: Get.height,
                      child: Column(
                        children: [
                          Container(
                            margin:
                                const EdgeInsets.only(top: 30.0, bottom: 20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'About Tiger Loyalty',
                                  style: alertTitle,
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: SingleChildScrollView(
                              padding: const EdgeInsets.only(bottom: 30.0),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 30),
                                child: Text(
                                  'Lorem ipsum dolor sit amet consectetur. Urna pharetra congue et nibh nulla libero massa. Mauris rhoncus quam porttitor massa Lorem ipsum dolor sit amet consectetur. Urna pharetra congue et nibh nulla libero massa. Mauris rhoncus quam porttitor massa Lorem ipsum dolor sit amet consectetur. Urna pharetra congue et nibh nulla libero massa. Mauris rhoncus quam porttitor massa\n\nLorem ipsum dolor sit amet consectetur. Urna pharetra congue et nibh nulla libero massa. Mauris rhoncus quam porttitor massa Lorem ipsum dolor sit amet consectetur. Urna pharetra congue et nibh nulla libero massa. Mauris rhoncus quam porttitor massa Lorem ipsum dolor sit amet consectetur. Urna pharetra congue et nibh nulla libero massa. Mauris rhoncus quam porttitor massa\n\nLorem ipsum dolor sit amet consectetur. Urna pharetra congue et nibh nulla libero massa. Mauris rhoncus quam porttitor massa Lorem ipsum dolor sit amet consectetur. Urna pharetra congue et nibh nulla libero massa. Mauris rhoncus quam porttitor massa Lorem ipsum dolor sit amet consectetur. Urna pharetra congue et nibh nulla libero massa. Mauris rhoncus quam porttitor massa\n\nLorem ipsum dolor sit amet consectetur. Urna pharetra congue et nibh nulla libero massa. Mauris rhoncus quam porttitor massa Lorem ipsum dolor sit amet consectetur. Urna pharetra congue et nibh nulla libero massa. Mauris rhoncus quam porttitor massa Lorem ipsum dolor sit amet consectetur. Urna pharetra congue et nibh nulla libero massa. Mauris rhoncus quam porttitor massa',
                                  style: dialogTextSm,
                                  textAlign: TextAlign.justify,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      right: 0,
                      top: 10,
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Container(
                          margin: const EdgeInsets.only(
                            right: 15.0,
                          ),
                          child: Image.asset('assets/close.png'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
        break;
      default:
        break;
    }
  }

  showAuthModelSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15))),
      builder: (BuildContext context) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Image.asset('assets/close.png'),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.lock,
                      color: Colors.black,
                      size: 55,
                      weight: 10,
                    ),
                    // Image.asset(
                    //     'assets/authentication.png'),
                    const SizedBox(height: 20),
                    Text(
                      'Authentication',
                      style: changeLabel,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Enter OTP sent to *****ya@**.com ',
                      style: todayText,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 50.0),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.only(right: 5.0),
                            decoration: BoxDecoration(
                              border:
                                  Border.all(color: const Color(0xFFF5F5F5)),
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
                                    // controller: pinController,
                                    keyboardType: TextInputType.number,
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.digitsOnly,
                                      LengthLimitingTextInputFormatter(4),
                                      // _tinFormatter,
                                    ],
                                    obscureText: true,
                                    decoration: const InputDecoration(
                                      hintText: 'Enter OTP',
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
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => EditReward(),
                              ),
                            );
                          },
                          style: btnGold2,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 13, vertical: 8.0),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 10.0),
                                  child: Text(
                                    'Save',
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
                    const SizedBox(height: 100.0),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

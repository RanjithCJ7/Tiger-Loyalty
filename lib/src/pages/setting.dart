import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import 'styles.dart';

class SubscriptionData {
  String title;
  String desc;
  final Color backgroundColor;
  final Color descColor;
  final Color titleColor;

  SubscriptionData({
    required this.title,
    required this.desc,
    required this.backgroundColor,
    required this.descColor,
    required this.titleColor,
  });
}

class Setting extends StatefulWidget {
  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  List<SubscriptionData> subscriptionData = [
    SubscriptionData(
      title: 'Free',
      titleColor: Colors.black,
      desc:
          'Lorem ipsum dolor sit amet consectetur. Eget vitae aenean risus aliquet elit turpis quam. Ut tellus tincidunt hendrerit venenatis. Sed integer semper felis felis eros lobortis risus. ',
      descColor: Colors.black,
      backgroundColor: const Color(0xFF000000).withOpacity(0.2),
    ),
    SubscriptionData(
      title: 'TZS. 25,000',
      titleColor: Colors.black,
      desc:
          'Lorem ipsum dolor sit amet consectetur. Eget vitae aenean risus aliquet elit turpis quam. Ut tellus tincidunt hendrerit venenatis. Sed integer semper felis felis eros lobortis risus. ',
      descColor: Colors.black,
      backgroundColor: const Color(0xFF1BB46A).withOpacity(0.5),
    ),
    SubscriptionData(
      title: 'TZS. 50,000',
      titleColor: Colors.white,
      desc:
          'Lorem ipsum dolor sit amet consectetur. Eget vitae aenean risus aliquet elit turpis quam. Ut tellus tincidunt hendrerit venenatis. Sed integer semper felis felis eros lobortis risus. ',
      descColor: Colors.white,
      backgroundColor: const Color(0xFF000000).withOpacity(0.7),
    ),
    SubscriptionData(
      title: 'TZS. 75,000',
      titleColor: Colors.white,
      desc:
          'Lorem ipsum dolor sit amet consectetur. Eget vitae aenean risus aliquet elit turpis quam. Ut tellus tincidunt hendrerit venenatis. Sed integer semper felis felis eros lobortis risus. ',
      descColor: Colors.white,
      backgroundColor: const Color(0xFF000000).withOpacity(1.0),
    ),
  ];

  SubscriptionData? selectedSubscription;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leadingWidth: size.width,
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Color(0xFF0E2ED4),
                ),
              ),
              const Text(
                "Setting",
                style: TextStyle(
                  color: Color(0xFF0E2ED4),
                  fontFamily: "Inter",
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                ),
              )
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: size.width,
                child: ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: subscriptionData.length,
                    itemBuilder: (context, index) {
                      var data = subscriptionData[index];
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedSubscription = data;
                          });
                        },
                        child: Stack(
                          children: [
                            Container(
                              width: size.width,
                              padding: const EdgeInsets.only(
                                  left: 20, right: 20, top: 10),
                              child: Container(
                                width: size.width * 0.8,
                                height: size.height * 0.185,
                                padding: const EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: data.backgroundColor,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      data.title,
                                      style: label.copyWith(
                                        color: data.titleColor,
                                      ),
                                    ),
                                    SizedBox(height: size.height * 0.01),
                                    Text(
                                      data.desc,
                                      style: subsDark.copyWith(
                                        letterSpacing: 0.5,
                                        color: data.descColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            if (data.title == selectedSubscription?.title)
                              Positioned(
                                top: 0,
                                right: 5,
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Image.asset('assets/white_border.png'),
                                    Image.asset('assets/check.png'),
                                  ],
                                ),
                              )
                          ],
                        ),
                      );
                    }),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              GestureDetector(
                onTap: () {
                  if (selectedSubscription == null) {
                    Fluttertoast.showToast(
                        msg: "Please choose subscription plan");
                  } else {
                    Get.back();
                  }
                },
                child: Container(
                  height: size.height * 0.06,
                  width: size.width * 0.9,
                  decoration: BoxDecoration(
                    color: const Color(0xFFCFAF4E),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Center(
                    child: Text(
                      'Upgrade',
                      style: btnGoldText2,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

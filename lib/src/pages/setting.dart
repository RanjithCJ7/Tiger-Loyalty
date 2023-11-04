import 'package:flutter/material.dart';
import 'package:tiger_loyalty/src/pages/create_reward.dart';
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
      backgroundColor: Color(0xFF000000).withOpacity(0.2),
    ),
    SubscriptionData(
      title: 'TZS. 25,000',
      titleColor: Colors.black,
      desc:
          'Lorem ipsum dolor sit amet consectetur. Eget vitae aenean risus aliquet elit turpis quam. Ut tellus tincidunt hendrerit venenatis. Sed integer semper felis felis eros lobortis risus. ',
      descColor: Colors.black,
      backgroundColor: Color(0xFF1BB46A).withOpacity(0.5),
    ),
    SubscriptionData(
      title: 'TZS. 50,000',
      titleColor: Colors.white,
      desc:
          'Lorem ipsum dolor sit amet consectetur. Eget vitae aenean risus aliquet elit turpis quam. Ut tellus tincidunt hendrerit venenatis. Sed integer semper felis felis eros lobortis risus. ',
      descColor: Colors.white,
      backgroundColor: Color(0xFF000000).withOpacity(0.7),
    ),
    SubscriptionData(
      title: 'TZS. 75,000',
      titleColor: Colors.white,
      desc:
          'Lorem ipsum dolor sit amet consectetur. Eget vitae aenean risus aliquet elit turpis quam. Ut tellus tincidunt hendrerit venenatis. Sed integer semper felis felis eros lobortis risus. ',
      descColor: Colors.white,
      backgroundColor: Color(0xFF000000).withOpacity(1.0),
    ),
  ];

  SubscriptionData? selectedSubscription;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(left: 15, top: 15),
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 10),
                    child: Image.asset('assets/chevron_left.png'),
                  ),
                  Text(
                    'Setting',
                    style: settingLabel,
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Column(
              children: subscriptionData.map((data) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedSubscription = data;
                    });
                  },
                  child: Stack(
                    children: [
                      Container(
                        width: 347,
                        height: 159,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: data.backgroundColor,
                        ),
                        margin: EdgeInsets.only(bottom: 5.0),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                data.title,
                                style: label.copyWith(
                                  color: data.titleColor,
                                ),
                              ),
                              SizedBox(height: 20.0),
                              Text(
                                data.desc,
                                style: subsDark.merge(
                                  TextStyle(
                                    letterSpacing: 0.5,
                                    color: data.descColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      if (data.title == selectedSubscription?.title)
                        Positioned(
                          top: -4,
                          right: -4,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Image.asset('assets/white_border.png'),
                              Image.asset('assets/check.png'),
                            ],
                          ),
                        ),
                    ],
                  ),
                );
              }).toList(),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              margin: EdgeInsets.all(10),
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
                      'Upgrade',
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
    );
  }
}

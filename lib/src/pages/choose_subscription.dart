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

class ChooseSubscription extends StatefulWidget {
  @override
  _ChooseSubscriptionState createState() => _ChooseSubscriptionState();
}

class _ChooseSubscriptionState extends State<ChooseSubscription> {
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
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(40.0),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.symmetric(vertical: 15.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Choose subscription',
                            style: label,
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
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
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
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
                                    if (data.title ==
                                        selectedSubscription?.title)
                                      Positioned(
                                        top: -5,
                                        right: -5,
                                        child: Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            Image.asset(
                                                'assets/white_border.png'),
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
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => CreateReward(),
                                  ),
                                );
                              },
                              style: btnGold2,
                              child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                child: Container(
                                  width: double.infinity,
                                  child: Text(
                                    'Proceed',
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

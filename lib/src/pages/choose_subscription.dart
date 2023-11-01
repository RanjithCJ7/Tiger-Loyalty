import 'package:flutter/material.dart';
import 'package:tiger_loyalty/src/pages/create_reward.dart';
import 'styles.dart';

class SubscriptionData {
  String title;
  String desc;

  SubscriptionData({required this.title, required this.desc});
}

class ChooseSubscription extends StatefulWidget {
  @override
  _ChooseSubscriptionState createState() => _ChooseSubscriptionState();
}

class _ChooseSubscriptionState extends State<ChooseSubscription> {
  List<SubscriptionData> subscriptionData = [
    SubscriptionData(
      title: 'Free',
      desc:
          'Lorem ipsum dolor sit amet consectetur. Eget vitae aenean risus aliquet elit turpis quam. Ut tellus tincidunt hendrerit venenatis. Sed integer semper felis felis eros lobortis risus.',
    ),
    SubscriptionData(
      title: 'TZS. 25,000',
      desc:
          'Lorem ipsum dolor sit amet consectetur. Eget vitae aenean risus aliquet elit turpis quam. Ut tellus tincidunt hendrerit venenatis. Sed integer semper felis felis eros lobortis risus.',
    ),
    SubscriptionData(
      title: 'TZS. 50,000',
      desc:
          'Lorem ipsum dolor sit amet consectetur. Eget vitae aenean risus aliquet elit turpis quam. Ut tellus tincidunt hendrerit venenatis. Sed integer semper felis felis eros lobortis risus.',
    ),
    SubscriptionData(
      title: 'TZS. 75,000',
      desc:
          'Lorem ipsum dolor sit amet consectetur. Eget vitae aenean risus aliquet elit turpis quam. Ut tellus tincidunt hendrerit venenatis. Sed integer semper felis felis eros lobortis risus.',
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
                                        color: selectedSubscription == data
                                            ? Color(0xFF1BB46A).withOpacity(0.5)
                                            : Color(0xFF000000)
                                                .withOpacity(0.2),
                                      ),
                                      margin: EdgeInsets.only(bottom: 5.0),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 20.0, vertical: 15.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(data.title, style: label),
                                            SizedBox(height: 20.0),
                                            Text(
                                              data.desc,
                                              style: subsDark.merge(
                                                TextStyle(
                                                  letterSpacing: 0.5,
                                                  color: selectedSubscription ==
                                                          data
                                                      ? Colors.white
                                                      : Colors.black,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    if (selectedSubscription == data)
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
                              child: Container(
                                width: double.infinity,
                                height: 53,
                                alignment: Alignment.center,
                                child: Text(
                                  'Proceed',
                                  style: btnGoldText2,
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

import 'package:flutter/material.dart';
import 'package:tiger_loyalty/src/pages/customers.dart';
import 'package:tiger_loyalty/src/pages/give_reward.dart';
import 'package:tiger_loyalty/src/pages/profile.dart';
import 'package:tiger_loyalty/src/pages/reviews.dart';
import 'package:tiger_loyalty/src/pages/update_business.dart';
import 'package:tiger_loyalty/src/pages/update_contact.dart';
import 'package:tiger_loyalty/src/pages/update_reward_table.dart';
import 'styles.dart';

class RewardData {
  String text;
  String image;

  RewardData({required this.text, required this.image});
}

List<RewardData> settingData = [
  RewardData(
      text: 'Change business details', image: 'assets/change_business.png'),
  RewardData(text: 'Add menu (pdf)', image: 'assets/add_menu.png'),
  RewardData(text: 'Update reward table', image: 'assets/update_reward.png'),
  RewardData(text: 'Update Contacts', image: 'assets/update_contacts.png')
];

void _navigateToScreen(BuildContext context, String title) {
  switch (title) {
    case 'Change business details':
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => UpdateBusiness(name: 'Boo Boo Restaurant')));
      break;
    case 'Add menu (pdf)':
      showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            margin: EdgeInsets.only(bottom: 50.0),
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
                  margin: EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        child: Text(
                          'UPLOAD MENU',
                          style: changeLabel,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(height: 30.0),
                      Container(
                        width: double.infinity,
                        height: 53,
                        child: TextButton(
                          onPressed: () {},
                          style: btnGrey,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.only(right: 10),
                                child: Image.asset('assets/upload_file.png'),
                              ),
                              Text(
                                'Upload file',
                                style: btnGreyText,
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Container(
                        width: double.infinity,
                        height: 53,
                        child: TextButton(
                          onPressed: () {},
                          style: btnGrey,
                          child: Text(
                            'SAVE',
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
    case 'Update reward table':
          Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => UpdateRewardTable()));
      break;
    case 'Update Contacts':
          Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => UpdateContact()));

      break;
    default:
      break;
  }
}

class EditReward extends StatefulWidget {
  @override
  _EditRewardState createState() => _EditRewardState();
}

class _EditRewardState extends State<EditReward> {
  @override
  Widget _rewardItems() {
    return Column(
      children: settingData.map((data) {
        return _rewardItem(data.text, data.image);
      }).toList(),
    );
  }

  Widget _rewardItem(String title, String image) {
    return Builder(
      builder: (BuildContext context) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 10.0),
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
              padding: EdgeInsets.symmetric(horizontal: 15),
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

  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Column(
              children: [
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
                      Spacer()
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Spacer(),
                          Container(
                            child: Stack(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 50),
                                  child: Container(
                                    width: 92,
                                    height: 92,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 1, color: Color(0xFFCFAF4E)),
                                      borderRadius: BorderRadius.circular(46),
                                    ),
                                    child: Image.asset('assets/restaurant.png'),
                                  ),
                                ),
                                Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Image.asset('assets/camera_bg.png'),
                                      Image.asset('assets/camera.png'),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Spacer(),
                          TextButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return Dialog(
                                    backgroundColor: Colors.black
                                        .withOpacity(0.5), // Dull background
                                    child: Container(
                                      padding: EdgeInsets.all(20),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Image.asset(
                                              'assets/restaurant_modal.png'),
                                          SizedBox(height: 20),
                                          // ElevatedButton(
                                          //   onPressed: () {
                                          //     Navigator.of(context).pop();
                                          //   },
                                          //   child: Text('Close'),
                                          // ),
                                          Container(
                                            width: double.infinity,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.stretch,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: [
                                                    TextButton(
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                      style: photoBtn,
                                                      child: Padding(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal: 20,
                                                                vertical: 5),
                                                        child: Text('Cancel',
                                                            style: photoText),
                                                      ),
                                                    ),
                                                    TextButton(
                                                      onPressed: () {
                                                        // Navigator.of(context).push(
                                                        //   MaterialPageRoute(
                                                        //     builder: (context) => CreateAccount(),
                                                        //   ),
                                                        // );
                                                      },
                                                      style: photoBtn,
                                                      child: Padding(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal: 20,
                                                                vertical: 5),
                                                        child: Row(
                                                          children: [
                                                            Container(
                                                              margin: EdgeInsets
                                                                  .only(
                                                                      right:
                                                                          5.0),
                                                              child: Image.asset(
                                                                  'assets/tick.png'),
                                                            ),
                                                            Text('Choose',
                                                                style:
                                                                    photoText),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                )
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
                            child: Container(
                              margin: EdgeInsets.only(bottom: 30),
                              child: Text(
                                'Edit brand',
                                style: resetBtnText,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      Container(
                        child: Column(
                          children: [
                            Text('Boo Boo Restaurant', style: invoiceLabel),
                            SizedBox(height: 10),
                            Text('Magomeni Mikumi, Dar es salaam', style: desc),
                          ],
                        ),
                      ),
                      SizedBox(height: 30),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => Review(),
                            ),
                          );
                        },
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                    margin: EdgeInsets.symmetric(horizontal: 5),
                                    child:
                                        Image.asset('assets/star_active.png')),
                                Container(
                                    margin: EdgeInsets.symmetric(horizontal: 5),
                                    child:
                                        Image.asset('assets/star_active.png')),
                                Container(
                                    margin: EdgeInsets.symmetric(horizontal: 5),
                                    child:
                                        Image.asset('assets/star_active.png')),
                                Container(
                                    margin: EdgeInsets.symmetric(horizontal: 5),
                                    child:
                                        Image.asset('assets/star_active.png')),
                                Container(
                                    margin: EdgeInsets.symmetric(horizontal: 5),
                                    child: Image.asset(
                                        'assets/star_inactive.png')),
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(right: 5),
                                      child: Text('4.0', style: rewardText),
                                    ),
                                    Image.asset('assets/star_gold.png'),
                                  ],
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 5),
                                  child: Image.asset('assets/line_sm.png'),
                                ),
                                Row(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(right: 5),
                                      child:
                                          Image.asset('assets/mail_gold.png'),
                                    ),
                                    Text('213', style: rewardText),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 50),
                      _rewardItems(),
                    ],
                  ),
                ),
              ],
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
                  child: Column(
                    children: [
                      Image.asset('assets/home.png'),
                      SizedBox(height: 5),
                      Text('Home', style: footerText),
                    ],
                  ),
                ),
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => GiveReward(),
                        ),
                      );
                    },
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
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => Profile(),
                        ),
                      );
                    },
                    child: Column(
                      children: [
                        Image.asset('assets/profile.png',
                            color: Color.fromRGBO(0, 0, 0, 0.3)),
                        SizedBox(height: 5),
                        Text('Profile',
                            style: footerText.copyWith(
                                color: Color.fromRGBO(0, 0, 0, 0.3))),
                      ],
                    ),
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

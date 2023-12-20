import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:tiger_loyalty/screens/profile/model/profile_model.dart';
import 'package:tiger_loyalty/screens/signup/controller/signup_controller.dart';
import '../../../src/pages/styles.dart';

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

// ignore: must_be_immutable
class ChooseSubscription extends StatefulWidget {
  ProfileModel profileModel;
  ChooseSubscription({super.key, required this.profileModel});

  @override
  _ChooseSubscriptionState createState() => _ChooseSubscriptionState();
}

class _ChooseSubscriptionState extends State<ChooseSubscription> {
  SignupController signupController = Get.find<SignupController>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.symmetric(vertical: 15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'choose_subs'.tr,
                  style: label,
                ),
                SizedBox(
                  width: size.width,
                  child: ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: signupController.subscriptionData.length,
                      itemBuilder: (context, index) {
                        var data = signupController.subscriptionData[index];
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              signupController.selectedSubscription = data;
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        data.title,
                                        style: label.copyWith(
                                          color: data.titleColor,
                                        ),
                                      ),
                                      SizedBox(height: size.height * 0.015),
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
                              if (data.title ==
                                  signupController.selectedSubscription?.title)
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
                const SizedBox(
                  height: 10.0,
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  child: TextButton(
                    onPressed: () {
                      if (signupController.selectedSubscription == null) {
                        Fluttertoast.showToast(msg: "choose_plan_msg".tr);
                      } else {
                        signupController.choosePlan();
                      }
                    },
                    style: btnGold2,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                      ),
                      child: SizedBox(
                        width: size.width * 0.8,
                        child: Text(
                          'proceed'.tr,
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
      ),
    );
  }
}

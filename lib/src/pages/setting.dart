import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:tiger_loyalty/screens/profile/controller/profile_controller.dart';
import 'package:tiger_loyalty/widget/loader_widget.dart';

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
      title: 'free'.tr,
      titleColor: Colors.black,
      desc: 'free_desc'.tr,
      descColor: Colors.black,
      backgroundColor: const Color(0xFF000000).withOpacity(0.2),
    ),
    SubscriptionData(
      title: 'plan_2'.tr,
      titleColor: Colors.black,
      desc: 'plan_2_desc'.tr,
      descColor: Colors.black,
      backgroundColor: const Color(0xFF1BB46A).withOpacity(0.5),
    ),
    SubscriptionData(
      title: 'plan_3'.tr,
      titleColor: Colors.white,
      desc: 'plan_3_desc'.tr,
      descColor: Colors.white,
      backgroundColor: const Color(0xFF000000).withOpacity(0.7),
    ),
    SubscriptionData(
      title: 'plan_4'.tr,
      titleColor: Colors.white,
      desc: 'plan_4_desc'.tr,
      descColor: Colors.white,
      backgroundColor: const Color(0xFF000000).withOpacity(1.0),
    ),
  ];

  ProfileController profileController = Get.find<ProfileController>();

  @override
  void initState() {
    super.initState();

    setState(() {
      profileController.profileModel.value.subscriptionPlan == "FREE"
          ? profileController.selectedSubscription = subscriptionData[0]
          : profileController.profileModel.value.subscriptionPlan == "PLAN_2"
              ? profileController.selectedSubscription = subscriptionData[1]
              : profileController.profileModel.value.subscriptionPlan ==
                      "PLAN_3"
                  ? profileController.selectedSubscription = subscriptionData[2]
                  : profileController.selectedSubscription =
                      subscriptionData[3];
    });
  }

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
              Text(
                "settings".tr,
                style: const TextStyle(
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
        child: Obx(
          () => profileController.isLoading.value
              ? const LoaderWidget()
              : SingleChildScrollView(
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
                                    profileController.selectedSubscription =
                                        data;
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
                                          borderRadius:
                                              BorderRadius.circular(10),
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
                                            SizedBox(
                                                height: size.height * 0.01),
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
                                        profileController
                                            .selectedSubscription?.title)
                                      Positioned(
                                        top: 0,
                                        right: 5,
                                        child: Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            Image.asset(
                                                'assets/white_border.png'),
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
                          if (profileController.selectedSubscription == null) {
                            Fluttertoast.showToast(msg: "choose_plan_msg".tr);
                          } else {
                            profileController.choosePlan();
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
                              'upgrade'.tr,
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
      ),
    );
  }
}

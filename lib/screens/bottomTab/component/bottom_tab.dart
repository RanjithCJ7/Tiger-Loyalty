import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiger_loyalty/const/Image.dart';
import 'package:tiger_loyalty/screens/bottomTab/controller/bottomtab_controller.dart';
import 'package:tiger_loyalty/screens/home/controller/home_controller.dart';
import 'package:tiger_loyalty/screens/notification/controller/notification_controller.dart';
import 'package:tiger_loyalty/screens/profile/controller/profile_controller.dart';

class BottomTab extends StatefulWidget {
  const BottomTab({super.key});

  @override
  State<BottomTab> createState() => _BottomTabState();
}

class _BottomTabState extends State<BottomTab> {
  NotificationController notificationController =
      Get.put(NotificationController());
  BottomTabController bottomTabController = Get.put(BottomTabController());

  @override
  void initState() {
    Get.lazyPut<ProfileController>(() => ProfileController());
    Get.lazyPut<HomeController>(() => HomeController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: bottomTabController.changeTab,
        builder: (context, value, child) {
          return Scaffold(
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: bottomTabController.index.value,
              type: BottomNavigationBarType.fixed,
              backgroundColor: const Color(0xFFFBFBFB),
              selectedItemColor: Colors.black,
              unselectedItemColor: const Color(0xFFB0B0B0),
              selectedFontSize: 14,
              unselectedFontSize: 14,
              onTap: (value) {
                Get.lazyPut<ProfileController>(() => ProfileController());
                Get.lazyPut<HomeController>(() => HomeController());
                setState(() {
                  bottomTabController.index.value = value;
                });
              },
              items: [
                BottomNavigationBarItem(
                  label: 'home'.tr,
                  icon: Image.asset(
                    Images.homeTab,
                    color: bottomTabController.index.value == 0
                        ? Colors.black
                        : const Color(0xFFB0B0B0),
                    height: Get.height * 0.03,
                  ),
                ),
                BottomNavigationBarItem(
                  label: 'give_reward'.tr,
                  icon: Image.asset(
                    Images.rewardTab,
                    color: bottomTabController.index.value == 1
                        ? Colors.black
                        : const Color(0xFFB0B0B0),
                    height: Get.height * 0.03,
                  ),
                ),
                BottomNavigationBarItem(
                  label: 'customers'.tr,
                  icon: Image.asset(
                    Images.customerTab,
                    color: bottomTabController.index.value == 2
                        ? Colors.black
                        : const Color(0xFFB0B0B0),
                    height: Get.height * 0.03,
                  ),
                ),
                BottomNavigationBarItem(
                  label: 'profile'.tr,
                  icon: Image.asset(
                    Images.profileTab,
                    color: bottomTabController.index.value == 3
                        ? Colors.black
                        : const Color(0xFFB0B0B0),
                    height: Get.height * 0.03,
                  ),
                ),
              ],
            ),
            body: ValueListenableBuilder(
                valueListenable: bottomTabController.changeTab,
                builder: (context, value, child) {
                  return bottomTabController
                      .screen[bottomTabController.index.value];
                }),
            /* body: Navigator(
            onGenerateRoute: (settings) {
              Widget page = screen[3];
              if (settings.name == 'page2') page = EditReward();
              return MaterialPageRoute(builder: (_) => page);
            },
          ), */
          );
        });
  }
}

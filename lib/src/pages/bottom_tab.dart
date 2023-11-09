import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiger_loyalty/const/Image.dart';
import 'package:tiger_loyalty/screens/customer/component/customers.dart';
import 'package:tiger_loyalty/src/pages/give_reward.dart';
import 'package:tiger_loyalty/screens/home/component/home.dart';
import 'package:tiger_loyalty/src/pages/profile.dart';

class BottomTab extends StatefulWidget {
  const BottomTab({super.key});

  @override
  State<BottomTab> createState() => _BottomTabState();
}

class _BottomTabState extends State<BottomTab> {
  int index = 0;
  var screen = [Home(), GiveReward(), Customers(), Profile()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xFFFBFBFB),
        selectedItemColor: Colors.black,
        unselectedItemColor: const Color(0xFFB0B0B0),
        selectedFontSize: 14,
        unselectedFontSize: 14,
        onTap: (value) {
          setState(() {
            index = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Image.asset(
              Images.homeTab,
              color: index == 0 ? Colors.black : const Color(0xFFB0B0B0),
              height: Get.height * 0.03,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Give reward',
            icon: Image.asset(
              Images.rewardTab,
              color: index == 1 ? Colors.black : const Color(0xFFB0B0B0),
              height: Get.height * 0.03,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Customers',
            icon: Image.asset(
              Images.customerTab,
              color: index == 2 ? Colors.black : const Color(0xFFB0B0B0),
              height: Get.height * 0.03,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Profile',
            icon: Image.asset(
              Images.profileTab,
              color: index == 3 ? Colors.black : const Color(0xFFB0B0B0),
              height: Get.height * 0.03,
            ),
          ),
        ],
      ),
      body: screen[index],
    );
  }
}

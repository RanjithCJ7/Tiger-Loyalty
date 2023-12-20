import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiger_loyalty/src/pages/give_reward.dart';
import 'package:tiger_loyalty/screens/home/component/home.dart';
import 'package:tiger_loyalty/screens/profile/component/profile.dart';
import 'package:tiger_loyalty/screens/customer/component/customers.dart';

class BottomTabController extends GetxController {
  RxInt index = 0.obs;
  var screen = [Home(), GiveReward(), Customers(), Profile()];
  ValueNotifier<bool> changeTab = ValueNotifier(true);
}

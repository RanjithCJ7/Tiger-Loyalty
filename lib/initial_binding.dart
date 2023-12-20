import 'package:get/get.dart';
import 'package:tiger_loyalty/screens/createLipaNamba/controller/lipna_namba_controller.dart';
import 'package:tiger_loyalty/screens/createReward/controller/create_reward_controller.dart';
import 'package:tiger_loyalty/screens/home/controller/home_controller.dart';
import 'package:tiger_loyalty/screens/manageBrand/controller/manage_brand_controller.dart';
import 'package:tiger_loyalty/screens/profile/controller/profile_controller.dart';
import 'package:tiger_loyalty/screens/signin/controller/signin_controller.dart';
import 'package:tiger_loyalty/screens/signup/controller/signup_controller.dart';
import 'package:tiger_loyalty/screens/updateRewardTable/controller/update_reward_table_controller.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignupController());
    Get.lazyPut(() => SigninController());
    Get.lazyPut(() => CreateRewardController());
    Get.lazyPut(() => UpdateRewardTableController());
    Get.lazyPut(() => LipaNambaController());
    Get.lazyPut(() => ProfileController());
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => ManagebrandController());
  }
}

import 'package:get/get.dart';
import 'package:tiger_loyalty/screens/signin/controller/signin_controller.dart';
import 'package:tiger_loyalty/screens/signup/controller/signup_controller.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignupController());
    Get.lazyPut(() => SigninController());
  }
}

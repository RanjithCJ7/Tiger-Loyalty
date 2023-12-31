import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiger_loyalty/const/Image.dart';
import 'package:tiger_loyalty/const/constant.dart';
import 'package:tiger_loyalty/initial_binding.dart';
import 'package:tiger_loyalty/screens/signin/component/signin.dart';
import 'package:tiger_loyalty/src/pages/bottom_tab.dart';

import 'src/pages/styles.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: const MyHomePage(title: ''),
      initialBinding: InitialBinding(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    SetSharedPref().getData();
    Future.delayed(const Duration(seconds: 3), () {
      Params.userToken != "null"
          ? Get.offAll(() => const BottomTab())
          : Get.offAll(() => SignIn());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Image.asset(
          Images.loadingGIF,
          height: 50,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/splash.png'),
            const SizedBox(height: 15.0),
            Text(
              'Reward for Growth',
              style: splashText,
            ),
          ],
        ),
      ),
    );
  }
}

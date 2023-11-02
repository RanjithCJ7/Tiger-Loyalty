import 'package:flutter/material.dart';
import 'package:tiger_loyalty/src/pages/choose_photo.dart';
import 'package:tiger_loyalty/src/pages/choose_subscription.dart';
import 'package:tiger_loyalty/src/pages/create_reward.dart';
import 'package:tiger_loyalty/src/pages/customers.dart';
import 'package:tiger_loyalty/src/pages/customers_summary.dart';
import 'package:tiger_loyalty/src/pages/home.dart';
import 'package:tiger_loyalty/src/pages/profile.dart';
import 'package:tiger_loyalty/src/pages/reg_business.dart';
import 'package:tiger_loyalty/src/pages/reg_user.dart';
import 'package:tiger_loyalty/src/pages/signin.dart';
import 'src/pages/styles.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(title: ''),
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
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        Navigator.pushReplacement(
          context,
          // MaterialPageRoute(builder: (context) => SignIn()),
          MaterialPageRoute(builder: (context) => ChooseSubscription()),
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Stack(
          children: [
            // if (isLoading)
            // Image.asset(
            //   "assets/loading.gif",
            //   height: 125.0,
            //   width: 125.0,
            // ),
            // if (!isLoading)
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 175.0),
                  child: Column(
                    children: [
                      Image.asset('assets/splash.png'),
                      SizedBox(height: 15.0),
                      Text(
                        'Reward for Growth',
                        style: splashText,
                      ),
                    ],
                  ),
                ),
                Image.asset('assets/tiger.png'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tiger_loyalty/const/Image.dart';
import 'package:tiger_loyalty/const/Url.dart';
import 'package:tiger_loyalty/const/constant.dart';
import 'package:tiger_loyalty/initial_binding.dart';
import 'package:tiger_loyalty/screens/signin/component/signin.dart';
import 'package:tiger_loyalty/screens/bottomTab/component/bottom_tab.dart';
import 'package:tiger_loyalty/translation/translation_service.dart';
import 'package:http/http.dart' as http;
import 'src/pages/styles.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final TranslationService translationService = TranslationService();

    return GetMaterialApp(
      translations: translationService,
      home: const MyHomePage(),
      initialBinding: InitialBinding(),
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('sw', 'TZ'),
        Locale("en"),
      ],
      locale: const Locale('en', 'TZ'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();

    SetSharedPref().getData().then((value) {
      refreshToken();
      if (Params.language == "English") {
        Get.updateLocale(const Locale('en'));
      } else {
        Get.updateLocale(const Locale('sw'));
      }
      print("language ==> ${Params.language}");
    });
    Future.delayed(const Duration(seconds: 3), () {
      Params.userToken != "null"
          ? Get.offAll(() => const BottomTab(), binding: InitialBinding())
          : Get.offAll(() => SignIn());
    });
  }

  refreshToken() async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();

      if (Params.userToken != "null") {
        var request = http.Request('POST', Uri.parse(Urls.refreshToken));
        request.body = json.encode({"refreshToken": Params.refreshToken});
        request.headers.addAll({'Content-Type': 'application/json'});

        http.StreamedResponse response = await request.send();
        var decodeData = await http.Response.fromStream(response);
        final result = jsonDecode(decodeData.body);
        print("refresh token response ==> $result");

        if (response.statusCode == 200) {
          pref.setString("token", result["token"]);
          pref.setString("refreshToken", result["refreshToken"]);
          Params.userToken = result["token"];
          Params.refreshToken = result["refreshToken"];
        } else {
          SetSharedPref().clearData();
          Get.offAll(() => SignIn(), binding: InitialBinding());
        }
      }
    } catch (e) {
      SetSharedPref().clearData();
      Get.offAll(() => SignIn(), binding: InitialBinding());
      rethrow;
    }
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
              'reward_growth'.tr,
              style: splashText,
            ),
          ],
        ),
      ),
    );
  }
}

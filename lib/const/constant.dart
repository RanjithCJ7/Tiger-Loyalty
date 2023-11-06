import 'package:shared_preferences/shared_preferences.dart';

class Params {
  static String userToken = "null";
  static String userid = "null";
  static String refreshToken = "null";
  static String email = "null";
}

class SetSharedPref {
  setData(
      {required String token,
      required String refreshToken,
      required String email,
      required String userid}) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString("token", token);
    pref.setString("refreshToken", refreshToken);
    pref.setString("email", email);
    pref.setString("userid", userid);

    Params.userToken = token;
    Params.refreshToken = refreshToken;
    Params.email = email;
    Params.userid = userid;
  }

  getData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    Params.userToken = pref.getString("token") ?? "null";
    Params.refreshToken = pref.getString("refreshToken") ?? "null";
    Params.email = pref.getString("email") ?? "null";
    Params.userid = pref.getString("userid") ?? "null";

    print("data ==> ${pref.getString("token")}");
  }

  clearData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.clear();

    Params.userToken = "null";
    Params.refreshToken = "null";
    Params.email = "null";
    Params.userid = "null";
  }
}

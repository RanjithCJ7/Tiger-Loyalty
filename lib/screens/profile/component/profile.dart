import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:tiger_loyalty/const/Image.dart';
import 'package:tiger_loyalty/const/constant.dart';
import 'package:tiger_loyalty/initial_binding.dart';
import 'package:tiger_loyalty/screens/home/controller/home_controller.dart';
import 'package:tiger_loyalty/screens/profile/controller/profile_controller.dart';
import 'package:tiger_loyalty/screens/signin/component/signin.dart';
import 'package:tiger_loyalty/screens/manageBrand/component/edit_reward.dart';
import 'package:tiger_loyalty/screens/profile/component/choose_photo.dart';
import 'package:tiger_loyalty/src/pages/setting.dart';
import 'package:tiger_loyalty/widget/loader_widget.dart';
import 'package:tiger_loyalty/widget/select_image.dart';
import 'package:tiger_loyalty/widget/translate_language.dart';
import '../../../src/pages/styles.dart';

class SettingData {
  String text;
  String image;

  SettingData({required this.text, required this.image});
}

class Profile extends StatefulWidget {
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  ProfileController profileController = Get.put(ProfileController());

  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Obx(
          () => profileController.isLoading.value
              ? const LoaderWidget()
              : SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding:
                            const EdgeInsets.only(top: 10, left: 30, right: 30),
                        width: size.width,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Image.asset(
                              Images.profileBack,
                              height: Get.height * 0.15,
                              width: Get.width,
                              fit: BoxFit.fill,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 0),
                              child: Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: Get.width * 0.03),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    TextButton(
                                      onPressed: () {
                                        ImageUploadHelper().showCropImagePicker(
                                            context, true, (p0) {
                                          if (p0 != null) {
                                            profileController.profileImage = p0;
                                            Get.to(() => ChoosePhoto(),
                                                binding: InitialBinding());
                                          }
                                        });
                                      },
                                      child: Stack(
                                        children: [
                                          Align(
                                            child: Container(
                                              padding: const EdgeInsets.all(2),
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  border: Border.all(
                                                      color: const Color(
                                                          0xFFCFAF4E),
                                                      width: 1)),
                                              child: ValueListenableBuilder(
                                                  valueListenable:
                                                      profileController
                                                          .notifieImage,
                                                  builder:
                                                      (context, value, child) {
                                                    return profileController
                                                                .profileModel
                                                                .value
                                                                .image !=
                                                            null
                                                        ? CircleAvatar(
                                                            backgroundColor:
                                                                Colors
                                                                    .transparent,
                                                            backgroundImage: MemoryImage(
                                                                profileController
                                                                    .profileImageURL
                                                                    .bodyBytes),
                                                            radius: Get.height *
                                                                0.05,
                                                          )
                                                        : CircleAvatar(
                                                            backgroundColor:
                                                                Colors
                                                                    .transparent,
                                                            backgroundImage:
                                                                AssetImage(
                                                              Images.profile,
                                                            ),
                                                            radius: Get.height *
                                                                0.05,
                                                          );
                                                  }),
                                            ),
                                          ),
                                          Positioned(
                                            bottom: 0,
                                            right: 0,
                                            child: GestureDetector(
                                              onTap: () {
                                                ImageUploadHelper()
                                                    .showCropImagePicker(
                                                        context, true, (p0) {
                                                  if (p0 != null) {
                                                    profileController
                                                        .profileImage = p0;
                                                    Get.to(() => ChoosePhoto(),
                                                        binding:
                                                            InitialBinding());
                                                  }
                                                });
                                              },
                                              child: CircleAvatar(
                                                radius: 12,
                                                backgroundColor: Colors.white,
                                                child: Container(
                                                  padding:
                                                      const EdgeInsets.all(2),
                                                  decoration: BoxDecoration(
                                                      color: const Color(
                                                          0xFF0E2ED4),
                                                      shape: BoxShape.circle,
                                                      border: Border.all(
                                                          color: Colors.white,
                                                          width: 2)),
                                                  child: const Icon(
                                                    Icons.camera_alt,
                                                    color: Colors.white,
                                                    size: 16,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                            "${profileController.profileModel.value.firstName ?? ""} ${profileController.profileModel.value.lastName ?? ""}",
                                            style: nameLabel),
                                        const SizedBox(height: 10.0),
                                        Text(
                                            profileController.profileModel.value
                                                    .userName ??
                                                "",
                                            style: nameDesc),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: size.height * 0.01),
                      _buildSubsItem(
                          'subscription_price'.tr, 'assets/setting_1.png'),
                      const SizedBox(height: 5),
                      _buildInvoiceItem('invoice'.tr, 'assets/setting_2.png'),
                      SizedBox(height: size.height * 0.04),
                      Container(
                        width: size.width,
                        padding: const EdgeInsets.only(left: 30),
                        child: Text(
                          'settings'.tr,
                          style: settingsTitle,
                        ),
                      ),
                      const SizedBox(height: 5),
                      _buildSettingItemsList(),
                      const SizedBox(height: 10),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            const SizedBox(height: 5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'change_lang'.tr,
                                  style: smText,
                                ),
                                const SizedBox(width: 5),
                                GestureDetector(
                                  onTap: () {
                                    ChangeLanguage().changeLanguage();
                                  },
                                  child: Text(
                                    'ksw'.tr,
                                    style: boldText,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                GestureDetector(
                                  onTap: () {
                                    showModalBottomSheet(
                                      shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(15),
                                              topRight: Radius.circular(15))),
                                      context: context,
                                      builder: (BuildContext context) {
                                        return Container(
                                          margin: const EdgeInsets.only(
                                              bottom: 50.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: <Widget>[
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  TextButton(
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: Image.asset(
                                                        'assets/close.png'),
                                                  ),
                                                ],
                                              ),
                                              Container(
                                                margin:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 30),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    SizedBox(
                                                      width: Get.width * 0.5,
                                                      child: Text(
                                                        'delete_account_desc'
                                                            .tr,
                                                        style: changeLabel,
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                        height: 30.0),
                                                    SizedBox(
                                                      width: Get.width,
                                                      height: Get.height * 0.06,
                                                      child: TextButton(
                                                        onPressed: () {
                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                        style: btnGrey,
                                                        child: Text(
                                                          'no'.tr,
                                                          style: btnGreyText,
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                      ),
                                                    ),
                                                    const SizedBox(height: 5.0),
                                                    SizedBox(
                                                      width: Get.width,
                                                      height: Get.height * 0.06,
                                                      child: TextButton(
                                                        onPressed: () {
                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                        style: btnRed,
                                                        child: Text(
                                                          'yes'.tr,
                                                          style: yesText,
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  child: Text(
                                    'delete_account'.tr,
                                    style: deleteText,
                                  ),
                                ),
                                SizedBox(
                                  width: Get.width * 0.3,
                                  child: TextButton(
                                    style: btnGrey,
                                    onPressed: () {
                                      SetSharedPref().clearData();
                                      Get.offAll(() => SignIn(),
                                          binding: InitialBinding());
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 10.0),
                                            child: Text(
                                              'sign_out'.tr,
                                              style: btnGreyText,
                                            ),
                                          ),
                                          Image.asset(
                                              'assets/btn_arrow_right.png'),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  '${"about_tl".tr} V.${profileController.appVersion.value}',
                                  style: smText,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
        ),
      ),
    );
  }

  Widget _buildSettingItemsList() {
    return Obx(
      () => Column(
        children: profileController.settingData.map((data) {
          return _buildSettingItem(data.text, data.image);
        }).toList(),
      ),
    );
  }

  Widget _buildSubsItem(String title, String image) {
    return StatefulBuilder(
      builder: (context, setState) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 30.0),
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xFFF5F5F5)),
            color: const Color(0xFFD9D9D9),
            borderRadius: BorderRadius.circular(5),
          ),
          child: TextButton(
            onPressed: () {
              Get.to(() => Setting(), binding: InitialBinding());
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 10),
                    child: Image.asset(image,
                        color: const Color.fromRGBO(0, 0, 0, 0.3)),
                  ),
                  Expanded(
                    child: Text(
                      title.tr,
                      style: settingsLabel,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildInvoiceItem(String title, String image) {
    return Builder(
      builder: (BuildContext context) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 30.0),
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xFFF5F5F5)),
            color: const Color(0xFFD9D9D9),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 10),
                  child: Image.asset(image,
                      color: const Color.fromRGBO(0, 0, 0, 0.3)),
                ),
                Expanded(
                  child: Text(
                    title,
                    style: settingsLabel,
                  ),
                ),
                profileController.profileModel.value.paymentStatus == "PAID"
                    ? TextButton(
                        onPressed: () {},
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                              color: const Color(0xFF1BB46A),
                              borderRadius: BorderRadius.circular(22)),
                          child: Row(
                            children: [
                              Text(
                                "paid".tr,
                                style: const TextStyle(color: Colors.white),
                              ),
                              const SizedBox(width: 5),
                              const Icon(
                                Icons.check,
                                color: Colors.white,
                                size: 18,
                              )
                            ],
                          ),
                        ),
                      )
                    : TextButton(
                        onPressed: () {
                          paymentBottomSheet(context);
                        },
                        style: payBtn,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text(
                            'pay_now'.tr,
                            style: payBtnText,
                          ),
                        ),
                      ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildSettingItem(String title, String image) {
    return Builder(
      builder: (BuildContext context) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 30.0),
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xFFF5F5F5)),
            color: const Color(0xFFD9D9D9),
            borderRadius: BorderRadius.circular(5),
          ),
          child: TextButton(
            onPressed: () {
              _navigateToScreen(context, title);
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 10),
                    child: Image.asset(image,
                        color: const Color.fromRGBO(0, 0, 0, 0.3)),
                  ),
                  Expanded(
                    child: Text(
                      title.tr,
                      style: settingsLabel,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _navigateToScreen(BuildContext context, String title) {
    switch (title) {
      case 'change_login_details':
        changeLoginBottomSheet(context);
        break;
      case 'manage_brands':
        Get.to(() => EditReward(), binding: InitialBinding());

        break;
      case 'terms_condition':
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return Container(
              height: Get.height,
              alignment: Alignment.bottomCenter,
              child: Dialog(
                child: Stack(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(top: 30),
                      // width: Get.width * 0.9,
                      height: Get.height,
                      child: Column(
                        children: [
                          Container(
                            margin:
                                const EdgeInsets.only(top: 10.0, bottom: 20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'terms_condition'.tr,
                                  style: alertTitle,
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: SingleChildScrollView(
                              padding: const EdgeInsets.only(bottom: 30.0),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 30),
                                child: Text(
                                  'terms_condition_desc'.tr,
                                  style: dialogTextSm,
                                  textAlign: TextAlign.justify,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 40)
                        ],
                      ),
                    ),
                    Positioned(
                      top: 15,
                      right: 10,
                      child: InkWell(
                        onTap: () {
                          Get.close(1);
                        },
                        child: Container(
                          margin: const EdgeInsets.only(
                            left: 30.0,
                          ),
                          child: Image.asset('assets/close.png'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
        break;
      case 'privacy_policy':
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return Container(
              height: MediaQuery.of(context).size.height - 125.0,
              alignment: Alignment.bottomCenter,
              child: Dialog(
                child: Stack(
                  children: [
                    SizedBox(
                      width: Get.width * 0.9,
                      height: Get.height,
                      child: Column(
                        children: [
                          Container(
                            margin:
                                const EdgeInsets.only(top: 30.0, bottom: 20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'privacy_policy'.tr,
                                  style: alertTitle,
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: SingleChildScrollView(
                              padding: const EdgeInsets.only(bottom: 30.0),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 30),
                                child: Text(
                                  'privacy_policy_desc'.tr,
                                  style: dialogTextSm,
                                  textAlign: TextAlign.justify,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 10,
                      right: 0,
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Container(
                          margin: const EdgeInsets.only(
                            right: 15.0,
                          ),
                          child: Image.asset('assets/close.png'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
        break;
      case 'about_tl':
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return Container(
              height: MediaQuery.of(context).size.height - 125.0,
              alignment: Alignment.bottomCenter,
              child: Dialog(
                child: Stack(
                  children: [
                    SizedBox(
                      width: Get.width,
                      height: Get.height,
                      child: Column(
                        children: [
                          Container(
                            margin:
                                const EdgeInsets.only(top: 30.0, bottom: 20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'about_tl'.tr,
                                  style: alertTitle,
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: SingleChildScrollView(
                              padding: const EdgeInsets.only(bottom: 30.0),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 30),
                                child: Text(
                                  'about_tl_desc'.tr,
                                  style: dialogTextSm,
                                  textAlign: TextAlign.justify,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      right: 0,
                      top: 10,
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Container(
                          margin: const EdgeInsets.only(
                            right: 15.0,
                          ),
                          child: Image.asset('assets/close.png'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
        break;
      default:
        break;
    }
  }

  showAuthModelSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15))),
      builder: (BuildContext context) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Image.asset('assets/close.png'),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.lock,
                      color: Colors.black,
                      size: 55,
                      weight: 10,
                    ),
                    // Image.asset(
                    //     'assets/authentication.png'),
                    const SizedBox(height: 20),
                    Text(
                      'authentication'.tr,
                      style: changeLabel,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      '${"enter_otp_sent".tr} ${obscureEmail(profileController.emailController.text)}',
                      style: todayText,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 50.0),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.only(right: 5.0),
                            decoration: BoxDecoration(
                              border:
                                  Border.all(color: const Color(0xFFF5F5F5)),
                              color: const Color(0xFFD9D9D9),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 15),
                                  child: Image.asset('assets/pin.png'),
                                ),
                                Expanded(
                                  child: TextField(
                                    controller: profileController.otpController,
                                    keyboardType: TextInputType.number,
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.digitsOnly,
                                      LengthLimitingTextInputFormatter(6),
                                      // _tinFormatter,
                                    ],
                                    obscureText: true,
                                    decoration: InputDecoration(
                                      hintText: 'enterOTP'.tr,
                                      hintStyle: const TextStyle(
                                          color: Color(0xFF808080)),
                                      border: InputBorder.none,
                                    ),
                                    style: textFieldStyle,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            if (profileController.otpController.text.isEmpty) {
                              Fluttertoast.showToast(msg: "enter_otp".tr);
                            } else if (profileController
                                    .otpController.text.length <
                                6) {
                              Fluttertoast.showToast(msg: "otp_digit_msg".tr);
                            } else {
                              Get.close(1);
                              profileController.verifyOTP();
                            }
                          },
                          style: btnGold2,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 13, vertical: 8.0),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 10.0),
                                  child: Text(
                                    'save'.tr,
                                    style: btnGoldText,
                                  ),
                                ),
                                Image.asset('assets/btn_arrow_right.png'),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 100.0),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void changeLoginBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15))),
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.only(bottom: Get.height * 0.05),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Image.asset('assets/close.png'),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'change_login_details'.tr,
                      style: changeLabel,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 30.0),
                    SizedBox(
                      width: double.infinity,
                      height: Get.height * 0.06,
                      child: TextButton(
                        onPressed: () {
                          Get.close(1);
                          changeEmailBottomSheet(context);
                        },
                        style: btnGrey,
                        child: Text(
                          'email'.tr,
                          style: btnGreyText,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    // SizedBox(
                    //   width: double.infinity,
                    //   height: Get.height * 0.06,
                    //   child: TextButton(
                    //     onPressed: () {
                    //       Get.close(1);
                    //       changePINBottomSheet(context);
                    //     },
                    //     style: btnGrey,
                    //     child: Text(
                    //       'PIN',
                    //       style: btnGreyText,
                    //       textAlign: TextAlign.center,
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  changePINBottomSheet(BuildContext context) {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15), topRight: Radius.circular(15))),
        builder: (BuildContext context) {
          return Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Container(
              margin: const EdgeInsets.only(bottom: 20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          Get.close(1);
                        },
                        child: Image.asset('assets/close.png'),
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset('assets/pin_setup.png'),
                        const SizedBox(height: 10),
                        Text(
                          'change_pin'.tr,
                          style: changeLabel,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'change_login_pin'.tr,
                          style: todayText,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: Get.height * 0.05),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: const Color(0xFFF5F5F5)),
                            color: const Color(0xFFD9D9D9),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: TextField(
                            controller: profileController.oldPINController,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly,
                              LengthLimitingTextInputFormatter(4),
                            ],
                            decoration: InputDecoration(
                              hintText: 'old_pin'.tr,
                              hintStyle:
                                  const TextStyle(color: Color(0xFF808080)),
                              border: InputBorder.none,
                              contentPadding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                            ),
                            style: textFieldStyle,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: const Color(0xFFF5F5F5)),
                            color: const Color(0xFFD9D9D9),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: TextField(
                            controller: profileController.newPINController,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly,
                              LengthLimitingTextInputFormatter(4),
                            ],
                            decoration: InputDecoration(
                              hintText: 'new_pin'.tr,
                              hintStyle:
                                  const TextStyle(color: Color(0xFF808080)),
                              border: InputBorder.none,
                              contentPadding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                            ),
                            style: textFieldStyle,
                          ),
                        ),
                        const SizedBox(height: 10),
                        TextButton(
                          onPressed: () {
                            if (profileController
                                    .oldPINController.text.isEmpty ||
                                profileController
                                    .newPINController.text.isEmpty) {
                              Fluttertoast.showToast(msg: "enter_pin_msg".tr);
                            } else if (profileController
                                        .oldPINController.text.length <
                                    4 ||
                                profileController.newPINController.text.length <
                                    4) {
                              Fluttertoast.showToast(msg: "enter_pin_msg1".tr);
                            } else {
                              Get.close(1);
                              showAuthModelSheet(context);
                            }
                          },
                          style: btnGold2,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: SizedBox(
                              width: double.infinity,
                              child: Text(
                                'change'.tr,
                                style: btnGoldText2,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 50.0),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  String obscureEmail(String email) {
    List<String> parts = email.split('@');
    String username = parts[0];
    String domain = parts[1];
    List<String> domain2 = domain.split('.');

    String obscuredUsername = '*' * (username.length - 2) +
        (username.length >= 2 ? username.substring(username.length - 2) : '');

    String obscuredDomain = '*' * domain2[0].length;

    return '$obscuredUsername@$obscuredDomain.${domain2.last}';
  }

  void changeEmailBottomSheet(BuildContext context) {
    profileController.emailController.clear();
    showModalBottomSheet(
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15))),
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Container(
            margin: const EdgeInsets.only(bottom: 50.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        Get.close(1);
                      },
                      child: Image.asset('assets/close.png'),
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.call,
                        color: Colors.black,
                        size: 55,
                        weight: 10,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'change_email'.tr,
                        style: changeLabel,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20),
                      Text(
                        ' ${obscureEmail(profileController.profileModel.value.userName!)} as your number',
                        style: todayText,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 50.0),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: const Color(0xFFF5F5F5)),
                          color: const Color(0xFFD9D9D9),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: TextField(
                          controller: profileController.emailController,
                          decoration: InputDecoration(
                            hintText: 'new_email'.tr,
                            hintStyle:
                                const TextStyle(color: Color(0xFF808080)),
                            border: InputBorder.none,
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 20),
                          ),
                          style: textFieldStyle,
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextButton(
                        onPressed: () {
                          if (profileController.emailController.text.isEmpty) {
                            Fluttertoast.showToast(msg: "enter_email_msg".tr);
                          } else if (!profileController
                              .emailController.text.isEmail) {
                            Fluttertoast.showToast(
                                msg: "enter_valid_email_msg".tr);
                          } else {
                            Get.close(1);
                            profileController.sendOTP();
                            showAuthModelSheet(context);
                          }
                        },
                        style: btnGold2,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: SizedBox(
                            width: double.infinity,
                            child: Text(
                              'change'.tr,
                              style: btnGoldText2,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 50.0),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  String formatDate(DateTime date) {
    return "${date.day}";
  }

  void paymentBottomSheet(BuildContext context) {
    DateTime now = DateTime.now();
    String currentMonth = DateFormat.MMMM().format(now);
    DateTime firstDayOfMonth = DateTime.utc(now.year, now.month, 1);
    DateTime lastDayOfMonth = DateTime.utc(now.year, now.month + 1, 0);
    String formattedFirstDay = formatDate(firstDayOfMonth);
    String formattedLastDay = formatDate(lastDayOfMonth);

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15))),
      builder: (BuildContext context) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Container(
            height: Get.height * 0.6,
            alignment: Alignment.bottomCenter,
            child: Stack(
              children: [
                Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 30.0, bottom: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'invoice'.tr,
                            style: alertTitle,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        Text(
                            '${"total_bill".tr} ($currentMonth $formattedFirstDay - $formattedLastDay)',
                            style: desc2),
                        SizedBox(height: Get.height * 0.02),
                        Text(
                            'Tsh. ${profileController.profileModel.value.subscriptionPlan == "FREE" ? "0" : profileController.profileModel.value.subscriptionPlan == "PLAN_2" ? "25,000" : profileController.profileModel.value.subscriptionPlan == "PLAN_3" ? "50,000" : "75,000"}',
                            style: filterText),
                        const SizedBox(height: 5),
                        Text('total_invoice'.tr, style: desc2),
                      ],
                    ),
                    SizedBox(height: Get.height * 0.015),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 15),
                      child: IntrinsicHeight(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    profileController
                                        .pointsSummary.value.issuedRewardPoints
                                        .toString(),
                                    style: invoiceLabel),
                                const SizedBox(height: 5),
                                Text('total_points_issued'.tr,
                                    style: dialogTextSm),
                              ],
                            ),
                            const VerticalDivider(
                              color: Colors.black,
                              thickness: 1,
                              width: 30,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    profileController
                                        .pointsSummary.value.issuedCustomers
                                        .toString(),
                                    style: invoiceLabel),
                                const SizedBox(height: 5),
                                Text('total_customers'.tr, style: dialogTextSm),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: Get.height * 0.015),
                    Text('enter_number_to_pay'.tr, style: textFieldStyle),
                    SizedBox(height: Get.height * 0.01),
                    Container(
                      margin: const EdgeInsets.only(
                          bottom: 10.0, left: 30, right: 30),
                      decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xFFF5F5F5)),
                        color: const Color(0xFFD9D9D9),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Row(
                        children: [
                          Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Image.asset('assets/ion_keypad.png')),
                          Expanded(
                            child: TextField(
                              controller:
                                  profileController.payPhoneNumberController,
                              keyboardType: TextInputType.number,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.digitsOnly,
                                LengthLimitingTextInputFormatter(9)
                              ],
                              decoration: InputDecoration(
                                hintText: 'phone_number'.tr,
                                hintStyle:
                                    const TextStyle(color: Color(0xFF808080)),
                                border: InputBorder.none,
                              ),
                              style: textFieldStyle,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 5),
                    Container(
                      margin: const EdgeInsets.only(
                          bottom: 10.0, left: 30, right: 30),
                      child: TextButton(
                        onPressed: () {
                          if (profileController
                              .payPhoneNumberController.text.isEmail) {
                            Fluttertoast.showToast(msg: "enter_number_msg".tr);
                          } else if (profileController
                                  .payPhoneNumberController.text.length <
                              9) {
                            Fluttertoast.showToast(
                                msg: "enter_valid_number_msg".tr);
                          } else {
                            Get.close(1);
                            profileController.invoicePayment();
                          }
                        },
                        style: btnGold2,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: SizedBox(
                            width: double.infinity,
                            child: Text(
                              'pay'.tr,
                              style: btnGoldText2,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Positioned(
                  top: 10,
                  right: 0,
                  child: InkWell(
                    onTap: () {
                      Get.close(1);
                    },
                    child: Container(
                      margin: const EdgeInsets.only(
                        right: 15.0,
                      ),
                      child: Image.asset('assets/close.png'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

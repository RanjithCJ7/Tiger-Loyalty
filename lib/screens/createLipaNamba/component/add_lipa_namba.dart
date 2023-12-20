import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:tiger_loyalty/initial_binding.dart';
import 'package:tiger_loyalty/screens/createLipaNamba/controller/lipna_namba_controller.dart';
import 'package:tiger_loyalty/screens/profile/model/profile_model.dart';
import 'package:tiger_loyalty/screens/bottomTab/component/bottom_tab.dart';

import 'package:tiger_loyalty/screens/createLipaNamba/component/download_code.dart';

import 'package:dotted_border/dotted_border.dart';
import '../../../src/pages/styles.dart';

// ignore: must_be_immutable
class AddLipaNamba extends StatefulWidget {
  ProfileModel profileModel;
  AddLipaNamba({required this.profileModel});

  @override
  _AddLipaNambaState createState() => _AddLipaNambaState();
}

class _AddLipaNambaState extends State<AddLipaNamba> {
  LipaNambaController lipaNambaController = Get.find<LipaNambaController>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(40.0),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.symmetric(vertical: 15.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'lipa_tiger'.tr,
                            style: label,
                          ),
                          SizedBox(height: size.height * 0.05),
                          Text(
                            widget.profileModel.businessName ?? "",
                            style: labelSm,
                          ),
                          SizedBox(height: size.height * 0.02),
                          Text(
                            'lipa_tiger_desc'.tr,
                            style: desc,
                          ),
                          SizedBox(height: size.height * 0.025),
                          DottedBorder(
                            borderType: BorderType.RRect,
                            radius: const Radius.circular(5),
                            dashPattern: const [6, 7],
                            color: Colors.black,
                            strokeWidth: 1.5,
                            child: Container(
                              width: 263,
                              decoration: BoxDecoration(
                                color: const Color(0xFFCFAF4E),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Center(
                                child: Text(
                                  widget.profileModel.rewardNumber!,
                                  style: numBig.copyWith(
                                    letterSpacing: 15,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: size.width * 0.5,
                            child: TextButton(
                              onPressed: () {
                                Get.to(
                                    () => DownloadCode(
                                        profileModel: widget.profileModel),
                                    binding: InitialBinding());
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        right: 10.0, bottom: 5.0),
                                    child: Image.asset('assets/download.png'),
                                  ),
                                  Text(
                                    'download_code'.tr,
                                    style: resetBtnText,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 35.0),
                      child: Text(
                        'download_code_desc'.tr,
                        style: textDark,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xFFF5F5F5)),
                        color: const Color(0xFFD9D9D9),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: TextField(
                        controller: lipaNambaController.lipaNambaTextController,
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(6),
                        ],
                        decoration: InputDecoration(
                          hintText: 'enter_lipa_namba'.tr,
                          hintStyle: const TextStyle(
                            color: Color(0xFF808080),
                            letterSpacing: 1.0,
                            fontFamily: "Inter",
                            fontWeight: FontWeight.w500,
                          ),
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.all(20),
                        ),
                        style: const TextStyle(
                            color: Colors.black,
                            fontFamily: "Inter",
                            fontWeight: FontWeight.w800,
                            letterSpacing: 4.0,
                            fontSize: 16),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.07,
                    ),
                    SizedBox(
                      width: size.width,
                      child: TextButton(
                        onPressed: () {
                          lipaNambaController
                              .createLipaNamba(widget.profileModel);
                        },
                        style: btnGold2,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Text(
                            'save'.tr,
                            style: btnGoldText2,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: size.height * 0.04),
                    Row(
                      children: [
                        const Expanded(
                          child: Divider(
                            color: Color(0xFF808080),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Text("do_it_later".tr, style: orText),
                        ),
                        const Expanded(
                          child: Divider(
                            color: Color(0xFF808080),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    SizedBox(
                      width: size.width * 0.35,
                      child: TextButton(
                        style: btnGrey,
                        onPressed: () {
                          Get.offAll(() => const BottomTab(),
                              binding: InitialBinding());
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 10.0),
                                child: Text(
                                  'proceed'.tr,
                                  style: btnGreyText,
                                ),
                              ),
                              const Icon(
                                Icons.arrow_forward,
                                color: Colors.black,
                                size: 20,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

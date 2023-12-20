import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiger_loyalty/const/Image.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tiger_loyalty/screens/notification/component/notification.dart';
import 'package:tiger_loyalty/screens/notification/controller/notification_controller.dart';

PreferredSizeWidget My_AppBar(context,
    {List<Widget>? actions,
    Widget? title,
    Widget? leading,
    centerTitle = true,
    Color? backcolor,
    bool? isNavigate}) {
  return AppBar(
    elevation: 0,
    backgroundColor: Colors.white,
    leading: leading,
    iconTheme: Theme.of(context).iconTheme,
    actions: [
      GestureDetector(
        onTap: () {
          if (isNavigate == true) {
          } else {
            Get.to(() => const NotificationScreen());
          }
        },
        child: Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Stack(
            children: [
              Padding(
                  padding: const EdgeInsets.only(right: 5),
                  child:
                      Align(child: SvgPicture.asset(Images.notificationSVG))),
              ValueListenableBuilder(
                  valueListenable: notificationCount,
                  builder: (context, value, child) {
                    return Positioned(
                      right: 0,
                      top: 5,
                      child: Container(
                        padding: const EdgeInsets.all(3.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 1),
                          color: const Color(0xFF0E2ED4),
                        ),
                        child: Text(
                          notificationCount.value.toString(),
                          style: const TextStyle(
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                              fontSize: 10),
                        ),
                      ),
                    );
                  })
            ],
          ),
        ),
      ),
      const SizedBox(width: 10),
    ],
    titleSpacing: 0.0,
    title: title,
  );
}

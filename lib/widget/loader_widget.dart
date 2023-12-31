import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiger_loyalty/const/Image.dart';

class LoaderWidget extends StatelessWidget {
  const LoaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.black, width: 2)),
              child: Image.asset(
                Images.loadingGIF,
                height: Get.width * 0.15,
              ),
            ),
            const Text(
              "Please wait...",
              style: TextStyle(
                  fontFamily: "Inter",
                  fontWeight: FontWeight.w700,
                  fontSize: 20),
            )
          ],
        ),
      ),
    );
  }
}

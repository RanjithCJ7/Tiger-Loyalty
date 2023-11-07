import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:tiger_loyalty/src/pages/charity_screen.dart';

import 'styles.dart';

final _discountFormatter = CustomTextInputFormatter();

class PromoScreen extends StatefulWidget {
  @override
  _PromoState createState() => _PromoState();
}

class _PromoState extends State<PromoScreen> {
  DateTime fromDate = DateTime.now();
  DateTime toDate = DateTime.now();
  bool isFromSelected = false;
  bool isToSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Color(0xFF0E2ED4),
          ),
        ),
        title:
            Text('New Promotion', style: label.copyWith(color: Colors.black)),
      ),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: Get.height * 0.02, horizontal: Get.height * 0.03),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Details',
              style: settingsTitle,
            ),
            SizedBox(height: Get.height * 0.02),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xFFF5F5F5)),
                color: const Color(0xFFD9D9D9),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  decoration: const InputDecoration(
                    hintText: 'Promo name',
                    hintStyle: TextStyle(color: Color(0xFF808080)),
                    border: InputBorder.none,
                  ),
                  style: textFieldStyle,
                ),
              ),
            ),
            SizedBox(height: Get.height * 0.01),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xFFF5F5F5)),
                color: const Color(0xFFD9D9D9),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  decoration: const InputDecoration(
                    hintText: 'Description',
                    hintStyle: TextStyle(color: Color(0xFF808080)),
                    border: InputBorder.none,
                  ),
                  maxLines: 4,
                  style: textFieldStyle,
                ),
              ),
            ),
            SizedBox(height: Get.height * 0.02),
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xFFF5F5F5)),
                color: const Color(0xFFD9D9D9),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 5),
                child: TextField(
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.only(top: 13),
                    hintText: 'Discount',
                    hintStyle: TextStyle(color: Color(0xFF808080)),
                    border: InputBorder.none,
                    suffixIcon: Icon(
                      Icons.percent,
                      color: Colors.black,
                    ),
                  ),
                  maxLines: 1,
                  style: textFieldStyle,
                ),
              ),
            ),
            SizedBox(height: Get.height * 0.04),
            Text(
              'Date',
              style: settingsTitle,
            ),
            SizedBox(height: Get.height * 0.02),
            GestureDetector(
              onTap: () async {
                DateTime? picked = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2101),
                );
                if (picked != null) {
                  setState(() {
                    fromDate = picked;
                    isFromSelected = true;
                  });
                }
              },
              child: Container(
                height: Get.height * 0.06,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xFFF5F5F5)),
                  color: const Color(0xFFD9D9D9),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Row(
                  children: [
                    SizedBox(width: Get.width * 0.04),
                    const Icon(
                      Icons.calendar_month,
                      color: Colors.black,
                    ),
                    SizedBox(width: Get.width * 0.04),
                    Text(
                      isFromSelected == true
                          ? DateFormat("MM/dd/yyy").format(fromDate)
                          : "From",
                      style: textFieldStyle.copyWith(
                          color: const Color(0xFF808080)),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: Get.height * 0.01),
            GestureDetector(
              onTap: () async {
                DateTime? picked = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2101),
                );
                if (picked != null) {
                  setState(() {
                    toDate = picked;
                    isToSelected = true;
                  });
                }
              },
              child: Container(
                height: Get.height * 0.06,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xFFF5F5F5)),
                  color: const Color(0xFFD9D9D9),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Row(
                  children: [
                    SizedBox(width: Get.width * 0.04),
                    const Icon(
                      Icons.calendar_month,
                      color: Colors.black,
                    ),
                    SizedBox(width: Get.width * 0.04),
                    Text(
                      isToSelected == true
                          ? DateFormat("MM/dd/yyy").format(toDate)
                          : "To",
                      style: textFieldStyle.copyWith(
                          color: const Color(0xFF808080)),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: Get.height * 0.04),
            TextButton(
              onPressed: () {
                Get.to(() => Charity());
              },
              style: btnGold2,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: SizedBox(
                  width: Get.width,
                  child: Text(
                    'Publish',
                    style: btnGoldText2,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}

class CustomTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text.isEmpty) {
      return newValue;
    }
    String text = newValue.text.replaceAll(RegExp(r'\D'), '');

    int discountValue = int.tryParse(text) ?? 0;
    discountValue = discountValue.clamp(1, 100);

    String formattedText = '$discountValue%';

    return TextEditingValue(
      text: formattedText,
      selection: TextSelection.collapsed(offset: formattedText.length),
    );
  }
}

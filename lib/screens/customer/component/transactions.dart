import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:tiger_loyalty/const/my_appbar.dart';
import 'package:tiger_loyalty/screens/customer/controller/customer_controller.dart';
import 'package:tiger_loyalty/screens/customer/model/transaction_model.dart';
import 'package:tiger_loyalty/widget/loader_widget.dart';

import '../../../src/pages/styles.dart';

class PointsData {
  String date;
  String amount;
  String points;

  PointsData({required this.date, required this.amount, required this.points});
}

// ignore: must_be_immutable
class Transactions extends StatefulWidget {
  String image, name, id;

  Transactions({required this.image, required this.name, required this.id});

  @override
  _TransactionsState createState() => _TransactionsState();
}

class _TransactionsState extends State<Transactions> {
  List<PointsData> pointsData = [
    PointsData(date: '23/09/2023', amount: '1,300,000', points: '4000'),
    PointsData(date: '20/09/2023', amount: '2,300,000', points: '4000'),
    PointsData(date: '15/09/2023', amount: '700,000', points: '4000'),
    PointsData(date: '12/08/2023', amount: '2,130,000', points: '4000'),
    PointsData(date: '08/08/2023', amount: '700,000', points: '4000'),
  ];
  CustomerController customerController = Get.find<CustomerController>();
  RxBool isLoading = false.obs;

  @override
  void initState() {
    super.initState();
    isLoading(true);
    customerController
        .fetchTransaction(widget.id)
        .then((value) => isLoading(false));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: My_AppBar(
        context,
        title: Obx(
          () => isLoading.value
              ? const SizedBox()
              : Row(
                  children: [
                    Image.asset(
                      widget.image,
                      height: Get.height * 0.05,
                    ),
                    const SizedBox(width: 5),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.name,
                          style: label.copyWith(color: Colors.black),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          'transactions'.tr,
                          style: desc,
                        ),
                      ],
                    )
                  ],
                ),
        ),
      ),
      body: Obx(
        () => isLoading.value
            ? const LoaderWidget()
            : Column(
                children: <Widget>[
                  ListView.separated(
                    padding: const EdgeInsets.only(top: 10),
                    shrinkWrap: true,
                    itemCount: customerController.transactionList.length,
                    separatorBuilder: (context, index) => const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Divider(color: Color(0XFFD9D9D9), thickness: 1),
                    ),
                    itemBuilder: (context, index) {
                      TransactionModel data =
                          customerController.transactionList[index];
                      return Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 30,
                        ),
                        height: MediaQuery.of(context).size.height * 0.055,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  DateFormat('dd/MM/yyyy')
                                      .format(DateTime.parse(data.createdDt!))
                                      .toString(),
                                  style: const TextStyle(
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16),
                                ),
                                Text(
                                  "${"amount_paid".tr} ${data.points}",
                                  style: const TextStyle(
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12,
                                      color: Color(0XFF808080)),
                                )
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  data.points.toString(),
                                  style: const TextStyle(
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16),
                                ),
                                Text(
                                  "points".tr,
                                  style: const TextStyle(
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12,
                                      color: Color(0XFF808080)),
                                )
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
      ),
    );
  }
}

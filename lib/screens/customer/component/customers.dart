import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import 'package:tiger_loyalty/const/Image.dart';
import 'package:tiger_loyalty/const/my_appbar.dart';
import 'package:tiger_loyalty/initial_binding.dart';
import 'package:tiger_loyalty/screens/customer/controller/customer_controller.dart';
import 'package:tiger_loyalty/screens/customer/model/customer_issuedpoints_model.dart';
import 'package:tiger_loyalty/screens/customer/component/transactions.dart';
import 'package:tiger_loyalty/widget/loader_widget.dart';
import '../../../src/pages/styles.dart';

class PointsData {
  String points;
  String name;
  String image, date;

  PointsData(
      {required this.points,
      required this.name,
      required this.image,
      required this.date});
}

class Customers extends StatefulWidget {
  @override
  _CustomersState createState() => _CustomersState();
}

class _CustomersState extends State<Customers> {
  CustomerController customerController = Get.put(CustomerController());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: My_AppBar(context,
          title: Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text('customers'.tr,
                style: label.copyWith(color: Colors.black)),
          )),
      body: SafeArea(
        child: Obx(
          () => customerController.isLoading.value
              ? const LoaderWidget()
              : Column(
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: GestureDetector(
                              onPanUpdate: (details) {
                                if (details.delta.dx > 0) {
                                  setState(() {
                                    customerController.points.value = true;
                                  });
                                }
                                if (details.delta.dx < 0) {
                                  setState(() {
                                    customerController.points.value = false;
                                  });
                                }
                              },
                              child: customerController.points.value
                                  ? Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        Image.asset(Images.homeBackImg3),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10.0),
                                          child: Column(
                                            children: [
                                              Container(
                                                padding:
                                                    const EdgeInsets.all(10.0),
                                                child: Column(
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Text('summary'.tr,
                                                            style: imgLabel),
                                                        const Spacer(),
                                                        GestureDetector(
                                                          onTap: () {
                                                            showDatePickerDialog();
                                                          },
                                                          child: Container(
                                                            padding:
                                                                const EdgeInsets
                                                                    .symmetric(
                                                                    horizontal:
                                                                        5),
                                                            decoration:
                                                                BoxDecoration(
                                                              border:
                                                                  Border.all(
                                                                color: Colors
                                                                    .white,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          25.0),
                                                            ),
                                                            height: 20,
                                                            child: Row(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Text(
                                                                  customerController
                                                                          .isFilterApplied
                                                                          .value
                                                                      ? customerController
                                                                          .appliedFilter
                                                                          .value
                                                                          .tr
                                                                      : "today"
                                                                          .tr,
                                                                  style: todayText
                                                                      .copyWith(
                                                                          color:
                                                                              Colors.white),
                                                                ),
                                                                const Icon(
                                                                  Icons
                                                                      .arrow_drop_down_outlined,
                                                                  color: Colors
                                                                      .white,
                                                                  size: 18,
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    const SizedBox(
                                                        height: 15.0),
                                                    Row(
                                                      children: [
                                                        Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                                customerController
                                                                    .customerSummary
                                                                    .value
                                                                    .issuedCustomers
                                                                    .toString(),
                                                                style: imgNum),
                                                            const SizedBox(
                                                                height: 5.0),
                                                            Text('customers'.tr,
                                                                style: imgDesc)
                                                          ],
                                                        ),
                                                        const Spacer(),
                                                        Image.asset(
                                                            'assets/line.png'),
                                                        const Spacer(),
                                                        Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .end,
                                                          children: [
                                                            Text(
                                                                customerController
                                                                    .customerSummary
                                                                    .value
                                                                    .issuedRewardPoints
                                                                    .toString(),
                                                                textAlign:
                                                                    TextAlign
                                                                        .right,
                                                                style: imgNum),
                                                            const SizedBox(
                                                                height: 5.0),
                                                            Text(
                                                                'total_issued_points'
                                                                    .tr,
                                                                style:
                                                                    imgDescDark)
                                                          ],
                                                        )
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    )
                                  : Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        Image.asset(Images.homeBackImg2),
                                        Container(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10.0),
                                            child: Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    Text('summary'.tr,
                                                        style: imgLabel),
                                                    const Spacer(),
                                                    GestureDetector(
                                                      onTap: () {
                                                        showDatePickerDialog();
                                                      },
                                                      child: Container(
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                                horizontal: 5),
                                                        decoration:
                                                            BoxDecoration(
                                                          border: Border.all(
                                                            color: Colors.white,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      25.0),
                                                        ),
                                                        height: 20,
                                                        child: Row(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Text(
                                                              customerController
                                                                      .isFilterApplied
                                                                      .value
                                                                  ? customerController
                                                                      .appliedFilter
                                                                      .value
                                                                      .tr
                                                                  : "today".tr,
                                                              style: todayText
                                                                  .copyWith(
                                                                      color: Colors
                                                                          .white),
                                                            ),
                                                            const Icon(
                                                              Icons
                                                                  .arrow_drop_down_outlined,
                                                              color:
                                                                  Colors.white,
                                                              size: 18,
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(height: 15.0),
                                                Row(
                                                  children: [
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                            customerController
                                                                .customerSummary
                                                                .value
                                                                .redeemedCustomers
                                                                .toString(),
                                                            style: imgNum),
                                                        const SizedBox(
                                                            height: 5.0),
                                                        Text('customers'.tr,
                                                            style: imgDesc)
                                                      ],
                                                    ),
                                                    const Spacer(),
                                                    Image.asset(
                                                        'assets/line.png'),
                                                    const Spacer(),
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .end,
                                                      children: [
                                                        Text(
                                                            customerController
                                                                .customerSummary
                                                                .value
                                                                .redeemedRewardPoints
                                                                .toString(),
                                                            textAlign:
                                                                TextAlign.right,
                                                            style: imgNum),
                                                        const SizedBox(
                                                            height: 5.0),
                                                        Text(
                                                            'total_redeemed_points'
                                                                .tr,
                                                            style: redeemText)
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                            ),
                          ),
                          const SizedBox(height: 10.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: indicators(
                                2,
                                customerController.points.value == true
                                    ? 0
                                    : 1),
                          ),
                          const SizedBox(height: 15.0),
                          Container(
                            margin:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: const Color(0xFFD9D9D9),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                children: [
                                  Image.asset('assets/search.png'),
                                  const SizedBox(width: 10),
                                  SizedBox(
                                    width: size.width * 0.75,
                                    height: 24,
                                    child: TextField(
                                      controller:
                                          customerController.searchController,
                                      onChanged: (value) {
                                        customerController.searchData();
                                        setState(() {});
                                      },
                                      decoration: InputDecoration(
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                vertical: 11),
                                        hintText: 'search_customer'.tr,
                                        border: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                      ),
                                      style: dialogTextSm,
                                    ),
                                  )
                                  // Padding(
                                  //   padding: EdgeInsets.only(right: 5, bottom: 5.0),
                                  //   child: Image.asset('assets/search.png'),
                                  // ),
                                  // Container(
                                  //   width: 95,
                                  //   height: 24,
                                  //   decoration: BoxDecoration(
                                  //     color: Color(0xFFD9D9D9),
                                  //   ),
                                  //   child: TextField(
                                  //     decoration: InputDecoration(
                                  //       hintText: 'Search customer',
                                  //       border: InputBorder.none,
                                  //     ),
                                  //     style: dialogTextSm,
                                  //   ),
                                  // ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: ListView.separated(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 5),
                              physics: const BouncingScrollPhysics(),
                              separatorBuilder: (context, index) =>
                                  const Divider(
                                      color: Color(0XFFD9D9D9), thickness: 1),
                              itemCount: customerController
                                  .customerIssuedPoints.length,
                              itemBuilder: (context, index) {
                                CustomerIssuePointsModel data =
                                    customerController
                                        .customerIssuedPoints[index];
                                return GestureDetector(
                                  onTap: () => showTransaction(data),
                                  child: Container(
                                    color: Colors.transparent,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5),
                                    height: MediaQuery.of(context).size.height *
                                        0.055,
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                            width: size.width * 0.10,
                                            child: Image.asset(Images.profile)),
                                        SizedBox(
                                          width: size.width * 0.5,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(data.fullName ?? "",
                                                  style: custName),
                                              const SizedBox(height: 5),
                                              Text(
                                                  '${"points".tr}: ${data.totalPoints}',
                                                  style: desc2),
                                            ],
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: 36,
                                              height: 36,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(18),
                                                color: const Color(0xFFD9D9D9),
                                              ),
                                              margin: const EdgeInsets.only(
                                                  right: 15),
                                              child: Center(
                                                child: Image.asset(
                                                    'assets/whatsapp.png'),
                                              ),
                                            ),
                                            Container(
                                              width: 36,
                                              height: 36,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(18),
                                                color: const Color(0xFFD9D9D9),
                                              ),
                                              child: Center(
                                                child: Image.asset(
                                                    'assets/call.png'),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
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

  showDatePickerDialog() {
    customerController.selectedFilterDay.value =
        customerController.appliedFilter.value;

    customerController.focusedDay = DateTime.now();
    if (customerController.selectedFilterDay.value == "today") {
      setState(() {
        customerController.rangeMode = DateRangePickerSelectionMode.single;
      });
    }
    if (customerController.selectedFilterDay.value == "week") {
      setState(() {
        customerController.rangeMode = DateRangePickerSelectionMode.range;
      });
    }

    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(15.0),
        ),
      ),
      builder: (BuildContext context) {
        return StatefulBuilder(builder: (context, setState) {
          return Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.75,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('filter'.tr, style: filterText),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Wrap(
                        children: customerController.filterDays
                            .map((e) => Padding(
                                  padding: const EdgeInsets.all(1.0),
                                  child: InkWell(
                                    onTap: () async {
                                      setState(() {
                                        customerController
                                            .selectedFilterDay.value = e;
                                        print(
                                            "date ==> ${customerController.selectedFilterDay.value}");

                                        customerController.rangeStart = null;
                                        customerController.rangeEnd = null;
                                        customerController.focusedDay =
                                            DateTime.now();

                                        if (e == "today") {
                                          setState(() {
                                            customerController.rangeMode =
                                                DateRangePickerSelectionMode
                                                    .single;
                                          });
                                        }
                                        if (e == "week") {
                                          setState(() {
                                            customerController.rangeMode =
                                                DateRangePickerSelectionMode
                                                    .range;
                                          });
                                        }
                                      });
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 10),
                                      margin: const EdgeInsets.only(left: 3),
                                      decoration: BoxDecoration(
                                          color: e ==
                                                  customerController
                                                      .selectedFilterDay.value
                                              ? const Color(0xFFF5F5F5)
                                              : Colors.white,
                                          border: Border.all(
                                              color: e ==
                                                      customerController
                                                          .selectedFilterDay
                                                          .value
                                                  ? const Color(0xFFF5F5F5)
                                                  : Colors.black,
                                              width: 2),
                                          borderRadius:
                                              BorderRadius.circular(22.0)),
                                      child: Text(
                                        e.tr,
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ),
                                ))
                            .toList(),
                      ),
                      SizedBox(height: Get.height * 0.03),
                      Center(
                        child: Text('select_date'.tr, style: selectDateText),
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      customerController.selectedFilterDay.value == "month"
                          ? Expanded(
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'from'.tr,
                                            style: label,
                                          ),
                                          Container(
                                            margin:
                                                const EdgeInsets.only(top: 10),
                                            padding: const EdgeInsets.only(
                                                right: 10),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                color: Colors.grey.shade400),
                                            child: Row(
                                              children: [
                                                Column(
                                                  children: [
                                                    IconButton(
                                                      onPressed: () {
                                                        setState(() {
                                                          if (customerController
                                                                  .monthIndex ==
                                                              11) {
                                                            customerController
                                                                .monthIndex = 0;
                                                          } else {
                                                            customerController
                                                                    .monthIndex =
                                                                customerController
                                                                        .monthIndex +
                                                                    1;
                                                          }
                                                        });
                                                      },
                                                      icon: const Icon(
                                                        Icons
                                                            .keyboard_arrow_up_rounded,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                    IconButton(
                                                      onPressed: () {
                                                        setState(() {
                                                          if (customerController
                                                                  .monthIndex ==
                                                              0) {
                                                            customerController
                                                                .monthIndex = 11;
                                                          } else {
                                                            customerController
                                                                    .monthIndex =
                                                                customerController
                                                                        .monthIndex -
                                                                    1;
                                                          }
                                                        });
                                                      },
                                                      icon: const Icon(
                                                        Icons
                                                            .keyboard_arrow_down_rounded,
                                                        color: Colors.black,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                Text(
                                                  customerController
                                                      .monthList[
                                                          customerController
                                                              .monthIndex]
                                                      .month
                                                      .tr,
                                                  style: const TextStyle(
                                                      fontSize: 22,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Colors.black),
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(width: Get.width * 0.02),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'to'.tr,
                                            style: label,
                                          ),
                                          Container(
                                            margin:
                                                const EdgeInsets.only(top: 10),
                                            padding: const EdgeInsets.only(
                                                right: 10),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                color: Colors.grey.shade400),
                                            child: Row(
                                              children: [
                                                Column(
                                                  children: [
                                                    IconButton(
                                                      onPressed: () {
                                                        setState(() {
                                                          if (customerController
                                                                  .monthIndex2 ==
                                                              11) {
                                                            customerController
                                                                .monthIndex2 = 0;
                                                          } else {
                                                            customerController
                                                                    .monthIndex2 =
                                                                customerController
                                                                        .monthIndex2 +
                                                                    1;
                                                          }
                                                        });
                                                      },
                                                      icon: const Icon(
                                                        Icons
                                                            .keyboard_arrow_up_rounded,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                    IconButton(
                                                      onPressed: () {
                                                        setState(() {
                                                          if (customerController
                                                                  .monthIndex2 ==
                                                              0) {
                                                            customerController
                                                                .monthIndex2 = 11;
                                                          } else {
                                                            customerController
                                                                    .monthIndex2 =
                                                                customerController
                                                                        .monthIndex2 -
                                                                    1;
                                                          }
                                                        });
                                                      },
                                                      icon: const Icon(
                                                        Icons
                                                            .keyboard_arrow_down_rounded,
                                                        color: Colors.black,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                Text(
                                                  customerController
                                                      .monthList[
                                                          customerController
                                                              .monthIndex2]
                                                      .month
                                                      .tr,
                                                  style: const TextStyle(
                                                      fontSize: 22,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Colors.black),
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  if (customerController.monthIndex >=
                                      customerController.monthIndex2) ...[
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "select_valid_month".tr,
                                        style:
                                            const TextStyle(color: Colors.red),
                                      ),
                                    )
                                  ]
                                ],
                              ),
                            )
                          : customerController.selectedFilterDay.value == "year"
                              ? Expanded(
                                  child: GridView.builder(
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 3,
                                            childAspectRatio: 3,
                                            mainAxisSpacing: 5,
                                            crossAxisSpacing: 10),
                                    physics: const BouncingScrollPhysics(),
                                    itemCount:
                                        customerController.yearList.length,
                                    itemBuilder: (context, index) {
                                      return GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            customerController
                                                    .selectedyear.value =
                                                customerController
                                                    .yearList[index];
                                          });
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              border: Border.all(
                                                  width: 2,
                                                  color: customerController
                                                              .selectedyear
                                                              .value ==
                                                          customerController
                                                              .yearList[index]
                                                      ? Colors.black
                                                      : Colors.white),
                                              borderRadius:
                                                  BorderRadius.circular(50)),
                                          child: Center(
                                            child: Text(
                                              customerController
                                                  .yearList[index],
                                              style: const TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                )
                              : Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(12),
                                    boxShadow: const [
                                      BoxShadow(
                                          color: Colors.grey,
                                          blurRadius: 5,
                                          offset: Offset(1, 2))
                                    ],
                                  ),
                                  child: SfDateRangePicker(
                                    maxDate: DateTime.now(),
                                    initialSelectedDate:
                                        customerController.selectedDate,
                                    initialSelectedRange: PickerDateRange(
                                        customerController.rangeStart,
                                        customerController.rangeEnd),
                                    onSelectionChanged:
                                        (dateRangePickerSelectionChangedArgs) {
                                      if (customerController
                                              .selectedFilterDay.value ==
                                          "week") {
                                        customerController.rangeStart =
                                            dateRangePickerSelectionChangedArgs
                                                .value.startDate;
                                        customerController.rangeEnd =
                                            dateRangePickerSelectionChangedArgs
                                                .value.endDate;
                                      } else {
                                        customerController.selectedDate =
                                            dateRangePickerSelectionChangedArgs
                                                .value;
                                      }
                                    },
                                    headerStyle:
                                        const DateRangePickerHeaderStyle(
                                            textAlign: TextAlign.start,
                                            textStyle: TextStyle(
                                                fontWeight: FontWeight.w500)),
                                    view: DateRangePickerView.month,
                                    selectionMode: customerController.rangeMode,
                                  ),
                                )
                      /* TableCalendar(
                                  // headerVisible: false,

                                  firstDay: DateTime(DateTime.now().year - 1),
                                  lastDay: DateTime.now(),
                                  focusedDay: homeController.focusedDay,
                                  selectedDayPredicate: (day) => isSameDay(
                                      homeController.selectedDay, day),
                                  rangeStartDay: homeController.rangeStart,
                                  rangeEndDay: homeController.rangeEnd,
                                  calendarFormat: homeController.calendarFormat,
                                  rangeSelectionMode:
                                      homeController.rangeSelectionMode,
                                  onDaySelected: (selectedDay, focusedDay) {
                                    if (!isSameDay(homeController.selectedDay,
                                        selectedDay)) {
                                      setState(() {
                                        homeController.selectedDay =
                                            selectedDay;
                                        homeController.focusedDay = focusedDay;
                                        homeController.rangeStart = null;
                                        homeController.rangeEnd = null;
                                        homeController.rangeSelectionMode =
                                            RangeSelectionMode.toggledOff;
                                      });
                                    }
                                  },
                                  onRangeSelected: (start, end, focusedDay) {
                                    setState(() {
                                      homeController.selectedDay = null;
                                      homeController.focusedDay = focusedDay;
                                      homeController.rangeStart = start;
                                      homeController.rangeEnd = end;
                                      homeController.rangeSelectionMode =
                                          RangeSelectionMode.toggledOn;
                                    });
                                  },
                                  onFormatChanged: (format) {
                                    if (homeController.calendarFormat !=
                                        format) {
                                      setState(() {
                                        homeController.calendarFormat = format;
                                      });
                                    }
                                  },
                                  onPageChanged: (focusedDay) {
                                    homeController.focusedDay = focusedDay;
                                  },
                                ) */
                      ,
                      const SizedBox(height: 10),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        child: TextButton(
                          onPressed: () {
                            if (customerController.selectedFilterDay.value ==
                                "week") {
                              if (customerController.rangeStart == null ||
                                  customerController.rangeEnd == null) {
                                Fluttertoast.showToast(
                                    msg: "please_select_range".tr);
                              } else {
                                customerController.isFilterApplied.value = true;
                                customerController.appliedFilter.value =
                                    customerController.selectedFilterDay.value;
                                customerController.filterListData();
                                Get.close(1);
                              }
                            } else if (customerController
                                    .selectedFilterDay.value ==
                                "month") {
                              // if (homeController.selectedMonth.isEmpty) {
                              //   Fluttertoast.showToast(
                              //       msg: "Please select month");
                              // } else {
                              if (customerController.monthIndex >=
                                  customerController.monthIndex2) {
                                Fluttertoast.showToast(
                                    msg: "select_valid_month_msg".tr);
                              } else {
                                customerController.isFilterApplied.value = true;
                                customerController.appliedFilter.value =
                                    customerController.selectedFilterDay.value;
                                customerController.filterListData();
                                Get.close(1);
                              }
                            } else {
                              customerController.isFilterApplied.value = true;
                              customerController.appliedFilter.value =
                                  customerController.selectedFilterDay.value;
                              customerController.filterListData();
                              Get.close(1);
                            }
                          },
                          style: btnGold2,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 10.0),
                                  child: Text(
                                    'submit'.tr,
                                    style: btnGoldText2,
                                  ),
                                ),
                                Image.asset('assets/btn_arrow_right.png'),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                right: 10,
                top: 10,
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Image.asset('assets/close.png'),
                ),
              ),
            ],
          );
        });
      },
    );
  }

  List<Widget> indicators(imagesLength, currentIndex) {
    return List<Widget>.generate(imagesLength, (index) {
      return Container(
        margin: const EdgeInsets.all(3),
        width: 5,
        height: 5,
        decoration: BoxDecoration(
          color: currentIndex == index ? const Color(0xFF0E2ED4) : Colors.grey,
          shape: BoxShape.circle,
        ),
      );
    });
  }

  showTransaction(CustomerIssuePointsModel data) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15))),
      builder: (BuildContext context) {
        return Container(
          height: Get.height * 0.6,
          margin: EdgeInsets.only(bottom: Get.height * 0.05),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Image.asset('assets/close.png'),
              ),
              SizedBox(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: Get.height * 0.1,
                    ),
                    Container(
                        width: 52,
                        height: 52,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(26),
                          border: Border.all(
                            color: const Color(0xFFCFAF4E),
                            width: 1,
                          ),
                        ),
                        child: Image.asset(Images.profile)),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(data.fullName ?? "",
                        style: const TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFFCFAF4E),
                        )),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(data.totalPoints!, style: label),
                    const SizedBox(
                      height: 5,
                    ),
                    Text('total_points'.tr, style: totalText),
                    SizedBox(height: Get.height * 0.05),
                    Text('0723 732 770', style: numText),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'phone_number'.tr,
                      style: numDesc,
                    ),
                    SizedBox(height: Get.height * 0.03),
                    TextButton(
                      onPressed: () {
                        Get.close(1);
                        Get.to(
                            () => Transactions(
                                image: Images.profile,
                                name: data.fullName ?? "",
                                id: data.userId ?? ""),
                            binding: InitialBinding());
                      },
                      child: Text('transactions'.tr, style: transText),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

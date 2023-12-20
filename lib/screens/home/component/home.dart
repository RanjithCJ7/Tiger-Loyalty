import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import 'package:tiger_loyalty/const/Image.dart';
import 'package:tiger_loyalty/const/my_appbar.dart';
import 'package:tiger_loyalty/screens/home/controller/home_controller.dart';
import 'package:tiger_loyalty/screens/home/model/approved_points_model.dart';
import 'package:tiger_loyalty/screens/home/model/pending_points_model.dart';
import 'package:tiger_loyalty/screens/profile/controller/profile_controller.dart';
import 'package:tiger_loyalty/widget/loader_widget.dart';
import '../../../src/pages/styles.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  HomeController homeController = Get.find<HomeController>();
  ProfileController profileController = Get.find<ProfileController>();

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
          title: Obx(
            () => Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                      '${"hello".tr} ${profileController.profileModel.value.firstName ?? ""}',
                      style: label.copyWith(color: Colors.black)),
                  const SizedBox(height: 5.0),
                  Text(profileController.profileModel.value.businessName ?? "",
                      style: desc),
                ],
              ),
            ),
          )),
      body: SafeArea(
        child: Obx(
          () => homeController.isLoading.value ||
                  profileController.isLoading.value
              ? const LoaderWidget()
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    children: [
                      GestureDetector(
                        onPanUpdate: (details) {
                          if (details.delta.dx > 0) {
                            homeController.points.value = true;
                          }
                          if (details.delta.dx < 0) {
                            homeController.points.value = false;
                          }
                        },
                        child: homeController.points.value
                            ? Stack(
                                alignment: Alignment.center,
                                children: [
                                  Image.asset(Images.homeBackImg),
                                  Container(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Text('issuance'.tr,
                                                style: imgLabel),
                                            const Spacer(),
                                            GestureDetector(
                                              onTap: () {
                                                showDatePickerDialog();
                                              },
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 5),
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color: Colors.white,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          25.0),
                                                ),
                                                height: 20,
                                                child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      homeController
                                                              .isFilterApplied
                                                              .value
                                                          ? homeController
                                                              .appliedFilter
                                                              .value
                                                              .tr
                                                          : "today".tr,
                                                      style: todayText.copyWith(
                                                          color: Colors.white),
                                                    ),
                                                    const Icon(
                                                      Icons
                                                          .arrow_drop_down_outlined,
                                                      color: Colors.white,
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
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                    homeController
                                                        .customerSummary
                                                        .value
                                                        .issuedCustomers!
                                                        .toString(),
                                                    style: imgNum),
                                                const SizedBox(height: 5.0),
                                                Text('customers'.tr,
                                                    style: imgDesc)
                                              ],
                                            ),
                                            const Spacer(),
                                            Image.asset('assets/line.png'),
                                            const Spacer(),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                Text(
                                                    homeController
                                                        .customerSummary
                                                        .value
                                                        .issuedRewardPoints!,
                                                    style: imgNum),
                                                const SizedBox(height: 5.0),
                                                Text('total_issued_points'.tr,
                                                    style: imgDesc)
                                              ],
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              )
                            : Stack(
                                alignment: Alignment.center,
                                children: [
                                  // Image.asset('assets/rectangle_3.png'),
                                  // Positioned(
                                  //   bottom: 0,
                                  //   right: 10,
                                  //   child: Image.asset(
                                  //       'assets/rectangle_4.png'),
                                  // ),
                                  Image.asset(Images.homeBackImg3),
                                  Container(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Text('redemption'.tr,
                                                style: imgLabel),
                                            const Spacer(),
                                            GestureDetector(
                                              onTap: () {
                                                showDatePickerDialog();
                                              },
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 5),
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color: Colors.white,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          25.0),
                                                ),
                                                height: 20,
                                                child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      homeController
                                                              .isFilterApplied
                                                              .value
                                                          ? homeController
                                                              .appliedFilter
                                                              .value
                                                              .tr
                                                          : "today".tr,
                                                      style: todayText.copyWith(
                                                          color: Colors.white),
                                                    ),
                                                    const Icon(
                                                      Icons
                                                          .arrow_drop_down_outlined,
                                                      color: Colors.white,
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
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                    homeController
                                                        .customerSummary
                                                        .value
                                                        .redeemedCustomers!
                                                        .toString(),
                                                    style: imgNum),
                                                const SizedBox(height: 5.0),
                                                Text('customers'.tr,
                                                    style: imgDesc)
                                              ],
                                            ),
                                            const Spacer(),
                                            Image.asset('assets/line.png'),
                                            const Spacer(),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                Text(
                                                    homeController
                                                        .customerSummary
                                                        .value
                                                        .redeemedRewardPoints!
                                                        .toString(),
                                                    style: imgNum),
                                                const SizedBox(height: 5.0),
                                                Text('total_redeemed_points'.tr,
                                                    style: imgDescDark)
                                              ],
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                      ),
                      const SizedBox(height: 10.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: indicators(
                            2, homeController.points.value == true ? 0 : 1),
                      ),
                      const SizedBox(height: 15.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('issued_points'.tr, style: labelSm),
                          Container(
                            decoration: BoxDecoration(
                                color: const Color(0xFFF5F5F5),
                                borderRadius: BorderRadius.circular(5),
                                border:
                                    Border.all(color: const Color(0XFFD9D9D9))),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset('assets/search.png'),
                                  const SizedBox(width: 10),
                                  SizedBox(
                                    width: size.width * 0.3,
                                    height: 24,
                                    child: TextField(
                                      controller:
                                          homeController.searchController,
                                      onChanged: (value) {
                                        homeController.searchData();
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
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10.0),
                      Container(
                        height: 32,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                              color: const Color(0xFF000000), width: 0.5),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: homeController.points.value
                                      ? const Color(0xFFD9D9D9)
                                      : null,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: TextButton(
                                  onPressed: () {
                                    // setState(() {
                                    homeController.points.value = true;
                                    // });
                                  },
                                  child: Text('pending'.tr, style: smText),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: homeController.points.value
                                      ? null
                                      : const Color(0xFFD9D9D9),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: TextButton(
                                  onPressed: () {
                                    homeController.points.value = false;
                                  },
                                  child: Text('issued'.tr, style: smText),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      homeController.points.value
                          ? pendingPoint(size)
                          : issuedPoints(size)
                    ],
                  ),
                ),
        ),
      ),
    );
  }

  showDatePickerDialog() {
    homeController.selectedFilterDay.value = homeController.appliedFilter.value;

    homeController.focusedDay = DateTime.now();
    if (homeController.selectedFilterDay.value == "today") {
      setState(() {
        homeController.rangeMode = DateRangePickerSelectionMode.single;
      });
    }
    if (homeController.selectedFilterDay.value == "week") {
      setState(() {
        homeController.rangeMode = DateRangePickerSelectionMode.range;
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
                        children: homeController.filterDays
                            .map((e) => Padding(
                                  padding: const EdgeInsets.all(1.0),
                                  child: InkWell(
                                    onTap: () async {
                                      setState(() {
                                        homeController.selectedFilterDay.value =
                                            e;
                                        print(
                                            "date ==> ${homeController.selectedFilterDay.value}");

                                        homeController.rangeStart = null;
                                        homeController.rangeEnd = null;
                                        homeController.focusedDay =
                                            DateTime.now();

                                        if (e == "today") {
                                          setState(() {
                                            homeController.rangeMode =
                                                DateRangePickerSelectionMode
                                                    .single;
                                          });
                                        }
                                        if (e == "week") {
                                          setState(() {
                                            homeController.rangeMode =
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
                                                  homeController
                                                      .selectedFilterDay.value
                                              ? const Color(0xFFF5F5F5)
                                              : Colors.white,
                                          border: Border.all(
                                              color: e ==
                                                      homeController
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
                      homeController.selectedFilterDay.value == "month"
                          ? /* Expanded(
                              child: GridView.builder(
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  childAspectRatio: 3,
                                  mainAxisSpacing: 5,
                                  crossAxisSpacing: 10,
                                ),
                                physics: const BouncingScrollPhysics(),
                                itemCount: homeController.monthList.length,
                                itemBuilder: (context, index) {
                                  var data = homeController.monthList[index];

                                  return GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        if (homeController
                                                .selectedMonth.length <
                                            3) {
                                          if (homeController.selectedMonth
                                              .contains(data)) {
                                            homeController.selectedMonth
                                                .remove(data);
                                          } else {
                                            homeController.selectedMonth
                                                .add(data);
                                          }
                                        } else {
                                          homeController.selectedMonth
                                              .remove(data);
                                        }
                                      });
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          border: Border.all(
                                              width: 2,
                                              color: homeController
                                                      .selectedMonth
                                                      .contains(data)
                                                  ? Colors.black
                                                  : Colors.white),
                                          borderRadius:
                                              BorderRadius.circular(50)),
                                      child: Center(
                                        child: Text(
                                          data.month,
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
                            ) */
                          Expanded(
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
                                                          if (homeController
                                                                  .monthIndex ==
                                                              11) {
                                                            homeController
                                                                .monthIndex = 0;
                                                          } else {
                                                            homeController
                                                                    .monthIndex =
                                                                homeController
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
                                                          if (homeController
                                                                  .monthIndex ==
                                                              0) {
                                                            homeController
                                                                .monthIndex = 11;
                                                          } else {
                                                            homeController
                                                                    .monthIndex =
                                                                homeController
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
                                                  homeController
                                                      .monthList[homeController
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
                                                          if (homeController
                                                                  .monthIndex2 ==
                                                              11) {
                                                            homeController
                                                                .monthIndex2 = 0;
                                                          } else {
                                                            homeController
                                                                    .monthIndex2 =
                                                                homeController
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
                                                          if (homeController
                                                                  .monthIndex2 ==
                                                              0) {
                                                            homeController
                                                                .monthIndex2 = 11;
                                                          } else {
                                                            homeController
                                                                    .monthIndex2 =
                                                                homeController
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
                                                  homeController
                                                      .monthList[homeController
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
                                  if (homeController.monthIndex >=
                                      homeController.monthIndex2) ...[
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
                          : homeController.selectedFilterDay.value == "year"
                              ? Expanded(
                                  child: GridView.builder(
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 3,
                                            childAspectRatio: 3,
                                            mainAxisSpacing: 5,
                                            crossAxisSpacing: 10),
                                    physics: const BouncingScrollPhysics(),
                                    itemCount: homeController.yearList.length,
                                    itemBuilder: (context, index) {
                                      return GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            homeController.selectedyear.value =
                                                homeController.yearList[index];
                                          });
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              border: Border.all(
                                                  width: 2,
                                                  color: homeController
                                                              .selectedyear
                                                              .value ==
                                                          homeController
                                                              .yearList[index]
                                                      ? Colors.black
                                                      : Colors.white),
                                              borderRadius:
                                                  BorderRadius.circular(50)),
                                          child: Center(
                                            child: Text(
                                              homeController.yearList[index],
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
                                        homeController.selectedDate,
                                    initialSelectedRange: PickerDateRange(
                                        homeController.rangeStart,
                                        homeController.rangeEnd),
                                    onSelectionChanged:
                                        (dateRangePickerSelectionChangedArgs) {
                                      if (homeController
                                              .selectedFilterDay.value ==
                                          "week") {
                                        homeController.rangeStart =
                                            dateRangePickerSelectionChangedArgs
                                                .value.startDate;
                                        homeController.rangeEnd =
                                            dateRangePickerSelectionChangedArgs
                                                .value.endDate;
                                      } else {
                                        homeController.selectedDate =
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
                                    selectionMode: homeController.rangeMode,
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
                            if (homeController.selectedFilterDay.value ==
                                "week") {
                              if (homeController.rangeStart == null ||
                                  homeController.rangeEnd == null) {
                                Fluttertoast.showToast(
                                    msg: "please_select_range".tr);
                              } else {
                                homeController.isFilterApplied.value = true;
                                homeController.appliedFilter.value =
                                    homeController.selectedFilterDay.value;
                                homeController.filterListData();
                                Get.close(1);
                              }
                            } else if (homeController.selectedFilterDay.value ==
                                "month") {
                              // if (homeController.selectedMonth.isEmpty) {
                              //   Fluttertoast.showToast(
                              //       msg: "Please select month");
                              // } else {
                              if (homeController.monthIndex >=
                                  homeController.monthIndex2) {
                                Fluttertoast.showToast(
                                    msg: "select_valid_month_msg".tr);
                              } else {
                                homeController.isFilterApplied.value = true;
                                homeController.appliedFilter.value =
                                    homeController.selectedFilterDay.value;
                                homeController.filterListData();
                                Get.close(1);
                              }
                            } else {
                              homeController.isFilterApplied.value = true;
                              homeController.appliedFilter.value =
                                  homeController.selectedFilterDay.value;
                              homeController.filterListData();
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

  pendingPoint(Size size) {
    return Expanded(
      child: ListView.separated(
        padding: const EdgeInsets.only(top: 10),
        physics: const BouncingScrollPhysics(),
        itemCount: homeController.pendingPointsList.length,
        separatorBuilder: (context, index) =>
            const Divider(color: Color(0XFFD9D9D9), thickness: 1),
        itemBuilder: (context, index) {
          PendingPointsModel data = homeController.pendingPointsList[index];
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            height: MediaQuery.of(context).size.height * 0.055,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: size.width * 0.14,
                  child: Stack(
                    children: [
                      Align(
                        child: Container(
                          padding: const EdgeInsets.all(1),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                                color: const Color(0xFFCFAF4E), width: 1),
                          ),
                          // child: CircleAvatar(
                          //   backgroundImage: AssetImage(
                          //     data.image,
                          //   ),
                          // ),
                        ),
                      ),
                      Align(
                        child: Container(
                          margin: const EdgeInsets.all(2),
                          padding: const EdgeInsets.all(1),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage(Images.profile),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: size.width * 0.45,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(data.totalPoints.toString(), style: labelSm),
                      const SizedBox(height: 5),
                      Text(data.fullName!, style: desc),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TextButton(
                      onPressed: () {
                        homeController.approvePendingPoints(data.rewardId!);
                      },
                      style: approveBtn,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 5.0),
                            child: Image.asset('assets/approve.png'),
                          ),
                          Text('approve'.tr, style: approveText),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        cancelPointsBottomSheet(context, data.userId!);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(2.0),
                        decoration: const BoxDecoration(
                            color: Color(0XFFD9D9D9), shape: BoxShape.circle),
                        child: const Icon(
                          Icons.close,
                          color: Colors.white,
                          size: 15,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  issuedPoints(Size size) {
    return Expanded(
      child: ListView.separated(
        padding: const EdgeInsets.only(top: 10),
        physics: const BouncingScrollPhysics(),
        itemCount: homeController.approvedPointsList.length,
        separatorBuilder: (context, index) =>
            const Divider(color: Color(0XFFD9D9D9), thickness: 1),
        itemBuilder: (context, index) {
          ApprovedPointsModel data = homeController.approvedPointsList[index];
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            height: MediaQuery.of(context).size.height * 0.055,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                    width: size.width * 0.14,
                    child: Stack(
                      children: [
                        Align(
                          child: Container(
                            padding: const EdgeInsets.all(1),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  color: const Color(0xFFCFAF4E), width: 1),
                            ),
                            // child: CircleAvatar(
                            //   backgroundImage: AssetImage(
                            //     data.image,
                            //   ),
                            // ),
                          ),
                        ),
                        Align(
                          child: Container(
                            margin: const EdgeInsets.all(2),
                            padding: const EdgeInsets.all(1),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: AssetImage(Images.profile),
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )),
                SizedBox(
                  width: size.width * 0.5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(data.totalPoints.toString(), style: labelSm),
                      const SizedBox(height: 5),
                      Text(data.fullName ?? "", style: desc),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    cancelPointsBottomSheet(context, data.rewardId!);
                  },
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 18),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(22),
                        color: const Color(0xFFCA1818)),
                    child: Text(
                      "cancel".tr,
                      style: const TextStyle(
                          fontFamily: "Inter",
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  void cancelPointsBottomSheet(BuildContext context, String id) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(15.0),
        ),
      ),
      builder: (BuildContext context) {
        return Stack(
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 50, top: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 10),
                    child: SizedBox(
                      width: double.infinity,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: 260,
                            alignment: Alignment.center,
                            child: Text(
                              '${"want_to_cancel".tr} ${"data.name"} ${"reward_points".tr}',
                              style: labelSm,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          const SizedBox(height: 15.0),
                          SizedBox(
                            width: double.infinity,
                            height: 53,
                            child: TextButton(
                              onPressed: () {},
                              style: btnGrey,
                              child: Text(
                                'no'.tr,
                                style: btnGreyText,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          const SizedBox(height: 5.0),
                          SizedBox(
                            width: double.infinity,
                            height: 53,
                            child: TextButton(
                              onPressed: () {
                                Get.close(1);
                                homeController.cancelPoints(id);
                              },
                              style: btnRed,
                              child: Text(
                                'yes'.tr,
                                style: yesText,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              right: 0,
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Image.asset('assets/close.png'),
              ),
            ),
          ],
        );
      },
    );
  }
}

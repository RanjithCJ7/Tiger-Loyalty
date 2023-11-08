import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import 'package:tiger_loyalty/const/Image.dart';
import 'package:tiger_loyalty/const/my_appbar.dart';
import 'package:tiger_loyalty/screens/customer/controller/customer_controller.dart';
import 'package:tiger_loyalty/src/pages/transactions.dart';
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
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: My_AppBar(context,
          title: Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child:
                Text('Customers', style: label.copyWith(color: Colors.black)),
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
                                        // Image.asset('assets/rectangle_3.png'),
                                        // Positioned(
                                        //   bottom: 0,
                                        //   right: 10,
                                        //   child: Image.asset('assets/rectangle_4.png'),
                                        // ),
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
                                                        Text('Summary',
                                                            style: imgLabel),
                                                        Spacer(),
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
                                                                      : "Today",
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
                                                            Text('219',
                                                                style: imgNum),
                                                            const SizedBox(
                                                                height: 5.0),
                                                            Text('Customers',
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
                                                            Text('3,478,300',
                                                                style: imgNum),
                                                            const SizedBox(
                                                                height: 5.0),
                                                            Text(
                                                                'Total issued points',
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
                                        // Image.asset('assets/rectangle_5.png'),
                                        // Positioned(
                                        //   bottom: 0,
                                        //   right: 10,
                                        //   child:
                                        //       Image.asset('assets/rectangle_4.png'),
                                        // ),
                                        Image.asset(Images.homeBackImg2),

                                        Container(
                                          padding: const EdgeInsets.all(15.0),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10.0),
                                            child: Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    Text('Summary',
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
                                                                  : "Today",
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
                                                        Text('59',
                                                            style: imgNum),
                                                        const SizedBox(
                                                            height: 5.0),
                                                        Text('Customers',
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
                                                              .start,
                                                      children: [
                                                        Text('1,503,700',
                                                            style: imgNum),
                                                        const SizedBox(
                                                            height: 5.0),
                                                        Text(
                                                            'Total redeemed points',
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
                                      decoration: const InputDecoration(
                                        contentPadding:
                                            EdgeInsets.symmetric(vertical: 11),
                                        hintText: 'Search customer',
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
                              itemCount: customerController.filterData.length,
                              itemBuilder: (context, index) {
                                var data = customerController.filterData[index];
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
                                            child: Image.asset(data.image)),
                                        SizedBox(
                                          width: size.width * 0.5,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(data.name, style: custName),
                                              const SizedBox(height: 5),
                                              Text('Points: ${data.points}',
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
                          Text('Filter', style: filterText),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Wrap(
                        children: customerController.filterDays
                            .map((e) => Padding(
                                  padding: const EdgeInsets.all(1.0),
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        customerController
                                            .selectedFilterDay.value = e;

                                        customerController.rangeStart = null;
                                        customerController.rangeEnd = null;
                                        customerController.focusedDay =
                                            DateTime.now();

                                        if (e == "Today") {
                                          setState(() {
                                            customerController.rangeMode =
                                                DateRangePickerSelectionMode
                                                    .single;
                                          });
                                        }
                                        if (e == "Week") {
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
                                        e,
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
                        child: Text(
                            customerController.selectedFilterDay.value ==
                                    "Month"
                                ? 'Select a month'
                                : customerController.selectedFilterDay.value ==
                                        "Year"
                                    ? 'Select a year'
                                    : 'Select a date',
                            style: selectDateText),
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      customerController.selectedFilterDay.value == "Month"
                          ? Expanded(
                              child: GridView.builder(
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 3,
                                        childAspectRatio: 3,
                                        mainAxisSpacing: 5,
                                        crossAxisSpacing: 10),
                                physics: const BouncingScrollPhysics(),
                                itemCount: customerController.monthList.length,
                                itemBuilder: (context, index) {
                                  var data =
                                      customerController.monthList[index];

                                  return GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        if (customerController
                                                .selectedMonth.length <
                                            3) {
                                          if (customerController.selectedMonth
                                              .contains(data)) {
                                            customerController.selectedMonth
                                                .remove(data);
                                          } else {
                                            customerController.selectedMonth
                                                .add(data);
                                          }
                                        } else {
                                          customerController.selectedMonth
                                              .remove(data);
                                        }
                                      });
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          border: Border.all(
                                              width: 2,
                                              color: customerController
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
                            )
                          : customerController.selectedFilterDay.value == "Year"
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
                                    initialSelectedDate:
                                        customerController.selectedDate,
                                    initialSelectedRange: PickerDateRange(
                                        customerController.rangeStart,
                                        customerController.rangeEnd),
                                    onSelectionChanged:
                                        (dateRangePickerSelectionChangedArgs) {
                                      if (customerController
                                              .selectedFilterDay.value ==
                                          "Week") {
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
                                "Week") {
                              if (customerController.rangeStart == null ||
                                  customerController.rangeEnd == null) {
                                Fluttertoast.showToast(
                                    msg: "Please select range");
                              } else {
                                customerController.isFilterApplied.value = true;
                                customerController.appliedFilter.value =
                                    customerController.selectedFilterDay.value;
                                customerController.filterListData();
                                Get.close(1);
                              }
                            } else if (customerController
                                    .selectedFilterDay.value ==
                                "Month") {
                              if (customerController.selectedMonth.isEmpty) {
                                Fluttertoast.showToast(
                                    msg: "Please select month");
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
                            print(
                                "selected date ==> ${customerController.selectedDate} first date ==> ${customerController.rangeStart} end => ${customerController.rangeEnd} ");
                          },
                          style: btnGold2,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8.0,
                                horizontal:
                                    20), // Applying horizontal margin of 20
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 10.0),
                                  child: Text(
                                    'Submit',
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

  showTransaction(PointsData data) {
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
                        child: Image.asset(data.image)),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(data.name,
                        style: const TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFFCFAF4E),
                        )),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(data.points, style: label),
                    const SizedBox(
                      height: 5,
                    ),
                    Text('Total points', style: totalText),
                    SizedBox(height: Get.height * 0.05),
                    Text('0723 732 770', style: numText),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Phone number',
                      style: numDesc,
                    ),
                    SizedBox(height: Get.height * 0.03),
                    TextButton(
                      onPressed: () {
                        Get.close(1);
                        Get.to(() => Transactions(data.image, data.name));
                      },
                      child: Text('Transactions', style: transText),
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

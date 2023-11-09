import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import 'package:tiger_loyalty/const/Image.dart';
import 'package:tiger_loyalty/const/my_appbar.dart';
import 'package:tiger_loyalty/screens/home/controller/home_controller.dart';
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

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: My_AppBar(context,
          title: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Hello Jane,', style: label.copyWith(color: Colors.black)),
                const SizedBox(height: 5.0),
                Text('Boob Boo Restaurant', style: desc),
              ],
            ),
          )),
      body: SafeArea(
        child: Obx(
          () => homeController.isLoading.value
              ? const LoaderWidget()
              : Column(
                  children: <Widget>[
                    Expanded(
                      child: Padding(
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
                                        /*Image.asset(
                                          'assets/rectangle_1.png',
                                          width: Get.width,
                                        ),
                                        Positioned(
                                          // bottom: 0,
                                          // right: 30,
                                          child: Image.asset(
                                            'assets/rectangle_2.png',
                                            width: Get.width,
                                            // height: Get.height * 0.1,
                                          ),
                                        ), */
                                        Image.asset(Images.homeBackImg),
                                        Container(
                                          padding: const EdgeInsets.all(15.0),
                                          child: Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Text('Issuance',
                                                      style: imgLabel),
                                                  const Spacer(),
                                                  GestureDetector(
                                                    onTap: () {
                                                      showDatePickerDialog();
                                                    },
                                                    child: Container(
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                          horizontal: 5),
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                          color: Colors.white,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(25.0),
                                                      ),
                                                      height: 20,
                                                      child: Row(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            homeController
                                                                    .isFilterApplied
                                                                    .value
                                                                ? homeController
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
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text('10', style: imgNum),
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
                                                      Text('60,120',
                                                          style: imgNum),
                                                      const SizedBox(
                                                          height: 5.0),
                                                      Text(
                                                          'Total issued points',
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
                                          padding: EdgeInsets.all(15.0),
                                          child: Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Text('Redemption',
                                                      style: imgLabel),
                                                  const Spacer(),
                                                  GestureDetector(
                                                    onTap: () {
                                                      showDatePickerDialog();
                                                    },
                                                    child: Container(
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                          horizontal: 5),
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                          color: Colors.white,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(25.0),
                                                      ),
                                                      height: 20,
                                                      child: Row(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            homeController
                                                                    .isFilterApplied
                                                                    .value
                                                                ? homeController
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
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text('23', style: imgNum),
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
                                                      Text('178,300',
                                                          style: imgNum),
                                                      const SizedBox(
                                                          height: 5.0),
                                                      Text(
                                                          'Total redeemed points',
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
                              children: indicators(2,
                                  homeController.points.value == true ? 0 : 1),
                            ),
                            const SizedBox(height: 15.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Issued points', style: labelSm),
                                Container(
                                  decoration: BoxDecoration(
                                      color: const Color(0xFFF5F5F5),
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(
                                          color: const Color(0XFFD9D9D9))),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
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
                                            decoration: const InputDecoration(
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      vertical: 11),
                                              hintText: 'Search customer',
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
                                        child: Text('Pending', style: smText),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: homeController.points.value
                                            ? null
                                            : Color(0xFFD9D9D9),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: TextButton(
                                        onPressed: () {
                                          homeController.points.value = false;
                                        },
                                        child: Text('Issued', style: smText),
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
                    /* Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
                decoration: BoxDecoration(
                  color: Color(0xFFD9D9D9),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Image.asset('assets/home.png'),
                          SizedBox(height: 5),
                          Text('Home', style: footerText),
                        ],
                      ),
                    ),
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => GiveReward(),
                            ),
                          );
                        },
                        child: Column(
                          children: [
                            Image.asset('assets/reward.png',
                                color: Color.fromRGBO(0, 0, 0, 0.3)),
                            SizedBox(height: 5),
                            Text('Give reward',
                                style: footerText.copyWith(
                                    color: Color.fromRGBO(0, 0, 0, 0.3))),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => Customers(),
                            ),
                          );
                        },
                        child: Column(
                          children: [
                            Image.asset('assets/customer.png',
                                color: Color.fromRGBO(0, 0, 0, 0.3)),
                            SizedBox(height: 5),
                            Text('Customers',
                                style: footerText.copyWith(
                                    color: Color.fromRGBO(0, 0, 0, 0.3))),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          // Navigator.of(context).push(
                          //   MaterialPageRoute(
                          //     builder: (context) => Profile(),
                          //   ),
                          // );
                        },
                        child: Column(
                          children: [
                            Image.asset('assets/profile.png',
                                color: Color.fromRGBO(0, 0, 0, 0.3)),
                            SizedBox(height: 5),
                            Text('Profile',
                                style: footerText.copyWith(
                                    color: Color.fromRGBO(0, 0, 0, 0.3))),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
             */
                  ],
                ),
        ),
      ),
    );
  }

  showDatePickerDialog() {
    homeController.selectedFilterDay.value = homeController.appliedFilter.value;
    homeController.focusedDay = DateTime.now();
    if (homeController.selectedFilterDay.value == "Today") {
      setState(() {
        homeController.rangeMode = DateRangePickerSelectionMode.single;
      });
    }
    if (homeController.selectedFilterDay.value == "Week") {
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
                          Text('Filter', style: filterText),
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

                                        homeController.rangeStart = null;
                                        homeController.rangeEnd = null;
                                        homeController.focusedDay =
                                            DateTime.now();

                                        if (e == "Today") {
                                          setState(() {
                                            homeController.rangeMode =
                                                DateRangePickerSelectionMode
                                                    .single;
                                          });
                                        }
                                        if (e == "Week") {
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
                            homeController.selectedFilterDay.value == "Month"
                                ? 'Select a month'
                                : homeController.selectedFilterDay.value ==
                                        "Year"
                                    ? 'Select a year'
                                    : 'Select a date',
                            style: selectDateText),
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      homeController.selectedFilterDay.value == "Month"
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
                                            'From',
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
                                                          print(
                                                              "index ==> ${homeController.monthIndex}");
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
                                                          print(
                                                              "index ==> ${homeController.monthIndex}");
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
                                                      .month,
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
                                            'To',
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
                                                          print(
                                                              "index ==> ${homeController.monthIndex2}");
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
                                                          print(
                                                              "index ==> ${homeController.monthIndex2}");
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
                                                      .month,
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
                                    const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text(
                                        "Select valid From and To month",
                                        style: TextStyle(color: Colors.red),
                                      ),
                                    )
                                  ]
                                ],
                              ),
                            )
                          : homeController.selectedFilterDay.value == "Year"
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
                                          "Week") {
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
                                "Week") {
                              if (homeController.rangeStart == null ||
                                  homeController.rangeEnd == null) {
                                Fluttertoast.showToast(
                                    msg: "Please select range");
                              } else {
                                homeController.isFilterApplied.value = true;
                                homeController.appliedFilter.value =
                                    homeController.selectedFilterDay.value;
                                homeController.filterListData();
                                Get.close(1);
                              }
                            } else if (homeController.selectedFilterDay.value ==
                                "Month") {
                              // if (homeController.selectedMonth.isEmpty) {
                              //   Fluttertoast.showToast(
                              //       msg: "Please select month");
                              // } else {
                              if (homeController.monthIndex >=
                                  homeController.monthIndex2) {
                                Fluttertoast.showToast(
                                    msg:
                                        "Please select valid From and To month");
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
                            print(
                                "selected date ==> ${homeController.selectedDate} first date ==> ${homeController.rangeStart} end => ${homeController.rangeEnd} ");
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

  pendingPoint(Size size) {
    return Expanded(
      child: ListView.separated(
        padding: const EdgeInsets.only(top: 10),
        physics: const BouncingScrollPhysics(),
        itemCount: homeController.filterData.length,
        separatorBuilder: (context, index) =>
            const Divider(color: Color(0XFFD9D9D9), thickness: 1),
        itemBuilder: (context, index) {
          // var data = homeController.filterData[index];
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            height: MediaQuery.of(context).size.height * 0.055,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                    width: size.width * 0.14,
                    child: Image.asset(homeController.filterData[index].image)),
                SizedBox(
                  width: size.width * 0.45,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(homeController.filterData[index].points,
                          style: labelSm),
                      const SizedBox(height: 5),
                      Text(homeController.filterData[index].name, style: desc),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TextButton(
                      onPressed: () {},
                      style: approveBtn,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 5.0),
                            child: Image.asset('assets/approve.png'),
                          ),
                          Text('Approve', style: approveText),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () {
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
                                  margin: const EdgeInsets.only(
                                      bottom: 50, top: 15),
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
                                                  'Do you want to cancel ${homeController.filterData[index].name} rewards point?',
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
                                                    'No',
                                                    style: btnGreyText,
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(height: 5.0),
                                              Container(
                                                width: double.infinity,
                                                height: 53,
                                                child: TextButton(
                                                  onPressed: () {},
                                                  style: btnRed,
                                                  child: Text(
                                                    'Yes',
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
        itemCount: homeController.filterData.length,
        separatorBuilder: (context, index) =>
            const Divider(color: Color(0XFFD9D9D9), thickness: 1),
        itemBuilder: (context, index) {
          var data = homeController.filterData[index];
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            height: MediaQuery.of(context).size.height * 0.055,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                    width: size.width * 0.14, child: Image.asset(data.image)),
                SizedBox(
                  width: size.width * 0.5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(data.points, style: labelSm),
                      const SizedBox(height: 5),
                      Text(data.name, style: desc),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
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
                              margin: EdgeInsets.only(bottom: 50, top: 15),
                              decoration: BoxDecoration(),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 15, vertical: 10),
                                    child: Container(
                                      width: double.infinity,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Container(
                                            width: 260,
                                            alignment: Alignment.center,
                                            child: Text(
                                              'Do you want to cancel ${data.name} rewards point?',
                                              style: labelSm,
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                          SizedBox(height: 15.0),
                                          Container(
                                            width: double.infinity,
                                            height: 53,
                                            child: TextButton(
                                              onPressed: () {},
                                              style: btnGrey,
                                              child: Text(
                                                'No',
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
                                              onPressed: () {},
                                              style: btnRed,
                                              child: Text(
                                                'Yes',
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
                  },
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 18),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(22),
                        color: const Color(0xFFCA1818)),
                    child: const Text(
                      "Cancel",
                      style: TextStyle(
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
}

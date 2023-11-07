import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:table_calendar/table_calendar.dart';
import 'package:tiger_loyalty/const/Image.dart';
import 'package:tiger_loyalty/const/my_appbar.dart';
import 'package:tiger_loyalty/screens/home/controller/home_controller.dart';
import 'package:tiger_loyalty/widget/loader_widget.dart';
import '../../../src/pages/styles.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class PointsData {
  String points;
  String name;
  String image;

  PointsData({required this.points, required this.name, required this.image});
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
                        child: SingleChildScrollView(
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
                                                              "Today",
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
                                                        Text('10',
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
                                                              "Today",
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
                                                        Text('23',
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
                                children: indicators(
                                    2,
                                    homeController.points.value == true
                                        ? 0
                                        : 1),
                              ),
                              const SizedBox(height: 15.0),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                      color: const Color(0xFF000000),
                                      width: 0.5),
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: homeController.points.value
                                              ? const Color(0xFFD9D9D9)
                                              : null,
                                          borderRadius:
                                              BorderRadius.circular(5),
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
                                          borderRadius:
                                              BorderRadius.circular(5),
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
    homeController.rangeStart = null;
    homeController.rangeEnd = null;
    homeController.focusedDay = DateTime.now();
    homeController.selectedDay = null;

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
                                    onTap: () {
                                      setState(() {
                                        homeController.selectedFilterDay.value =
                                            e;
                                        homeController.selectedDay = null;

                                        if (e == "Today") {
                                          homeController.rangeSelectionMode =
                                              RangeSelectionMode.toggledOff;
                                        }
                                        if (e == "Week") {
                                          homeController.rangeSelectionMode =
                                              RangeSelectionMode.toggledOn;
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
                          ? Expanded(
                              child: GridView.builder(
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  childAspectRatio: 16 / 8,
                                ),
                                physics: const BouncingScrollPhysics(),
                                itemCount: homeController.monthList.length,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        homeController.selectedMonth.value =
                                            homeController.monthList[index];
                                      });
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: homeController
                                                      .selectedMonth.value ==
                                                  homeController
                                                      .monthList[index]
                                              ? Colors.black
                                              : Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: Center(
                                        child: Text(
                                          homeController.monthList[index],
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: homeController
                                                          .selectedMonth
                                                          .value ==
                                                      homeController
                                                          .monthList[index]
                                                  ? Colors.white
                                                  : Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            )
                          : homeController.selectedFilterDay.value == "Year"
                              ? Expanded(
                                  child: GridView.builder(
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 3,
                                            childAspectRatio: 19 / 9),
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
                                              color: homeController
                                                          .selectedyear.value ==
                                                      homeController
                                                          .yearList[index]
                                                  ? Colors.black
                                                  : Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          child: Center(
                                            child: Text(
                                              homeController.yearList[index],
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  color: homeController
                                                              .selectedyear
                                                              .value ==
                                                          homeController
                                                              .yearList[index]
                                                      ? Colors.white
                                                      : Colors.black,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                )
                              : TableCalendar(
                                  headerVisible: false,
                                  firstDay: DateTime(DateTime.now().year - 1),
                                  lastDay: DateTime(DateTime.now().year + 1),
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
                                ),
                      const SizedBox(height: 10),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        child: TextButton(
                          onPressed: () {
                            Get.close(1);
                            print(
                                "first date ==> ${homeController.rangeStart} end => ${homeController.rangeEnd}");
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
    return Column(
      children: [
        ListView.separated(
          padding: const EdgeInsets.only(top: 10),
          shrinkWrap: true,
          itemCount: homeController.pointsData.length,
          separatorBuilder: (context, index) =>
              const Divider(color: Color(0XFFD9D9D9), thickness: 1),
          itemBuilder: (context, index) {
            var data = homeController.pointsData[index];
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
                    width: size.width * 0.45,
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
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
                                                    'Do you want to cancel ${data.name} rewards point?',
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
                                                      textAlign:
                                                          TextAlign.center,
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
                                                      textAlign:
                                                          TextAlign.center,
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
        const Divider(color: Color(0XFFD9D9D9), thickness: 1)
      ],
    );
  }

  issuedPoints(Size size) {
    return Column(
      children: [
        ListView.separated(
          padding: const EdgeInsets.only(top: 10),
          shrinkWrap: true,
          itemCount: homeController.pointsData.length,
          separatorBuilder: (context, index) =>
              const Divider(color: Color(0XFFD9D9D9), thickness: 1),
          itemBuilder: (context, index) {
            var data = homeController.pointsData[index];
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
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 18),
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
        const Divider(color: Color(0XFFD9D9D9), thickness: 1)
      ],
    );
  }
}

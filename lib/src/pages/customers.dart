import 'package:flutter/material.dart';

import 'package:table_calendar/table_calendar.dart';
import 'package:tiger_loyalty/const/my_appbar.dart';

import 'package:tiger_loyalty/src/pages/transactions.dart';
import 'styles.dart';

class Customers extends StatefulWidget {
  @override
  _CustomersState createState() => _CustomersState();
}

class PointsData {
  String points;
  String name;
  String image;

  PointsData({required this.points, required this.name, required this.image});
}

class _CustomersState extends State<Customers> {
  String selectedToday = 'Date';
  List<String> selectDay = ['Date', 'Date1', 'Date2'];

  List<PointsData> pointsData = [
    PointsData(points: '4,000', name: 'Juma hamza', image: 'assets/cust_1.png'),
    PointsData(
        points: '250', name: 'Hamisa Kichwa', image: 'assets/cust_2.png'),
    PointsData(
        points: '1230', name: 'Jane Jackson', image: 'assets/cust_3.png'),
    PointsData(
        points: '700', name: 'Jaribu Athumani', image: 'assets/cust_4.png'),
    PointsData(points: '0', name: 'Anna Kitonga', image: 'assets/cust_5.png'),
  ];
  List<String> filterDays = ["Today", "Week", "Month", "Year"];
  String selectedFilterDay = "Today";
  CalendarFormat _calendarFormat = CalendarFormat.month;
  RangeSelectionMode _rangeSelectionMode = RangeSelectionMode.toggledOn;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  DateTime? _rangeStart;
  DateTime? _rangeEnd;
  bool points = true;

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
        child: Column(
          children: <Widget>[
            SizedBox(
              height: size.height * 0.01,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    GestureDetector(
                      onPanUpdate: (details) {
                        if (details.delta.dx > 0) {
                          setState(() {
                            points = true;
                          });
                        }
                        if (details.delta.dx < 0) {
                          setState(() {
                            points = false;
                          });
                        }
                      },
                      child: points
                          ? Stack(
                              alignment: Alignment.center,
                              children: [
                                Image.asset('assets/rectangle_3.png'),
                                Positioned(
                                  bottom: 0,
                                  right: 10,
                                  child: Image.asset('assets/rectangle_4.png'),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 30.0),
                                  child: Column(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.all(10.0),
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
                                                    padding: const EdgeInsets
                                                        .symmetric(
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
                                                    Text('219', style: imgNum),
                                                    const SizedBox(height: 5.0),
                                                    Text('Customers',
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
                                                    Text('3,478,300',
                                                        style: imgNum),
                                                    const SizedBox(height: 5.0),
                                                    Text('Total issued points',
                                                        style: imgDescDark)
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
                                Image.asset('assets/rectangle_5.png'),
                                Positioned(
                                  bottom: 0,
                                  right: 10,
                                  child: Image.asset('assets/rectangle_4.png'),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 30.0),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Text('Summary', style: imgLabel),
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
                                                      "Today",
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
                                                Text('59', style: imgNum),
                                                const SizedBox(height: 5.0),
                                                Text('Customers',
                                                    style: imgDesc)
                                              ],
                                            ),
                                            const Spacer(),
                                            Image.asset('assets/line.png'),
                                            const Spacer(),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text('1,503,700',
                                                    style: imgNum),
                                                const SizedBox(height: 5.0),
                                                Text('Total redeemed points',
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
                    const SizedBox(height: 10.0),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: indicators(2, points == true ? 0 : 1),
                    ),
                    const SizedBox(height: 15.0),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20.0),
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
                    // SizedBox(height: 10.0),
                    ListView.separated(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 5),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          var data = pointsData[index];
                          return GestureDetector(
                            onTap: () => showTransaction(data),
                            child: Container(
                              color: Colors.transparent,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              height:
                                  MediaQuery.of(context).size.height * 0.055,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
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
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 36,
                                        height: 36,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(18),
                                          color: const Color(0xFFD9D9D9),
                                        ),
                                        margin:
                                            const EdgeInsets.only(right: 15),
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
                                          child: Image.asset('assets/call.png'),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) => const Divider(
                            color: Color(0XFFD9D9D9), thickness: 1),
                        itemCount: pointsData.length),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  showDatePickerDialog() {
    _rangeStart = null;
    _rangeEnd = null;
    _focusedDay = DateTime.now();
    showModalBottomSheet(
      context: context,
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
                        children: filterDays
                            .map((e) => Padding(
                                  padding: const EdgeInsets.all(1.0),
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        selectedFilterDay = e;
                                      });
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 10),
                                      margin: const EdgeInsets.only(left: 3),
                                      decoration: BoxDecoration(
                                          color: e == selectedFilterDay
                                              ? const Color(0xFFF5F5F5)
                                              : Colors.white,
                                          border: Border.all(
                                              color: e == selectedFilterDay
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
                      const SizedBox(
                        height: 10.0,
                      ),
                      Center(
                        child: Text('Select a date', style: selectDateText),
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      TableCalendar(
                        headerVisible: false,
                        firstDay: DateTime(DateTime.now().year - 1),
                        lastDay: DateTime(DateTime.now().year + 1),
                        focusedDay: _focusedDay,
                        selectedDayPredicate: (day) =>
                            isSameDay(_selectedDay, day),
                        rangeStartDay: _rangeStart,
                        rangeEndDay: _rangeEnd,
                        calendarFormat: _calendarFormat,
                        rangeSelectionMode: _rangeSelectionMode,
                        onDaySelected: (selectedDay, focusedDay) {
                          if (!isSameDay(_selectedDay, selectedDay)) {
                            setState(() {
                              _selectedDay = selectedDay;
                              _focusedDay = focusedDay;
                              _rangeStart = null;
                              _rangeEnd = null;
                              _rangeSelectionMode =
                                  RangeSelectionMode.toggledOff;
                            });
                          }
                        },
                        onRangeSelected: (start, end, focusedDay) {
                          setState(() {
                            _selectedDay = null;
                            _focusedDay = focusedDay;
                            _rangeStart = start;
                            _rangeEnd = end;
                            _rangeSelectionMode = RangeSelectionMode.toggledOn;
                          });
                        },
                        onFormatChanged: (format) {
                          if (_calendarFormat != format) {
                            setState(() {
                              _calendarFormat = format;
                            });
                          }
                        },
                        onPageChanged: (focusedDay) {
                          _focusedDay = focusedDay;
                        },
                      ),
                      const SizedBox(height: 10),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        child: TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                            // Navigator.of(context)
                            //     .push(
                            //   MaterialPageRoute(
                            //     builder:
                            //         (context) =>
                            //             Profile(),
                            //   ),
                            // );
                            print(
                                "first date ==> $_rangeStart end => $_rangeEnd");
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
      builder: (BuildContext context) {
        return Container(
          margin: const EdgeInsets.only(bottom: 50.0),
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
                    Text(data.name, style: custName),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(data.points, style: label),
                    const SizedBox(
                      height: 5,
                    ),
                    Text('Total points', style: totalText),
                    const SizedBox(
                      height: 50,
                    ),
                    Text('0723 732 770', style: numText),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Phone number',
                      style: numDesc,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => Transactions(
                              data.image,
                              data.name,
                            ),
                          ),
                        );
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

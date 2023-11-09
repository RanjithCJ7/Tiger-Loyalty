import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import '../component/home.dart';
import 'package:intl/intl.dart';

class MonthModel {
  String month;
  int index;
  MonthModel({required this.month, required this.index});
}

class HomeController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool points = true.obs;
  RxBool isFilterApplied = true.obs;
  RxString appliedFilter = "Today".obs;
  RxList<String> filterDays = ["Today", "Week", "Month", "Year"].obs;
  RxString selectedFilterDay = "Today".obs;
  TextEditingController searchController = TextEditingController();
  // CalendarFormat calendarFormat = CalendarFormat.month;
  // RangeSelectionMode rangeSelectionMode = RangeSelectionMode.toggledOn;
  DateRangePickerSelectionMode rangeMode = DateRangePickerSelectionMode.single;
  DateRangePickerView pickerView = DateRangePickerView.month;
  DateTime focusedDay = DateTime.now();
  DateTime? selectedDate =
      DateFormat("yyyy-MM-dd").parse(DateTime.now().toString());
  DateTime? rangeStart;
  DateTime? rangeEnd;

  RxList<PointsData> filterData = <PointsData>[].obs;
  RxList<PointsData> pointsData = [
    PointsData(
        points: '4,000',
        name: 'Juma hamza',
        image: 'assets/pending_1.png',
        date: "2023-11-08"),
    PointsData(
        points: '250',
        name: 'Hamisa Kichwa',
        image: 'assets/pending_2.png',
        date: "2023-11-08"),
    PointsData(
        points: '1,230',
        name: 'Jane Jackson',
        image: 'assets/pending_3.png',
        date: "2023-11-08"),
    PointsData(
        points: '700',
        name: 'Jaribu Athumani',
        image: 'assets/pending_4.png',
        date: "2023-11-05"),
    PointsData(
        points: '600',
        name: 'Jaribu Athumani',
        image: 'assets/pending_4.png',
        date: "2023-11-06"),
    PointsData(
        points: '500',
        name: 'Jaribu Athumani',
        image: 'assets/pending_4.png',
        date: "2023-11-07"),
    PointsData(
        points: '400',
        name: 'Jaribu Athumani',
        image: 'assets/pending_4.png',
        date: "2023-11-09"),
    PointsData(
        points: '300',
        name: 'Jaribu Athumani',
        image: 'assets/pending_4.png',
        date: "2023-11-10"),
    PointsData(
        points: '200',
        name: 'Jaribu Athumani',
        image: 'assets/pending_4.png',
        date: "2024-01-10"),
    PointsData(
        points: '50',
        name: 'Jaribu Athumani',
        image: 'assets/pending_4.png',
        date: "2024-02-10"),
    PointsData(
        points: '20',
        name: 'Jaribu Athumani',
        image: 'assets/pending_4.png',
        date: "2024-03-10"),
    PointsData(
        points: '10',
        name: 'Jaribu Athumani',
        image: 'assets/pending_4.png',
        date: "2024-03-10"),
  ].obs;

  List<MonthModel> monthList = [
    MonthModel(index: 1, month: 'Jan'),
    MonthModel(index: 2, month: 'Feb'),
    MonthModel(index: 3, month: 'Mar'),
    MonthModel(index: 4, month: 'Apr'),
    MonthModel(index: 5, month: 'May'),
    MonthModel(index: 6, month: 'Jun'),
    MonthModel(index: 7, month: 'Jul'),
    MonthModel(index: 8, month: 'Aug'),
    MonthModel(index: 9, month: 'Sep'),
    MonthModel(index: 10, month: 'Oct'),
    MonthModel(index: 11, month: 'Nov'),
    MonthModel(index: 12, month: 'Dec'),
  ];

  int monthIndex = 0;
  int monthIndex2 = 1;

  List<MonthModel> selectedMonth = [];

  RxList<String> yearList =
      List.generate(21, (index) => (index + 2023).toString()).obs;

  RxString selectedyear = "2023".obs;

  @override
  void onInit() {
    super.onInit();
    filterData.value = pointsData;
    // filterData.value = pointsData
    //     .where((p0) => DateTime.parse(p0.date).isAtSameMomentAs(selectedDate!))
    //     .toList();
  }

  filterListData() {
    if (selectedFilterDay.value == "Today") {
      filterData.value = pointsData
          .where(
              (p0) => DateTime.parse(p0.date).isAtSameMomentAs(selectedDate!))
          .toList();
    } else if (selectedFilterDay.value == "Week") {
      filterData.value = pointsData.where((item) {
        DateTime itemDate = DateTime.parse(item.date);
        return itemDate.isAtSameMomentAs(rangeStart!) ||
            itemDate.isAfter(rangeStart!) && itemDate.isBefore(rangeEnd!) ||
            itemDate.isAtSameMomentAs(rangeEnd!);
      }).toList();
    } else if (selectedFilterDay.value == "Month") {
      // filterData.value = pointsData.where((item) {
      //   DateTime itemDate = DateTime.parse(item.date);
      //   return selectedMonth.any((element) => element.index == itemDate.month);
      // }).toList();
      filterData.value = pointsData.where((data) {
        int itemDate = DateTime.parse(data.date).month;
        return itemDate >= monthIndex + 1 && itemDate <= monthIndex2 + 1;
      }).toList();
    } else if (selectedFilterDay.value == "Year") {
      filterData.value = pointsData.where((item) {
        DateTime itemDate = DateTime.parse(item.date);
        return int.parse(selectedyear.value) == itemDate.year;
      }).toList();
    }
  }

  searchData() {
    filterData = <PointsData>[].obs;
    if (searchController.text.isEmpty) {
      filterData.value = pointsData;
      filterListData();
    } else {
      for (var element in pointsData) {
        if (element.name
            .toLowerCase()
            .contains(searchController.text.toLowerCase())) {
          filterData.add(element);
        }
      }
      print("data ==> ${filterData.map((element) => element.name)}");
    }
  }
}

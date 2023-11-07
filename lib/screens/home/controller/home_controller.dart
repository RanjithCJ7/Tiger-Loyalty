import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

import '../component/home.dart';

class HomeController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool points = true.obs;
  String selectedToday = 'Today';
  RxList<String> selectDay = ['Today', 'Tomorrow', 'Next Week'].obs;
  RxList<String> filterDays = ["Today", "Week", "Month", "Year"].obs;
  RxString selectedFilterDay = "Today".obs;
  CalendarFormat calendarFormat = CalendarFormat.month;
  RangeSelectionMode rangeSelectionMode = RangeSelectionMode.toggledOn;
  DateTime focusedDay = DateTime.now();
  DateTime? selectedDay;
  DateTime? rangeStart;
  DateTime? rangeEnd;

  RxList<PointsData> pointsData = [
    PointsData(
        points: '4,000', name: 'Juma hamza', image: 'assets/pending_1.png'),
    PointsData(
        points: '250', name: 'Hamisa Kichwa', image: 'assets/pending_2.png'),
    PointsData(
        points: '1,230', name: 'Jane Jackson', image: 'assets/pending_3.png'),
    PointsData(
        points: '700', name: 'Jaribu Athumani', image: 'assets/pending_4.png'),
  ].obs;

  RxList<String> monthList = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec',
  ].obs;

  RxString selectedMonth = "Jan".obs;

  RxList<String> yearList = [
    '2023',
    '2024',
    '2025',
    '2026',
    '2027',
    '2028',
    '2029',
    '2030',
    '2031',
  ].obs;

  RxString selectedyear = "2023".obs;
}

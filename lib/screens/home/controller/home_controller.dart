import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:tiger_loyalty/const/Url.dart';
import 'package:tiger_loyalty/const/constant.dart';
import 'package:tiger_loyalty/screens/customer/model/customer_summary_model.dart';
import 'package:tiger_loyalty/screens/home/model/approved_points_model.dart';
import 'package:tiger_loyalty/screens/home/model/pending_points_model.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

class MonthModel {
  String month;
  int index;
  MonthModel({required this.month, required this.index});
}

class HomeController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool points = true.obs;
  RxBool isFilterApplied = true.obs;
  RxString appliedFilter = "today".obs;
  RxList<String> filterDays = ["today", "week", "month", "year"].obs;
  RxString selectedFilterDay = "today".obs;
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
  List<MonthModel> monthList = [
    MonthModel(index: 1, month: 'jan'),
    MonthModel(index: 2, month: 'feb'),
    MonthModel(index: 3, month: 'mar'),
    MonthModel(index: 4, month: 'apr'),
    MonthModel(index: 5, month: 'may'),
    MonthModel(index: 6, month: 'jun'),
    MonthModel(index: 7, month: 'jul'),
    MonthModel(index: 8, month: 'aug'),
    MonthModel(index: 9, month: 'sep'),
    MonthModel(index: 10, month: 'oct'),
    MonthModel(index: 11, month: 'nov'),
    MonthModel(index: 12, month: 'dec'),
  ];

  int monthIndex = 0;
  int monthIndex2 = 1;
  List<MonthModel> selectedMonth = [];
  RxList<String> yearList =
      List.generate(21, (index) => (index + 2023).toString()).obs;
  RxString selectedyear = "2023".obs;

  RxList<PendingPointsModel> pendingPointsList = <PendingPointsModel>[].obs;
  RxList<PendingPointsModel> allPendingPointsList = <PendingPointsModel>[].obs;
  RxList<ApprovedPointsModel> approvedPointsList = <ApprovedPointsModel>[].obs;
  RxList<ApprovedPointsModel> allApprovedPointsList =
      <ApprovedPointsModel>[].obs;
  Rx<CustomerSummaryModel> customerSummary = CustomerSummaryModel().obs;
  RxString totalApprovedPoints = "0".obs;
  RxString totalIssuedPoints = "0".obs;
  String url = "?";

  @override
  void onInit() {
    super.onInit();
    isLoading(true);
    fetchSummary(
            "?startDate=${DateFormat('dd/MM/yyyy').format(selectedDate!)}&endDate=${DateFormat('dd/MM/yyyy').format(selectedDate!)}")
        .then((value) => fetchIssuedPoints(
                    "?startDate=${DateFormat('dd/MM/yyyy').format(selectedDate!)}&endDate=${DateFormat('dd/MM/yyyy').format(selectedDate!)}")
                .then((value) => fetchApprovedPoints(
                    "?startDate=${DateFormat('dd/MM/yyyy').format(selectedDate!)}&endDate=${DateFormat('dd/MM/yyyy').format(selectedDate!)}"))
                .whenComplete(() {
              isLoading(false);
            }));
  }

  filterListData() {
    url = "?";
    if (selectedFilterDay.value == "today") {
      url +=
          "startDate=${DateFormat('MM/dd/yyyy').format(selectedDate!)}&endDate=${DateFormat('MM/dd/yyyy').format(selectedDate!)}";
    } else if (selectedFilterDay.value == "week") {
      url +=
          "startDate=${DateFormat('MM/dd/yyyy').format(rangeStart!)}&endDate=${DateFormat('MM/dd/yyyy').format(rangeEnd!)}";
    } else if (selectedFilterDay.value == "month") {
      url +=
          "startDate=${"${monthIndex + 1}/01/${DateTime.now().year}"}&endDate=${"${monthIndex2 + 1}/${DateTime(DateTime.now().year, monthIndex2 + 2, 1).subtract(Duration(days: 1)).day}/${DateTime.now().year}"}";
    } else if (selectedFilterDay.value == "year") {
      String formattedFirstDate = DateFormat('MM/dd/yyyy')
          .format(DateTime(int.parse(selectedyear.value), 1, 1));
      String formattedLastDate = DateFormat('MM/dd/yyyy')
          .format(DateTime(int.parse(selectedyear.value), 12, 31));
      url += "startDate=$formattedFirstDate&endDate=$formattedLastDate";
    }
    print("url ==> $url filter ==> ${selectedFilterDay.value}");
    fetchIssuedPoints(url);
    fetchApprovedPoints(url);
    fetchSummary(url);
  }

  searchData() {
    pendingPointsList = <PendingPointsModel>[].obs;
    approvedPointsList = <ApprovedPointsModel>[].obs;
    if (searchController.text.isEmpty) {
      pendingPointsList.value = allPendingPointsList;
      approvedPointsList.value = allApprovedPointsList;
      // filterListData();
    } else {
      for (var element in allPendingPointsList) {
        if (element.fullName!
            .toLowerCase()
            .contains(searchController.text.toLowerCase())) {
          pendingPointsList.add(element);
        }
      }
      for (var element in allApprovedPointsList) {
        if (element.fullName!
            .toLowerCase()
            .contains(searchController.text.toLowerCase())) {
          approvedPointsList.add(element);
        }
      }
    }
  }

  /* Future fetchPendingPoints() async {
    try {
      isLoading(true);

      var request = http.Request('GET', Uri.parse(Urls.pendingPointList));

      request.headers.addAll({
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${Params.userToken}'
      });

      http.StreamedResponse response = await request.send();
      var decodeData = await http.Response.fromStream(response);
      final result = jsonDecode(decodeData.body);

      if (response.statusCode == 200) {
        pendingPointsList.value = (result as List)
            .map((data) => PendingPointsModel.fromJson(data))
            .toList();
        allPendingPointsList.value = (result as List)
            .map((data) => PendingPointsModel.fromJson(data))
            .toList();

        double totalPoints =
            pendingPointsList.fold(0, (sum, point) => sum + point.points!);
        totalIssuedPoints.value = totalPoints.toString();

        isLoading(false);
      } else {
        isLoading(false);
      }
    } catch (e) {
      isLoading(false);
      rethrow;
    }
  }

  Future fetchApprovedPoints() async {
    try {
      // isLoading(true);

      var request = http.Request('GET', Uri.parse(Urls.approvedPointList));

      request.headers.addAll({
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${Params.userToken}'
      });

      http.StreamedResponse response = await request.send();
      var decodeData = await http.Response.fromStream(response);
      final result = jsonDecode(decodeData.body);

      if (response.statusCode == 200) {
        approvedPointsList.value = (result as List)
            .map((data) => ApprovedPointsModel.fromJson(data))
            .toList();
        allApprovedPointsList.value = (result as List)
            .map((data) => ApprovedPointsModel.fromJson(data))
            .toList();

        double totalPoints =
            approvedPointsList.fold(0, (sum, point) => sum + point.points!);
        totalApprovedPoints.value = totalPoints.toString();

        // isLoading(false);
      } else {
        // isLoading(false);
      }
    } catch (e) {
      // isLoading(false);
      rethrow;
    }
  } */

  Future approvePendingPoints(String id) async {
    try {
      // isLoading(true);

      var request =
          http.Request('PUT', Uri.parse("${Urls.approvePendingPoints}/$id"));

      request.headers.addAll({
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${Params.userToken}'
      });

      http.StreamedResponse response = await request.send();
      var decodeData = await http.Response.fromStream(response);
      final result = jsonDecode(decodeData.body);
      print("approvePendingPoints response ==> $result");

      if (response.statusCode == 200) {
        fetchApprovedPoints(url);
        fetchIssuedPoints(url);
        fetchSummary(url);
        // isLoading(false);
      } else {
        // isLoading(false);
      }
    } catch (e) {
      // isLoading(false);
      rethrow;
    }
  }

  Future cancelPoints(String id) async {
    try {
      // isLoading(true);

      var request =
          http.Request('DELETE', Uri.parse("${Urls.cancelPoint}/$id"));

      request.headers.addAll({
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${Params.userToken}'
      });

      http.StreamedResponse response = await request.send();
      var decodeData = await http.Response.fromStream(response);
      final result = jsonDecode(decodeData.body);
      print("cancelPoint response ==> $result");

      if (response.statusCode == 200) {
        fetchApprovedPoints(url);
        fetchIssuedPoints(url);
        fetchSummary(url);
        // isLoading(false);
      } else {
        // isLoading(false);
      }
    } catch (e) {
      // isLoading(false);
      rethrow;
    }
  }

  Future fetchIssuedPoints(String url) async {
    try {
      isLoading(true);

      var request = http.Request('GET', Uri.parse(Urls.issuedPoints + url));

      request.headers.addAll({
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${Params.userToken}'
      });

      http.StreamedResponse response = await request.send();
      var decodeData = await http.Response.fromStream(response);
      final result = jsonDecode(decodeData.body);

      if (response.statusCode == 200) {
        pendingPointsList.value = (result as List)
            .map((data) => PendingPointsModel.fromJson(data))
            .toList();
        allPendingPointsList.value = (result as List)
            .map((data) => PendingPointsModel.fromJson(data))
            .toList();

        isLoading(false);
      } else {
        isLoading(false);
      }
    } catch (e) {
      isLoading(false);
      rethrow;
    }
  }

  Future fetchApprovedPoints(String url) async {
    try {
      isLoading(true);

      var request = http.Request('GET', Uri.parse(Urls.approvedPoints + url));

      request.headers.addAll({
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${Params.userToken}'
      });

      http.StreamedResponse response = await request.send();
      var decodeData = await http.Response.fromStream(response);
      final result = jsonDecode(decodeData.body);

      if (response.statusCode == 200) {
        approvedPointsList.value = (result as List)
            .map((data) => ApprovedPointsModel.fromJson(data))
            .toList();
        allApprovedPointsList.value = (result as List)
            .map((data) => ApprovedPointsModel.fromJson(data))
            .toList();

        isLoading(false);
      } else {
        isLoading(false);
      }
    } catch (e) {
      isLoading(false);
      rethrow;
    }
  }

  Future fetchSummary(String url) async {
    try {
      isLoading(true);

      var request = http.Request('GET', Uri.parse(Urls.customerSummary + url));

      request.headers.addAll({
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${Params.userToken}'
      });

      http.StreamedResponse response = await request.send();
      var decodeData = await http.Response.fromStream(response);
      final result = jsonDecode(decodeData.body);

      if (response.statusCode == 200) {
        customerSummary.value = CustomerSummaryModel.fromJson(result);

        isLoading(false);
      } else {
        isLoading(false);
      }
    } catch (e) {
      isLoading(false);
      rethrow;
    }
  }
}

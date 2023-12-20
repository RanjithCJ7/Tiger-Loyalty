import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:intl/intl.dart';
import 'package:tiger_loyalty/const/Url.dart';
import 'package:tiger_loyalty/const/constant.dart';
import 'package:http/http.dart' as http;
import 'package:tiger_loyalty/screens/customer/model/customer_issuedpoints_model.dart';
import 'package:tiger_loyalty/screens/customer/model/customer_summary_model.dart';
import 'package:tiger_loyalty/screens/customer/model/transaction_model.dart';

class MonthModel {
  String month;
  int index;
  MonthModel({
    required this.month,
    required this.index,
  });
}

class CustomerController extends GetxController {
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
  RxList<CustomerIssuePointsModel> customerIssuedPoints =
      <CustomerIssuePointsModel>[].obs;
  RxList<CustomerIssuePointsModel> allCustomerIssuedPoints =
      <CustomerIssuePointsModel>[].obs;
  RxList<TransactionModel> transactionList = <TransactionModel>[].obs;
  Rx<CustomerSummaryModel> customerSummary = CustomerSummaryModel().obs;

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
  String initURL = "";

  @override
  void onInit() {
    super.onInit();
    initURL =
        "?startDate=${DateFormat('dd/MM/yyyy').format(selectedDate!)}&endDate=${DateFormat('dd/MM/yyyy').format(selectedDate!)}";
    fetchSummary(
            "?startDate=${DateFormat('dd/MM/yyyy').format(selectedDate!)}&endDate=${DateFormat('dd/MM/yyyy').format(selectedDate!)}")
        .then((value) => fetchIssuedPoints(
            "?startDate=${DateFormat('dd/MM/yyyy').format(selectedDate!)}&endDate=${DateFormat('dd/MM/yyyy').format(selectedDate!)}"));
  }

  filterListData() {
    String url = "?";
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
    initURL = url;
    fetchIssuedPoints(url);
    fetchSummary(url);
  }

  searchData() {
    customerIssuedPoints = <CustomerIssuePointsModel>[].obs;
    if (searchController.text.isEmpty) {
      customerIssuedPoints.value = allCustomerIssuedPoints;
      // filterListData();
    } else {
      for (var element in allCustomerIssuedPoints) {
        if (element.fullName!
            .toLowerCase()
            .contains(searchController.text.toLowerCase())) {
          customerIssuedPoints.add(element);
        }
      }
    }
  }

  Future fetchIssuedPoints(String url) async {
    try {
      isLoading(true);

      var request =
          http.Request('GET', Uri.parse(Urls.customerissuePoints + url));

      request.headers.addAll({
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${Params.userToken}'
      });

      http.StreamedResponse response = await request.send();
      var decodeData = await http.Response.fromStream(response);
      final result = jsonDecode(decodeData.body);

      if (response.statusCode == 200) {
        customerIssuedPoints.value = (result as List)
            .map((data) => CustomerIssuePointsModel.fromJson(data))
            .toList();
        allCustomerIssuedPoints.value = (result as List)
            .map((data) => CustomerIssuePointsModel.fromJson(data))
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
      print("summary ==> $result");
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

  Future fetchTransaction(String id) async {
    var link = initURL
        .replaceAll("startDate", "fromDate")
        .replaceAll("endDate", "toDate");

    try {
      var request = http.Request(
          'GET', Uri.parse("${Urls.transaction}$link&customerId=$id"));

      request.headers.addAll({
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${Params.userToken}'
      });

      http.StreamedResponse response = await request.send();
      var decodeData = await http.Response.fromStream(response);
      final result = jsonDecode(decodeData.body);

      if (response.statusCode == 200) {
        transactionList.value = (result as List)
            .map((data) => TransactionModel.fromJson(data))
            .toList();
      } else {}
    } catch (e) {
      rethrow;
    }
  }
}

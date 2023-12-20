class CustomerIssuePointsModel {
  String? userId;
  String? userName;
  String? firstName;
  String? fullName;
  String? lastName;
  String? totalPoints;
  String? status;

  CustomerIssuePointsModel(
      {this.userId,
      this.userName,
      this.firstName,
      this.fullName,
      this.lastName,
      this.totalPoints,
      this.status});

  CustomerIssuePointsModel.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    userName = json['userName'];
    firstName = json['firstName'];
    fullName = json['fullName'];
    lastName = json['lastName'];
    totalPoints = json['totalPoints'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['userName'] = this.userName;
    data['firstName'] = this.firstName;
    data['fullName'] = this.fullName;
    data['lastName'] = this.lastName;
    data['totalPoints'] = this.totalPoints;
    data['status'] = this.status;
    return data;
  }
}

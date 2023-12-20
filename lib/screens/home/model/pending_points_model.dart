class PendingPointsModel {
  String? userId;
  String? userName;
  String? firstName;
  String? fullName;
  String? lastName;
  String? totalPoints;
  String? rewardId;
  String? status;

  PendingPointsModel(
      {this.userId,
      this.userName,
      this.firstName,
      this.fullName,
      this.lastName,
      this.totalPoints,
      this.rewardId,
      this.status});

  PendingPointsModel.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    userName = json['userName'];
    firstName = json['firstName'];
    fullName = json['fullName'];
    lastName = json['lastName'];
    totalPoints = json['totalPoints'];
    rewardId = json['rewardId'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = userId;
    data['userName'] = userName;
    data['firstName'] = firstName;
    data['fullName'] = fullName;
    data['lastName'] = lastName;
    data['totalPoints'] = totalPoints;
    data['rewardId'] = rewardId;
    data['status'] = status;
    return data;
  }
}

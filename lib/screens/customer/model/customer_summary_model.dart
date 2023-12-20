class CustomerSummaryModel {
  int? issuedCustomers;
  String? issuedRewardPoints;
  int? redeemedCustomers;
  String? redeemedRewardPoints;

  CustomerSummaryModel(
      {this.issuedCustomers,
      this.issuedRewardPoints,
      this.redeemedCustomers,
      this.redeemedRewardPoints});

  CustomerSummaryModel.fromJson(Map<String, dynamic> json) {
    issuedCustomers = json['issuedCustomers'];
    issuedRewardPoints = json['issuedRewardPoints'];
    redeemedCustomers = json['redeemedCustomers'];
    redeemedRewardPoints = json['redeemedRewardPoints'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['issuedCustomers'] = this.issuedCustomers;
    data['issuedRewardPoints'] = this.issuedRewardPoints;
    data['redeemedCustomers'] = this.redeemedCustomers;
    data['redeemedRewardPoints'] = this.redeemedRewardPoints;
    return data;
  }
}

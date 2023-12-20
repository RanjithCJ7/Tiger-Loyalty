class TransactionModel {
  String? id;
  String? userId;
  String? merchantId;
  String? invoiceId;
  dynamic invoiceAmount;
  double? points;
  String? status;
  String? createdDt;
  String? updatedDt;

  TransactionModel(
      {this.id,
      this.userId,
      this.merchantId,
      this.invoiceId,
      this.invoiceAmount,
      this.points,
      this.status,
      this.createdDt,
      this.updatedDt});

  TransactionModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    merchantId = json['merchantId'];
    invoiceId = json['invoiceId'];
    invoiceAmount = json['invoiceAmount'];
    points = json['points'];
    status = json['status'];
    createdDt = json['createdDt'];
    updatedDt = json['updatedDt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['userId'] = userId;
    data['merchantId'] = merchantId;
    data['invoiceId'] = invoiceId;
    data['invoiceAmount'] = invoiceAmount;
    data['points'] = points;
    data['status'] = status;
    data['createdDt'] = createdDt;
    data['updatedDt'] = updatedDt;
    return data;
  }
}

class ReviewListModel {
  String? id;
  String? merchantId;
  String? userId;
  int? rating;
  String? comment;
  String? createdDt;
  String? updatedDt;

  ReviewListModel(
      {this.id,
      this.merchantId,
      this.userId,
      this.rating,
      this.comment,
      this.createdDt,
      this.updatedDt});

  ReviewListModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    merchantId = json['merchantId'];
    userId = json['userId'];
    rating = json['rating'];
    comment = json['comment'];
    createdDt = json['createdDt'];
    updatedDt = json['updatedDt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['merchantId'] = merchantId;
    data['userId'] = userId;
    data['rating'] = rating;
    data['comment'] = comment;
    data['createdDt'] = createdDt;
    data['updatedDt'] = updatedDt;
    return data;
  }
}

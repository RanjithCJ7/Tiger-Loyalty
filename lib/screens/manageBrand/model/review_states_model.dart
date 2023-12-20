class ReviewStatesModel {
  int? numberOfReviews;
  double? averageRating;

  ReviewStatesModel({this.numberOfReviews, this.averageRating});

  ReviewStatesModel.fromJson(Map<String, dynamic> json) {
    numberOfReviews = json['numberOfReviews'];
    averageRating = json['averageRating'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['numberOfReviews'] = numberOfReviews;
    data['averageRating'] = averageRating;
    return data;
  }
}

class ProfileModel {
  String? id;
  String? userName;
  String? phoneNumber;
  String? firstName;
  String? lastName;
  String? gender;
  String? businessName;
  String? tin;
  String? category;
  String? location;
  String? rewardNumber;
  String? merchantDetailsId;
  dynamic subscriptionPlan;
  dynamic subscriptionStatus;
  dynamic startDate;
  dynamic endDate;
  dynamic lipaNumber;
  String? image;
  dynamic businessimage;
  String? whatsapp;
  String? facebook;
  String? instagram;
  String? twitter;
  dynamic paymentStatus;
  dynamic nextDueDate;
  dynamic lastPaymentDate;
  List<RewardTable>? rewardTable;

  ProfileModel(
      {this.id,
      this.userName,
      this.phoneNumber,
      this.firstName,
      this.lastName,
      this.gender,
      this.businessName,
      this.tin,
      this.category,
      this.location,
      this.rewardNumber,
      this.merchantDetailsId,
      this.subscriptionPlan,
      this.subscriptionStatus,
      this.startDate,
      this.endDate,
      this.lipaNumber,
      this.image,
      this.businessimage,
      this.whatsapp,
      this.facebook,
      this.instagram,
      this.twitter,
      this.paymentStatus,
      this.nextDueDate,
      this.lastPaymentDate,
      this.rewardTable});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userName = json['userName'];
    phoneNumber = json['phoneNumber'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    gender = json['gender'];
    businessName = json['businessName'];
    tin = json['tin'];
    category = json['category'];
    location = json['location'];
    rewardNumber = json['rewardNumber'];
    merchantDetailsId = json['merchantDetailsId'];
    subscriptionPlan = json['subscriptionPlan'];
    subscriptionStatus = json['subscriptionStatus'];
    startDate = json['startDate'];
    endDate = json['endDate'];
    lipaNumber = json['lipaNumber'];
    image = json['image'];
    businessimage = json['businessimage'];
    whatsapp = json['whatsapp'];
    facebook = json['facebook'];
    instagram = json['instagram'];
    twitter = json['twitter'];
    paymentStatus = json['paymentStatus'];
    nextDueDate = json['nextDueDate'];
    lastPaymentDate = json['lastPaymentDate'];
    if (json['rewardTable'] != null) {
      rewardTable = <RewardTable>[];
      json['rewardTable'].forEach((v) {
        rewardTable!.add(RewardTable.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['userName'] = userName;
    data['phoneNumber'] = phoneNumber;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['gender'] = gender;
    data['businessName'] = businessName;
    data['tin'] = tin;
    data['category'] = category;
    data['location'] = location;
    data['rewardNumber'] = rewardNumber;
    data['merchantDetailsId'] = merchantDetailsId;
    data['subscriptionPlan'] = subscriptionPlan;
    data['subscriptionStatus'] = subscriptionStatus;
    data['startDate'] = startDate;
    data['endDate'] = endDate;
    data['lipaNumber'] = lipaNumber;
    data['image'] = image;
    data['businessimage'] = businessimage;
    data['whatsapp'] = whatsapp;
    data['facebook'] = facebook;
    data['instagram'] = instagram;
    data['twitter'] = twitter;
    data['paymentStatus'] = paymentStatus;
    data['nextDueDate'] = nextDueDate;
    data['lastPaymentDate'] = lastPaymentDate;
    if (rewardTable != null) {
      data['rewardTable'] = rewardTable!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class RewardTable {
  String? id;
  double? min;
  double? max;
  double? reward;

  RewardTable({this.id, this.min, this.max, this.reward});

  RewardTable.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    min = json['min'];
    max = json['max'];
    reward = json['reward'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['min'] = min;
    data['max'] = max;
    data['reward'] = reward;
    return data;
  }
}

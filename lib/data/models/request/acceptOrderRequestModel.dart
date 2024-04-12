class AcceptOrderRequestModel {
  String? userId;
  String? payId;

  AcceptOrderRequestModel({this.userId, this.payId});

  AcceptOrderRequestModel.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    payId = json['pay_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['pay_id'] = this.payId;
    return data;
  }
}

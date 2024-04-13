class RejectOrderRequestModel {
  String? userId;
  String? payId;
  String? rejectedReason;

  RejectOrderRequestModel({this.userId, this.payId, this.rejectedReason});

  RejectOrderRequestModel.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    payId = json['pay_id'];
    rejectedReason = json['rejected_reason'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['pay_id'] = this.payId;
    data['rejected_reason'] = this.rejectedReason;
    return data;
  }
}

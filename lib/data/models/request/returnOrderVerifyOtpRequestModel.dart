class ReturnOrderVerifyOtpRquestModel {
  String? userId;
  String? reason;
  String? otp;
  String? payId;

  ReturnOrderVerifyOtpRquestModel(
      {this.userId, this.reason, this.otp, this.payId});

  ReturnOrderVerifyOtpRquestModel.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    reason = json['reason'];
    otp = json['otp'];
    payId = json['pay_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['reason'] = this.reason;
    data['otp'] = this.otp;
    data['pay_id'] = this.payId;
    return data;
  }
}

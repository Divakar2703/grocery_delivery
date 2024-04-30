class DeliverOrderVerifyOtpRequestModel {
  String? userId;
  String? payId;
  String? otp;

  DeliverOrderVerifyOtpRequestModel({this.userId, this.payId, this.otp});

  DeliverOrderVerifyOtpRequestModel.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    payId = json['pay_id'];
    otp = json['otp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['pay_id'] = this.payId;
    data['otp'] = this.otp;
    return data;
  }
}

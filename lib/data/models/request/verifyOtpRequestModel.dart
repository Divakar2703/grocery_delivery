class VerifyOtpRequestModel {
  String? userId;
  String? otp;

  VerifyOtpRequestModel({this.userId, this.otp});

  VerifyOtpRequestModel.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    otp = json['otp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['otp'] = this.otp;
    return data;
  }
}
class SendOtpResponseModel {
  String? otp;
  String? userId;
  String? status;
  int? statusCode;
  String? message;

  SendOtpResponseModel(
      {this.otp, this.userId, this.status, this.statusCode, this.message});

  SendOtpResponseModel.fromJson(Map<String, dynamic> json) {
    otp = json['otp'];
    userId = json['user_id'];
    status = json['status'];
    statusCode = json['statusCode'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['otp'] = this.otp;
    data['user_id'] = this.userId;
    data['status'] = this.status;
    data['statusCode'] = this.statusCode;
    data['message'] = this.message;
    return data;
  }
}
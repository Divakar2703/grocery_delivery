class VerifyOtpResponseModel {
  String? status;
  int? statusCode;
  String? message;

  VerifyOtpResponseModel({this.status, this.statusCode, this.message});

  VerifyOtpResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    statusCode = json['statusCode'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['statusCode'] = this.statusCode;
    data['message'] = this.message;
    return data;
  }
}
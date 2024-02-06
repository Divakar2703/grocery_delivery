class RegisterResponseModel {
  String? userId;
  String? status;
  int? statusCode;
  String? message;

  RegisterResponseModel(
      {this.userId, this.status, this.statusCode, this.message});

  RegisterResponseModel.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    status = json['status'];
    statusCode = json['statusCode'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['status'] = this.status;
    data['statusCode'] = this.statusCode;
    data['message'] = this.message;
    return data;
  }
}
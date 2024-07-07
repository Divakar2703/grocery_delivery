class ClearAllNotificationRequestModel {
  String? userId;
  String? status;
  String? service;

  ClearAllNotificationRequestModel({this.userId, this.status, this.service});

  ClearAllNotificationRequestModel.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    status = json['status'];
    service = json['service'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['status'] = this.status;
    data['service'] = this.service;
    return data;
  }
}

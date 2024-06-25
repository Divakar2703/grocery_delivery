class OnlineOfflineResponseModel {
  String? onlineStauts;
  String? status;
  int? statusCode;
  String? message;

  OnlineOfflineResponseModel(
      {this.onlineStauts, this.status, this.statusCode, this.message});

  OnlineOfflineResponseModel.fromJson(Map<String, dynamic> json) {
    onlineStauts = json['online_stauts'];
    status = json['status'];
    statusCode = json['statusCode'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['online_stauts'] = this.onlineStauts;
    data['status'] = this.status;
    data['statusCode'] = this.statusCode;
    data['message'] = this.message;
    return data;
  }
}

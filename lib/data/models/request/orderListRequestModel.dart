class OrderListRequestModel {
  String? userId;
  String? type;

  OrderListRequestModel({this.userId, this.type});

  OrderListRequestModel.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['type'] = this.type;
    return data;
  }
}
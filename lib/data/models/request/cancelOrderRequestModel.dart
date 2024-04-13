class CancelOrderRequestModel {
  String? userId;
  String? comment;
  String? orderId;
  String? payId;

  CancelOrderRequestModel(
      {this.userId, this.comment, this.orderId, this.payId});

  CancelOrderRequestModel.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    comment = json['comment'];
    orderId = json['order_id'];
    payId = json['pay_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['comment'] = this.comment;
    data['order_id'] = this.orderId;
    data['pay_id'] = this.payId;
    return data;
  }
}

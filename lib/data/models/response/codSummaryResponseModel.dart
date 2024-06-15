class CodSummaryResponseModel {
  List<ListModel>? list;
  String? status;
  int? statusCode;
  String? message;

  CodSummaryResponseModel({this.list, this.status, this.statusCode, this.message});

  CodSummaryResponseModel.fromJson(Map<String, dynamic> json) {
    if (json['list'] != null) {
      list = <ListModel>[];
      json['list'].forEach((v) {
        list!.add(ListModel.fromJson(v));
      });
    }
    status = json['status'];
    statusCode = json['statusCode'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (list != null) {
      data['list'] = list!.map((v) => v.toJson()).toList();
    }
    data['status'] = status;
    data['statusCode'] = statusCode;
    data['message'] = message;
    return data;
  }
}

class ListModel {
  dynamic id;
  String? dlDate;
  String? orderId;
  String? orderDate;
  String? status;
  String? amount;

  ListModel({this.id, this.dlDate, this.orderId, this.orderDate, this.status, this.amount});

  ListModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    dlDate = json['dl_date'];
    orderId = json['order_id'];
    orderDate = json['order_date'];
    status = json['status'];
    amount = json['amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['dl_date'] = dlDate;
    data['order_id'] = orderId;
    data['order_date'] = orderDate;
    data['status'] = status;
    data['amount'] = amount;
    return data;
  }
}

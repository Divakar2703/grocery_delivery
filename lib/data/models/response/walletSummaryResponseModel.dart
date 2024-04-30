class WalletSummaryResponseModel {
  List<WalletListModel>? list;
  String? status;
  int? statusCode;
  String? message;

  WalletSummaryResponseModel({this.list, this.status, this.statusCode, this.message});

  WalletSummaryResponseModel.fromJson(Map<String, dynamic> json) {
    if (json['list'] != null) {
      list = <WalletListModel>[];
      json['list'].forEach((v) {
        list!.add(WalletListModel.fromJson(v));
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

class WalletListModel {
  int? id;
  String? entryDate;
  String? orderId;
  String? status;
  String? debit;
  String? credit;
  String? closingAmount;
  String? description;

  WalletListModel({
    this.id,
    this.entryDate,
    this.orderId,
    this.status,
    this.debit,
    this.credit,
    this.closingAmount,
    this.description,
  });

  WalletListModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    entryDate = json['entry_date'];
    orderId = json['order_id'];
    status = json['status'];
    debit = json['debit'];
    credit = json['credit'];
    closingAmount = json['closing_amount'];
    description = json['descript'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['entry_date'] = entryDate;
    data['order_id'] = orderId;
    data['status'] = status;
    data['debit'] = debit;
    data['credit'] = credit;
    data['closing_amount'] = closingAmount;
    data['descript'] = description;
    return data;
  }
}

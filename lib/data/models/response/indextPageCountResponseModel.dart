class IndextPageCountResponseModel {
  int? allOrder;
  int? pendingOrder;
  int? cancelDeliyerorder;
  int? deliverOrder;
  int? codPayment;
  int? onlinePayment;
  String? status;
  int? statusCode;
  String? message;

  IndextPageCountResponseModel(
      {this.allOrder,
        this.pendingOrder,
        this.cancelDeliyerorder,
        this.deliverOrder,
        this.codPayment,
        this.onlinePayment,
        this.status,
        this.statusCode,
        this.message});

  IndextPageCountResponseModel.fromJson(Map<String, dynamic> json) {
    allOrder = json['all order'];
    pendingOrder = json['pending order'];
    cancelDeliyerorder = json['cancel deliyerorder'];
    deliverOrder = json['deliver order'];
    codPayment = json['cod payment'];
    onlinePayment = json['online payment'];
    status = json['status'];
    statusCode = json['statusCode'];
    message = json['message'];
  }

  get record => null;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['all order'] = this.allOrder;
    data['pending order'] = this.pendingOrder;
    data['cancel deliyerorder'] = this.cancelDeliyerorder;
    data['deliver order'] = this.deliverOrder;
    data['cod payment'] = this.codPayment;
    data['online payment'] = this.onlinePayment;
    data['status'] = this.status;
    data['statusCode'] = this.statusCode;
    data['message'] = this.message;
    return data;
  }
}
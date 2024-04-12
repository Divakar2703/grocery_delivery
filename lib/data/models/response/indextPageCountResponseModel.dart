class IndextPageCountResponseModel {
  int? leaveStauts;
  int? totalOrders;
  int? packedOrders;
  int? totalShippingOrders;
  int? totalReturnOrders;
  int? totalRejectOrders;
  int? deliveryCancelOrder;
  int? completeOrders;
  int? totalCODOrders;
  int? totalOnlineOrders;
  String? totalOnlinePaymentCollection;
  String? totalCODPaymentCollection;
  String? totalPendingCODPayments;
  int? totalFoodOrders;
  int? packedFoodOrders;
  int? totalShippingFoodOrders;
  int? totalReturnFoodOrders;
  int? totalRejectFoodOrders;
  int? deliveryCancelFoodOrder;
  int? completeFoodOrders;
  int? totalCODFoodOrders;
  int? totalOnlineFoodOrders;
  String? totalOnlineFoodPaymentCollection;
  String? totalCODFoodPaymentCollection;
  String? totalPendingFoodCODPayments;
  String? status;
  int? statusCode;
  String? message;

  IndextPageCountResponseModel(
      {this.leaveStauts,
        this.totalOrders,
        this.packedOrders,
        this.totalShippingOrders,
        this.totalReturnOrders,
        this.totalRejectOrders,
        this.deliveryCancelOrder,
        this.completeOrders,
        this.totalCODOrders,
        this.totalOnlineOrders,
        this.totalOnlinePaymentCollection,
        this.totalCODPaymentCollection,
        this.totalPendingCODPayments,
        this.totalFoodOrders,
        this.packedFoodOrders,
        this.totalShippingFoodOrders,
        this.totalReturnFoodOrders,
        this.totalRejectFoodOrders,
        this.deliveryCancelFoodOrder,
        this.completeFoodOrders,
        this.totalCODFoodOrders,
        this.totalOnlineFoodOrders,
        this.totalOnlineFoodPaymentCollection,
        this.totalCODFoodPaymentCollection,
        this.totalPendingFoodCODPayments,
        this.status,
        this.statusCode,
        this.message});

  IndextPageCountResponseModel.fromJson(Map<String, dynamic> json) {
    leaveStauts = json['Leave_stauts'];
    totalOrders = json['Total Orders'];
    packedOrders = json['Packed Orders'];
    totalShippingOrders = json['Total shipping Orders'];
    totalReturnOrders = json['Total Return Orders'];
    totalRejectOrders = json['Total Reject Orders'];
    deliveryCancelOrder = json['Delivery cancel order'];
    completeOrders = json['Complete Orders'];
    totalCODOrders = json['Total COD Orders'];
    totalOnlineOrders = json['Total Online Orders'];
    totalOnlinePaymentCollection = json['Total Online Payment collection'];
    totalCODPaymentCollection = json['Total COD Payment collection'];
    totalPendingCODPayments = json['Total Pending COD Payments'];
    totalFoodOrders = json['Total Food Orders'];
    packedFoodOrders = json['Packed Food Orders'];
    totalShippingFoodOrders = json['Total shipping Food  Orders'];
    totalReturnFoodOrders = json['Total Return Food Orders'];
    totalRejectFoodOrders = json['Total Reject Food Orders'];
    deliveryCancelFoodOrder = json['Delivery cancel Food order'];
    completeFoodOrders = json['Complete Food Orders'];
    totalCODFoodOrders = json['Total COD Food Orders'];
    totalOnlineFoodOrders = json['Total Online Food Orders'];
    totalOnlineFoodPaymentCollection =
    json['Total Online Food Payment collection'];
    totalCODFoodPaymentCollection = json['Total COD Food Payment collection'];
    totalPendingFoodCODPayments = json['Total Pending Food COD Payments'];
    status = json['status'];
    statusCode = json['statusCode'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Leave_stauts'] = this.leaveStauts;
    data['Total Orders'] = this.totalOrders;
    data['Packed Orders'] = this.packedOrders;
    data['Total shipping Orders'] = this.totalShippingOrders;
    data['Total Return Orders'] = this.totalReturnOrders;
    data['Total Reject Orders'] = this.totalRejectOrders;
    data['Delivery cancel order'] = this.deliveryCancelOrder;
    data['Complete Orders'] = this.completeOrders;
    data['Total COD Orders'] = this.totalCODOrders;
    data['Total Online Orders'] = this.totalOnlineOrders;
    data['Total Online Payment collection'] = this.totalOnlinePaymentCollection;
    data['Total COD Payment collection'] = this.totalCODPaymentCollection;
    data['Total Pending COD Payments'] = this.totalPendingCODPayments;
    data['Total Food Orders'] = this.totalFoodOrders;
    data['Packed Food Orders'] = this.packedFoodOrders;
    data['Total shipping Food  Orders'] = this.totalShippingFoodOrders;
    data['Total Return Food Orders'] = this.totalReturnFoodOrders;
    data['Total Reject Food Orders'] = this.totalRejectFoodOrders;
    data['Delivery cancel Food order'] = this.deliveryCancelFoodOrder;
    data['Complete Food Orders'] = this.completeFoodOrders;
    data['Total COD Food Orders'] = this.totalCODFoodOrders;
    data['Total Online Food Orders'] = this.totalOnlineFoodOrders;
    data['Total Online Food Payment collection'] =
        this.totalOnlineFoodPaymentCollection;
    data['Total COD Food Payment collection'] =
        this.totalCODFoodPaymentCollection;
    data['Total Pending Food COD Payments'] = this.totalPendingFoodCODPayments;
    data['status'] = this.status;
    data['statusCode'] = this.statusCode;
    data['message'] = this.message;
    return data;
  }
}

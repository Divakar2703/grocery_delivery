class OrderListResponseModel {
  String? type;
  String? id;
  String? orderId;
  String? payid;
  String? amount;
  String? created;
  String? payMode;
  String? delevaryCharge;
  String? addressName;
  String? phone;
  String? email;
  String? orderStatus;
  List<Product>? product;
  String? status;
  int? statusCode;
  String? message;

  OrderListResponseModel(
      {this.type,
        this.id,
        this.orderId,
        this.payid,
        this.amount,
        this.created,
        this.payMode,
        this.delevaryCharge,
        this.addressName,
        this.phone,
        this.email,
        this.orderStatus,
        this.product,
        this.status,
        this.statusCode,
        this.message});

  OrderListResponseModel.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    id = json['id'];
    orderId = json['order_id'];
    payid = json['payid'];
    amount = json['amount'];
    created = json['created'];
    payMode = json['pay_mode'];
    delevaryCharge = json['delevary_charge'];
    addressName = json['address_name'];
    phone = json['phone'];
    email = json['email'];
    orderStatus = json['order_status'];
    if (json['product'] != null) {
      product = <Product>[];
      json['product'].forEach((v) {
        product!.add(new Product.fromJson(v));
      });
    }
    status = json['status'];
    statusCode = json['statusCode'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['id'] = this.id;
    data['order_id'] = this.orderId;
    data['payid'] = this.payid;
    data['amount'] = this.amount;
    data['created'] = this.created;
    data['pay_mode'] = this.payMode;
    data['delevary_charge'] = this.delevaryCharge;
    data['address_name'] = this.addressName;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['order_status'] = this.orderStatus;
    if (this.product != null) {
      data['product'] = this.product!.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    data['statusCode'] = this.statusCode;
    data['message'] = this.message;
    return data;
  }
}

class Product {
  String? productId;
  String? productQty;
  String? productPrice;
  String? placeid;
  String? productName;
  String? productWeight;
  String? productImage;

  Product(
      {this.productId,
        this.productQty,
        this.productPrice,
        this.placeid,
        this.productName,
        this.productWeight,
        this.productImage});

  Product.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    productQty = json['product_qty'];
    productPrice = json['product_price'];
    placeid = json['placeid'];
    productName = json['product_name'];
    productWeight = json['product_weight'];
    productImage = json['product_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_id'] = this.productId;
    data['product_qty'] = this.productQty;
    data['product_price'] = this.productPrice;
    data['placeid'] = this.placeid;
    data['product_name'] = this.productName;
    data['product_weight'] = this.productWeight;
    data['product_image'] = this.productImage;
    return data;
  }
}
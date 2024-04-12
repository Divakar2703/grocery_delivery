class OrderListResponseModel {
  List<Order>? order;
  String? status;
  int? statusCode;
  String? message;

  OrderListResponseModel(
      {this.order, this.status, this.statusCode, this.message});

  OrderListResponseModel.fromJson(Map<String, dynamic> json) {
    if (json['Order'] != null) {
      order = <Order>[];
      json['Order'].forEach((v) {
        order!.add(new Order.fromJson(v));
      });
    }
    status = json['status'];
    statusCode = json['statusCode'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.order != null) {
      data['Order'] = this.order!.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    data['statusCode'] = this.statusCode;
    data['message'] = this.message;
    return data;
  }
}

class Order {
  String? type;
  String? payid;
  String? orderID;
  String? orderDate;
  String? deliveredDate;
  String? shippingDate;
  String? returnDate;
  String? rejectDate;
  String? customerName;
  String? customerAddress;
  String? customerLatitude;
  String? customerLongitude;
  String? customerContactNo;
  String? sellerName;
  String? sellerContactno;
  String? pickUpAddress;
  String? sellerLatitude;
  String? sellerLongitude;
  String? sellerStorename;
  String? paymentMode;
  String? orderAmount;
  String? orderStatus;
  List<Product>? product;

  Order(
      {this.type,
        this.payid,
        this.orderID,
        this.orderDate,
        this.deliveredDate,
        this.shippingDate,
        this.returnDate,
        this.rejectDate,
        this.customerName,
        this.customerAddress,
        this.customerLatitude,
        this.customerLongitude,
        this.customerContactNo,
        this.sellerName,
        this.sellerContactno,
        this.pickUpAddress,
        this.sellerLatitude,
        this.sellerLongitude,
        this.sellerStorename,
        this.paymentMode,
        this.orderAmount,
        this.orderStatus,
        this.product});

  Order.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    payid = json['payid'];
    orderID = json['Order ID'];
    orderDate = json['Order Date'];
    deliveredDate = json['Delivered Date'];
    shippingDate = json['Shipping Date'];
    returnDate = json['Return Date'];
    rejectDate = json['Reject Date'];
    customerName = json['Customer Name'];
    customerAddress = json['Customer Address'];
    customerLatitude = json['Customer latitude'];
    customerLongitude = json['Customer longitude'];
    customerContactNo = json['Customer Contact no'];
    sellerName = json['Seller Name'];
    sellerContactno = json['Seller Contactno'];
    pickUpAddress = json['Pick Up Address'];
    sellerLatitude = json['Seller latitude'];
    sellerLongitude = json['Seller longitude'];
    sellerStorename = json['Seller Storename'];
    paymentMode = json['Payment Mode'];
    orderAmount = json['Order Amount'];
    orderStatus = json['order_status'];
    if (json['product'] != null) {
      product = <Product>[];
      json['product'].forEach((v) {
        product!.add(new Product.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['payid'] = this.payid;
    data['Order ID'] = this.orderID;
    data['Order Date'] = this.orderDate;
    data['Delivered Date'] = this.deliveredDate;
    data['Shipping Date'] = this.shippingDate;
    data['Return Date'] = this.returnDate;
    data['Reject Date'] = this.rejectDate;
    data['Customer Name'] = this.customerName;
    data['Customer Address'] = this.customerAddress;
    data['Customer latitude'] = this.customerLatitude;
    data['Customer longitude'] = this.customerLongitude;
    data['Customer Contact no'] = this.customerContactNo;
    data['Seller Name'] = this.sellerName;
    data['Seller Contactno'] = this.sellerContactno;
    data['Pick Up Address'] = this.pickUpAddress;
    data['Seller latitude'] = this.sellerLatitude;
    data['Seller longitude'] = this.sellerLongitude;
    data['Seller Storename'] = this.sellerStorename;
    data['Payment Mode'] = this.paymentMode;
    data['Order Amount'] = this.orderAmount;
    data['order_status'] = this.orderStatus;
    if (this.product != null) {
      data['product'] = this.product!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Product {
  String? productId;
  String? placeid;
  String? productName;
  String? sellerName;
  String? productQty;
  String? productPrice;
  String? productWeight;
  String? image;
  dynamic total;

  Product(
      {this.productId,
        this.placeid,
        this.productName,
        this.sellerName,
        this.productQty,
        this.productPrice,
        this.productWeight,
        this.image,
        this.total});

  Product.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    placeid = json['placeid'];
    productName = json['product_name'];
    sellerName = json['seller_name'];
    productQty = json['product_qty'];
    productPrice = json['product_price'];
    productWeight = json['product_weight'];
    image = json['image'];
    total = json['Total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_id'] = this.productId;
    data['placeid'] = this.placeid;
    data['product_name'] = this.productName;
    data['seller_name'] = this.sellerName;
    data['product_qty'] = this.productQty;
    data['product_price'] = this.productPrice;
    data['product_weight'] = this.productWeight;
    data['image'] = this.image;
    data['Total'] = this.total;
    return data;
  }
}

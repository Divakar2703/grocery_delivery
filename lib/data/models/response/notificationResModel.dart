class NotificationResModel {
  List<Notification>? notification;
  String? status;
  int? statusCode;
  String? message;

  NotificationResModel(
      {this.notification, this.status, this.statusCode, this.message});

  NotificationResModel.fromJson(Map<String, dynamic> json) {
    if (json['notification'] != null) {
      notification = <Notification>[];
      json['notification'].forEach((v) {
        notification!.add(new Notification.fromJson(v));
      });
    }
    status = json['status'];
    statusCode = json['statusCode'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.notification != null) {
      data['notification'] = this.notification!.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    data['statusCode'] = this.statusCode;
    data['message'] = this.message;
    return data;
  }
}

class Notification {
  String? id;
  String? createdBy;
  String? orderId;
  String? actionPage;
  String? createdDate;

  Notification(
      {this.id,
        this.createdBy,
        this.orderId,
        this.actionPage,
        this.createdDate});

  Notification.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdBy = json['created_by'];
    orderId = json['order_id'];
    actionPage = json['action_page'];
    createdDate = json['created_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['created_by'] = this.createdBy;
    data['order_id'] = this.orderId;
    data['action_page'] = this.actionPage;
    data['created_date'] = this.createdDate;
    return data;
  }
}

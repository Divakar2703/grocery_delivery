class GetPayTypeRes {
  int? status;
  String? message;
  List<Data>? data;

  GetPayTypeRes({this.status, this.message, this.data});

  GetPayTypeRes.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  String toString() {
    return 'Status: $status, Message: $message, Data: $data';
  }
}

class Data {
  String? id;
  String? type;
  String? status;
  String? createdAt;

  Data({this.id, this.type, this.status, this.createdAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    status = json['status'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = this.id;
    data['type'] = this.type;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    return data;
  }

  @override
  String toString() {
    return 'ID: $id, Type: $type, Status: $status, Created At: $createdAt';
  }
}
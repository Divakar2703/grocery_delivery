class PhoneLoginResponseModel {
  Record? record;
  String? status;
  int? statusCode;
  String? message;

  PhoneLoginResponseModel(
      {this.record, this.status, this.statusCode, this.message});

  PhoneLoginResponseModel.fromJson(Map<String, dynamic> json) {
    record =
    json['record'] != null ? new Record.fromJson(json['record']) : null;
    status = json['status'];
    statusCode = json['statusCode'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.record != null) {
      data['record'] = this.record!.toJson();
    }
    data['status'] = this.status;
    data['statusCode'] = this.statusCode;
    data['message'] = this.message;
    return data;
  }
}

class Record {
  String? id;
  String? deliUserId;
  String? name;
  String? mobileNo;
  String? pinCode;
  String? city;
  String? state;

  Record(
      {this.id,
        this.deliUserId,
        this.name,
        this.mobileNo,
        this.pinCode,
        this.city,
        this.state});

  Record.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    deliUserId = json['deli_user_id'];
    name = json['name'];
    mobileNo = json['mobile_no'];
    pinCode = json['pin_code'];
    city = json['city'];
    state = json['state'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['deli_user_id'] = this.deliUserId;
    data['name'] = this.name;
    data['mobile_no'] = this.mobileNo;
    data['pin_code'] = this.pinCode;
    data['city'] = this.city;
    data['state'] = this.state;
    return data;
  }
}

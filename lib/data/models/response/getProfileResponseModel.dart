class GetProfileResponseModel {
  String? id;
  String? deliveryboyId;
  String? name;
  String? emailId;
  String? mobileNo;
  String? address;
  String? city;
  String? state;
  String? country;
  String? pinCode;
  String? latitude;
  String? longitude;
  String? leaveStartDate;
  String? levEndDate;
  String? status;
  int? statusCode;
  String? message;

  GetProfileResponseModel(
      {this.id,
        this.deliveryboyId,
        this.name,
        this.emailId,
        this.mobileNo,
        this.address,
        this.city,
        this.state,
        this.country,
        this.pinCode,
        this.latitude,
        this.longitude,
        this.leaveStartDate,
        this.levEndDate,
        this.status,
        this.statusCode,
        this.message});

  GetProfileResponseModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    deliveryboyId = json['deliveryboy_id'];
    name = json['name'];
    emailId = json['email_id'];
    mobileNo = json['mobile_no'];
    address = json['address'];
    city = json['city'];
    state = json['state'];
    country = json['country'];
    pinCode = json['pin_code'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    leaveStartDate = json['leave_start_date'];
    levEndDate = json['lev_end_date'];
    status = json['status'];
    statusCode = json['statusCode'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['deliveryboy_id'] = this.deliveryboyId;
    data['name'] = this.name;
    data['email_id'] = this.emailId;
    data['mobile_no'] = this.mobileNo;
    data['address'] = this.address;
    data['city'] = this.city;
    data['state'] = this.state;
    data['country'] = this.country;
    data['pin_code'] = this.pinCode;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['leave_start_date'] = this.leaveStartDate;
    data['lev_end_date'] = this.levEndDate;
    data['status'] = this.status;
    data['statusCode'] = this.statusCode;
    data['message'] = this.message;
    return data;
  }
}

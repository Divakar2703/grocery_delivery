class RegisterRequestModel {
  String? name;
  String? mobileNo;
  String? emailId;
  String? pinCode;
  String? address;
  String? latitude;
  String? longitude;

  RegisterRequestModel(
      {this.name,
        this.mobileNo,
        this.emailId,
        this.pinCode,
        this.address,
        this.latitude,
        this.longitude});

  RegisterRequestModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    mobileNo = json['mobile_no'];
    emailId = json['email_id'];
    pinCode = json['pin_code'];
    address = json['address'];
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['mobile_no'] = this.mobileNo;
    data['email_id'] = this.emailId;
    data['pin_code'] = this.pinCode;
    data['address'] = this.address;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    return data;
  }
}

class RegisterRequestModel {
  String? name;
  String? mobileNo;
  String? emailId;
  String? pinCode;
  String? address;

  RegisterRequestModel(
      {this.name, this.mobileNo, this.emailId, this.pinCode, this.address});

  RegisterRequestModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    mobileNo = json['mobile_no'];
    emailId = json['email_id'];
    pinCode = json['pin_code'];
    address = json['address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['mobile_no'] = this.mobileNo;
    data['email_id'] = this.emailId;
    data['pin_code'] = this.pinCode;
    data['address'] = this.address;
    return data;
  }
}
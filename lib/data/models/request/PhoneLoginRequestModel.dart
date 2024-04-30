class PhoneLoginRequestModel {
  String? phone;
  String? fTokan;

  PhoneLoginRequestModel({this.phone, this.fTokan});

  PhoneLoginRequestModel.fromJson(Map<String, dynamic> json) {
    phone = json['phone'];
    fTokan = json['f_tokan'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['phone'] = this.phone;
    data['f_tokan'] = this.fTokan;
    return data;
  }
}

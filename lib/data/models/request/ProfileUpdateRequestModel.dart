class ProfileUpdateRequestModel {
  String? userId;
  String? name;
  String? phone;
  String? email;
  String? address;
  String? pinCode;
  String? city;
  String? state;
  String? country;

  ProfileUpdateRequestModel(
      {this.userId,
        this.name,
        this.phone,
        this.email,
        this.address,
        this.pinCode,
        this.city,
        this.state,
        this.country});

  ProfileUpdateRequestModel.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    name = json['name'];
    phone = json['phone'];
    email = json['email'];
    address = json['address'];
    pinCode = json['pin_code'];
    city = json['city'];
    state = json['state'];
    country = json['country'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['address'] = this.address;
    data['pin_code'] = this.pinCode;
    data['city'] = this.city;
    data['state'] = this.state;
    data['country'] = this.country;
    return data;
  }
}

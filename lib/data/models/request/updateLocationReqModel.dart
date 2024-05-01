class UpdateLocationReqModel {
  String? userId;
  String? latitude;
  String? longitude;

  UpdateLocationReqModel({this.userId, this.latitude, this.longitude});

  UpdateLocationReqModel.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    return data;
  }
}

class UploadProfileImageResponseModel {
  Record? record;
  String? status;
  int? statusCode;
  String? message;

  UploadProfileImageResponseModel(
      {this.record, this.status, this.statusCode, this.message});

  UploadProfileImageResponseModel.fromJson(Map<String, dynamic> json) {
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
  String? imagePhoto;

  Record({this.id, this.deliUserId, this.imagePhoto});

  Record.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    deliUserId = json['deli_user_id'];
    imagePhoto = json['image_photo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['deli_user_id'] = this.deliUserId;
    data['image_photo'] = this.imagePhoto;
    return data;
  }
}

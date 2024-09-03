class SubmitOrdCollRes {
  int? status;
  String? message;

  SubmitOrdCollRes({this.status, this.message});

  SubmitOrdCollRes.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    return data;
  }

  @override
  String toString() {
    return 'Status: $status, Message: $message';
  }

}
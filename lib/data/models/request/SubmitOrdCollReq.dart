class SubmitOrdCollReq {
  String? ordId;
  String? onlineAmt;
  String? offlineAmt;
  String? collectMode;

  SubmitOrdCollReq(
      {this.ordId, this.onlineAmt, this.offlineAmt, this.collectMode});

  SubmitOrdCollReq.fromJson(Map<String, dynamic> json) {
    ordId = json['ord_id'];
    onlineAmt = json['online_amt'];
    offlineAmt = json['offline_amt'];
    collectMode = json['collect_mode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ord_id'] = this.ordId;
    data['online_amt'] = this.onlineAmt;
    data['offline_amt'] = this.offlineAmt;
    data['collect_mode'] = this.collectMode;
    return data;
  }
}
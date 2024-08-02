class GetCustomerIdReqModel {
  String? name;
  String? email;
  String? contact;
  String? failExisting;
  String? gstin;
  Notes? notes;

  GetCustomerIdReqModel(
      {this.name,
        this.email,
        this.contact,
        this.failExisting,
        this.gstin,
        this.notes});

  GetCustomerIdReqModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    contact = json['contact'];
    failExisting = json['fail_existing'];
    gstin = json['gstin'];
    notes = json['notes'] != null ? new Notes.fromJson(json['notes']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['contact'] = this.contact;
    data['fail_existing'] = this.failExisting;
    data['gstin'] = this.gstin;
    if (this.notes != null) {
      data['notes'] = this.notes!.toJson();
    }
    return data;
  }
}

class Notes {
  String? notesKey1;
  String? notesKey2;

  Notes({this.notesKey1, this.notesKey2});

  Notes.fromJson(Map<String, dynamic> json) {
    notesKey1 = json['notes_key_1'];
    notesKey2 = json['notes_key_2'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['notes_key_1'] = this.notesKey1;
    data['notes_key_2'] = this.notesKey2;
    return data;
  }
}

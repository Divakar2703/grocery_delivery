class GetCustomerIdResModel {
  String? id;
  String? entity;
  String? name;
  String? email;
  String? contact;
  String? gstin;
  Notes? notes;
  int? createdAt;

  GetCustomerIdResModel(
      {this.id,
        this.entity,
        this.name,
        this.email,
        this.contact,
        this.gstin,
        this.notes,
        this.createdAt});

  GetCustomerIdResModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    entity = json['entity'];
    name = json['name'];
    email = json['email'];
    contact = json['contact'];
    gstin = json['gstin'];
    notes = json['notes'] != null ? new Notes.fromJson(json['notes']) : null;
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['entity'] = this.entity;
    data['name'] = this.name;
    data['email'] = this.email;
    data['contact'] = this.contact;
    data['gstin'] = this.gstin;
    if (this.notes != null) {
      data['notes'] = this.notes!.toJson();
    }
    data['created_at'] = this.createdAt;
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

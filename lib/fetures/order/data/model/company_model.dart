class CompanyModel {
  CompanyModelData? data;

  CompanyModel({this.data});

  CompanyModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? CompanyModelData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class CompanyModelData {
  String? company;
  String? description;
  String? expansion;
  String? commitment;
  String? facebook;

  CompanyModelData(
      {this.company,
      this.description,
      this.expansion,
      this.commitment,
      this.facebook});

  CompanyModelData.fromJson(Map<String, dynamic> json) {
    company = json['company'];
    description = json['description'];
    expansion = json['expansion'];
    commitment = json['commitment'];
    facebook = json['facebook'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['company'] = company;
    data['description'] = description;
    data['expansion'] = expansion;
    data['commitment'] = commitment;
    data['facebook'] = facebook;
    return data;
  }
}
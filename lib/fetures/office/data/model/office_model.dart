class GetOfficesModel {
  List<GetOfficesModelData>? offices;

  GetOfficesModel({this.offices});

  GetOfficesModel.fromJson(Map<String, dynamic> json) {
    if (json['offices'] != null) {
      offices = <GetOfficesModelData>[];
      json['offices'].forEach((v) {
        offices!.add(GetOfficesModelData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (offices != null) {
      data['offices'] = offices!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class GetOfficesModelData {
  int? id;
  int? governorateId;
  String? city;
  String? address;
  String? phone;
  String? createdAt;
  String? updatedAt;

  GetOfficesModelData(
      {this.id,
      this.governorateId,
      this.city,
      this.address,
      this.phone,
      this.createdAt,
      this.updatedAt});

  GetOfficesModelData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    governorateId = json['governorate_id'];
    city = json['city'];
    address = json['address'];
    phone = json['phone'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['governorate_id'] = governorateId;
    data['city'] = city;
    data['address'] = address;
    data['phone'] = phone;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
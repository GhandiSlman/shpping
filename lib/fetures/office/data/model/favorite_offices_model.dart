class FavoriteOfficesModel {
  List<FavoriteOfficesModelData>? data;

  FavoriteOfficesModel({this.data});

  FavoriteOfficesModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <FavoriteOfficesModelData>[];
      json['data'].forEach((v) {
        data!.add(FavoriteOfficesModelData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class FavoriteOfficesModelData {
  int? id;
  int? governorateId;
  String? city;
  String? address;
  double? latitude;
  double? longitude;
  String? phone;
  String? createdAt;
  String? updatedAt;
  Pivot? pivot;

  FavoriteOfficesModelData(
      {this.id,
      this.governorateId,
      this.city,
      this.address,
      this.latitude,
      this.longitude,
      this.phone,
      this.createdAt,
      this.updatedAt,
      this.pivot});

  FavoriteOfficesModelData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    governorateId = json['governorate_id'];
    city = json['city'];
    address = json['address'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    phone = json['phone'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    pivot = json['pivot'] != null ? Pivot.fromJson(json['pivot']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['governorate_id'] = governorateId;
    data['city'] = city;
    data['address'] = address;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['phone'] = phone;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (pivot != null) {
      data['pivot'] = pivot!.toJson();
    }
    return data;
  }
}

class Pivot {
  int? userId;
  int? officeId;

  Pivot({this.userId, this.officeId});

  Pivot.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    officeId = json['office_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = userId;
    data['office_id'] = officeId;
    return data;
  }
}
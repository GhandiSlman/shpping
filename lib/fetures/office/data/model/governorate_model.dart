class GovernorateModel {
  List<GovernorateModelData>? data;

  GovernorateModel({this.data});

  GovernorateModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <GovernorateModelData>[];
      json['data'].forEach((v) {
        data!.add(GovernorateModelData.fromJson(v));
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

class GovernorateModelData {
  int? id;
  String? name;
  String? createdAt;
  String? updatedAt;

  GovernorateModelData({this.id, this.name, this.createdAt, this.updatedAt});

  GovernorateModelData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

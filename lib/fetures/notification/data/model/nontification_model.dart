class GetNotiModel {
  List<GetNotiModelData>? data;

  GetNotiModel({this.data});

  GetNotiModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <GetNotiModelData>[];
      json['data'].forEach((v) {
        data!.add(GetNotiModelData.fromJson(v));
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

class GetNotiModelData {
  String? title;
  String? message;

  GetNotiModelData({this.title, this.message});

  GetNotiModelData.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['message'] = message;
    return data;
  }
}
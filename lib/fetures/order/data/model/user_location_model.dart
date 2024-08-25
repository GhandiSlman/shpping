class UserLocatoinModel {
  String? latitude;
  String? longitude;

  UserLocatoinModel({this.latitude, this.longitude});

  UserLocatoinModel.fromJson(Map<String, dynamic> json) {
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    return data;
  }
}
class LogoutModel {
  String? message;

  LogoutModel({this.message});

  LogoutModel.fromJson(Map<String, dynamic> json) {
    message = json['success'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = message;
    return data;
  }
}
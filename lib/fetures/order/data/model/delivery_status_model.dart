class DeliveryStatusModel {
  String? message;
  bool? isOnline;

  DeliveryStatusModel({this.message, this.isOnline});

  DeliveryStatusModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    isOnline = json['is_online'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['is_online'] = isOnline;
    return data;
  }
}
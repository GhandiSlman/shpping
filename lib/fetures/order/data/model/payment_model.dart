// ignore_for_file: non_constant_identifier_names

class PayMentModel {
  String? order_id;

  PayMentModel({this.order_id});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['order_id'] = order_id;
    return data;
  }
}

class GetPayMentModel {
  String? message;
  int? currentBalance;

  GetPayMentModel({this.message, this.currentBalance});

  GetPayMentModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    currentBalance = json['current_balance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['current_balance'] = currentBalance;
    return data;
  }
}



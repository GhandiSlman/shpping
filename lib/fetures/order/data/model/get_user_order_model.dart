class GetUserOrdersModel {
  List<GetUserOrdersModelData>? data;

  GetUserOrdersModel({this.data});

  GetUserOrdersModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <GetUserOrdersModelData>[];
      json['data'].forEach((v) {
        data!.add(GetUserOrdersModelData.fromJson(v));
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

class GetUserOrdersModelData {
  int? id;
  String? totalPrice;
  String? paymentMethod;
  String? paymentType;
  String? status;
  int? userId;
  int? fromOfficeId;
  int? toOfficeId;
  int? employeeId;
  int? customerId;
  String? createdAt;
  String? updatedAt;

  GetUserOrdersModelData(
      {this.id,
      this.totalPrice,
      this.paymentMethod,
      this.paymentType,
      this.status,
      this.userId,
      this.fromOfficeId,
      this.toOfficeId,
      this.employeeId,
      this.customerId,
      this.createdAt,
      this.updatedAt});

  GetUserOrdersModelData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    totalPrice = json['total_price'];
    paymentMethod = json['payment_method'];
    paymentType = json['payment_type'];
    status = json['status'];
    userId = json['user_id'];
    fromOfficeId = json['from_office_id'];
    toOfficeId = json['to_office_id'];
    employeeId = json['employee_id'];
    customerId = json['customer_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['total_price'] = totalPrice;
    data['payment_method'] = paymentMethod;
    data['payment_type'] = paymentType;
    data['status'] = status;
    data['user_id'] = userId;
    data['from_office_id'] = fromOfficeId;
    data['to_office_id'] = toOfficeId;
    data['employee_id'] = employeeId;
    data['customer_id'] = customerId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

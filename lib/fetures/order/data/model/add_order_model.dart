class CreateOrderModel {
  String? fromOfficeId;
  String? toOfficeId;
  String? paymentMethod;
  String? paymentType;
  int? customerId;
  String? sUser;
  String? sNationalId;
  String? sPhoneNumber;
  String? sMotherName;
  String? lat;
  String? long;
  String? sFamilyRegistration;
  String? rUser;
  String? rPhoneNumber;
  List<IncomingGoods>? incomingGoods;

  CreateOrderModel({
    this.fromOfficeId,
    this.toOfficeId,
    this.paymentMethod,
    this.paymentType,
    this.customerId,
    this.sUser,
    this.sNationalId,
    this.sPhoneNumber,
    this.sMotherName,
    this.lat,
    this.long,
    this.sFamilyRegistration,
    this.rUser,
    this.rPhoneNumber,
    this.incomingGoods,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['from_office_id'] = fromOfficeId;
    data['to_office_id'] = toOfficeId;
    data['payment_method'] = paymentMethod;
    data['payment_type'] = paymentType;
    data['customer_id'] = customerId;
    if (sUser != null) data['S_user'] = sUser;
    if (sNationalId != null) data['S_national_id'] = sNationalId;
    if (sPhoneNumber != null) data['S_phone_number'] = sPhoneNumber;
    if (sMotherName != null) data['S_mother_name'] = sMotherName;
    if (lat != null) data['latitude'] = lat;
    if (lat != null) data['longitude'] = long;
    if (sFamilyRegistration != null) {
      data['S_family_registration'] = sFamilyRegistration;
    }
    if (rUser != null) data['R_user'] = rUser;
    if (rPhoneNumber != null) data['R_phone_number'] = rPhoneNumber;
    if (incomingGoods != null) {
      data['incoming_goods'] = incomingGoods!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class GetOrderModel {
  String? status;
  String? message;
  Data? data;

  GetOrderModel({this.status, this.message, this.data});

  GetOrderModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  Order? order;
  OrderDetails? orderDetails;
  List<IncomingGoods>? incomingGoods;
  Invoice? invoice;

  Data({this.order, this.orderDetails, this.incomingGoods, this.invoice});

  Data.fromJson(Map<String, dynamic> json) {
    order = json['order'] != null ? Order.fromJson(json['order']) : null;
    orderDetails = json['orderDetails'] != null
        ? OrderDetails.fromJson(json['orderDetails'])
        : null;
    if (json['incomingGoods'] != null) {
      incomingGoods = <IncomingGoods>[];
      json['incomingGoods'].forEach((v) {
        incomingGoods!.add(IncomingGoods.fromJson(v));
      });
    }
    invoice =
        json['invoice'] != null ? Invoice.fromJson(json['invoice']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (order != null) {
      data['order'] = order!.toJson();
    }
    if (orderDetails != null) {
      data['orderDetails'] = orderDetails!.toJson();
    }
    if (incomingGoods != null) {
      data['incomingGoods'] = incomingGoods!.map((v) => v.toJson()).toList();
    }
    if (invoice != null) {
      data['invoice'] = invoice!.toJson();
    }
    return data;
  }
}

class Order {
  int? employeeId;
  int? userId;
  String? fromOfficeId;
  String? toOfficeId;
  String? status;
  String? paymentMethod;
  String? paymentType;
  int? customerId;
  String? updatedAt;
  String? createdAt;
  int? id;
  int? totalPrice;

  Order(
      {this.employeeId,
      this.userId,
      this.fromOfficeId,
      this.toOfficeId,
      this.status,
      this.paymentMethod,
      this.paymentType,
      this.customerId,
      this.updatedAt,
      this.createdAt,
      this.id,
      this.totalPrice});

  Order.fromJson(Map<String, dynamic> json) {
    employeeId = json['employee_id'];
    userId = json['user_id'];
    fromOfficeId = json['from_office_id'];
    toOfficeId = json['to_office_id'];
    status = json['status'];
    paymentMethod = json['payment_method'];
    paymentType = json['payment_type'];
    customerId = json['customer_id'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
    totalPrice = json['total_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['employee_id'] = employeeId;
    data['user_id'] = userId;
    data['from_office_id'] = fromOfficeId;
    data['to_office_id'] = toOfficeId;
    data['status'] = status;
    data['payment_method'] = paymentMethod;
    data['payment_type'] = paymentType;
    data['customer_id'] = customerId;
    data['updated_at'] = updatedAt;
    data['created_at'] = createdAt;
    data['id'] = id;
    data['total_price'] = totalPrice;
    return data;
  }
}

class OrderDetails {
  int? orderId;
  String? sUser;
  String? sNationalId;
  String? sPhoneNumber;
  String? sMotherName;
  String? sLocation;
  String? sFamilyRegistration;
  String? rUser;
  String? rPhoneNumber;
  String? updatedAt;
  String? createdAt;
  int? id;

  OrderDetails(
      {this.orderId,
      this.sUser,
      this.sNationalId,
      this.sPhoneNumber,
      this.sMotherName,
      this.sLocation,
      this.sFamilyRegistration,
      this.rUser,
      this.rPhoneNumber,
      this.updatedAt,
      this.createdAt,
      this.id});

  OrderDetails.fromJson(Map<String, dynamic> json) {
    orderId = json['order_id'];
    sUser = json['S_user'];
    sNationalId = json['S_national_id'];
    sPhoneNumber = json['S_phone_number'];
    sMotherName = json['S_mother_name'];
    sLocation = json['S_Location'];
    sFamilyRegistration = json['S_family_registration'];
    rUser = json['R_user'];
    rPhoneNumber = json['R_phone_number'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['order_id'] = orderId;
    data['S_user'] = sUser;
    data['S_national_id'] = sNationalId;
    data['S_phone_number'] = sPhoneNumber;
    data['S_mother_name'] = sMotherName;
    data['S_Location'] = sLocation;
    data['S_family_registration'] = sFamilyRegistration;
    data['R_user'] = rUser;
    data['R_phone_number'] = rPhoneNumber;
    data['updated_at'] = updatedAt;
    data['created_at'] = createdAt;
    data['id'] = id;
    return data;
  }
}

class IncomingGoods {
  String? goodName;
  String? quantity;
  String? weight;
  int? orderId;
  int? warehouseId;
  String? status;
  int? price;
  String? updatedAt;
  String? createdAt;
  int? id;

  IncomingGoods(
      {this.goodName,
      this.quantity,
      this.weight,
      this.orderId,
      this.warehouseId,
      this.status,
      this.price,
      this.updatedAt,
      this.createdAt,
      this.id});

  IncomingGoods.fromJson(Map<String, dynamic> json) {
    goodName = json['good_name'];
    quantity = json['quantity'];
    weight = json['weight'];
    orderId = json['order_id'];
    warehouseId = json['warehouse_id'];
    status = json['status'];
    price = json['price'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['good_name'] = goodName;
    data['quantity'] = quantity;
    data['weight'] = weight;
    data['order_id'] = orderId;
    data['warehouse_id'] = warehouseId;
    data['status'] = status;
    data['price'] = price;
    data['updated_at'] = updatedAt;
    data['created_at'] = createdAt;
    data['id'] = id;
    return data;
  }
}

class Invoice {
  int? orderId;
  String? status;
  int? value;
  String? paymentMethod;
  String? officeId;
  String? updatedAt;
  String? createdAt;
  int? id;

  Invoice(
      {this.orderId,
      this.status,
      this.value,
      this.paymentMethod,
      this.officeId,
      this.updatedAt,
      this.createdAt,
      this.id});

  Invoice.fromJson(Map<String, dynamic> json) {
    orderId = json['order_id'];
    status = json['status'];
    value = json['value'];
    paymentMethod = json['payment_method'];
    officeId = json['office_id'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['order_id'] = orderId;
    data['status'] = status;
    data['value'] = value;
    data['payment_method'] = paymentMethod;
    data['office_id'] = officeId;
    data['updated_at'] = updatedAt;
    data['created_at'] = createdAt;
    data['id'] = id;
    return data;
  }
}

class LoginModel {
  String email;
  String password;
  String fcm;
  LoginModel({
    required this.email,
    required this.password,
    required this.fcm,
  });

  Map<String, dynamic> toJson() {
    return {'email': email, 'password': password, 'fcm_token': fcm};
  }
}

class GetLoginModel {
  String? status;
  String? message;
  Data? data;

  GetLoginModel({this.status, this.message, this.data});

  GetLoginModel.fromJson(Map<String, dynamic> json) {
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
  User? user;
  String? token;

  Data({this.user, this.token});

  Data.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['token'] = token;
    return data;
  }
}

class User {
  int? id;
  String? email;
  bool? emailVerifiedAt;
  String? firstName;
  String? lastName;
  String? fatherName;
  int? isOnline;
  String? motherName;
  int? isVerified;
  String? nationalNumber;
  String? phone;
  String? createdAt;
  String? updatedAt;
  String? fcmToken;
  String? role;

  User(
      {this.id,
      this.email,
      this.emailVerifiedAt,
      this.firstName,
      this.lastName,
      this.fatherName,
      this.isOnline,
      this.motherName,
      this.isVerified,
      this.nationalNumber,
      this.phone,
      this.createdAt,
      this.updatedAt,
      this.fcmToken,
      this.role});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    fatherName = json['father_name'];
    isOnline = json['is_online'];
    motherName = json['mother_name'];
    isVerified = json['is_verified'];
    nationalNumber = json['national_number'];
    phone = json['phone'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    fcmToken = json['fcm_token'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['email'] = email;
    data['email_verified_at'] = emailVerifiedAt;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['father_name'] = fatherName;
    data['is_online'] = isOnline;
    data['mother_name'] = motherName;
    data['is_verified'] = isVerified;
    data['national_number'] = nationalNumber;
    data['phone'] = phone;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['fcm_token'] = fcmToken;
    data['role'] = role;
    return data;
  }
}
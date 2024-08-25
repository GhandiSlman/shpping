class SignUpModel {
  String? firstName;
  String? lastName;
  String? email;
  String? fatherName;
  String? motherName;
  String? nationalNumber;
  String? phone;
  String? password;
  String? passwordConfirm;
  String? fcm;

  SignUpModel(
      {this.firstName,
      this.lastName,
      this.email,
      this.fatherName,
      this.motherName,
      this.nationalNumber,
      this.password,
      this.passwordConfirm,
      this.phone,
      this.fcm,
      });

  Map<String, dynamic> toJson() {
    return {
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'father_name': fatherName,
      'mother_name': motherName,
      'national_number': nationalNumber,
      'phone': phone,
      'password': password,
      'password_confirmation': passwordConfirm,
      'fcm_token':fcm,
    };
  }
}

class GetSignUpModel {
  String? status;
  String? message;
  GetSignUpModelData? data;

  GetSignUpModel({this.status, this.message, this.data});

  GetSignUpModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? GetSignUpModelData.fromJson(json['data']) : null;
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

class GetSignUpModelData {
  User? user;
  String? token;

  GetSignUpModelData({this.user, this.token});

  GetSignUpModelData.fromJson(Map<String, dynamic> json) {
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
  String? email;
  String? firstName;
  String? lastName;
  String? fatherName;
  String? motherName;
  String? nationalNumber;
  String? phone;
  String? updatedAt;
  String? createdAt;
  int? id;
  String? role;

  User(
      {this.email,
      this.firstName,
      this.lastName,
      this.fatherName,
      this.motherName,
      this.nationalNumber,
      this.phone,
      this.updatedAt,
      this.createdAt,
      this.id,
      this.role});

  User.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    fatherName = json['father_name'];
    motherName = json['mother_name'];
    nationalNumber = json['national_number'];
    phone = json['phone'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['father_name'] = fatherName;
    data['mother_name'] = motherName;
    data['national_number'] = nationalNumber;
    data['phone'] = phone;
    data['updated_at'] = updatedAt;
    data['created_at'] = createdAt;
    data['id'] = id;
    data['role'] = role;
    return data;
  }
}

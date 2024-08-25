class ForgetPasswordModel {
  String? email;

  ForgetPasswordModel(this.email);

  Map<String, dynamic> toJson() {
    return {'email': email};
  }
}

class GetForgetPasswordModel {
  String? message;

  GetForgetPasswordModel({this.message});

  GetForgetPasswordModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
  }
}

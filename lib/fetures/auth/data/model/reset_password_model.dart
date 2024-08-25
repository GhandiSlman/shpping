class ResetPasswordModel {
  String? code;
  String? newPassword;
  String? confirmPass;

  ResetPasswordModel(this.code , this.newPassword , this.confirmPass);
  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'password': newPassword,
      'password_confirmation': confirmPass,
    };
  }
}

class GetResetPasswordModel {
  String? message;

  GetResetPasswordModel(this.message);

  GetResetPasswordModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
  }
}

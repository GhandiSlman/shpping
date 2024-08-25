class CheckCodeModel {
  String code;

  CheckCodeModel({required this.code});

  Map<String, dynamic> toJson() {
    return {'code': code};
  }
}

class GetCheckCodeModel {
  String? message;

  GetCheckCodeModel(this.message);

  GetCheckCodeModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
  }
}

import 'package:logistech/core/data/data_repo.dart';
import 'package:logistech/core/data/data_state.dart';
import 'package:logistech/fetures/auth/data/model/check_code_model.dart';
import 'package:logistech/fetures/auth/data/model/forget_password_model.dart';
import 'package:logistech/fetures/auth/data/model/login_model.dart';
import 'package:logistech/fetures/auth/data/model/reset_password_model.dart';
import 'package:logistech/fetures/auth/data/model/sign_up_model.dart';
import 'package:logistech/fetures/auth/data/repo/auth_repo.dart';

class AuthRepoImp implements AuthRepo {
  final DataService _dataService;
  AuthRepoImp(this._dataService);

  @override
  Future<DataState> signUp({required SignUpModel signUpModel}) async {
    final response = await _dataService.postData(
        endPoint: 'register',
        data: signUpModel.toJson(),
        fromJson: GetSignUpModel.fromJson);
    return response;
  }

  @override
  Future<DataState> login({required LoginModel loginModel}) async {
    final response = await _dataService.postData(
      endPoint: 'login',
      data: loginModel.toJson(),
      //  baseUrl: baseUrl,
      fromJson: GetLoginModel.fromJson,
    );
    return response;
  }

  @override
  Future<DataState> forgetPassword(
      {required ForgetPasswordModel forgetPasswordModel}) async {
    final response = await _dataService.postData(
        endPoint: 'password/forget',
        data: forgetPasswordModel.toJson(),
        fromJson: GetForgetPasswordModel.fromJson);
    return response;
  }

  @override
  Future<DataState> resetPassword(
      {required ResetPasswordModel resetPasswordModel}) async {
    final response = await _dataService.postData(
        endPoint: 'password/reset',
        data: resetPasswordModel.toJson(),
        fromJson: GetResetPasswordModel.fromJson);
    return response;
  }

  @override
  Future<DataState> verifyCode({required CheckCodeModel checkCodeModel}) async {
    final response = await _dataService.postData(
        endPoint: 'validate/code',
        data: checkCodeModel.toJson(),
        fromJson: GetCheckCodeModel.fromJson);
    return response;
  }

  @override
  Future<DataState> logOut() async {
    final response =
        await _dataService.getData(endPoint: 'logout',
        fromJson: (Map<String, dynamic> json) => GetLoginModel.fromJson(json),
        );
    return response;
  }
}

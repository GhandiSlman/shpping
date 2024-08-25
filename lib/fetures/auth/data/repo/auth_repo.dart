import 'package:logistech/core/data/data_state.dart';
import 'package:logistech/fetures/auth/data/model/check_code_model.dart';
import 'package:logistech/fetures/auth/data/model/forget_password_model.dart';
import 'package:logistech/fetures/auth/data/model/login_model.dart';
import 'package:logistech/fetures/auth/data/model/logout_model.dart';
import 'package:logistech/fetures/auth/data/model/reset_password_model.dart';
import 'package:logistech/fetures/auth/data/model/sign_up_model.dart';

abstract class AuthRepo {
  Future<DataState> signUp({required SignUpModel signUpModel});

  Future<DataState> login({required LoginModel loginModel});

  Future<DataState> forgetPassword(
      {required ForgetPasswordModel forgetPasswordModel});

  Future<DataState> resetPassword(
      {required ResetPasswordModel resetPasswordModel});

  Future<DataState> verifyCode({required CheckCodeModel checkCodeModel});
  Future<DataState> logOut({required LogoutModel logoutModel});
}

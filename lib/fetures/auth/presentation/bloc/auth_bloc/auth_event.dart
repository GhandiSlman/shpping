// ignore_for_file: must_be_immutable

part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class SignUpEvent extends AuthEvent {
  final SignUpModel signUpModel;
  const SignUpEvent({required this.signUpModel});

  @override
  List<Object> get props => [signUpModel];
}

class LoginEvent extends AuthEvent {
  final LoginModel loginModel;
  const LoginEvent({required this.loginModel});

  @override
  List<Object> get props => [loginModel];
}

class ForgetPasswordEvent extends AuthEvent {
  final ForgetPasswordModel forgetPasswordModel;

  const ForgetPasswordEvent({
    required this.forgetPasswordModel,
  });

  @override
  List<Object> get props => [
        forgetPasswordModel,
      ];
}

class VerifyCodeEvent extends AuthEvent {
  final CheckCodeModel checkCodeModel;
  const VerifyCodeEvent({required this.checkCodeModel});

  @override
  List<Object> get props => [checkCodeModel];
}

class ResetPasswordEvent extends AuthEvent {
  final ResetPasswordModel resetPasswordModel;
  const ResetPasswordEvent({required this.resetPasswordModel});

  @override
  List<Object> get props => [resetPasswordModel];
}

class LogOutEvent extends AuthEvent {
  String token;
  LogOutEvent({required this.token});
    @override
  List<Object> get props => [token];
}

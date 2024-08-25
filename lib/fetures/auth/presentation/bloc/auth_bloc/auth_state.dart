part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {}

// Login States
class LoginLoadingState extends AuthState {}

class LoginLoadedState extends AuthState {}

class LoginErrorState extends AuthState {}

// SignUp States
class SignUpLoadingState extends AuthState {}

class SignUpLoadedState extends AuthState {}

class SignUpErrorState extends AuthState {}

// ForgetPassword States
class ForgetPasswordLoadingState extends AuthState {}

class ForgetPasswordLoadedState extends AuthState {}

class ForgetPasswordErrorState extends AuthState {}

// // Verify Code States
class VerifyCodeLoadingState extends AuthState {}

class VerifyCodeLoadedState extends AuthState {}

class VerifyCodeErrorState extends AuthState {}

// Reset Password States
class ResetPasswordLoadingState extends AuthState {}

class ResetPasswordLoadedState extends AuthState {}

class ResetPasswordErrorState extends AuthState {}

//Logout

class LogoutLoadingState extends AuthState {}

class LogoutLoadedState extends AuthState {}

class LogoutErrorState extends AuthState {}



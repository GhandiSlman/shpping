import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:logistech/core/const/app_consts.dart';

import 'package:logistech/core/const/color.dart';
import 'package:logistech/core/data/data_state.dart';
import 'package:logistech/core/utils/app_router.dart';
import 'package:logistech/core/widget/custom_toast.dart';
import 'package:logistech/fetures/auth/data/model/check_code_model.dart';
import 'package:logistech/fetures/auth/data/model/forget_password_model.dart';
import 'package:logistech/fetures/auth/data/model/login_model.dart';
import 'package:logistech/fetures/auth/data/model/logout_model.dart';
import 'package:logistech/fetures/auth/data/model/reset_password_model.dart';
import 'package:logistech/fetures/auth/data/model/sign_up_model.dart';
import 'package:logistech/fetures/auth/data/repo/auth_repo.dart';
import 'package:logistech/main.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepo _authRepo;

  AuthBloc(this._authRepo) : super(AuthInitial()) {
    on<SignUpEvent>((event, emit) async {
      emit(SignUpLoadingState());
      final DataState dataState =
          await _authRepo.signUp(signUpModel: event.signUpModel);
      if (dataState is DataSuccess<GetSignUpModel>) {
        await box.write('token', dataState.data!.data!.token);
        await box.write('role', dataState.data!.data!.user!.role);
        await box.write('first_name', dataState.data!.data!.user!.firstName);
        await box.write('last_name', dataState.data!.data!.user!.lastName);
        await box.write('father_name', dataState.data!.data!.user!.fatherName);
        await box.write('mother_name', dataState.data!.data!.user!.motherName);
        await box.write('email', dataState.data!.data!.user!.email);
        await box.write('phone', dataState.data!.data!.user!.phone);
        await box.write('national', dataState.data!.data!.user!.nationalNumber);

        emit(SignUpLoadedState());
      } else if (dataState is DataFailed) {
        emit(SignUpErrorState());
        CustomToast.showToast(
          message: dataState.errorMessage!,
          backgroundColor: AppColor.redColor,
          fontSize: 15.sp,
          gravity: ToastGravity.BOTTOM,
          textColor: AppColor.whiteColor,
          toastDuration: 2,
        );
      }
    });

    on<LoginEvent>((event, emit) async {
      emit(LoginLoadingState());
      final DataState dataState =
          await _authRepo.login(loginModel: event.loginModel);
      if (dataState is DataSuccess<GetLoginModel>) {
        await box.write('token', dataState.data!.data!.token);
        await box.write('role', dataState.data!.data!.user!.role);
        await box.write('first_name', dataState.data!.data!.user!.firstName);
        await box.write('last_name', dataState.data!.data!.user!.lastName);
        await box.write('father_name', dataState.data!.data!.user!.fatherName);
        await box.write('mother_name', dataState.data!.data!.user!.motherName);
        await box.write('email', dataState.data!.data!.user!.email);
        await box.write('phone', dataState.data!.data!.user!.phone);
        await box.write(
            'national_number', dataState.data!.data!.user!.nationalNumber);
        emit(LoginLoadedState());
      } else if (dataState is DataFailed) {
        emit(LoginErrorState());
        CustomToast.showToast(
          message: dataState.errorMessage!,
          backgroundColor: AppColor.redColor,
          fontSize: 15.sp,
          gravity: ToastGravity.BOTTOM,
          textColor: AppColor.whiteColor,
          toastDuration: 2,
        );
      }
    });

    on<ForgetPasswordEvent>((event, emit) async {
      emit(ForgetPasswordLoadingState());
      final dataState = await _authRepo.forgetPassword(
          forgetPasswordModel: event.forgetPasswordModel);
      if (dataState is DataSuccess<GetForgetPasswordModel>) {
        emit(ForgetPasswordLoadedState());
        CustomToast.showToast(
          message: dataState.data!.message!,
          backgroundColor: AppColor.greenColor,
          fontSize: 15.sp,
          gravity: ToastGravity.BOTTOM,
          textColor: AppColor.whiteColor,
          toastDuration: 2,
        );
      } else if (dataState is DataFailed) {
        emit(ForgetPasswordErrorState());

        CustomToast.showToast(
          message: dataState.errorMessage!,
          backgroundColor: AppColor.redColor,
          fontSize: 15.sp,
          gravity: ToastGravity.BOTTOM,
          textColor: AppColor.whiteColor,
          toastDuration: 2,
        );
      }
    });
    on<VerifyCodeEvent>((event, emit) async {
      emit(VerifyCodeLoadingState());
      final result =
          await _authRepo.verifyCode(checkCodeModel: event.checkCodeModel);
      if (result is DataSuccess<GetCheckCodeModel>) {
        emit(VerifyCodeLoadedState());
        CustomToast.showToast(
          message: result.data!.message!,
          backgroundColor: AppColor.greenColor,
          fontSize: 15.sp,
          gravity: ToastGravity.BOTTOM,
          textColor: AppColor.whiteColor,
          toastDuration: 2,
        );
      } else if (result is DataFailed) {
        emit(VerifyCodeErrorState());
        CustomToast.showToast(
          message: result.errorMessage!,
          backgroundColor: AppColor.redColor,
          fontSize: 15.sp,
          gravity: ToastGravity.BOTTOM,
          textColor: AppColor.whiteColor,
          toastDuration: 2,
        );
      }
    });
    on<ResetPasswordEvent>((event, emit) async {
      emit(ResetPasswordLoadingState());
      final dataState = await _authRepo.resetPassword(
          resetPasswordModel: event.resetPasswordModel);
      if (dataState is DataSuccess<GetResetPasswordModel>) {
        emit(ResetPasswordLoadedState());
        CustomToast.showToast(
          message: dataState.data!.message!,
          backgroundColor: AppColor.greenColor,
          fontSize: 15.sp,
          gravity: ToastGravity.BOTTOM,
          textColor: AppColor.whiteColor,
          toastDuration: 2,
        );
      } else if (dataState is DataFailed) {
        emit(ResetPasswordErrorState());
        CustomToast.showToast(
          message: dataState.errorMessage!,
          backgroundColor: AppColor.redColor,
          fontSize: 15.sp,
          gravity: ToastGravity.BOTTOM,
          textColor: AppColor.whiteColor,
          toastDuration: 2,
        );
      }
    });
    on<LogOutEvent>((event, emit) async {
      emit(LogoutLoadingState());
      final result = await _authRepo.logOut(logoutModel: LogoutModel());
      if (result is DataSuccess<LogoutModel>) {
        emit(LogoutLoadedState());
        box
            .remove('token')
            .then((value) => navigatorKey.currentState?.pushNamedAndRemoveUntil(
                  AppRouter.loginScreen,
                  (route) => false,
                ));
      } else if (state is DataFailed) {
        emit(LogoutErrorState());
        CustomToast.showToast(
          message: result.errorMessage!,
          backgroundColor: AppColor.redColor,
          fontSize: 15.sp,
          gravity: ToastGravity.BOTTOM,
          textColor: AppColor.whiteColor,
          toastDuration: 2,
        );
      }
    });
  }
}

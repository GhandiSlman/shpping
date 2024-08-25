// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_validator/form_validator.dart';
import 'package:iconsax/iconsax.dart';
import 'package:logistech/core/const/color.dart';
import 'package:logistech/core/utils/app_router.dart';
import 'package:logistech/core/widget/custom_app-bar.dart';
import 'package:logistech/core/widget/loading_widget.dart';
import 'package:logistech/fetures/auth/data/model/sign_up_model.dart';
import 'package:logistech/fetures/auth/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:logistech/fetures/auth/presentation/bloc/hide_show_password_bloc/bloc/hs_password_bloc.dart';
import 'package:logistech/fetures/auth/presentation/widgets/btn_widget.dart';
import 'package:logistech/fetures/auth/presentation/widgets/icon_btn_widget.dart';
import 'package:logistech/fetures/auth/presentation/widgets/text_btn.dart';
import 'package:logistech/fetures/auth/presentation/widgets/text_field_widget.dart';
import 'package:logistech/fetures/auth/presentation/widgets/text_widget.dart';
import 'package:logistech/main.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController fatherName = TextEditingController();
  TextEditingController motherName = TextEditingController();
  TextEditingController nationalNumber = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController passwordCon = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'New account',
       leading: IconBtnWidget(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Iconsax.arrow_left_2)),
      ),
      body: Padding(
        padding: EdgeInsets.only(right: 20.w, left: 20.w),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Column(
                children: [
                  40.verticalSpace,
                  Row(
                    children: [
                      Expanded(
                        child: TextFieldWidget(
                          controller: firstName,
                          hintText: 'First name',
                          keyboardType: TextInputType.name,
                          validator: ValidationBuilder().minLength(1).build(),
                        ),
                      ),
                      10.horizontalSpace,
                      Expanded(
                        child: TextFieldWidget(
                          controller: lastName,
                          hintText: 'Last name',
                          keyboardType: TextInputType.name,
                          validator: ValidationBuilder().minLength(1).build(),
                        ),
                      ),
                    ],
                  ),
                  10.verticalSpace,
                  Row(
                    children: [
                      Expanded(
                        child: TextFieldWidget(
                          controller: fatherName,
                          hintText: 'Father name',
                          keyboardType: TextInputType.name,
                          validator: ValidationBuilder().minLength(1).build(),
                        ),
                      ),
                      10.horizontalSpace,
                      Expanded(
                        child: TextFieldWidget(
                          controller: motherName,
                          hintText: 'Mother name',
                          keyboardType: TextInputType.name,
                          validator: ValidationBuilder().minLength(1).build(),
                        ),
                      ),
                    ],
                  ),
                  10.verticalSpace,
                  TextFieldWidget(
                    controller: email,
                    hintText: 'Email',
                    keyboardType: TextInputType.emailAddress,
                    validator: ValidationBuilder().email().build(),
                  ),
                  10.verticalSpace,
                  TextFieldWidget(
                    controller: nationalNumber,
                    hintText: 'National number',
                    keyboardType: TextInputType.number,
                    validator: ValidationBuilder().minLength(11).build(),
                  ),
                  10.verticalSpace,
                  TextFieldWidget(
                    controller: phoneNumber,
                    hintText: 'Phone number',
                    keyboardType: TextInputType.number,
                    validator: ValidationBuilder().phone().build(),
                  ),
                  10.verticalSpace,
                  BlocBuilder<HsPasswordBloc, HsPasswordState>(builder: (context, state) {
                    final isPasswordHidden = state is PasswordHideShowState &&
                        state.isPasswordHidden;

                    return TextFieldWidget(
                      obscureText: !isPasswordHidden,
                      hintText: 'Password',
                      controller: password,
                      suffixIcon: IconButton(
                        icon: Icon(
                          !isPasswordHidden ? Iconsax.eye4 : Iconsax.eye_slash5,
                        ),
                        color: AppColor.lightGrey,
                        onPressed: () {
                          BlocProvider.of<HsPasswordBloc>(context).add(
                              HidePasswordEvent(hideOrShow: !isPasswordHidden));
                        },
                      ),
                      validator: ValidationBuilder().minLength(8).build(),
                    );
                  }),
                  10.verticalSpace,
                  BlocBuilder<HsPasswordBloc, HsPasswordState>(builder: (context, state) {
                    final isPasswordHidden = state is PasswordHideShowState &&
                        state.isPasswordHidden;

                    return TextFieldWidget(
                      obscureText: !isPasswordHidden,
                      hintText: 'Password Confirmation',
                      controller: passwordCon,
                      suffixIcon: IconButton(
                        icon: Icon(
                          !isPasswordHidden ? Iconsax.eye4 : Iconsax.eye_slash5,
                        ),
                        color: AppColor.lightGrey,
                        onPressed: () {
                          BlocProvider.of<HsPasswordBloc>(context).add(
                              HidePasswordEvent(hideOrShow: !isPasswordHidden));
                        },
                      ),
                      validator: ValidationBuilder()
                          .minLength(
                        8,
                      )
                          .add((value) {
                        if (value != password.text) {
                          return "Passwords don't match";
                        }
                        return null;
                      }).build(),
                    );
                  }),
                  20.verticalSpace,
                  BlocListener<AuthBloc, AuthState>(
                    listener: (context, state) {
                      if (state is SignUpLoadedState) {
                        Navigator.of(context).pushNamedAndRemoveUntil(
                          AppRouter.homeScreen,
                          (route) => false,
                        );
                      }
                    },
                    child: BlocBuilder<AuthBloc, AuthState>(
                      builder: (context, state) {
                        return state is SignUpLoadingState
                            ? LoadingWidget(
                                color: AppColor.primary,
                                border: Border.all(),
                              )
                            : BtnWidget(
                                onTap: () {
                                  if (_formKey.currentState!.validate()) {
                                    BlocProvider.of<AuthBloc>(context).add(
                                        SignUpEvent(
                                            signUpModel: SignUpModel(
                                                firstName: firstName.text,
                                                lastName: lastName.text,
                                                email: email.text,
                                                fatherName: fatherName.text,
                                                motherName: motherName.text,
                                                nationalNumber:
                                                    nationalNumber.text,
                                                phone: phoneNumber.text,
                                                password: password.text,
                                                passwordConfirm:
                                                    passwordCon.text,
                                                    fcm: fcmToken,
                                                    )));
                                  }
                                },
                                color: AppColor.primary,
                                text: 'Create new account',
                                textColor: Colors.white,
                              );
                      },
                    ),
                  ),
                  10.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextWidget(
                        text: "Already have an account? ",
                        color: AppColor.lightGrey,
                        fontSize: 15.sp,
                      ),
                      TextBtn(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        color: AppColor.primary,
                        fontSize: 15.sp,
                        text: 'Login',
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

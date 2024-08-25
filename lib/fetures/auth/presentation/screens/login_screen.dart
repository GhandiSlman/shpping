// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_validator/form_validator.dart';
import 'package:iconsax/iconsax.dart';

import 'package:logistech/core/const/color.dart';
import 'package:logistech/core/utils/app_router.dart';
import 'package:logistech/core/widget/loading_widget.dart';
import 'package:logistech/fetures/auth/data/model/login_model.dart';
import 'package:logistech/fetures/auth/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:logistech/fetures/auth/presentation/bloc/hide_show_password_bloc/bloc/hs_password_bloc.dart';
import 'package:logistech/fetures/auth/presentation/screens/forget_password_screen.dart';
import 'package:logistech/fetures/auth/presentation/screens/sign_up_screen.dart';
import 'package:logistech/fetures/auth/presentation/widgets/btn_widget.dart';
import 'package:logistech/fetures/auth/presentation/widgets/text_btn.dart';
import 'package:logistech/fetures/auth/presentation/widgets/text_field_widget.dart';
import 'package:logistech/fetures/auth/presentation/widgets/text_widget.dart';
import 'package:logistech/main.dart';
import 'package:logistech/test.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: EdgeInsets.only(right: 20.w, left: 20.w),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                Column(
                  children: [
                    150.verticalSpace,
                    TextWidget(
                      text: 'Login',
                      fontSize: 25.sp,
                      fontWeight: FontWeight.bold,
                    ),
                    10.verticalSpace,
                    TextFieldWidget(
                      hintText: 'Email',
                      controller: email,
                      keyboardType: TextInputType.emailAddress,
                      validator: ValidationBuilder().email().build(),
                    ),
                    10.verticalSpace,
                    BlocBuilder<HsPasswordBloc, HsPasswordState>(
                      builder: (context, state) {
                        final isPasswordHidden =
                            BlocProvider.of<HsPasswordBloc>(context)
                                .isPasswordHidden;

                        return TextFieldWidget(
                          obscureText: !isPasswordHidden,
                          hintText: 'Password',
                          controller: password,
                          suffixIcon: IconButton(
                            icon: Icon(
                              !isPasswordHidden
                                  ? Iconsax.eye4
                                  : Iconsax.eye_slash5,
                            ),
                            color: AppColor.lightGrey,
                            onPressed: () {
                              BlocProvider.of<HsPasswordBloc>(context).add(
                                HidePasswordEvent(
                                    hideOrShow: !isPasswordHidden),
                              );
                            },
                          ),
                          validator: ValidationBuilder().minLength(8).build(),
                        );
                      },
                    ),
                    10.verticalSpace,
                    Padding(
                        padding: EdgeInsets.only(left: 150.w),
                        child: TextBtn(
                          onPressed: () {
                            Navigator.of(context)
                                .push(Slider1(Page: ForgetPasswordScreen()));
                          },
                          color: AppColor.primary,
                          fontSize: 20.sp,
                          text: 'Forget password ?',
                        )),
                    10.verticalSpace,
                    BlocListener<AuthBloc, AuthState>(
                      listener: (context, state) {
                        if (state is LoginLoadedState) {
                          Navigator.of(context).pushNamedAndRemoveUntil(
                            AppRouter.homeScreen,
                            (route) => false,
                          );
                        }
                      },
                      child: BlocBuilder<AuthBloc, AuthState>(
                          builder: (context, state) {
                        return state is LoginLoadingState
                            ? LoadingWidget(
                                color: AppColor.primary,
                                border: Border.all(),
                              )
                            : BtnWidget(
                                onTap: () async {
                                  if (_formKey.currentState!.validate()) {
                                 //   if (fcmToken != null) {
                                      BlocProvider.of<AuthBloc>(context).add(
                                        LoginEvent(
                                          loginModel: LoginModel(
                                            email: email.text,
                                            password: password.text,
                                            fcm: fcmToken!,
                                          ),
                                        ),
                                      );
                                   // }
                                  }
                                },
                                color: AppColor.primary,
                                text: 'Login',
                                width: double.infinity,
                                textColor: Colors.white,
                              );
                      }),
                    ),
                    10.verticalSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextWidget(
                          text: "You don't have an account ?",
                          color: AppColor.lightGrey,
                          fontSize: 15.sp,
                        ),
                        TextBtn(
                          onPressed: () {
                            Navigator.of(context)
                                .push(Slider1(Page: SignUpScreen()));
                          },
                          color: AppColor.primary,
                          fontSize: 15.sp,
                          text: 'Create one',
                        )
                      ],
                    ),
                  ],
                )
              ],
            ),
          )),
    );
  }
}

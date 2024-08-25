// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_validator/form_validator.dart';
import 'package:iconsax/iconsax.dart';
import 'package:logistech/core/const/color.dart';
import 'package:logistech/core/utils/app_router.dart';
import 'package:logistech/core/widget/custom_app-bar.dart';
import 'package:logistech/fetures/auth/data/model/reset_password_model.dart';
import 'package:logistech/fetures/auth/presentation/bloc/hide_show_password_bloc/bloc/hs_password_bloc.dart';
import 'package:logistech/fetures/auth/presentation/widgets/btn_widget.dart';
import 'package:logistech/fetures/auth/presentation/widgets/icon_btn_widget.dart';
import 'package:logistech/fetures/auth/presentation/widgets/text_field_widget.dart';
import 'package:logistech/fetures/auth/presentation/widgets/text_widget.dart';
import 'package:logistech/fetures/auth/presentation/bloc/auth_bloc/auth_bloc.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  TextEditingController newPasswordController = TextEditingController();

  TextEditingController confirmPasswordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final String otpCode = arguments['code'];
    return Scaffold(
      appBar:  CustomAppBar(title: 'New password',
       leading: IconBtnWidget(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Iconsax.arrow_left_2)),
      ),
      body: Padding(
        padding: EdgeInsets.only(right: 20.w, left: 20.w),
        child: ListView(
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                     BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
                      return state is ResetPasswordLoadingState
                          ? LinearProgressIndicator(
                              color: AppColor.primary,
                            )
                          : const SizedBox();}),
                  20.verticalSpace,
                  TextWidget(
                    text: "Please, Enter your new password to login.",
                    color: AppColor.lightGrey,
                    fontSize: 15.sp,
                  ),
                  20.verticalSpace,
                  BlocBuilder<HsPasswordBloc, HsPasswordState>(builder: (context, state) {
                    final isPasswordHidden = state is PasswordHideShowState &&
                        state.isPasswordHidden;

                    return TextFieldWidget(
                      obscureText: !isPasswordHidden,
                      hintText: 'Password',
                      controller: newPasswordController,
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
                      hintText: 'Confirm password',
                      controller: confirmPasswordController,
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
                        if (value != newPasswordController.text) {
                          return "Passwords don't match";
                        }
                        return null;
                      }).build(),
                    );
                  }),
                  20.verticalSpace,
                  BlocListener<AuthBloc, AuthState>(
                    listener: (context, state) {
                      if (state is ResetPasswordLoadedState) {
                        Navigator.of(context).pushNamedAndRemoveUntil(
                          AppRouter.loginScreen,
                          (route) => false,
                        );
                      }
                    },
                    child: BlocBuilder<AuthBloc, AuthState>(
                        builder: (context, state) {
                      return state is ResetPasswordLoadingState
                          ? const SizedBox()
                          : BtnWidget(
                              onTap: () {
                                if (_formKey.currentState!.validate()) {
                                  BlocProvider.of<AuthBloc>(context).add(
                                      ResetPasswordEvent(
                                          resetPasswordModel:
                                              ResetPasswordModel(
                                                  otpCode,
                                                  newPasswordController.text,
                                                  confirmPasswordController
                                                      .text)));
                                }
                              },
                              color: AppColor.primary,
                              text: 'Create new password',
                              width: double.infinity,
                              textColor: Colors.white,
                            );
                    }),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

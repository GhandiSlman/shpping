// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_validator/form_validator.dart';
import 'package:iconsax/iconsax.dart';
import 'package:logistech/core/const/color.dart';
import 'package:logistech/core/utils/app_router.dart';
import 'package:logistech/core/widget/custom_app-bar.dart';
import 'package:logistech/fetures/auth/data/model/forget_password_model.dart';
import 'package:logistech/fetures/auth/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:logistech/fetures/auth/presentation/widgets/btn_widget.dart';
import 'package:logistech/fetures/auth/presentation/widgets/icon_btn_widget.dart';
import 'package:logistech/fetures/auth/presentation/widgets/text_field_widget.dart';
import 'package:logistech/fetures/auth/presentation/widgets/text_widget.dart';

class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({super.key});
  TextEditingController email = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:  CustomAppBar(title: 'Forget password',
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
                      return state is ForgetPasswordLoadingState
                          ? LinearProgressIndicator(
                              color: AppColor.primary,
                            )
                          : const SizedBox();
                    }),
                    20.verticalSpace,
                    TextWidget(
                      text:
                          "Don't worry, just write your email and we will send the verfication code.",
                      color: AppColor.lightGrey,
                      fontSize: 15.sp,
                    ),
                    20.verticalSpace,
                    TextFieldWidget(
                      validator: ValidationBuilder().email().build(),
                      hintText: 'Email',
                      controller: email,
                    ),
                    20.verticalSpace,
                    BlocListener<AuthBloc, AuthState>(
                        listener: (context, state) {
                      if (state is ForgetPasswordLoadedState) {
                        Navigator.of(context).pushNamed(
                          AppRouter.checkCodeScreen,
                        );
                      }
                    }, child: BlocBuilder<AuthBloc, AuthState>(
                            builder: (context, state) {
                      return state is ForgetPasswordLoadingState
                          ? const SizedBox()
                          : BtnWidget(
                              onTap: () {
                                if (_formKey.currentState!.validate()) {
                                  BlocProvider.of<AuthBloc>(context).add(
                                    ForgetPasswordEvent(
                                      forgetPasswordModel: ForgetPasswordModel(
                                        email.text,
                                      ),
                                    ),
                                  );
                                }
                              },
                              color: AppColor.primary,
                              text: 'Forget my password',
                              textColor: Colors.white,
                            );
                    }))
                  ],
                ),
              )
            ],
          ),
        ));
  }
}

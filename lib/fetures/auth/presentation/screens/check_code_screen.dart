import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:iconsax/iconsax.dart';
import 'package:logistech/core/utils/color.dart';
import 'package:logistech/core/utils/app_router.dart';
import 'package:logistech/core/widget/custom_app-bar.dart';
import 'package:logistech/core/widget/custom_toast.dart';
import 'package:logistech/core/widget/otp_widget.dart';
import 'package:logistech/fetures/auth/data/model/check_code_model.dart';
import 'package:logistech/fetures/auth/presentation/bloc/auth_bloc/auth_bloc.dart';

import 'package:logistech/fetures/auth/presentation/widgets/btn_widget.dart';
import 'package:logistech/fetures/auth/presentation/widgets/icon_btn_widget.dart';

import 'package:logistech/fetures/auth/presentation/widgets/text_widget.dart';

class CheckCodeScreen extends StatelessWidget {
  CheckCodeScreen({super.key});
  final List<TextEditingController?> _otpControllers =
      List.generate(4, (index) => TextEditingController());

  @override
  Widget build(BuildContext context) {
    String otpCode = '';
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Check my code',
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
            Column(
              children: [
                BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
                      return state is VerifyCodeLoadingState
                          ? LinearProgressIndicator(
                              color: AppColor.primary,
                            )
                          : const SizedBox();
                    }),
                20.verticalSpace,
                TextWidget(
                  text: "Enter the code that we sent to your email.",
                  color: AppColor.lightGrey,
                  fontSize: 15.sp,
                ),
                20.verticalSpace,
                OtpWidget(
                  handleControllers: (controllers) {
                    for (int i = 0; i < controllers.length; i++) {
                      _otpControllers[i] = controllers[i];
                    }
                  },
                ),
                20.verticalSpace,
                BlocListener<AuthBloc, AuthState>(
                  listener: (context, state) {
                    if (state is VerifyCodeLoadedState) {
                      Navigator.of(context).pushNamed(
                          AppRouter.newPasswordScreen,
                          arguments: {'code': otpCode});
                    }
                  },
                  child: BlocBuilder<AuthBloc, AuthState>(
                    builder: (context, state) {
                      return state is VerifyCodeLoadingState
                          ? const SizedBox()
                          : BtnWidget(
                              color: AppColor.primary,
                              text: 'Check code',
                              textColor: Colors.white,
                              onTap: () {
                                otpCode = _otpControllers
                                    .map((controller) => controller!.text)
                                    .join();
                                if (otpCode.length == 4) {
                                  BlocProvider.of<AuthBloc>(context).add(
                                      VerifyCodeEvent(
                                          checkCodeModel:
                                              CheckCodeModel(code: otpCode)));
                                } else {
                                  CustomToast.showToast(
                                    message: 'Complete the otp.',
                                    backgroundColor: AppColor.redColor,
                                    fontSize: 15.sp,
                                    gravity: ToastGravity.BOTTOM,
                                    textColor: AppColor.whiteColor,
                                    toastDuration: 2,
                                  );
                                }
                              },
                            );
                    },
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

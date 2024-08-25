import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:logistech/core/const/app_consts.dart';
import 'package:logistech/core/const/color.dart';
import 'package:logistech/core/widget/custom_app-bar.dart';
import 'package:logistech/core/widget/loading_widget.dart';
import 'package:logistech/core/widget/logout_btn_widget.dart';
import 'package:logistech/fetures/auth/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:logistech/fetures/auth/presentation/widgets/text_widget.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Profile',
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: AnimationLimiter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: AnimationConfiguration.toStaggeredList(
              duration: const Duration(milliseconds: 500),
              childAnimationBuilder: (widget) => SlideAnimation(
                horizontalOffset: 100.0,
                child: FadeInAnimation(
                  child: widget,
                ),
              ),
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextWidget(
                      text: box.read('first_name'),
                      color: AppColor.primary,
                      fontSize: 30.sp,
                    ),
                    5.horizontalSpace,
                    TextWidget(
                      text: box.read('last_name'),
                      color: AppColor.primary,
                      fontSize: 30.sp,
                    ),
                  ],
                ),
                40.verticalSpace,
                Row(
                  children: [
                    Icon(
                      Iconsax.profile_2user,
                      color: AppColor.primary,
                    ),
                    5.horizontalSpace,
                    TextWidget(
                      text: box.read('father_name'),
                      color: AppColor.greayColor,
                      fontSize: 15.sp,
                    ),
                  ],
                ),
                10.verticalSpace,
                Row(
                  children: [
                    Icon(
                      Iconsax.profile_2user,
                      color: AppColor.primary,
                    ),
                    5.horizontalSpace,
                    TextWidget(
                      text: box.read('mother_name'),
                      color: AppColor.greayColor,
                      fontSize: 15.sp,
                    ),
                  ],
                ),
                10.verticalSpace,
                Row(
                  children: [
                    Icon(
                      Iconsax.sms,
                      color: AppColor.primary,
                    ),
                    5.horizontalSpace,
                    TextWidget(
                      text: box.read('email'),
                      color: AppColor.greayColor,
                      fontSize: 15.sp,
                    ),
                  ],
                ),
                10.verticalSpace,
                Row(
                  children: [
                    Icon(
                      Iconsax.call,
                      color: AppColor.primary,
                    ),
                    5.horizontalSpace,
                    TextWidget(
                      text: box.read('phone'),
                      color: AppColor.greayColor,
                      fontSize: 15.sp,
                    ),
                  ],
                ),
                10.verticalSpace,
                // Row(
                //   children: [
                //     Icon(
                //       Iconsax.card,
                //       color: AppColor.primary,
                //     ),
                //     5.horizontalSpace,
                //     TextWidget(
                //       text: box.read('national'),
                //       color: AppColor.greayColor,
                //       fontSize: 15.sp,
                //     ),
                //   ],
                // ),
                100.verticalSpace,
                const Divider(),
                10.verticalSpace,
                BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
                  return state is LogoutLoadingState
                      ? LoadingWidget(
                          color: AppColor.redColor,
                        )
                      : LogOutBtnWidget(
                          onPressed: () {
                            context.read<AuthBloc>().add(
                                  LogOutEvent(token: box.read('token')),
                                );
                            Navigator.of(context).pop();
                          },
                        );
                }),
                10.verticalSpace,
                const Divider(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

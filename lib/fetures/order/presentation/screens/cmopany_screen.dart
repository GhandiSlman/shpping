import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:iconsax/iconsax.dart';
import 'package:logistech/core/const/app_consts.dart';
import 'package:logistech/core/const/color.dart';
import 'package:logistech/core/const/images.dart';
import 'package:logistech/core/widget/custom_app-bar.dart';
import 'package:logistech/core/widget/no_internet.dart';
import 'package:logistech/fetures/notification/presentation/bloc/notification_bloc.dart';
import 'package:logistech/fetures/notification/presentation/screens/noti_screen.dart';
import 'package:logistech/fetures/order/presentation/bloc/company/company_bloc.dart';
import 'package:logistech/fetures/order/presentation/screens/step_one_add_order_screen.dart';
import 'package:logistech/fetures/order/presentation/widgets/company_card.dart';
import 'package:logistech/fetures/order/presentation/widgets/company_shimmer_widget.dart';
import 'package:logistech/test.dart';

class CompanyScreen extends StatelessWidget {
  const CompanyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<CompanyBloc>().add(GetCompanyInfoEvent());
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(Slider1(Page: StepOneAddOrderScreen()));
        },
        backgroundColor: AppColor.primary,
        child: Icon(
          Icons.add,
          color: AppColor.whiteColor,
        ),
      ),
      appBar: CustomAppBar(
        title: 'Home',
        leading: BlocBuilder<NotificationBloc, NotificationState>(
          builder: (context, notificationState) {
            bool hasNewNotification = false;

            if (notificationState is GetNotificationState) {
              hasNewNotification = notificationState.hasNewNotification;
            }

            return IconButton(
              onPressed: () {
                Navigator.of(context).push(Slider3(Page: const NotiScreen()));
                BlocProvider.of<NotificationBloc>(context)
                    .add(NotificationClearedEvent());
              },
              icon:  Stack(
                children: [
                  const Icon(Iconsax.notification4),
                  if (hasNewNotification && box.read('role') == 'client')
                    Positioned(
                      left: 0,
                      top: 0,
                      child: Container(
                        width: 8.w,
                        height: 8.h,
                        decoration: BoxDecoration(
                          color: AppColor.primary,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                ],
              ),
            );
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: BlocBuilder<CompanyBloc, CompanyState>(
          builder: (context, state) {
            if (state is GetCompanyInfoLoafedState) {
              return SingleChildScrollView(
                child: AnimationLimiter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: AnimationConfiguration.toStaggeredList(
                      duration: const Duration(milliseconds: 1000),
                      childAnimationBuilder: (widget) => SlideAnimation(
                        horizontalOffset: 100.0,
                        child: FadeInAnimation(
                          child: widget,
                        ),
                      ),
                      children: [
                        // Company Logo
                        Padding(
                          padding: EdgeInsets.only(top: 20.h, bottom: 20.h),
                          child: Center(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15.r),
                              child: Image.asset(
                                AppImages.companyLogoImage,
                                height: 120.h,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),

                        CompanyCard(
                          getCompanyInfoLoafedState: state,
                          commit: state.companyModelData.commitment!,
                          desc: state.companyModelData.description!,
                          expan: state.companyModelData.expansion!,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            } else if (state is GetCompanyInfoLoadingState) {
              return const CompanyShimmer();
            } else if (state is GetCompanyInfoErrorState) {
              return NoInternetWidget(onTap: () {
                context.read<CompanyBloc>().add(GetCompanyInfoEvent());
              });
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}

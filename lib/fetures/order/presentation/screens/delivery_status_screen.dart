import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:logistech/core/const/app_consts.dart';
import 'package:logistech/core/const/color.dart';
import 'package:logistech/core/widget/custom_app-bar.dart';
import 'package:logistech/core/widget/loading_widget.dart';
import 'package:logistech/fetures/auth/presentation/widgets/btn_widget.dart';
import 'package:logistech/fetures/auth/presentation/widgets/text_widget.dart';
import 'package:logistech/fetures/order/presentation/bloc/delivery/delivery_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class DeliveryStatusScreen extends StatelessWidget {
  const DeliveryStatusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Delivery status',
      ),
      body: Padding(
        padding: EdgeInsets.all(20.h),
        child: Center(
          child: AnimationLimiter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
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
                    children: [
                      TextWidget(
                        text: 'Hello ',
                        color: AppColor.primary,
                        fontSize: 25.sp,
                      ),
                      TextWidget(
                        text:
                            'Mr.${box.read('first_name')} ${box.read('last_name')}',
                        color: AppColor.lightGrey,
                        fontSize: 20.sp,
                      ),
                    ],
                  ),
                  10.verticalSpace,
                  TextWidget(
                    text:
                        "Let's keep delivering excellence together, please update your status when you start work.",
                    color: AppColor.secoundPrimary,
                  ),
                  50.verticalSpace,
                  BlocBuilder<DeliveryBloc, DeliveryState>(
                    builder: (context, state) {
                      if (state is DeliveryStatusLoadingState) {
                        return LoadingWidget(
                          color: AppColor.primary,
                        );
                      } else {
                        return Column(
                          children: AnimationConfiguration.toStaggeredList(
                            duration: const Duration(milliseconds: 500),
                            childAnimationBuilder: (widget) => SlideAnimation(
                              horizontalOffset: 100.0,
                              child: FadeInAnimation(
                                child: widget,
                              ),
                            ),
                            children: [
                              BtnWidget(
                                text: 'Update',
                                onTap: () {
                                  context
                                      .read<DeliveryBloc>()
                                      .add((GetDeliveryStatusEvent()));
                                },
                                color: AppColor.primary,
                                width: double.infinity,
                                textColor: AppColor.whiteColor,
                              ),
                            ],
                          ),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

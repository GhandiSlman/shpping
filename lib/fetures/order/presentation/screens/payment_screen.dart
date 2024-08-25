import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:iconsax/iconsax.dart';
import 'package:logistech/core/utils/app_consts.dart';
import 'package:logistech/core/utils/color.dart';
import 'package:logistech/core/utils/app_router.dart';
import 'package:logistech/core/widget/custom_app-bar.dart';
import 'package:logistech/core/widget/custom_toast.dart';
import 'package:logistech/fetures/auth/presentation/widgets/btn_widget.dart';
import 'package:logistech/fetures/auth/presentation/widgets/icon_btn_widget.dart';
import 'package:logistech/fetures/auth/presentation/widgets/text_widget.dart';
import 'package:logistech/fetures/order/data/model/payment_model.dart';
import 'package:logistech/fetures/order/presentation/bloc/order/order_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class PayMentScreen extends StatelessWidget {
  const PayMentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Payment',
        leading: IconBtnWidget(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Iconsax.arrow_left_2),
        ),
      ),
      body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
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
                    BlocBuilder<OrderBloc, OrderState>(
                        builder: (context, state) {
                      return state is PayMentLoadingState
                          ? LinearProgressIndicator(
                              color: AppColor.primary,
                            )
                          : const SizedBox();
                    }),
                    20.verticalSpace,
                    TextWidget(
                      text: 'This is the cost of your order.',
                      color: AppColor.lightGrey,
                      fontSize: 15.sp,
                    ),
                    20.verticalSpace,
                    TextWidget(
                      text: "${box.read('price').toString()} S.P",
                      color: AppColor.primary,
                      fontSize: 50.h,
                    ),
                    50.verticalSpace,
                    BlocListener<OrderBloc, OrderState>(
                        listener: (context, state) {
                      if (state is PayMentLoadedState) {
                        Navigator.of(context).pushNamedAndRemoveUntil(
                          AppRouter.homeScreen,
                          (route) => false,
                        );
                      }
                    }, child: BlocBuilder<OrderBloc, OrderState>(
                            builder: (context, state) {
                      return state is PayMentLoadingState
                          ? const SizedBox()
                          : Column(
                              children: AnimationConfiguration.toStaggeredList(
                                duration: const Duration(milliseconds: 500),
                                childAnimationBuilder: (widget) =>
                                    SlideAnimation(
                                  horizontalOffset: 100.0,
                                  child: FadeInAnimation(
                                    child: widget,
                                  ),
                                ),
                                children: [
                                  BtnWidget(
                                    text: 'Pay now',
                                    onTap: () {
                                      BlocProvider.of<OrderBloc>(context).add(
                                        PayMentEvent(
                                            payMentModel: PayMentModel(
                                          order_id:
                                              box.read('order_id').toString(),
                                        )),
                                      );
                                    },
                                    color: AppColor.primary,
                                    textColor: AppColor.whiteColor,
                                    width: double.infinity,
                                  ),
                                  20.verticalSpace,
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.of(context)
                                          .pushNamedAndRemoveUntil(
                                              AppRouter.homeScreen,
                                              (route) => false);
                                      CustomToast.showToast(
                                        message: 'We will remind you to pay.',
                                        backgroundColor: AppColor.greenColor,
                                        fontSize: 15.sp,
                                        gravity: ToastGravity.BOTTOM,
                                        textColor: AppColor.whiteColor,
                                        toastDuration: 5,
                                        isLongDuration: true,
                                      );
                                    },
                                    child: Container(
                                      width: double.infinity,
                                      height: 40.h,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: AppColor.primary),
                                          borderRadius:
                                              BorderRadius.circular(10.r)),
                                      child: Center(
                                          child: TextWidget(
                                        text: 'Skip',
                                        color: AppColor.primary,
                                      )),
                                    ),
                                  ),
                                ],
                              ),
                            );
                    }))
                  ],
                ),
              ),
            ),
          )),
    );
  }
}

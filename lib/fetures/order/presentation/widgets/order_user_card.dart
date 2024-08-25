import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:iconsax/iconsax.dart';
import 'package:logistech/core/const/app_consts.dart';
import 'package:logistech/core/const/color.dart';
import 'package:logistech/core/widget/custom_dialog.dart';
import 'package:logistech/fetures/auth/presentation/widgets/text_widget.dart';
import 'package:logistech/fetures/order/presentation/bloc/order/order_bloc.dart';
import 'package:logistech/fetures/order/presentation/screens/location_screen.dart';
import 'package:logistech/test.dart';

class OrderUserCard extends StatelessWidget {
  final String price;
  final String payMethod;
  final String payType;
  final String status;
  final int index;
  final String sourceOfficeId;
  final String orderId;

  const OrderUserCard({
    required this.price,
    required this.payMethod,
    required this.payType,
    required this.status,
    required this.index,
    required this.sourceOfficeId,
    required this.orderId,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SlideAnimation(
      verticalOffset: 100.0,
      child: FadeInAnimation(
        child: Container(
          width: double.infinity,
          height: 150.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.sp),
            gradient: LinearGradient(
              colors: [AppColor.primary.withOpacity(0.1), Colors.grey[200]!],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Stack(
            children: [
              // Decorative circles
              Positioned(
                top: -20.h,
                right: -20.w,
                child: CircleAvatar(
                  radius: 40.r,
                  backgroundColor: AppColor.primary.withOpacity(0.2),
                ),
              ),
              Positioned(
                bottom: -20.h,
                left: -20.w,
                child: CircleAvatar(
                  radius: 60.r,
                  backgroundColor: AppColor.primary.withOpacity(0.2),
                ),
              ),
              // Card content
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                child: AnimationLimiter(
                  child: AnimationConfiguration.staggeredList(
                    position: index,
                    duration: const Duration(milliseconds: 1000),
                    child: SlideAnimation(
                      horizontalOffset: 100.0,
                      child: FadeInAnimation(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Iconsax.money_send,
                                  color: AppColor.primary,
                                  size: 22.sp,
                                ),
                                10.horizontalSpace,
                                Expanded(
                                  child: AutoSizeText(
                                    price,
                                    maxLines: 1,
                                    minFontSize: 15.sp,
                                    maxFontSize: 15.sp,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      color: AppColor.blackColor,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            8.verticalSpace,
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Iconsax.wallet,
                                  color: AppColor.primary,
                                  size: 22.sp,
                                ),
                                10.horizontalSpace,
                                Expanded(
                                  child: AutoSizeText(
                                    payMethod,
                                    maxLines: 1,
                                    minFontSize: 15.sp,
                                    maxFontSize: 15.sp,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      color: AppColor.blackColor,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            8.verticalSpace,
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Iconsax.card,
                                  color: AppColor.primary,
                                  size: 22.sp,
                                ),
                                10.horizontalSpace,
                                Expanded(
                                  child: AutoSizeText(
                                    payType,
                                    maxLines: 1,
                                    minFontSize: 15.sp,
                                    maxFontSize: 15.sp,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      color: AppColor.blackColor,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            8.verticalSpace,
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Iconsax.refresh,
                                  color: AppColor.primary,
                                  size: 22.sp,
                                ),
                                SizedBox(width: 10.w),
                                Expanded(
                                  child: AutoSizeText(
                                    status,
                                    maxLines: 1,
                                    minFontSize: 15.sp,
                                    maxFontSize: 15.sp,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      color: AppColor.blackColor,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              if (box.read('role') == 'delivery')
                Positioned(
                  top: 10.h,
                  right: 10.w,
                  child: IconButton(
                    tooltip: 'Show location',
                    icon: Icon(Iconsax.location,
                        color: AppColor.primary, size: 24.sp),
                    onPressed: () {
                      Navigator.of(context).push(Slider3(
                          Page: LocationPickerScreen(
                        orderId: orderId,
                      )));
                    },
                  ),
                ),
              if (box.read('role') == 'delivery')
                // BlocBuilder<OrderBloc, OrderState>(builder: (context, state) {
                //   return
                Positioned(
                  bottom: 10.h,
                  right: 10.w,
                  child: IconButton(
                    tooltip: 'Deliver this order',
                    icon: Icon(Iconsax.edit,
                        color: AppColor.primary, size: 24.sp),
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return CustomDialog(
                              title: TextWidget(
                                text: 'Update order status',
                                color: AppColor.primary,
                              ),
                              content: TextWidget(
                                text: 'This action mean that you will start deliver this order',
                                color: AppColor.greayColor,
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: TextWidget(
                                    text: 'Cancel',
                                    color: AppColor.greayColor,
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                    context.read<OrderBloc>().add(
                                        updateOrderStateEvent(id: orderId));
                                  },
                                  child: TextWidget(
                                    text: 'Update',
                                    color: AppColor.primary,
                                  ),
                                ),
                              ],
                            );
                          });
                    },
                  ),
                ),
              // }),
            ],
          ),
        ),
      ),
    );
  }
}

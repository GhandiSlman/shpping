import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:logistech/core/const/color.dart';
import 'package:logistech/core/const/images.dart';
import 'package:logistech/fetures/auth/presentation/widgets/text_widget.dart';

class NoInternetWidget extends StatelessWidget {
  final void Function() onTap;
  const NoInternetWidget({
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
              height: 175.h,
              width: 175.w,
              child: Image.asset(AppImages.noNetImage)),
          TextWidget(
            text: 'SomeThing went wrong.',
            color: AppColor.greayColor,
            fontSize: 20.sp,
          ),
          TextWidget(
            text: 'Try these steps:',
            color: AppColor.lightGrey,
            fontSize: 18.sp,
          ),
          20.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Iconsax.tick_circle,
                color: AppColor.primary,
              ),
              5.horizontalSpace,
              FittedBox(
                child: SizedBox(
                  width: 200.w,
                  child: TextWidget(
                    text: 'Check your modem or router',
                    color: AppColor.lightGrey,
                    fontSize: 16.sp,
                  ),
                ),
              ),
            ],
          ),
          10.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Iconsax.tick_circle,
                color: AppColor.primary,
              ),
              5.horizontalSpace,
              FittedBox(
                child: SizedBox(
                  width: 200.w,
                  child: TextWidget(
                    text: 'Reconnect to Wi-fi',
                    color: AppColor.lightGrey,
                    fontSize: 16.sp,
                  ),
                ),
              ),
            ],
          ),
          30.verticalSpace,
          GestureDetector(
            onTap: onTap,
            child: Container(
              width: 75.w,
              height: 40.h,
              decoration: BoxDecoration(
                  border: Border.all(color: AppColor.primary),
                  borderRadius: BorderRadius.circular(10.r)),
              child: Center(
                  child: TextWidget(
                text: 'Reload',
                color: AppColor.primary,
              )),
            ),
          ),
        ],
      ),
    );
  }
}

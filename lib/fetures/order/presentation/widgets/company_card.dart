import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:iconsax/iconsax.dart';
import 'package:logistech/core/utils/color.dart';
import 'package:logistech/fetures/auth/presentation/widgets/text_widget.dart';
import 'package:logistech/fetures/order/presentation/bloc/company/company_bloc.dart';

class CompanyCard extends StatelessWidget {
  final GetCompanyInfoLoafedState getCompanyInfoLoafedState;
  final String desc;
  final String expan;
  final String commit;
  const CompanyCard({
    super.key,
    required this.getCompanyInfoLoafedState,
    required this.desc,
    required this.commit,
    required this.expan,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: AppColor.primary.withOpacity(0.06),
      ),
      child: Padding(
        padding: EdgeInsets.all(20.h),
        child: AnimationLimiter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: AnimationConfiguration.toStaggeredList(
              duration: const Duration(milliseconds: 1000),
              childAnimationBuilder: (widget) => SlideAnimation(
                verticalOffset: 50.0,
                child: FadeInAnimation(
                  child: widget,
                ),
              ),
              children: [
                TextWidget(
                  text: 'Ocean for transport',
                  fontSize: 22.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColor.primary,
                ),
                SizedBox(height: 15.h),
                TextWidget(
                  text: desc,
                  fontSize: 16.sp,
                  color: AppColor.secoundPrimary,
                ),
                SizedBox(height: 10.h),
                Row(
                  children: [
                    Icon(
                      Iconsax.building_4,
                      color: AppColor.primary,
                      size: 22.sp,
                    ),
                    SizedBox(width: 8.w),
                    Expanded(
                      child: TextWidget(
                        text: expan,
                        fontSize: 15.sp,
                        color: AppColor.greayColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                Row(
                  children: [
                    Icon(
                      Iconsax.flag,
                      color: AppColor.primary,
                      size: 22.sp,
                    ),
                    SizedBox(width: 8.w),
                    Expanded(
                      child: TextWidget(
                        text: commit,
                        fontSize: 15.sp,
                        color: AppColor.greayColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

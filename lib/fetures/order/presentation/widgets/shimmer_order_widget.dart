import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:logistech/core/const/color.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerOrderWidget extends StatelessWidget {
  const ShimmerOrderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 150.h,
        decoration: BoxDecoration(
          border: Border.all(color: AppColor.lightGrey),
          borderRadius: BorderRadius.circular(10.sp),
          color: AppColor.superLightGrey,
        ),
        child: Padding(
          padding:  EdgeInsets.only(left: 15.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Shimmer.fromColors(
                baseColor: Colors.grey[100]!,
                highlightColor: Colors.grey[400]!,
                child: Container(
                  height: 15.h,
                  width: 200.w,
                  color: Colors.grey[300],
                ),
              ),
              8.verticalSpace,
              Shimmer.fromColors(
                baseColor: Colors.grey[100]!,
                highlightColor: Colors.grey[400]!,
                child: Container(
                  height: 15.h,
                  width: 200.w,
                  color: Colors.grey[300],
                ),
              ),
              8.verticalSpace,
              Shimmer.fromColors(
                baseColor: Colors.grey[100]!,
                highlightColor: Colors.grey[400]!,
                child: Container(
                  height: 15.h,
                  width: 200.w,
                  color: Colors.grey[300],
                ),
              ),
              8.verticalSpace,
              Shimmer.fromColors(
                baseColor: Colors.grey[100]!,
                highlightColor: Colors.grey[400]!,
                child: Container(
                  height: 15.h,
                  width: 200.w,
                  color: Colors.grey[300],
                ),
              ),
            ],
          ),
        ),
      );
  }
}

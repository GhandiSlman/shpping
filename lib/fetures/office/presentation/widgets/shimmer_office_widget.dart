import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:logistech/core/const/color.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerOfficeWidget extends StatelessWidget {
  const ShimmerOfficeWidget({super.key});

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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                20.verticalSpace,
                Row(
                  children: [
                    10.horizontalSpace,
                    Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        height: 20.h,
                        width: 200.w,
                        color: Colors.grey[300],
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    35.verticalSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        20.horizontalSpace,
                        Shimmer.fromColors(
                          baseColor: Colors.grey[300]!,
                          highlightColor: Colors.grey[100]!,
                          child: Container(
                            height: 15.h,
                            width: 200.w,
                            color: Colors.grey[300],
                          ),
                        ),
                      ],
                    ),
                    10.verticalSpace,
                    Row(
                      children: [
                        20.horizontalSpace,
                        Shimmer.fromColors(
                          baseColor: Colors.grey[300]!,
                          highlightColor: Colors.grey[100]!,
                          child: Container(
                            height: 15.h,
                            width: 200.w,
                            color: Colors.grey[300],
                          ),
                        ),
                      ],
                    ),
                    10.verticalSpace,
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:logistech/core/const/color.dart';

class NotiCard extends StatelessWidget {
  final int index;
  final String title;
  final String subTitle;
  const NotiCard({
    super.key,
    required this.index,
    required this.subTitle,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.h),
      padding: EdgeInsets.all(15.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.sp),
        gradient: LinearGradient(
          colors: [
            AppColor.primary.withOpacity(0.1),
            Colors.grey[200]!,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Stack(
        children: [
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
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Iconsax.notification,
                      color: AppColor.primary,
                      size: 22.sp,
                    ),
                    SizedBox(width: 10.w),
                    Expanded(
                      child: Text(
                        title,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 16.sp,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8.h),
                Row(
                  children: [
                    Icon(
                      Iconsax.message,
                      color: AppColor.primary,
                      size: 22.sp,
                    ),
                    SizedBox(width: 10.w),
                    Expanded(
                      child: Text(
                        subTitle,
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 14.sp,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    ),
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

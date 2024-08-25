import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerGoverWidget extends StatelessWidget {
  const ShimmerGoverWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[100]!,
      highlightColor: Colors.grey[400]!,
      child: Container(
        height: 15.h,
        width: 200.w,
        color: Colors.grey[300],
      ),
    );
  }
}

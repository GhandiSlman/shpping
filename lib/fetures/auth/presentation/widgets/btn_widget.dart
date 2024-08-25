import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:logistech/fetures/auth/presentation/widgets/text_widget.dart';

class BtnWidget extends StatelessWidget {
  final String text;
  final Color? color;
  final Border? border;
  final Function() onTap;
  final Color? textColor;
  final double? width;

   const BtnWidget(
      {super.key,
      required this.text,
      this.width,
      this.color,
      this.border,
      required this.onTap,
      this.textColor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 55.h,
        width: width,
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(10.r)),
        child: Center(
            child: TextWidget(
          text: text,
          fontSize: 20.sp,
          fontWeight: FontWeight.bold,
          color: textColor,
        )),
      ),
    );
  }
}

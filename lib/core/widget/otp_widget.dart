import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:logistech/core/const/color.dart';

// ignore: must_be_immutable
class OtpWidget extends StatelessWidget {
  final Function(String)? onCodeSubmitted;
  void Function(List<TextEditingController?>)? handleControllers;
  OtpWidget({super.key,this.onCodeSubmitted , this.handleControllers});

  @override
  Widget build(BuildContext context) {
    return OtpTextField(
      handleControllers:handleControllers ,
      cursorColor: AppColor.primary,
      numberOfFields: 4,
      filled: true,
      fieldWidth: 70.w,
      showFieldAsBox: true,
      textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.sp),
      borderRadius: BorderRadius.circular(10.r),
      borderColor: AppColor.primary,
      fillColor: AppColor.superLightGrey,
      focusedBorderColor: AppColor.primary,
      onSubmit: onCodeSubmitted,
    );
  }
}

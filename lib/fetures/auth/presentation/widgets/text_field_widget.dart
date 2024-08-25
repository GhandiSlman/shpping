// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:logistech/core/const/color.dart';

class TextFieldWidget extends StatelessWidget {
  final String hintText;
  final bool? obscureText;
  final IconButton? suffixIcon;
  final void Function(String)? onChanged;
  final TextEditingController? controller;
  String? Function(String?)? validator;
  TextInputType? keyboardType;
  final void Function(String?)? onSaved;
  TextFieldWidget(
      {super.key,
      required this.hintText,
      this.suffixIcon,
      this.onChanged,
      this.controller,
      this.validator,
      this.keyboardType,
      this.obscureText,
      this.onSaved
      });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: onSaved,
      onChanged: onChanged,
      obscureText: obscureText == false,
      controller: controller,
      validator: validator,
      keyboardType: keyboardType,
      cursorColor: AppColor.primary,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        hintText: hintText,
        fillColor: AppColor.superLightGrey,
        filled: true,
        hintStyle:
            TextStyle(color: AppColor.lightGrey, fontFamily: 'Ubuntu-Regular'),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.h,)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(color: AppColor.lightGrey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(color: AppColor.primary),
        ),
      ),
    );
  }
}

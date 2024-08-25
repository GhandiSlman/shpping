// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:logistech/core/const/color.dart';

class CustomDropDown extends StatelessWidget {
  final String? value;
  final List<DropdownMenuItem<dynamic>> items;
  final void Function(dynamic)? onChanged;
  String? Function(dynamic)? validator;
  final String hintText;
  void Function(dynamic)? onSaved;
  CustomDropDown({
    super.key,
    required this.items,
    required this.onChanged,
    required this.hintText,
    this.validator,
    this.onSaved,
    this.value
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      onSaved: onSaved,
      value: value,
      validator: validator,
      items: items,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText,
        fillColor: AppColor.superLightGrey,
        filled: true,
        hintStyle:
            TextStyle(color: AppColor.lightGrey, fontFamily: 'Ubuntu-Regular'),
       // labelText: labelText,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
          10.h,
        )),
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

// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDialog extends StatelessWidget {
  final void Function()? onPressed;
  final Widget title;
  final Widget content;
  List<Widget>? actions;
  CustomDialog({
    super.key,
    this.onPressed,
    required this.title,
    required this.content,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: title,
      content: content,
      actions: actions,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(2.r)),
      ),
    );
  }
}

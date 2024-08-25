// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:logistech/fetures/auth/presentation/widgets/text_widget.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final PreferredSizeWidget? bottom;
  final Widget? leading;
  final List<Widget>? trailing;
  const CustomAppBar({
    required this.title,
    this.bottom,
    this.leading,
    this.trailing,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      bottom: bottom,
      automaticallyImplyLeading: false,
      leading: leading,
      actions: trailing,
      title: TextWidget(
        text: title,
        fontSize: 25.sp,
        fontWeight: FontWeight.bold,
      ),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(kToolbarHeight + (bottom?.preferredSize.height ?? 0.0));
}

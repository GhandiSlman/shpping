import 'package:flutter/material.dart';

class IconBtnWidget extends StatelessWidget {
  final void Function() onPressed;
  final Icon icon;
  const IconBtnWidget({super.key, required this.onPressed, required this.icon});

  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: onPressed, icon: icon);
  }
}

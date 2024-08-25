import 'package:flutter/material.dart';
import 'package:logistech/fetures/auth/presentation/widgets/text_widget.dart';

class TextBtn extends StatelessWidget {
  final void Function() onPressed;
  final String? text;
  final double? fontSize;
  final Color? color;
  const TextBtn(
      {super.key,
      required this.onPressed,
      this.text,
      this.fontSize,
      this.color});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: TextWidget(
        text: text!,
        color: color,
        fontSize: fontSize,
      ),
    );
  }
}

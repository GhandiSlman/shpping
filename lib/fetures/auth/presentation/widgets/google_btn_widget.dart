import 'package:flutter/material.dart';
import 'package:logistech/fetures/auth/presentation/widgets/text_widget.dart';

class GoogleBtnWidget extends StatelessWidget {
  final String? text;
  final Color? color;
  final Border? border;
  final Function() onTap;
  final Color? textColor;
  const GoogleBtnWidget(
      {super.key, this.text,this.color, this.border, required this.onTap, this.textColor});

  @override
  Widget build(BuildContext context) {
    final Size mq = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: mq.height * .08,
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          color: color,
           borderRadius: BorderRadius.circular(10)
        ),
        child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextWidget(
                          text: text!,
                          fontSize: 20,
                          color: textColor,
                        ),
                Image.asset('assets/images/google.png')
              ],
            )),
      ),
    );
  }
}

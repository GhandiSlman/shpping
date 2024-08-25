import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:logistech/core/const/color.dart';
import 'package:logistech/fetures/auth/presentation/widgets/text_widget.dart';

class LogOutBtnWidget extends StatelessWidget {
  final void Function()? onPressed;
  const LogOutBtnWidget({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: TextWidget(
                text: 'Confirm Logout',
                color: AppColor.primary,
              ),
              content: TextWidget(
                text: 'Are you sure you want to log out?',
                color: AppColor.greayColor,
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: TextWidget(
                    text: 'Cancel',
                    color: AppColor.greayColor,
                  ),
                ),
                TextButton(
                  onPressed: onPressed,
                  child: TextWidget(
                    text: 'Logout',
                    color: AppColor.redColor,
                  ),
                ),
              ],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(2.r)),
              ),
            );
          },
        );
      },
      child: Container(
        width: double.infinity,
        height: 40.h,
        decoration: BoxDecoration(
          border: Border.all(color: AppColor.redColor),
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Center(
          child: TextWidget(
            text: 'Log out',
            color: AppColor.redColor,
          ),
        ),
      ),
    );
  }
}

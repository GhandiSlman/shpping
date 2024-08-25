// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:logistech/core/const/color.dart';

class CustomPopMenu extends StatelessWidget {
  List<PopupMenuItem<dynamic>> items;
  CustomPopMenu({
    required this.items,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
        color: AppColor.whiteColor,
        popUpAnimationStyle: AnimationStyle(curve: Curves.easeInExpo),
        icon: const Icon(Iconsax.more_square),
        itemBuilder: (context) {
          return items;
        });
  }
}

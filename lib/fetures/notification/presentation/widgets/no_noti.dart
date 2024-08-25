import 'package:flutter/material.dart';
import 'package:logistech/core/utils/images.dart';

class NoNotiWidget extends StatelessWidget {
  const NoNotiWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(child: Image.asset(AppImages.notiImage));
  }
}

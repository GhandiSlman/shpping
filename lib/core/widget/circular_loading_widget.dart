import 'package:flutter/material.dart';
import 'package:logistech/core/utils/color.dart';

class CircularLoadingWidget extends StatelessWidget {
  const CircularLoadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(child: CircularProgressIndicator(
      color: AppColor.primary,
    ));
  }
}

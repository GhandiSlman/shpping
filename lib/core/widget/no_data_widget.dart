import 'package:flutter/material.dart';
import 'package:logistech/core/const/images.dart';

class NoDataWidget extends StatelessWidget {
  const NoDataWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
        child:
            Image.asset(AppImages.noDataImage),
      );
  }
}

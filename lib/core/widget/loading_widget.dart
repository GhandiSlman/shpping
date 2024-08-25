// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoadingWidget extends StatefulWidget {
  final String? text;
  final Color? color;
  final Border? border;

  const LoadingWidget({
    super.key,
    this.text,
    this.color,
    this.border,
  });

  @override
  _LoadingWidgetState createState() => _LoadingWidgetState();
}

class _LoadingWidgetState extends State<LoadingWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<AlignmentGeometry> _alig;
  late Animation<double> _turns;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    )..repeat(reverse: true);

    _alig = AlignmentTween(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
    ).animate(_controller);

    _turns = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlignTransition(
      alignment: _alig,
      child: RotationTransition(
        turns: _turns,
        child: Container(
          height: 40.h,
          width: 50.w,
          decoration: BoxDecoration(
              color: widget.color, borderRadius: BorderRadius.circular(10.r)),
        ),
      ),
    );
  }
}

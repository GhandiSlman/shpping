import 'package:flutter/material.dart';

class MyCustomClip extends CustomClipper<Path> {
  final double curveHeight;
  final bool clipFromTop;
  final bool clipFromRight;

  MyCustomClip({
    required this.curveHeight,
    this.clipFromTop = true,
    this.clipFromRight = true,
  });

  @override
  Path getClip(Size size) {
    Path path = Path();

    if (clipFromTop && clipFromRight) {
      path.moveTo(0, 0);
      path.lineTo(size.width, 0);
      path.lineTo(size.width, size.height - curveHeight);
      path.lineTo(0, size.height);
    } else if (clipFromTop && !clipFromRight) {
      path.moveTo(size.width, 0);
      path.lineTo(0, 0);
      path.lineTo(0, size.height - curveHeight);
      path.lineTo(size.width, size.height);
    } else if (!clipFromTop && clipFromRight) {
      path.moveTo(0, 0);
      path.lineTo(size.width - size.height, 0);
      path.lineTo(size.width, size.height);
      path.lineTo(0, size.height);
    } else {
      path.moveTo(size.width, 0);
      path.lineTo(0, curveHeight);
      path.lineTo(0, size.height);
      path.lineTo(size.width, size.height);
    }

    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

class MyCudstomClip extends CustomClipper<Path> {
  final double curveHeight; // The height of the curve

  MyCudstomClip({required this.curveHeight});

  @override
  Path getClip(Size size) {
    Path path = Path();

    path.moveTo(0, 0);

    path.lineTo(size.width, 0);

    path.lineTo(size.width, size.height);

    path.lineTo(0, size.height - curveHeight);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

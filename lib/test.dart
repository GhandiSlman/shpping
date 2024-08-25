// ignore_for_file: non_constant_identifier_names, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class Slider1 extends PageRouteBuilder {
  final Page;
  Slider1({this.Page})
      : super(
          pageBuilder: (context, animation, secondaryAnimation) => Page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(0.0, 1.0);
            const end = Offset.zero;
            const curve = Curves.ease;
            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
        );
}

class Slider2 extends PageRouteBuilder {
  final Page;
  final RouteSettings;

  Slider2({this.Page, this.RouteSettings})
      : super(
          settings: RouteSettings,
          pageBuilder: (context, animation, secondaryAnimation) => Page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(1.0, 0.0);
            const end = Offset.zero;
            const curve = Curves.ease;
            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
        );
}

class Slider3 extends PageRouteBuilder {
  final Page;
  final RouteSettings;

  Slider3({this.Page, this.RouteSettings})
      : super(
          settings: RouteSettings,
          pageBuilder: (context, animation, secondaryAnimation) => Page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(0.0, -1.0);
            const end = Offset.zero;
            const curve = Curves.ease;
            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
        );
}
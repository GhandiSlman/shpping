import 'package:flutter/material.dart';
import 'package:logistech/fetures/auth/presentation/screens/check_code_screen.dart';
import 'package:logistech/fetures/auth/presentation/screens/forget_password_screen.dart';
import 'package:logistech/fetures/auth/presentation/screens/login_screen.dart';
import 'package:logistech/fetures/auth/presentation/screens/new_password_screen.dart';
import 'package:logistech/fetures/auth/presentation/screens/sign_up_screen.dart';
import 'package:logistech/fetures/notification/presentation/screens/noti_screen.dart';
import 'package:logistech/fetures/order/presentation/screens/home_screen.dart';
import 'package:logistech/fetures/order/presentation/screens/step_one_add_order_screen.dart';

class AppRouter {
  static const String loginScreen = '/loginScreen';
  static const String signUpScreen = '/signUpScreen';
  static const String forgetPasswordScreen = '/forgetPasswordScreen';
  static const String newPasswordScreen = '/newPasswordSceen';
  static const String checkCodeScreen = '/checkCodeScreen';
  static const String homeScreen = '/homeScreen';
  static const String stepOne = '/stepOne';
  static const String notiScreen = '/notiScreen';
  

  static Map<String, Widget Function(BuildContext)> routes = {
    loginScreen: (context) => const LoginScreen(),
    signUpScreen: (context) => SignUpScreen(),
    forgetPasswordScreen: (context) => ForgetPasswordScreen(),
    newPasswordScreen: (context) => const ResetPasswordScreen(),
    checkCodeScreen: (context) => CheckCodeScreen(),
    homeScreen: (context) => const HomeScreen(),
    stepOne: (context ) => StepOneAddOrderScreen(),
    notiScreen: (context) => const NotiScreen(),
  };
}

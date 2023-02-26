import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_signin_ui_test/screen/home_screen.dart';
import 'package:flutter_signin_ui_test/screen/loading_screen.dart';
import 'package:flutter_signin_ui_test/screen/register_screen.dart';
import 'package:flutter_signin_ui_test/screen/signin_screen.dart';

//路
class Routes{
  static const String registerScreen = 'registerScreen';
  static const String homeScreen = 'homeScreen';
  static const String loadingScreen = 'loadingScreen';
  static const String testScreen = 'testScreen';
  static const String signInScreen = 'signInScreen';
}
//路由器
class MyRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.registerScreen:
        return NoAnimRouteBuilder(const RegisterScreen());
      case Routes.homeScreen:
        return NoAnimRouteBuilder(const HomeScreen());
      case Routes.loadingScreen:
        return NoAnimRouteBuilder(const LoadingScreen());
      case Routes.signInScreen:
        return NoAnimRouteBuilder(const SignInScreen());
      default:
        return CupertinoPageRoute(
            builder: (_) => Scaffold(
              body: Center(
                child: Text('No route defined for ${settings.name}'),
              ),
            ));
    }
  }
}
//無動畫跳轉
class NoAnimRouteBuilder extends PageRouteBuilder {
  final Widget page;

  NoAnimRouteBuilder(this.page)
      : super(
      opaque: false, //是否遮擋整個螢幕。
      pageBuilder: (context, animation, secondaryAnimation) => page,//建立要跳到的頁面。
      transitionDuration: const Duration(milliseconds: 0),//轉場動畫的持續時間。
      transitionsBuilder:
          (context, animation, secondaryAnimation, child) => child);//自訂的轉場效果。
}


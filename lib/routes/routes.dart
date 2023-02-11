import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_ui_test/screen/home_screen.dart';
import 'package:flutter_signin_ui_test/screen/loading_screen.dart';
import 'package:flutter_signin_ui_test/screen/register_screen.dart';

class Routes{
  static const String registerScreen = 'registerScreen';
  static const String homeScreen = 'homeScreen';
  static const String loadigScreen = 'loadigScreen';
}

class MyRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.registerScreen:
        return MaterialPageRoute(builder: (_)=>const RegisterScreen());
      case Routes.homeScreen:
        return NoAnimRouteBuilder(const HomeScreen());
      case Routes.loadigScreen:
        return NoAnimRouteBuilder(const LoadingScreen());
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

class NoAnimRouteBuilder extends PageRouteBuilder {
  final Widget page;

  NoAnimRouteBuilder(this.page)
      : super(
      opaque: false,
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionDuration: const Duration(milliseconds: 0),
      transitionsBuilder:
          (context, animation, secondaryAnimation, child) => child);
}
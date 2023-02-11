import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_ui_test/screen/home_screen.dart';
import 'package:flutter_signin_ui_test/screen/register_screen.dart';
import 'package:lottie/lottie.dart';

import '../routes/routes.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen>
    with SingleTickerProviderStateMixin{
   late AnimationController _controller;

  @override
  void initState() {
    // TODO: implement initState
    _controller = AnimationController(vsync: this)
    ..addStatusListener((s) {
      if( s == AnimationStatus.completed){
        Navigator.pushNamed(context,Routes.bbb);
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  Container(
      color: Colors.white,
      child: Lottie.asset(
        'assets/loading_animation.json',
        repeat: false,
        controller: _controller,
        onLoaded: (composition) {
          _controller
            ..duration = composition.duration
            ..forward();
        }
      ),
    );
  }
}




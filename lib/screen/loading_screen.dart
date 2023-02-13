import 'package:flutter/material.dart';
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
    _controller = AnimationController(vsync: this)//vsync 會綁定一個動畫計時器到 widge
    ..addStatusListener((s) {
      if( s == AnimationStatus.completed){
        Navigator.pushNamed(context,Routes.homeScreen);
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
        onLoaded: (composition) {//composition動畫檔案
          _controller//對應的 AnimationController
            ..duration = composition.duration
            ..forward();
        }
      ),
    );
  }
}




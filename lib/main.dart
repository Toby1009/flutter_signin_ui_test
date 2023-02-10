import 'package:flutter/material.dart';//import MaterialApp的包，使用material

import 'package:flutter_signin_ui_test/screen/signin_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //MaterialApp 是Material Design 風格的Widget
    return MaterialApp(
      title: 'Flutter Demo',
      //關掉debug圖標
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //起始頁面
      home: const SignInScreen() ,
    );
  }
}

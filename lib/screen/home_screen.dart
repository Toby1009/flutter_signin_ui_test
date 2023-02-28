import 'package:flutter/material.dart';

import '../routes/routes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return    Scaffold(
      body: Center(
        child:TextButton(
            onPressed:(){
             Navigator.pushNamed(context, Routes.signInScreen);
            },
            child: Text('反回'))),
      );

  }
}

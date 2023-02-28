//pub
import 'package:flutter/material.dart';//import MaterialApp的包，使用material
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_signin_ui_test/auth/auth_repositories/repository.dart';
import 'package:flutter_signin_ui_test/routes/routes.dart';
import 'package:flutter_signin_ui_test/screen/register_screen.dart';

//widget
import 'package:flutter_signin_ui_test/screen/signin_screen.dart';

import 'auth/app/screen/app_screen.dart';

Future<void> main() async {
  final  authRepository = AuthRepository();
  runApp(App(authRepository: authRepository));
}
// void main(){
//   runApp(MyApp());
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    //MaterialApp 是Material Design 風格的Widget
    return MaterialApp(
      title: 'Flutter Demo',
      //關掉debug圖標
      debugShowCheckedModeBanner: false,
      //告知路由器是哪個
      onGenerateRoute: MyRouter.generateRoute,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //起始頁面
      home: RepositoryProvider(
        create: (context)=> AuthRepository(),
        child: const SignInScreen(),
      ) ,
    );
  }
}

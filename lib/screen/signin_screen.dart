import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:flutter_signin_ui_test/widget/toast_widget.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:flutter_signin_ui_test/widget/button_widget.dart';
import 'package:flutter_signin_ui_test/widget/textfield_widget.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final GlobalKey _globalKey = GlobalKey();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final TapGestureRecognizer _tapGestureRecognizer = TapGestureRecognizer();


  late FToast fToast;

  @override
  void initState() {
    super.initState();
    fToast = FToast();
    fToast.init(context);
  }


  @override
  void dispose() {
    // TODO: implement dispose
    _tapGestureRecognizer.dispose();
    super.dispose();
  }

  _isOk() {
      fToast.showToast(
        child: const ToastWidget(
            text: "Sign In Success",
            color: Colors.greenAccent,
            icon: Icons.check),
        gravity: ToastGravity.BOTTOM,
        toastDuration: const Duration(seconds: 2),
      );
    }

  _notOk() {
    fToast.showToast(
      child: const  ToastWidget(text: "Email or Password is Empty", color: Colors.redAccent, icon: Icons.error),
      gravity: ToastGravity.BOTTOM,
      toastDuration: const Duration(seconds: 2),
    );
  }

    bool infIsOk() {
      final String email = emailController.text;
      final String passwd = passwordController.text;
      if (email.isEmpty && passwd.isEmpty) {
        return false;
      }
      return true;
    }




    @override
    Widget build(BuildContext context) {

    final Size screenSize = MediaQuery.of(context).size;
    final width = screenSize.width;
    final heigh = screenSize.height;

      return Scaffold(
        body: SafeArea(
          child: Container(
            width: double.maxFinite,
            height: double.maxFinite,
            padding:  EdgeInsets.only(
                left: width/20,
                right: width/20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/apple.png'),
                      )
                  ),
                ),
                //留空裝置高度/14
                SizedBox(height: MediaQuery
                    .of(context)
                    .size
                    .height / 14,),
                const Text(
                  'Hello World',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  'We are very missing you',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: heigh/20,),
                TextFieldWidget(
                  textEditingController: emailController,
                  hintText: "Email",
                ),
                SizedBox(height: heigh/90,),
                TextFieldWidget(
                  textEditingController: passwordController,
                  hintText: "Password",
                  obscureText: true,
                ),
                SizedBox(height: heigh/90,),
                //登入按鈕
                InkWell(
                    onTap: () {
                      if (infIsOk()) {
                        _isOk();
                      } else {
                        _notOk();
                      }
                    },
                    child: const ButtonWidget(text: "Sign In")
                ),
                SizedBox(height: heigh/90,),
                RichText(
                  text:   TextSpan(
                      children: [
                        const TextSpan(
                          text: "Not a member?",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        TextSpan(
                          //textspan 手勢識別
                          recognizer: _tapGestureRecognizer
                            ..onTap = () {
                            //註冊按鈕
                            },
                          text: "Register now",
                          style: const TextStyle(
                            color: Colors.blue,
                          ),
                        ),
                      ]
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
  }




